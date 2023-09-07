*** Settings ***
Documentation   This file contains all the utility methods required to interact with a web browser
Library     Selenium2Library
Library     Screenshot
Library     ../assets/driver_config.py
Library        ../assets/configLoader.py
Library     ../utility/cleaning.py

*** Variables ***
${baseUrl}      https://www.google.com
${browser}

*** Keywords ***
Fetch Driver Path
    [Arguments]   ${browser}
    ${Path}=    Get Driver Path    ${browser}
    [Return]    ${Path}

Fetch Browser Options
    [Arguments]     ${browser}      ${mode}
    ${options}=     get browser options     ${browser}      ${mode}
    [Return]    ${options}

Launch Browser
    [Arguments]   ${browser}    ${mode}     ${implicit_wait}
    ${path}=    Fetch Driver Path   ${browser}
    ${options}=     Fetch Browser Options   ${browser}  ${mode}
    open browser   ${baseUrl}   ${browser}      executable_path=${path}     options=${options}
    maximize browser window
    set selenium implicit wait      ${implicit_wait}

Fetch Config Data
    ${value}=    Load Config
    [Return]     ${value}

Initial Setup
    ${configData}=  Fetch Config Data
    set suite variable  ${browser}   ${configData}[browser]
    set suite variable  ${baseUrl}   ${configData}[baseUrl]
    remove allure files
    Launch Browser  ${browser}  ${configData}[headless]     ${configData}[implicit_wait]

Quit
    close all browsers

NavigateTo
    [Arguments]  ${url}
    GO TO  ${url}

Take Screenshot
    [Arguments]    ${filename}
    capture page screenshot         output/screenshots/${filename}