*** Settings ***
Library    SeleniumLibrary
Library    string

*** Variables ***

${url}    https://www.automationexercise.com/
${browser}    chromium
## home page
${signup-login}    //a[text()=' Signup / Login']

## signup
${signup_name}    [name='name']
${signup_email}    [name="email"][data-qa="signup-email"]  
${signup_button}    //button[.='Signup']
${mr_r_button}    [id='id_gender1']
${mr_r_button_name}    title
${mr_r_button_value}    Mr
${signup_password}    [id='password']
${day_dropdown}    [id='days']
${months_dropdown}    [id='months']
${years_dropdown}    [id='years']
${first_name}    [id='first_name']
${last_name}    [id='last_name']
${company}    [id='company']
${address}    [id='address1']
${country_dropdown}    [id='country']
${state}    [id='state']
${city}    [id='city']
${zipcode}    [id='zipcode']
${mobile_number}    [id='mobile_number']
${create_account}    //button[.='Create Account']
${continue}    //a[.='Continue']