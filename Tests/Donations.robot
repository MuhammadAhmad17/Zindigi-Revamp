*** Settings ***
Documentation       To validate the login form
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/HomePage.robot
Resource            ../PO/Navigation.robot
Resource            ../PO/MorePage.robot
Resource            ../PO/DonationsPage.robot
Resource            ../PO/Authentication.robot




*** Variables ***


*** Test Cases ***
Validate Successful Login
    LoginPage.Open Zindigi Application
    LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
Validate Zindigi Homepage is Open after Successfull Login
    HomePage.check Home Page is open after Login
Validate User Can Donate to Charity Organizations
    Open More Screen From bottom Navigation bar
    Open Donations Page from More Screen
    Select Charity Organization and Enter Donation Amount       ${Entered_Amount}
    Enter PIN       ${ValidUser_Pin}
    click on back button
Validate Account Balance is Update on Home Page After Transaction
    Open Home Page from Navigation Bar
    Check balance is updated after transaction on Home Page    ${Entered_Amount}