*** Settings ***
Documentation   Resource file must not contains any test cases
Library     OperatingSystem

*** Variables ***
@{temp_list}    1   2   3   4   5

@{temp_dict}    username=clara  password=watson

*** Keywords ***
Log my username
    [Arguments]  ${username}
    log  Hey, your username is ${username}!