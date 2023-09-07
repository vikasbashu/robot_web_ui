import json
from robot.api.deco import keyword


@keyword('Fetch Locators')
def fetch_locators(file_name):
    return json.load(open(f"assets/locators/{file_name}.json", 'r'))
