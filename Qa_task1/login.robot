*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button'

*** Keywords ***
Ensure Loaded
    Wait Until Page Does Not Contain Element    //*[contains(@aria-label,'Loading')]
*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //button[@id='dt_login_button']    30   
    Wait Until Element Contains    dt_login_button    Log in
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    password
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //*[@id="dt_core_account-info_acc-info"]   30
    Ensure Loaded
    Click Element    //*[@id="dt_core_account-info_acc-info"]
    Wait Until Page Contains Element    dt_core_account-switcher_demo-tab    30
    Click Element    dt_core_account-switcher_demo-tab    
    Page Should Contain Element    //*[@id="dt_VRTC6202200"]    40
    Click Element    //*[@id="dt_VRTC6202200"]

    #page should not have payout
    