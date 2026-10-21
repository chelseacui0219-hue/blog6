import pandas as pd
import re

print("Starting data cleaning...")

file_path = "D:/blog6/data/raw/fim16216_gid_BO_2_BAL_wide.txt"
with open(file_path, 'r') as f:
    lines = f.readlines()

records = []
for line in lines:
    line = line.strip()
    if not line or not line[0].isdigit():
        continue
    
    ids = re.findall(r'\d{7}', line)
    
    if len(ids) >= 2:
        child_id = ids[0]
        father_id = ids[1] if len(ids) > 1 else '0000000'
        mother_id = ids[2] if len(ids) > 2 else '0000000'
        records.append([child_id, father_id, mother_id])

gid_df = pd.DataFrame(records, columns=['child_id', 'father_id', 'mother_id'])

print(gid_df.head(10))
print(f"Total matched children: {len(gid_df)}")

gid_df.to_csv("D:/blog6/data/raw/gid_map_clean.csv", index=False)
print("Cleaned file saved!")
