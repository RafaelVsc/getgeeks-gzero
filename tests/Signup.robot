*Settings*
Documentation       Signup Test Suite

Resource        ${EXECDIR}/resources/Base.robot
# Resource        ${EXECDIR}/resources/Actions.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user
    [Tags]      smoke

    ${user}     Factory User    faker

    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate User
    [Tags]      attempt_signup

    ${user}                     Factory User    faker
    Add User From Database      ${user}

    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Modal Content Should Be  Já temos um usuário com o e-mail informado.


Wrong Email
    [Tags]      attempt_signup

    ${user}     Factory User   wrong_email

    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be  O email está estranho


Required Fields
    [Tags]      attempt_signup      reqf

    @{expected_alerts}      Create List
    ...                     Cadê o seu nome?
    # ...                     Cadê o sobrenome?
    ...                     E o sobrenome?
    ...                     O email é importante também!
    ...                     Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form

    Alert Spans Should Be  ${expected_alerts}

Short Password
    [Tags]      attempt_signup      short_password
    [Template]  Signup With Short Pass
    1
    12
    123
    1234
    12345
    a
    a1
    a1b
    a1b2
    -1
    a1b2c



*Keywords*
Signup With Short Pass
    [Arguments]     ${short_pass}


    ${user}     Create Dictionary
    ...         name=Rafael             lastname=Vescio
    ...         email=vescio@msn.com    password=${short_pass}

    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be  Informe uma senha com pelo menos 6 caracteres

# Signup Submit Without Form
#     [Arguments]     ${expected_alert}

#     Go To Signup Form
#     Submit Signup Form
#     Alert Span Should Be  ${expected_alert}