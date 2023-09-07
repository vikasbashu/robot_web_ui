from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdriver_manager.microsoft import IEDriverManager
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.edge.options import Options as EdgeOptions
from selenium.webdriver.ie.options import Options as IEOptions
from robot.api.deco import keyword


@keyword('Get Driver Path')
def get_driver_path(browser):
    # driver_path_dict = {
    #     'chrome': ChromeDriverManager().install(),
    #     'edge': EdgeChromiumDriverManager().install(),
    #     'firefox': GeckoDriverManager().install(),
    #     'ie': IEDriverManager().install()
    # }
    # try:
    #     return driver_path_dict[browser.casefold()]
    # except KeyError:
    #     return driver_path_dict['edge']
    browser = browser.casefold()
    if browser == 'chrome':
        return ChromeDriverManager().install()
    elif browser == 'edge':
        return EdgeChromiumDriverManager().install()
    elif browser == 'firefox':
        return GeckoDriverManager().install()
    else:
        return IEDriverManager().install()


@keyword("Get Browser Options")
def get_browser_options(browser, mode):
    browser = browser.casefold()
    if browser == "firefox":
        options = FirefoxOptions()
    elif browser in ["edge", "Edge", "chromium"]:
        options = EdgeOptions()
    elif browser == "chrome":
        options = ChromeOptions()
    else:
        options = IEOptions()
    if mode is True:
        options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    return options
