*** Settings ***

Documentation       All the page objects and keywords of Review Details page
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Send-Money-Button}        //*[@text='SEND MONEY']
${Send-Now-Button}        //*[@text='Send Now']
${Review_Details_Title}     //*[@text='Transfer to RAAST']
${Date_Text}                //*[@text='Date']
${From_Text}                //*[@text='From']
${Recipient_Text}                //*[@text='Recipient']
${Transaction_Amount_Text}      //*[@text='Transaction Amount']
${Fee_Text}                     //*[@text='Fee']
${Total_Text}                   //*[@text='Total']
${Pay_Now_Button}               //*[@text='PAY NOW']
${RequestNow_Button}               //*[@text='Request Now']
*** Keywords ***
Click Send Money On Review Details Page
    Click Element           ${Send-Money-Button}
Click on Pay Now Button On Review Details Screen
    Click Element           ${Pay_Now_Button}
Click Send Now On Review Details Page
    Wait Until Page Contains Element    ${Send-Now-Button}      15s
    Click Element    ${Send-Now-Button}
Click on Request Now button on Review Details Page
    Wait Until Page Contains Element    ${RequestNow_Button}        15s
    Click Element    ${RequestNow_Button}


Verify Data is Correct on Review Details Page
    ${Details_Title}    Get Text         ${Review_Details_Title}
    Should Be Equal As Strings    ${Details_Title}      Transfer to RAAST
    ${Date_Title}   Get Text    ${Date_Text}
    Should Be Equal As Strings    ${Date_Title}     Date
    ${From_Title}   Get Text    ${From_Text}
    Should Be Equal As Strings    ${From_Title}    From
    ${Recipient_Title}  Get Text   ${Recipient_Text}
    Should Be Equal As Strings    ${Recipient_Title}    Recipient
    ${Transaction_Amount_Title}     Get Text    ${Transaction_Amount_Text}
    Should Be Equal As Strings    ${Transaction_Amount_Title}     Transaction Amount
    ${Fee_Title}    Get Text    ${Fee_Text}
    Should Be Equal As Strings    ${Fee_Title}     Fee
    ${Total_Title}      Get Text    ${Total_Text}
    Should Be Equal As Strings    ${Total_Title}     Total






