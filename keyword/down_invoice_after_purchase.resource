*** Settings ***

Library    Browser
Library    String
Resource    ../page_object/down_invoice_after_purchase_locators.resource
Resource    ../keyword/signup.resource
Resource    ../keyword/launch_app.resource
Resource    ../keyword/add_to_cart.resource


*** Keywords ***
download_invoice
    launch_app
    add_to_cart
    Wait For Elements State    ${proceed_checkout}    enabled    timeout=10s
    Click    ${proceed_checkout}
    Click    ${register/login}
    signup
    Wait For Elements State    ${cart}    enabled     timeout=10s
    Click    ${cart}     
    Wait For Elements State    ${proceed_checkout}    enabled    timeout=10s
    Click    ${proceed_checkout}

    ${card_name_text}=    Generate Random String    10    [LETTERS]
    Fill Text    ${comment_on_product}    ${card_name_text}

    Click    ${place_order}

    Wait For Elements State    ${name_on_card}    enabled    timeout=10s
    ${name_on_card_text}=    Generate Random String    5    [LETTERS]
    Fill Text    ${name_on_card}    ${name_on_card_text}

    ${card_number_text}=    Generate Random String    12    [NUMBERS]
    Fill Text    ${card_number}    ${card_number_text}

    ${cvc_text}=    Generate Random String    3    [NUMBERS]
    Fill Text    ${cvc}    ${cvc_text}

    ${expiry_month_text}=    Evaluate    random.randint(1,12)    modules=random
    Fill Text    ${expiry_month}    ${expiry_month_text}
    
    ${expiry_year_text}=    Evaluate    random.randint(2026,2032)    modules=random
    Fill Text    ${expiry_year}    ${expiry_year_text}

    Click    ${pay_button}

    Click    ${download_invoice_button}

    Click    ${continue_button}

    Click    ${delete_account}

    Click    ${continue_button}

    Sleep    3s

    