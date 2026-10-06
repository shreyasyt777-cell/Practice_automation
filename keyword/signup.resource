*** Settings ***
Library    Browser
Library    String
Resource    ../page_object/signup_locators.resource

*** Keywords ***
signup
    Wait For Elements State    ${signup-login}    enabled    timeout=20s
    Click    ${signup-login}
    Wait For Elements State    ${signup_name}    enabled    timeout=20s
    ${signup_name_text}=    Generate Random String    5    [LETTERS]
    Fill Text    ${signup_name}    ${signup_name_text}
    ${random_email}=    Generate Random String    5    [LETTERS][NUMBERS]
    ${signup_email_text}=    Set Variable    ${random_email}@gmail.COM
    Fill Text    ${signup_email}    ${signup_email_text}
    Click    ${signup_button}


    Wait For Elements State    ${mr_r_button}    enabled    timeout=20s
    Click    ${mr_r_button}
    Sleep    1s

    ${signup_password_text}=    Generate Random String    7    [NUMBERS][LETTERS]
    Fill Text    ${signup_password}    ${signup_password_text}
    Sleep    1s

    ${day}=    Evaluate    str(random.randint(1,31))    modules=random
    Select Options By    ${day_dropdown}    value    ${day}

    ${month}=    Evaluate    str(random.randint(1,12))    modules=random
    Select Options By    ${months_dropdown}    value    ${month}

    ${year}=    Evaluate    str(random.randint(1900,2021))    modules=random
    Select Options By    ${years_dropdown}    value    ${year}
    Sleep    1s
    
    ${first_name_text}=    Generate Random String    5    [LETTERS]
    Fill Text    ${first_name}    ${first_name_text}
    Sleep    1s

    ${last_name_text}=    Generate Random String    4    [LETTERS]   
    Fill Text    ${last_name}    ${last_name_text}
    Sleep    1s

    Fill Text    ${address}    tecnotree, bengaluru
    Sleep    1s

    ${country}=    Evaluate    random.randint(1,7)    modules=random
    Select Options By    ${country_dropdown}    index    ${country}  
    Sleep    1s  

    Fill Text    ${state}    karnataka
    Fill Text    ${city}    bengaluru
    Sleep    1s
 
    IF    ${country} == 1
        ${zipcode_text}=    Evaluate    random.randint(100000,999999)    modules=random

    ELSE IF    ${country} == 2
        ${zipcode_text}=    Evaluate    random.randint(10000,99999)    modules=random

    ELSE IF    ${country} == 3
        ${numbers}=    Evaluate    str(random.randint(100,999))    modules=random
        ${letters}=    Generate Random String    3    [LETTERS]
        ${zipcode_text}=    Set Variable    ${letters}[0]${numbers}[0]${letters}[1] ${numbers}[1]${letters}[2]${numbers}[2]

    ELSE IF    ${country} == 4
        ${zipcode_text}=    Evaluate    random.randint(1000,9999)    modules=random

    ELSE IF    ${country} == 5
        ${zipcode_text}=    Evaluate    random.randint(1000000,9999999)    modules=random

    ELSE IF    ${country} == 6
        ${zipcode_text}=    Evaluate    random.randint(1000,9999)    modules=random

    ELSE IF    ${country} == 7
        ${zipcode_text}=    Evaluate    random.randint(100000,999999)    modules=random
    
    END
    Sleep    1s

    Fill Text    ${zipcode}    ${zipcode_text}

    IF    ${country} <= 3
        ${mobile_number_text}=    Evaluate    random.randint(6000000000,9999999999)    modules=random
    
    ELSE IF    ${country} <=6
        ${mobile_number_text}=    Evaluate    random.randint(100000000,999999999)    modules=random
        
    ELSE    
        ${mobile_number_text}=    Evaluate    random.randint(10000000,99999999)    modules=random

    END
    Sleep    1s   
    
    Fill Text    ${mobile_number}    ${mobile_number_text}
    Sleep    1s

    Click    ${create_account}

    Wait For Elements State    ${continue}    enabled    timeout=10s
    Click    ${continue}

    Sleep    2s


    
    