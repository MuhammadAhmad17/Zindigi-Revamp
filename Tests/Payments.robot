*** Settings ***
Documentation       To validate the transactions through Move Money
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/HomePage.robot
Resource            ../PO/GenericResource.robot
Resource            ../PO/Navigation.robot
Resource            ../PO/PaymentsPage.robot
Resource            ../PO/ReviewDetailsPage.robot
Resource            ../PO/Authentication.robot

*** Variables ***


*** Test Cases ***
#Verify User Can Successfully Perform Mobile Load Transaction Using Zindigi Mobile Application
    #Open Zindigi Application
    #Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
    #check Home Page is open after Login
    #Open Payments Page By Clicking On Payments Button
    #Click Mobile Load and Bundles Button on Payments Page
    #Click on Load Button on Mobile Loads And Bundles Page
    #Select the Network
    #Enter Receiver's Number, Amount and Name for Selected Network            ${ValidUser_Number}        ${Load_Amount}      ${Receiver_Nick}
    #Click Next Button
    #Click on Pay Now Button On Review Details Screen
    #Enter PIN            ${ValidUser_Pin}
Verify User Can Successfully Pay Bills And Fees Using Zindigi Mobile Application
    Open Zindigi Application
    Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
    check Home Page is open after Login
    Open Payments Page By Clicking On Payments Button
    Click Pay Bills and Fees on Payments Page
#   Select Category Company From Drop Down and Click on Next Button  ${Elec_Consumer_Num}    ${Receiver_Nick}
    Select Category from drop down



