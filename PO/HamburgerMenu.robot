*** Settings ***

Documentation       All the page objects and keywords of Navigation Bar
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Logout_Button}       //*[@text='Logout']
${Confirm_Logout}      //*[@text='Yes']
${Open_Profile}         //*[@text='Account Number']
*** Keywords ***
Click On Logout Button and confirm logout from pop up
    FOR    ${element}    IN RANGE    0    5
        Swipe    15    600    15    200
        ${el}    Run Keyword And Return Status    Wait Until Page Contains Element    ${Logout_Button}
        log    ${el}
        Run Keyword If    ${el}     Exit For Loop
        ${element}    Set Variable    ${element}+1
    END
    Click Element   ${Logout_Button}
    Wait Until Page Contains Element    ${Confirm_Logout}
    Click Element    ${Confirm_Logout}

Open profile page from hamburger menu
    Click Element    ${Open_Profile}

