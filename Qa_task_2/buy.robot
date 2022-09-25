*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button'

*** Keywords ***
Ensure Loaded
    Wait Until Page Does Not Contain Element    //*[contains(@aria-label,'Loading')]    10
    Wait Until Page Does Not Contain Element    //*[@class='chart-container__loader']

Login at Deriv
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
    


*** Test Cases ***
Buy a contract
    Login at Deriv
    Ensure Loaded
    Page Should Contain Element    //div[@class="cq-symbol-select-btn"]    40
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //div[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]    80
    Wait Until Page Contains Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]    80
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
    Wait Until Page Contains Element    //button[@class="btn-purchase btn-purchase--1"]    80
    Click Element    //button[@class="btn-purchase btn-purchase--1"]     
    