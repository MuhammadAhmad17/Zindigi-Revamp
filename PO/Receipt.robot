*** Settings ***

Documentation       All the page objects and keywords of Authentication Dialog Box
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Done_Button}      //*[@text='DONE']
*** Keywords ***
Click Done Button on Receipt
    Wait Until Element Is Visible    ${Done_Button}     20s
    Click Element    ${Done_Button}


