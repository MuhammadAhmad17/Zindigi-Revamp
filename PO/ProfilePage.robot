*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
#Resource            GenericResource.robot

*** Variables ***
${ProfileName_Editbutton}         //*[@text='Name']
${Address_Editbutton}             //*[@text='Address']
${UpdateName_Field}               //*[@text='Updated Name']/following-sibling::*[1]/child::*
${UpdateAddress_Field}            //*[@text='Update Address']/following-sibling::*[1]/child::*[1]
${User_name}                      //*[@text='Name']/following-sibling::*[1]
${Next_button}                    //*[@text='Next']
${Update_button}                  //*[@text='Update']
${User_Address}                   //*[@text='Address']/following-sibling::*[1]
${Allow_Button}                   com.android.packageinstaller:id/permission_allow_button
${ChangeNetwork_button}           //*[@text='Network']
${Open_Drpdown}                   //*[@text='Network']/following-sibling::*[1]/child::*[1]
${Network_Name}                   //*[@text='Telenor']
${Updated_Network}                //*[@text='Network']/following-sibling::*[1]
*** Keywords ***
Click on Name to Edit it
    Click Element    ${ProfileName_Editbutton}
Enter Updated Name and Click on Next Button
    [Arguments]    ${Updated_Name}
    Wait Until Page Contains Element    ${UpdateName_Field}     15s
    Input Text    ${UpdateName_Field}       ${Updated_Name}
    Click Element    ${Next_button}
    Wait Until Page Contains Element    //*[@content-desc='cross']      20s
    Click Element    //*[@content-desc='cross']
Verify Profile Name is updated
    [Arguments]    ${Updated_Name}
    Wait Until Page Contains Element    ${User_name}        15s
    ${UserProfile_Name}     Get Text    ${User_name}
    Should Be Equal As Strings    ${UserProfile_Name}       ${Updated_Name}
Click on Address to Edit it
    Click Element    ${Address_Editbutton}
Enter Updated Address and Click on Update Button
    [Arguments]    ${Updated_Address}
    Wait Until Page Contains Element    ${Allow_Button}         15s
    Click Element    ${Allow_Button}
    Wait Until Page Contains Element    ${UpdateAddress_Field}   15s
    Input Text    ${UpdateAddress_Field}     ${Updated_Address}
    Click Element    ${Update_button}
    Wait Until Page Contains Element    //*[@content-desc='cross']      20s
    Click Element    //*[@content-desc='cross']
Verify Profile Address is updated
    [Arguments]    ${Updated_Address}
    Wait Until Page Contains Element    ${User_Address}      15s
    ${Profile_Address}      Get Text    ${User_Address}
    Should Be Equal As Strings    ${Profile_Address}    ${Updated_Address}
Click on Network to Change it
    Click Element    ${ChangeNetwork_button}
Select Network from dropdown and click on Next Button
    Click Element    ${Open_Drpdown}
    Wait Until Page Contains Element    ${Network_Name}
    Click Element    ${Network_Name}
    Click Element     ${Next_button}
    Wait Until Page Contains Element    //*[@content-desc='cross']      25s
    Click Element    //*[@content-desc='cross']
Verify Profile Network is updated Successfully
    ${selected_Network}     Get Text    ${Network_Name}
    Wait Until Page Contains Element        ${Updated_Network}      15s
    ${Updated_UserNetwork}      Get Text    ${Updated_Network}
    Should Be Equal As Strings    ${Updated_UserNetwork}    ${selected_Network}











