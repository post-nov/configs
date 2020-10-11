"""
Сохраняет текущие настройки в папочку files
"""

__author__ = 'post-nov'

import os
import shutil

CURRENT_DIR = f'{os.getcwd()}/files'
HOME_DIR = os.path.expanduser('~')
USERNAME = os.getlogin()

CONFIGS = [
    f'/home/{USERNAME}/.bashrc',
    f'/home/{USERNAME}/.config/nvim/init.vim',
    f'/home/{USERNAME}/.config/regolith/i3/config',
    f'/home/{USERNAME}/.config/kitty/kitty.conf',
]


def config_copier():
    """
    Сохраняет локальные настройки в папочку files
    """

    for src in CONFIGS:
        # Скопировать настройки с сохранением директории, в которых они лежат
        ripped_src = src.replace(HOME_DIR, '', 1)
        dst = CURRENT_DIR + ripped_src

        # Без создания папки shutil.copy ругается
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        shutil.copy(src, dst, follow_symlinks=True)


if __name__ == '__main__':
    config_copier()
    print('Settings updated for:\n{}'.format("\n".join(CONFIGS)))

