*** Settings ***
Library    Browser


*** Variables ***

${contactus}    //a[.=' Contact us']

${get_in_touch}    //h2[.='Get In Touch']

${message}    [id='message']
${name}    [name='name']
${email}    [name='email']
${subject}    [name='subject']
${upload_file}    [name='upload_file']
${submit}    [name='submit']
${verify_sucess_msg}    (//div[.='Success! Your details have been submitted successfully.'])[1]
${home}    //span[.=' Home']