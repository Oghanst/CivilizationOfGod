# 递归遍历当前文件夹，将所有文件名大写改为小写，空格改为下划线
# 用法：python uncapitalize.py
import os

def uncapitalize(path):
    for file in os.listdir(path):
        old = os.path.join(path, file)
        new = os.path.join(path, file.lower().replace(' ', '_'))
        os.rename(old, new)
        if os.path.isdir(new):
            uncapitalize(new)

if __name__ == '__main__':
    uncapitalize('.')
    print('Done!')
    