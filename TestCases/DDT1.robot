*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/login_resources.robot
Suite Setup     Open MyBrowser
Suite Teardown  Close Browser
Test Template   Invalid Login

# Specify Test Data in the Script
*** Test Cases ***              username                    password
RightUser EmptyPassword         admin@yourstore.com         ${EMPTY}
RightUser WrongPassword         admin@yourstore.com         xyz
WrongUser RightPassword         adm@yourstore.com           admin
WrongUser EmptyPassword         min@yourstore.com           ${EMPTY}
WrongUser WrongPassword         in@yourstore.com            xyx

*** Keywords ***
Invalid Login
    [Arguments]  ${username}    ${password}
    Input Username  ${username}
    Input Password  ${password}
    Click LoginButton
    Error Message should be Visible
