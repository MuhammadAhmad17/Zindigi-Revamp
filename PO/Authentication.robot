*** Settings ***

Documentation       All the page objects and keywords of Authentication Dialog Box
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Enter_User_Pin}       //*[@text='Enter your 4-digit PIN.']/following-sibling :: *[1]//*[1]
${Next_Button}          //*[@text='NEXT']
*** Keywords ***
Enter PIN
    [Arguments]                                ${Authentication_Pin}
    Wait Until Page Contains Element            ${Enter_User_Pin}
    Input Text      ${Enter_User_Pin}          ${Authentication_Pin}
