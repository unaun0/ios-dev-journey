import os

start_num = None
end_num = None

for i in range(start_num, end_num + 1):
    folder_name = f"{i:04d}-"
    os.makedirs(folder_name, exist_ok=True)
    file_path = os.path.join(folder_name, "main.swift")
    if not os.path.exists(file_path):
        with open(file_path, 'w') as f:
            pass