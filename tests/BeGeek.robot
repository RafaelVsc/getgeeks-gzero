*Settings*
Documentation       BeGeek Test Suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session


*Test Cases*
Be a Geek

    ${user}     Factory User Be Geek
    Do Login  ${user}

    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    # Sleep           5

    Geek Form Should Be Success
