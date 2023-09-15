*** Settings ***

Documentation       All the page objects and keywords of Navigation Bar
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Donation_Button}          //*[@text='Donations']
${GiftMoney_Button}         //*[@text='Gift Money']
*** Keywords ***
Open Donations Page from More Screen
    Sleep    5s
     FOR    ${element}    IN RANGE    0    5
        Swipe    15    600    15    200
        ${el}    Run Keyword And Return Status    Wait Until Page Contains Element    ${Donation_Button}
        log    ${el}
        Run Keyword If    ${el}     Exit For Loop
        ${element}    Set Variable    ${element}+1
    END
    Click Element   ${Donation_Button}
Open Gift Money Page from More Screen
    Sleep    5s
    FOR    ${element}    IN RANGE    0    5
        Swipe    15    600    15    200
        ${el}    Run Keyword And Return Status    Wait Until Page Contains Element    ${GiftMoney_Button}
        log    ${el}
        Run Keyword If    ${el}     Exit For Loop
        ${element}    Set Variable    ${element}+1
    END
    Click Element   ${GiftMoney_Button}


