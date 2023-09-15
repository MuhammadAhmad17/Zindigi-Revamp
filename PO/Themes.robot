*** Settings ***

Documentation       All the page objects and keywords of Navigation Bar
Library             AppiumLibrary
Resource            GenericResource.robot


*** Variables ***
${Open_Themes}      //*[@text='Themes']
${Select_Theme}     //*[@text='Pearl White']/following-sibling::*[1]
*** Keywords ***
Open Themes Page to Change it
    Click Element    ${Open_Themes}
    Wait Until Page Contains Element    ${Select_Theme}     15s
    #Click Element    ${Select_Theme}
    Element Should Be Disabled           ${Select_Theme}




