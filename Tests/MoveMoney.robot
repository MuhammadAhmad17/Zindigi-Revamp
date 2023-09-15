*** Settings ***
Documentation       To validate the transactions through Move Money
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/SplashScreen.robot
Resource            ../PO/HomePage.robot
Resource            ../PO/GenericResource.robot
Resource            ../PO/MoveMoneyPage.robot
Resource            ../PO/ReviewDetailsPage.robot
Resource            ../PO/Authentication.robot
Resource            ../PO/ReviewApp.robot
Resource            ../PO/Receipt.robot
Resource            ../PO/Navigation.robot


*** Variables ***


*** Test Cases ***
#Open Login Page From Splash Screen
    #SplashScreen.Open Login Screen
#Validate Zindigi to Zindigi Transaction
    #LoginPage.Open Zindigi Application
    #LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
    #HomePage.check Home Page is open after Login
    #MoveMoneyPage.Open Move Money Page
    #MoveMoneyPage.Open Zindigi to Zindigi page
    #MoveMoneyPage.Enter Mobile Number ,Nick and Amount      ${Receiver_Mobile_Number}       ${Receiver_Nick}        ${Entered_Amount}
    #MoveMoneyPage.Click Next Button
    #Wait Until Page Contains Element        ${Send-Money-Button}        timeout=40
    #ReviewDetailsPage.Click Send Money On Review Details Page
    #Authentication.Enter PIN            ${ValidUser_Pin}
    #ReviewApp.Click on later button on review dialog box
    #Receipt.Click Done Button on Receipt

#Validate Account Balance is Update on Home Page After Transaction
    #Navigation.Open Home Page from Navigation Bar
    #HomePage.Check balance is updated after transaction on Home Page    ${Entered_Amount}

#Validate IBFT Transaction
    #LoginPage.Open Zindigi Application
    #LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
    #HomePage.check Home Page is open after Login
    #MoveMoneyPage.Open Move Money Page
    #MoveMoneyPage.Click Bank Account On Move Money to transfer money through IBFT
    #Sleep    10s
    #MoveMoneyPage.Select Bank from drop down
    #MoveMoneyPage.Enter Account Number ,Amount and Nick         ${Account_IBAN}           ${Entered_Amount}     ${Receiver_Nick}
    #MoveMoneyPage.Click Next Button
    #Sleep    10s
    #Wait Until Element Is Visible           ${Send-Money-Button}        40s
    #ReviewDetailsPage.Click Send Money On Review Details Page
    #Authentication.Enter PIN            ${ValidUser_Pin}
    #Receipt.Click Done Button on Receipt

#Validate Account Balance is Update on Home Page After Transaction
    #Navigation.Open Home Page from Navigation Bar
    #HomePage.Check balance is updated after transaction on Home Page    ${Entered_Amount}

Validate Raast Transaction
    LoginPage.Open Zindigi Application
    LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
    HomePage.check Home Page is open after Login
    MoveMoneyPage.Open Move Money Page
    MoveMoneyPage.Click Raast On Move Money Page to transfer money through Raast
    MoveMoneyPage.Enter Raast_Id ,Amount and Nick         ${Raast_Id}                ${Entered_Amount}
    MoveMoneyPage.Click Next Button
    Sleep    10s
Verify the Data on Review Details Page
    ReviewDetailsPage.Verify Data is Correct on Review Details Page

    Wait Until Page Contains Element                      ${Send-Money-Button}        timeout=40
    ReviewDetailsPage.Click Send Money On Review Details Page
    Authentication.Enter PIN                              ${ValidUser_Pin}
    Wait Until Page Contains Element                      ${Done_Button}          timeout=30
    Receipt.Click Done Button on Receipt
    MoveMoneyPage.Link Zindigi Account to Raast

#Validate Account Balance is Update on Home Page After Transaction
    #Navigation.Open Home Page from Navigation Bar
    #HomePage.Check balance is updated after transaction on Home Page    ${Entered_Amount}
