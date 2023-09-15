*** Settings ***
Documentation       To validate the login form
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/HomePage.robot
Resource            ../PO/Navigation.robot
Resource            ../PO/MorePage.robot
Resource            ../PO/GiftMoneyPage.robot
Resource            ../PO/ReviewDetailsPage.robot
Resource            ../PO/DonationsPage.robot
Resource            ../PO/Authentication.robot




*** Variables ***


*** Test Cases ***
Validate Successful Login
    LoginPage.Open Zindigi Application
    LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
Validate Zindigi Homepage is Open after Successfull Login
    HomePage.check Home Page is open after Login
Validate User Can Successfully Request for Gift Money
    Open More Screen From bottom Navigation bar
    Open Gift Money Page from More Screen
    Click on Request Gift Money Button and Add Recipient
    Enter Name ,Mobile Number and Amount and click on next button      ${Receiver_Nick}      ${Receiver_Mobile_Number}          ${Entered_Amount}
    Click on Request Now button on Review Details Page
    verify Request is sent Successfully
Validate User Can Successfully Send Gift Money
    Click on Send Gift Money Button and Add Recipient
    Enter Name ,Mobile Number and Amount and click on next button      ${Receiver_Nick}      ${Receiver_Mobile_Number}          ${Entered_Amount}
    Click Send Now On Review Details Page
    Enter PIN       ${ValidUser_Pin}
    Go back to More screen
Validate Account Balance is Update on Home Page After Transaction
    Open Home Page from Navigation Bar
    Check balance is updated after transaction on Home Page    ${Entered_Amount}


