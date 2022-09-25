*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button'    20
${take_profit}    //label[@for="dc_take_profit-checkbox_input"]
${cancelation}    //label[@for="dt_cancellation-checkbox_input"]
${stop_loss}    //label[@for="dc_stop_loss-checkbox_input"]
${stake}    //input[@id="dt_amount_input"]
${increment}    //button[@id="dt_amount_input_add"]
${decrement}    //button[@id="dt_amount_input_sub"]
${minutes}    //div[@class="dc-dropdown-container trade-container__multiplier-dropdown dc-dropdown--left"]

*** Keywords ***
Ensure Loaded
    Wait Until Page Does Not Contain Element    //*[contains(@aria-label,'Loading')]    30
    Wait Until Page Does Not Contain Element    //*[@class='chart-container__loader']

Login at Deriv
   Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //button[@id='dt_login_button']    30   
    Wait Until Element Contains    dt_login_button    Log in
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    aaa
    Input Text    //input[@type='password']    aaa
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //*[@id="dt_core_account-info_acc-info"]   30
    Ensure Loaded
    Click Element    //*[@id="dt_core_account-info_acc-info"]
    Wait Until Page Contains Element    dt_core_account-switcher_demo-tab    30
    Click Element    dt_core_account-switcher_demo-tab    
    Page Should Contain Element    //*[@id="dt_VRTC6202200"]    40
    Click Element    //*[@id="dt_VRTC6202200"]
    Ensure Loaded

Click Volatility 50
    Page Should Contain Element    //div[@class="cq-symbol-select-btn"]    40
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //span[@class="ic-icon ic-synthetic_index"]    40
    Click Element    //span[@class="ic-icon ic-synthetic_index"]
    Wait Until Page Contains Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ50V "]    30 
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ50V "]
    Wait Until Page Contains Element    //div[@id="dt_contract_dropdown"]    40
    Click Element   //div[@id="dt_contract_dropdown"] 
    Page Should Contain Element    //div[@id="dt_contract_multiplier_item"]    30
    Click Element    //div[@id="dt_contract_multiplier_item"]


*** Test Cases ***
Buy a contract
    Login at Deriv
    Click Volatility 50
    #should not contain payout
    Page Should Not Contain Element    payout
    #20,40,60,100,200
    Wait Until Page Contains Element    //div[@id="dropdown-display"]    30
    Click Element    //div[@id="dropdown-display"]
    Page Should Contain Element    ${take_profit}    30
    Page Should Contain Element    ${stop_loss}    30
    Page Should Contain Element    ${cancelation}    30
    Wait Until Page Contains Element    //*[@id="20"]    10
    Wait Until Page Contains Element    //*[@id="40"]    20
    Wait Until Page Contains Element    //*[@id="60"]    20
    Wait Until Page Contains Element    //*[@id="100"]    20
    Wait Until Page Contains Element    //*[@id="200"]    20
    Click Element    ${stake}
    Press Keys    ${stake}    CTRL+a+BACKSPACE
    Input Text    ${stake}    2001
    Sleep    10
    Press Keys    ${stake}    CTRL+a+BACKSPACE
    Input Text    ${stake}    -1
    Sleep    5
    Press Keys    ${stake}    CTRL+a+BACKSPACE
    Input Text    ${stake}    10
    Click Element    ${increment}
    Sleep    2
    Click Element    ${decrement}
    Click Element    ${cancelation}
    Click Element    ${minutes}
    Page Should Contain Element    //div[@id="5m"]
    Page Should Contain Element    //div[@id="10m"]
    Page Should Contain Element    //div[@id="15m"]
    Page Should Contain Element    //div[@id="30m"]
    Page Should Contain Element    //div[@id="60m"]


        

    

         
    