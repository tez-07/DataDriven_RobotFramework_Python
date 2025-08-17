*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login_resources.robot
Library     DataDriver  ../TestData/LoginData.csv  Sheet_name= csv

Suite Setup     Open MyBrowser
Suite Teardown  Close Browser
Test Template   Invalid Login

*** Test Cases ***
LoginTestWithExcel using    ${username} and ${password}

*** Keywords ***
Invalid Login
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password  ${password}
    Click LoginButton
    Error Message should be Visible