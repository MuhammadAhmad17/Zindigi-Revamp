*** Settings ***
Documentation       All the keywords and Variables related to Gift Money Page
Resource            ../PO/HomePage.robot
Resource            ../PO/Navigation.robot


*** Variables ***
${RequestMoney_Button}      //*[@text='Request Gift Money']
${SendMoney_Button}         //*[@text='Send Gift Money']
${Add_recipient}           //*[@text='Next']/following-sibling::*[1]/child::*[1]
${Name_Field}               //*[@text='Name']/following-sibling::*[1]/child::*[1]/child::*[1]
${Mobile_Field}             //*[@text='Mobile Number']/following-sibling::*[1]/child::*[1]/child::*[1]
${Amount_Field}             //*[@text='Amount']/following-sibling::*[1]/child::*[1]/child::*[1]
${Next_Button}              //*[@text='Next']
${Rate_Later_Button}        //*[@text='Later']
${Backto_GiftMoney}         //*[@text='Gift Request Sent']/preceding-sibling::*[1]/child::*[1]
${Okay_button}              //*[@text='Okay']
${backto_SendGiftMoney}     //*[@text='Review Details']/preceding-sibling::*[1]/child::*[1]
${backto_sendGiftMoney_Main}                          //*[@text='Send Gift Money']/preceding-sibling::*[1]/child::*[1]
${Gift_Moneypage}            //*[@text='Send Gift Money']/preceding-sibling::*[1]/child::*[1]
${Backto_More}                  //*[@text='Gift Money']/preceding-sibling::*[1]/child::*[1]


*** Keywords ***
Click on Request Gift Money Button and Add Recipient
    Wait Until Page Contains Element    ${RequestMoney_Button}      15s
    Click Element    ${RequestMoney_Button}
    Wait Until Page Contains Element    ${Add_recipient}
    Click Element    ${Add_recipient}
Enter Name ,Mobile Number and Amount and click on next button
    [Arguments]    ${Receiver_Nick}     ${Receiver_Mobile_Number}       ${Entered_Amount}
    Input Text     ${Name_Field}        ${Receiver_Nick}
    Input Text     ${Mobile_Field}      ${Receiver_Mobile_Number}
    Wait Until Page Contains Element    ${Amount_Field}     10s
    Input Text     ${Amount_Field}      ${Entered_Amount}
    Click Element    ${Next_Button}
verify Request is sent Successfully
    Wait Until Page Contains Element    ${Rate_Later_Button}    15s
    Click Element    ${Rate_Later_Button}
    Click Element    ${Backto_GiftMoney}
Click on Send Gift Money Button and Add Recipient
    Wait Until Page Contains Element    ${SendMoney_Button}     15s
    Click Element    ${SendMoney_Button}
    Wait Until Page Contains Element    ${Add_recipient}        15s
    Click Element    ${Add_recipient}
Go back to More screen
    Wait Until Page Contains Element    ${Okay_button}      15s
    Click Element    ${Okay_button}
    Wait Until Page Contains Element    ${backto_SendGiftMoney}     15s
    Click Element     ${backto_SendGiftMoney}
    Wait Until Page Contains Element    ${backto_sendGiftMoney_Main}    15s
    Click Element       ${backto_sendGiftMoney_Main}
    Wait Until Page Contains Element        ${Gift_Moneypage}       15s
    Click Element       ${Gift_Moneypage}
    Wait Until Page Contains Element     ${Backto_More}     15s
    Click Element       ${Backto_More}











