

import sys
from os import path
import datetime

def read_file(file_path, append_Str=''):
    context = ''
    if not path.exists(file_path):
        print(f"The file path {file_path} does not exist.")
        exit(1)
    if append_Str == '':
        with open(file_path, 'r', encoding='utf-8') as f:
            context += f.read()
    else:
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            for line in lines:
                context += append_Str + line
    f.close()
    return context

if __name__ == '__main__':
    if len(sys.argv) <= 2:
        print("Usage: python new_essays.py <file_path> <yaml_file>")
        print("Example: python new_essays.py essay.txt essay.yaml")
        print("The script will read the content of the file and add it to the YAML file.")
    else:
        context = read_file(sys.argv[1], '\t\t')
        yaml_file = sys.argv[2]
        # Read the YAML file
        yaml_content = read_file(yaml_file)
        date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M')
        # Write the essay to the YAML file
        with open(yaml_file, 'w', encoding='utf-8') as f:
            f.write("- content: |\n")
            f.write(context)
            f.write(f"\n  date: {date} \n\n")
            f.writelines(yaml_content)
        print(f"The essay has been saved to {yaml_file}.")