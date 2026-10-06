*** Settings ***

Library    Browser
Resource    ../keyword/down_invoice_after_purchase.resource

*** Test Cases ***
down_invoice
    download_invoice