*** Settings ***
Library    Browser

*** Variables ***

${browser}    chrome
${url}    https://www.automationexercise.com/ 

${signup-login}    //a[text()=' Signup / Login']

${login_email}    [name="email"][data-qa="login-email"]
${login_password}    [name='password']

${login_email_text}    ahkjd@gmail.com
${login_password_text}    sjkhda7

${login}    //button[.='Login']

