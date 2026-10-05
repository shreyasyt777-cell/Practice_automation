*** Settings ***

Library    Browser
Library    String
Resource    ../page_object/contactus_locators.resource

*** Keywords ***

contact_us
    Set Browser Timeout    60s
    New Browser    chromium    headless=False
    New Context    ignoreHTTPSErrors=True
    New Page    https://automationexercise.com/


    Wait For Elements State    ${contactus}    enabled    timeout=20s
    Click    ${contactus}

    Wait For Elements State    ${get_in_touch}    visible    timeout=20s
    ${random_number}=    Evaluate    random.randint(1,5)    modules=random
    ${name_text}=    Generate Random String    ${random_number}    [LETTERS]

    Fill Text    ${name}    ${name_text}

    
    ${email_textt}=    Set Variable    ${name_text}@gmail.com
    Fill Text    ${email}    ${email_textt}

    ${subject_text}=    Generate Random String    10    [LETTERS]
    Fill Text    ${subject}    ${subject_text}

    ${message_text}    Generate Random String    30    [LETTERS]
    Fill Text    ${message}    ${message_text}

    Upload File By Selector    ${upload_file}    C:/Users/narassh/OneDrive - Tecnotree/Desktop/Robot Framework/testdata.xlsx

    Handle Future Dialogs    accept

    Click    ${submit}
    Sleep    1s

    Wait For Elements State    ${verify_sucess_msg}    visible    timeout=10s

    Click    ${home}

    Sleep    2s
    Browser.Close Browser
