*Settings*
Documentation       BeGeek Test Suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session


*Test Cases*
Be a Geek

    #Dado que eu tenho um usuario comum
    ${user}     Factory User Be Geek

    # Faço login na plataforma getgeeks
    Do Login  ${user}

    # quando submeto o formulário para me tornar um geek (prestador de serviços)
    Go To Geek Form

    # Então devo ver a mensagem de sucesso
    Fill Geek Form  ${user}[geek_profile]
    Sleep           10



*Keywords*
Go To Geek Form
    Click       css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State     css=.be-geek-form   visible     5

Fill Geek Form
    [Arguments]     ${geek_profile}

    Fill Text       id=whatsapp     ${geek_profile}[whatsapp]
    Fill Text       id=desc         ${geek_profile}[description]

