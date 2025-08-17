*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F

*** Keywords ***
Open MyBrowser
    open browser    ${url}      ${browser}
    maximize browser window

Close Browser
    close all browsers

Open LoginPage
    go to  ${url}

Input Username
    [Arguments]     ${username}
    input text  id:Email    ${username}

Input Password
    [Arguments]     ${password}
    input text  id:Password     ${password}

Click LoginButton
    click element   xpath://button[text()='Log in']

Click LogoutButton
    click link  logout

Error Message should be Visible
    page should contain     Login was unsuccessful

Dashboard page should be Visible
    page should contain     Dashboard