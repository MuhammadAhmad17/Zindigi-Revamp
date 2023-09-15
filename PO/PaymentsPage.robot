*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Library             BuiltIn
Library             Collections
Resource            ../PO/GenericResource.robot

*** Variables ***
${Load_Bundle_Button}           //*[@text='Mobile Load & Bundles']
${Load_Button}                  //*[@text='Load']
${Network_Button}               //*[@text='Select Network']/following-sibling::*[1]/child::*[2]
${Enter_Number_Field}           //*[@text="Enter Receiver's Number"]/following-sibling::*[1]/child::*[1]
${Enter_Load_Amount}            //*[@text='Enter Amount to Load']/following-sibling::*[1]/child::*[1]
${Name_Field}                   //*[@text='Name']/following-sibling::*[1]/child::*[1]
${Next_Button}                  //*[@text='Next']
${Pay_Bills/Fees_Button}        //*[@text='Pay Bills and Fees']
${Category_DropDown}            //*[@text='Category']/following-sibling::*[1]/child::*[1]
${Categories}                   //*[@text='Category']/following-sibling::*[3]/child::*/child::*/child::*/child::*
${Electricity_Category}         //*[@text='Electricity']
${Select_Company_dropdown}      com.wallet.zindigi:id/2131365874
${Electricity_Company}          //*[@text='IESCO']
${Enter_Consumer_Number}        //*[@text='Consumer Number']/following-sibling::*[1]/child::*[1]/child::*[1]
${Consumer_Nick}                //*[@text='Nick']/following-sibling::*[1]/child::*
${Okay_Button}                  //*[@text='OKAY']
${Gas_Company}                  //*[@text='SNGPL']
${Category_list}
${actual_cleaned_categories_list}
${ctg}




*** Keywords ***
Click Mobile Load and Bundles Button on Payments Page
    Wait Until Element Is Visible       ${Load_Bundle_Button}                   15s
    Click Element                       ${Load_Bundle_Button}
Click on Load Button on Mobile Loads And Bundles Page
    Wait Until Page Contains Element    ${Load_Button}                          15s
    Click Element                       ${Load_Button}
Select the Network
    Wait Until Page Contains Element    ${Network_Button}                       10s
    Click Element                       ${Network_Button}
Enter Receiver's Number, Amount and Name for Selected Network
    [Arguments]    ${Number}    ${Load}      ${Name}
    Input Text     ${Enter_Number_Field}      ${Number}
    Wait Until Page Contains Element    ${Enter_Load_Amount}                    10s
    Input Text    ${Enter_Load_Amount}       ${Load}
    Input Text    ${Name_Field}              ${Name}
Click Next Button
    Click Element    ${Next_Button}
Click Pay Bills and Fees on Payments Page
    Wait Until Page Contains Element    ${Pay_Bills/Fees_Button}                15s
    Click Element                       ${Pay_Bills/Fees_Button}
#Select Category Company From Drop Down and Click on Next Button
#    [Arguments]    ${Elec_Con_Num}      ${Con_Nick}
#    Wait Until Page Contains Element    ${Category_DropDown}                    15s
#    Click Element                       ${Category_DropDown}
#    Wait Until Page Contains Element    ${Electricity_Category}                 15s
#    Click Element                       ${Electricity_Category}
#    Wait Until Page Contains Element    ${Select_Company_dropdown}              25s
#    Click Element                       ${Select_Company_dropdown}
#    Wait Until Page Contains Element    ${Electricity_Company}
#    Click Element                       ${Electricity_Company}
#    Wait Until Page Contains Element    ${Enter_Consumer_Number}
#    Input Text    ${Enter_Consumer_Number}      ${Elec_Con_Num}
#    Wait Until Page Contains Element    ${Consumer_Nick}
#    Input Text    ${Consumer_Nick}      ${Con_Nick}
#    Click Element    ${Next_Button}
#    Wait Until Page Contains Element     ${Okay_Button}                           20s
#    Click Element                        ${Okay_Button}
Select Category from drop down
    @{expected_Categories}    Create List    Electricity    Gas
    Set Global Variable    ${Category_list}
    Wait Until Page Contains Element    ${Category_DropDown}                    15s
    Click Element                       ${Category_DropDown}
    Wait Until Page Contains Element    ${Categories}
    @{Category_list} =        Get WebElements     ${Categories}
    @{actual_Categories} =     Create List
    FOR    ${Category}   IN  @{Category_list}
        Log    ${Category.text}
        Append To List   ${actual_Categories}     ${Category.text}
    END
    Remove Empty Strings And Brackets       ${actual_Categories}
    ${actual_cleaned_categories_list}       Remove Empty Strings And Brackets       ${actual_Categories}
    Set Global Variable    ${actual_cleaned_categories_list}
    Log      ${actual_cleaned_categories_list}
    Log      ${expected_Categories}
    FOR    ${ctg}    IN    @{expected_Categories}
        log     ${ctg}
        ${is_category_in_list}=    Evaluate    '${ctg}' in ${actual_cleaned_categories_list}
        Run Keyword If    ${is_category_in_list}    Perform Action    ${ctg}    ${Elec_Consumer_Num}     ${Receiver_Nick}
    END
Remove Empty Strings And Brackets
    [Arguments]    ${actual_Categories}
    ${cleaned_list} =    Evaluate    [item for item in ${actual_Categories} if item != '']
    [Return]    ${cleaned_list}
    Log    ${cleaned_list}
Perform Action
    [Arguments]    ${ctg}   ${Elec_Consumer_Num}     ${Receiver_Nick}
    Log    ${ctg}
    Set Global Variable    ${ctg}
    IF    ${ctg} ==  'Gas'
        Click Element    ${ctg}
        Wait Until Page Contains Element    ${Select_Company_dropdown}              25s
        Click Element                       ${Select_Company_dropdown}
        Wait Until Page Contains Element    ${Electricity_Company}
        Click Element                       ${Electricity_Company}
        Wait Until Page Contains Element    ${Enter_Consumer_Number}
        Input Text    ${Enter_Consumer_Number}      ${Elec_Consumer_Num}
        Wait Until Page Contains Element    ${Consumer_Nick}
        Input Text    ${Consumer_Nick}      ${Receiver_Nick}
        Click Element    ${Next_Button}
        Wait Until Page Contains Element     ${Okay_Button}                           20s
        Click Element                        ${Okay_Button}
        Wait Until Page Contains Element    ${Category_DropDown}                    15s
        Click Element                       ${Category_DropDown}
    END






















