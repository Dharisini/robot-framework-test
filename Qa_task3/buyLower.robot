*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button'

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
    Ensure Loaded

Click High and Low
    Page Should Contain Element    //div[@class="cq-symbol-select-btn"]    40
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //span[@class="ic-icon ic-forex"]    40
    Click Element    //span[@class="ic-icon ic-forex"]
    Wait Until Page Contains Element    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]    30 
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
    Wait Until Page Contains Element    //div[@id="dt_contract_dropdown"]    40
    Click Element   //div[@id="dt_contract_dropdown"] 
    Wait Until Page Contains Element    //div[@id="dt_contract_high_low_item"]    30
    Click Element    //div[@id="dt_contract_high_low_item"]


*** Test Cases ***
Buy a contract
    Login at Deriv
    Click High and Low
    Wait Until Page Contains Element    //input[@class="dc-input__field"]    10
    Press Keys    //input[@class="dc-input__field"]    CTRL+a+BACKSPACE
    Input Text    //input[@class="dc-input__field"]    4
    Wait Until Page Contains Element    //button[@id="dc_payout_toggle_item"]    10
    Click Element    //button[@id="dc_payout_toggle_item"]
    Wait Until Page Contains Element    //input[@id="dt_amount_input"]    10
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE           
    Input Text    //input[@id="dt_amount_input"]    15.50   
    Wait Until Page Contains Element    //button[@class="btn-purchase btn-purchase--2"]    10
    Click Button    //button[@class="btn-purchase btn-purchase--2"]     

    

         
    