*** Settings ***
Documentation       To validate the login form
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/ProfilePage.robot
Resource            ../PO/HomePage.robot
Resource            ../PO/Themes.robot
Resource            ../PO/GenericResource.robot
Resource            ../PO/HamburgerMenu.robot


*** Variables ***


*** Test Cases ***
Validate Successful Login
    LoginPage.Open Zindigi Application
    LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
Validate Zindigi Homepage is Open after Successfull Login
    HomePage.check Home Page is open after Login
Validate User Can Edit Profile Name on Profile Page
    Click on Hamburger menu on HomePage
    Open profile page from hamburger menu
    Click on Name to Edit it
    Enter Updated Name and Click on Next Button     ${Updated_Name}
    Verify Profile Name is updated              ${Updated_Name}
Validate User Can Edit Address on Profile Page
    Click on Address to Edit it
    Enter Updated Address and Click on Update Button     ${Updated_Address}
    Verify Profile Address is updated              ${Updated_Address}
Validate User Can Change Network on Profile Page
    Click on Network to Change it
    Select Network from dropdown and click on Next Button
    Verify Profile Network is updated Successfully
#Verify User can change the Themes
#    Open Themes Page to Change it
