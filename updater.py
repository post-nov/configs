"""
Обновляет и пушит локальные настройки программ
"""

__author__ = 'post-nov'

import os
import shutil

CURRENT_DIR = f'{os.getcwd()}/_configs'
HOME_DIR = os.path.expanduser('~')
USERNAME = os.getlogin()

CONFIGS = [
    f'/home/{USERNAME}/.bashrc',
    f'/home/{USERNAME}/.config/nvim/init.vim',
]


def config_copier():
    """
    Сохраняет локальные настройки в папочку _configs
    """

    for src in CONFIGS:
        # Скопировать настройки с сохранением директории, в которых они лежат
        ripped_src = src.replace(HOME_DIR, '', 1)
        dst = CURRENT_DIR + ripped_src

        # Без создания папки shutil.copy ругается
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        shutil.copy(src, dst, follow_symlinks=True)


def config_pushier():
    """
    Пушит существующие настройки в настроенный репозиторий
    """

    pass


if __name__ == '__main__':
    config_copier()

