*** Settings ***
Documentation   Automate the add to card journey on amazon
Resource        ../resource/browser_utility.robot
Library         BuiltIn
Library        ../assets/load_locators.py

Suite Setup     Initial Setup
Suite Teardown  Quit

*** Variables ***
${browser}
${baseUrl}

*** Keywords ***
Fetch Page Locators
    [Arguments]     ${page}
    ${locators}=    Fetch Locators    amazon
    [Return]    ${locators}[${page}]

*** Test Cases ***
Open Website
    NavigateTo   ${baseUrl}
    log many  ${browser}    ${baseUrl}

Check Home Page Status
    [Tags]  amazon
    ${locators}=    Fetch Page Locators     homePage
    element should be visible  ${locators}[logo]
    element should be visible  ${locators}[copyright]
    scroll element into view    ${locators}[copyright]
    ${pageTitle}=   get title
    should contain      ${pageTitle}    ${locators}[pageTitle]

Search Product
    ${locators}=    Fetch Page Locators    homePage
    Scroll Element Into View        ${locators}[searchBox]
    Element Should Be Enabled        ${locators}[searchBox]
    Input Text    ${locators}[searchBox]    Laptop
    Click Element    ${locators}[searchButton]
    press key  Enter
    Title Should Be    ${locators}[pageTitle]

Apply Filters
    ${locators}=    Fetch Page Locators    searchResultPage
    # Get it by tomorrow
    click element    ${locators}[filter1]
    # Brand - HP
    click element    ${locators}[filter2]
    # Price Range - 15000 - 35000
    Input Text    ${locators}[minPrice]      15000
    Input Text    ${locators}[maxPrice]      35000
    click element    ${locators}[price_go]
    # Processor - Intel
    click element    ${locators}[filter3]

Apply Sorting
    ${locators}=    Fetch Page Locators    searchResultPage
    # Sort by price - low to high
    click element    ${locators}[sort]
    click element    ${locators}[sortBy]

Select Product
    # select first product
    ${locators}=    Fetch Page Locators    searchResultPage
    click element   ${locators}[top_result]
    Switch Window    New
    Take Screenshot   product_screenshot_1.png

Add To Cart
    ${locators}=    Fetch Page Locators    productPage
    click element  ${locators}[addToCart]
    # skip add ons
    click element   ${locators}[addOns]
    # Item should be added to cart
    element should be enabled    ${locators}[itemAddedToCart]
    title should be    ${locators}[pageTitle]
    # Opt for gift wrap option
    click element   ${locators}[giftWrap]
    # Go to cart
    click element   ${locators}[goToCart]
    Take Screenshot    cart_screenshot_1.png
Proceed To Buy
    ${locators}=    Fetch Page Locators    shoppingCartPage
    click element   ${locators}[checkout]
    title should be    ${locators}[pageTitle]
    Take Screenshot   login_screenshot_1.png