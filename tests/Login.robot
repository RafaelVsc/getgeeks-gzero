*Settings*
Documentation       Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User Login

    ${user}                     Factory User Login

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In        ${user}
    

Incorrect password
    [Tags]      inc_pass

    ${user}     Create Dictionary   email=vescio@hotmail.com    password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

User not found
    [Tags]      user_404

    ${user}     Create Dictionary   email=vescio@404.net    password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

Incorrect email
    [Tags]      inc_email

    ${user}     Create Dictionary   email=vescio.com.br    password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Should Be Type Email

# Desafio 1 do modulo PRO
# Automatizando 3 novos de casos de testes: EMail Obrigatório, Senha Obrigatória, Campos Obrigatórios

Email Field is required
    [Tags]      req_fields

    ${user}     Create Dictionary       email=        password=abc123
    
    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Alert Span Should Be  E-mail obrigatório


Password Field is required
    [Tags]      req_fields

    ${user}     Create Dictionary       email=vescio@hotmail.com        password=
    
    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Alert Span Should Be  Senha obrigatória


Login Fields is required
    [Tags]      req_fields
    

    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be  ${expected_alerts} 

