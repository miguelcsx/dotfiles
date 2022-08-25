from os import path
import json
from random import choice

qpath = path.join(path.expanduser('~'), ".config", "qtile")

def random_theme():
    themes = ["dark-grey", "dracula", "fusion", "material-darker", "material-ocean", "nature", "nord-wave", "nord", "onedark", "popsicle", "rosepine", "tomorrow"]


    config = path.join(qpath, "config.json")

    theme = choice(themes)

    with open(config, "w") as f:
        f.write(f'{{"theme": "{theme}"}}\n')

    theme_file = path.join(qpath, "themes", f'{theme}.json')

    if not path.isfile(theme_file):
        raise Exception(f'{theme_file} does not exist')

    with open(path.join(theme_file)) as f:
        return json.load(f)

if __name__ == "__main__":
    random_theme()
