import json
from robot.api.deco import keyword


@keyword("Load Config")
def load_config(file_name="config"):
    return json.load(open(f"testData/{file_name}.json", 'r'))
