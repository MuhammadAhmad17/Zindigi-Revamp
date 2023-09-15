*** Settings ***

Documentation       All the page objects and keywords of Authentication Dialog Box
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Later_Review_Button}      //*[@text='LATER']
*** Keywords ***
Click on later button on review dialog box
    Wait Until Page Contains Element   ${Later_Review_Button}       timeout=25
    Click Element           ${Later_Review_Button}
