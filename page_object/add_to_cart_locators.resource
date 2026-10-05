*** Settings ***

Library    Browser

*** Variables ***

${product}    //a[contains(text(), "Products")]
${first_product}    (//div[@class='single-products'])[1]
${f_P_add_to_cart}    (//a[@data-product-id='1'])[1]
${continue_shopping}    //button[.='Continue Shopping']
${second_product}    (//div[@class='single-products'])[2]
${s_p_add_to_cart}    (//a[@data-product-id='2'])[1]
${view_cart}    //u[.='View Cart']
