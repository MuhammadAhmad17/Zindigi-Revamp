*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Resource            Login.robot
#Resource            GenericResource.robot

*** Variables ***
${Enter_Number}                        //*[@text='Mobile Number']/following-sibling :: *[1]//*[1]
${Enter_Pin}                          //*[@text='PIN']/following-sibling :: *[1]//*[1]
${Login-Button}                      //*[@text='Login']
${Allow-Button}                     id=com.android.packageinstaller:id/permission_allow_button
${Forgot_Pin}                      //*[@text='Forgot PIN?']
${Enter_Cnic}                     //*[@text='CNIC'] /following-sibling :: *[1]/child :: *[1]/child :: *[1]
${Submit_Button}                 //*[@text='Submit']
${Reset_Page_Title}             //*[@text='Reset Login PIN']
${New_Pin}                     //*[@text='New PIN']//following-sibling::*[1]/child::*[last()-4]
${Confirm_New_Pin}            //*[@text='Confirm New PIN']//following-sibling::*[1]/child::*[last()-4]
${Change_Button}             //*[@text='Change Now']
${Cancel-resetPin-Popup}        cross


*** Keywords ***
Open Zindigi Application
    Open Application              http://localhost:4723/wd/hub       platformName=Android        platformVersion=8       deviceName=6NUDU18A17010437       appPackage=com.wallet.zindigi       appActivity=Views.SN_VNCA
Fill the Login form
    [Arguments]                                ${User_Number}         ${User_Pin}
    Wait Until Element Is Visible              ${Enter_Number}        timeout=10
    Input Text                                 ${Enter_Number}        ${User_Number}
    Input Password                             ${Enter_Pin}           ${User_Pin}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}

Click on Forgot Pin on Login Page
    Click Element    ${Forgot_Pin}
Enter Mobile Number and CNIC of User
    [Arguments]                               ${User_Number}         ${User_Cnic}
    Wait Until Page Contains Element          ${Enter_Number}
    Input Text                                ${Enter_Number}           ${User_Number}
    Input Text                                ${Enter_Cnic}             ${User_Cnic}

Click on Submit Button and Allow Permissions
    Click Element       ${Submit_Button}
#    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
#    Click Element                              ${Allow-Button}
#    Wait Until Page Contains Element    ${Submit_Button}    10s
#    Click Element       ${Submit_Button}
    Sleep       25s

Verify OTP Is Auto-fetched and Reset Login Pin Screen is Open
    Wait Until Page Contains Element    ${Reset_Page_Title}     timeout=30
    ${Title_Text}       Get Text        ${Reset_Page_Title}
    Should Be Equal As Strings                          ${Title_Text}       Reset Login PIN

Enter New Pin And Confirm It
    [Arguments]       ${Pin}            ${Cnfrm_Pin}
    Input Text        ${New_Pin}            ${Pin}
    Input Text        ${Confirm_New_Pin}        ${Cnfrm_Pin}
    Click Element    ${Change_Button}
    Click Element    ${Cancel-resetPin-Popup}
Verify Pin is Reset successfully by login through new pin
    [Arguments]                                ${User_Number}         ${Pin}
    Wait Until Element Is Visible              ${Enter_Number}        timeout=10
    Input Text                                 ${Enter_Number}        ${User_Number}
    Input Password                             ${Enter_Pin}           ${Pin}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}
    check Home Page is open after Login

Verify user is successfully Logout
    Wait Until Page Contains Element     //*[@text='Sign in to your account']    15s
    ${Signin_Text}     Get Text        //*[@text='Sign in to your account']
    Should Be Equal As Strings    ${Signin_Text}      Sign in to your account



    
