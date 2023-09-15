*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Library             BuiltIn
Resource            GenericResource.robot


*** Variables ***
${Customer-Balance}                         //*[@text='PKR']/preceding-sibling :: *[last()-1]
${Hamburger_Menu}                           com.wallet.zindigi:id/2131363871
${Initial_Balance-Amount}
*** Keywords ***
check Home Page is open after Login
    Wait Until Page Contains Element                    ${Customer-Balance}                  timeout=25
    ${Initial_Balance-Amount}        Get Text           ${Customer-Balance}
    Set Global Variable                                 ${Initial_Balance-Amount}
    Log                                                 ${Initial_Balance-Amount}
    Should Be True                                      ${Initial_Balance-Amount}   >=0
Check balance is updated after transaction on Home Page
    [Arguments]                                         ${Entered_Amount}
    Wait Until Page Contains Element                    ${Customer-Balance}                 timeout=30
    ${New_Balance}                   Get Text           ${Customer-Balance}
    Log     ${New_Balance}
    ${Updated_Balance}               Evaluate            ${Initial_Balance-Amount} - ${Entered_Amount}
    Log     ${Updated_Balance}
    Should Be Equal As Strings                          ${New_Balance}       ${Updated_Balance}
Click on Hamburger menu on HomePage
    Click Element    ${Hamburger_Menu}


