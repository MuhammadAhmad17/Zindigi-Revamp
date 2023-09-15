*** Settings ***

Documentation       All the page objects and keywords of Navigation Bar
Library             AppiumLibrary
Resource            GenericResource.robot


*** Variables ***
${Open_CharityDropDown}     //*[@text='Select Charity Organization']/following-sibling::*[1]/child::*[1]
${select_Organization}      //*[@text='AL KHIDMAT FOUNDATION PAKISTAN']
${Amount_Field}             //*[@text='Enter Donation Amount']/following-sibling::*[1]/child::*[1]
${Next_button}              //*[@text='Next']
${Back_button}              //*[@text='Transaction Details']/preceding-sibling::*[1]/child::*[1]
*** Keywords ***
Select Charity Organization and Enter Donation Amount
    [Arguments]       ${Entered_Amount}
    Wait Until Page Contains Element    ${Open_CharityDropDown}     15s
    Click Element    ${Open_CharityDropDown}
    Click Element    ${select_Organization}
    Input Text       ${Amount_Field}    ${Entered_Amount}
    Click Element    ${Next_button}
click on back button
    Wait Until Page Contains Element    ${Back_button}      20s
    Click Element    ${Back_button}




