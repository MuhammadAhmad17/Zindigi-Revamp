*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Move-Money-Button}            //*[@text='MOVE MONEY'][position()=1]
${Z-Z-Button}                   //*[@text='Zindigi']
${Enter-Mobile-Number}          //*[@text='Mobile Number']/following-sibling :: *[1]//*[1]
${Enter-Nick}                   //*[@text='Nick']/following-sibling :: *[1]//*[1]
${Enter-Amount}                 //*[@text='Amount']/following-sibling :: *[1]//*[1]
${Next-Button}                  //*[@text='NEXT']
${Bank_Account_Button}          //*[@text='Bank Account']
${click_dropdown}               //*[@text='Bank']/following-sibling :: *[1]//*[1]
${Select_Bank}                  //*[@text='ALFALAH']
${Enter_IBAN}                   //*[@text='Account Number / IBAN'] /following-sibling :: *[1]/child :: *[1]/child :: *[1]
${Raast_Button}                 //*[@text='Raast']
${Raast_Input}                  //*[@text='RAAST ID']/following-sibling :: *[1]//*[1]
${Link_Raast}                   //*[@text='NO']
*** Keywords ***
Open Move Money Page
    Wait Until Page Contains Element    ${Move-Money-Button}        timeout=25
    Click Element                       ${Move-Money-Button}
Open Zindigi to Zindigi page
    Wait Until Page Contains Element    ${Z-Z-Button}       timeout=15
    Click Element                       ${Z-Z-Button}
Enter Mobile Number ,Nick and Amount
    [Arguments]                                ${Receiver_Number}         ${Receiver_Nick}      ${Entered_Amount}
    Input Text                          ${Enter-Mobile-Number}          ${Receiver_Number}
    Wait Until Page Contains Element    ${Enter-Nick}
    Input Text                          ${Enter-Nick}                   ${Receiver_Nick}
    Input Text                          ${Enter-Amount}                  ${Entered_Amount}
Click Next Button
    Click Element                       ${Next-Button}
Click Bank Account On Move Money to transfer money through IBFT
    Wait Until Page Contains Element        ${Bank_Account_Button}          20s
    Click Element                           ${Bank_Account_Button}
Select Bank from drop down
    Wait Until Page Contains Element        ${click_dropdown}                30s
    Click Element                           ${click_dropdown}
    Click Element                           ${Select_Bank}
Enter Account Number ,Amount and Nick
    [Arguments]         ${IBAN}           ${Entered_Amount}     ${Receiver_Nick}
    Input Text          ${Enter_IBAN}       ${IBAN}
    Input Text          ${Enter-Amount}                  ${Entered_Amount}
    Wait Until Page Contains Element    ${Enter-Nick}
    Input Text                          ${Enter-Nick}                   ${Receiver_Nick}
Click Raast On Move Money Page to transfer money through Raast
    Wait Until Page Contains Element        ${Raast_Button}     timeout=25
    Click Element    ${Raast_Button}
Enter Raast_Id ,Amount and Nick
    [Arguments]         ${Raast}                      ${Entered_Amount}
    Input Text          ${Raast_Input}      ${Raast}
    Wait Until Page Contains Element        ${Enter-Amount}         timeout=30
    Input Text          ${Enter-Amount}     ${Entered_Amount}
Link Zindigi Account to Raast
    Wait Until Page Contains Element    ${Link_Raast}
    Click Element      ${Link_Raast}
verify balance is updated after transaction on Home Page












