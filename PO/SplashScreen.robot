*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Login-button}          //*[@text='Login']


*** Keywords ***
Open Login Screen
    Wait Until Element Is Visible         ${Login-button}       timeout=30

