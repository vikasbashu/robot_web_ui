*** Settings ***
Documentation  This is my first test case file
Resource    ../resource/resources.robot

*** Keywords ***


*** Variables ***
${var1}     Vikas Sharma


*** Test Cases ***
Test
    log     This is the ${temp_list}[1] sample test case for ${var1}
    log     username is ${temp_dict}\[username]
    log     password is ${temp_dict}\[password]
Test2
    log my username  ${var1}
