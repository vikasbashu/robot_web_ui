import os
from robot.api.deco import keyword


@keyword("Remove Allure Files")
def remove_allure_files():
    directory_path = "output/Reports/Allure"
    for fileName in os.listdir(directory_path):
        file_path = os.path.join(directory_path, fileName)
        if os.path.isfile(file_path):
            os.remove(file_path)

