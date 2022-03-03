*Settings*

Documentation       Signup Actions for automation test

*Keywords*

Go To Signup Form
    Go To       ${BASE_URL}/signup

    Wait For Elements State     css=form.signup-form    visible     5
    
# Dado
Fill Signup Form
    [Arguments]     ${user}

    Fill Text       css=input[id="name"]        ${user}[name]
    Fill Text       css=input[id="lastname"]    ${user}[lastname]
    Fill Text       css=input[id="email"]       ${user}[email]
    Fill Text       css=input[id="password"]    ${user}[password]

# Quando
Submit Signup Form
    Click       css=button.submit-button >> text=Cadastrar

# Então
User Should Be Registered

    ${expected_message}     Set Variable    css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State     ${expected_message}     visible     5
