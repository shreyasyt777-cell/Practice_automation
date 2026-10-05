*** Settings ***
Library    Browser

*** Variables ***

${proceed_checkout}    //a[.='Proceed To Checkout']
${register/login}    //u[.='Register / Login']\
${cart}    //a[.=' Cart']  
${comment_on_product}     [name='message']
${place_order}    //a[.='Place Order']
${name_on_card}    [name='name_on_card']
${card_number}    [name='card_number']
${cvc}    [name='cvc']
${expiry_month}    [name='expiry_month']
${expiry_year}    [name='expiry_year']
${pay_button}    [id='submit']
${download_invoice_button}    //a[.='Download Invoice']
${continue_button}    //a[.='Continue']
${delete_account}     //a[.=' Delete Account']