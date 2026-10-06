*** Settings ***
Library    Browser
Resource    ../keyword/add_to_cart.resource
Resource    ../keyword/launch_app.resource

*** Test Cases ***
add to cart
    launch_app
    add_to_cart
    