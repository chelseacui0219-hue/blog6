# install
install.packages("sqldf")
library(tidyverse)
library(sqldf)

# Read the csv
df <- read_csv("D:/blog6/data/raw/learning.csv")

# "parent” and “children”
parents <- df |> select(g2_id, g2_educ, g2_log_income)
children <- df |> select(g3_id, g2_id, g3_educ, g3_log_income, sex, race)

# 3. match children with parent
family_matched <- sqldf("
  SELECT 
    c.g3_id,
    c.g2_id,
    c.g3_log_income,
    c.g3_educ,
    c.sex,
    c.race,
    p.g2_log_income,
    p.g2_educ
  FROM children c
  JOIN parents p ON c.g2_id = p.g2_id
")

head(family_matched)

# DISTINCT 
family_unique <- sqldf("
  SELECT DISTINCT * 
  FROM family_matched
")

# GROUP BY
grouped_income <- sqldf("
  SELECT 
    sex,
    COUNT(g3_id) AS sample_size,
    AVG(g2_log_income) AS avg_parent_log_income,
    AVG(g3_log_income) AS avg_child_log_income
  FROM family_unique
  GROUP BY sex
")

print(grouped_income)

# IGE
model_ige <- lm(g3_log_income ~ g2_log_income, data = family_unique)

summary(model_ige)