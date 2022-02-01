*Settings*
Documentation       BeGeek Test Suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session


*Test Cases*
Be a Geek

    ${user}     Factory User    be_geek
    Do Login  ${user}

    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    # Sleep           5

    Geek Form Should Be Success

Short Description

    ${user}     Factory User    short_desc
    Do Login  ${user}
    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be  A descrição deve ter no minimo 80 caracteres

Long Description

    ${user}     Factory User    long_desc
    Do Login  ${user}
    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be  A descrição deve ter no máximo 255 caracteres