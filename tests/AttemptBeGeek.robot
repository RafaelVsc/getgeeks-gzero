*Settings*
Documentation       Attempt BeGeek Test Suite

Resource    ${EXECDIR}/resources/Base.robot
Suite Setup      Start Session For Attempt Be Geek
Test Template   Attempt Be a Geek

*Variables*
${long_desc}    Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unity

*Test Cases*
Short Description       description        Formato o seu PC        A descrição deve ter no minimo 80 caracteres
Long Description        description        ${long_desc}            A descrição deve ter no máximo 255 caracteres
Empty Description       description        ${EMPTY}                Informe a descrição do seu trabalho
Only DDD Phone          whatsapp           11                      O Whatsapp deve ter 11 digitos contando com o DDD
Only Phone Number       whatsapp           999999999               O Whatsapp deve ter 11 digitos contando com o DDD
Empty Phone             whatsapp           ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
String Cost             cost               aaaa                    Valor hora deve ser numérico
Alhpanum Cost           cost               aa12                    Valor hora deve ser numérico
Special chars Cost      cost               $%^&                    Valor hora deve ser numérico
Empty Cost              cost               ${EMPTY}                Valor hora deve ser numérico




*Keywords*
Attempt Be a Geek
    [Arguments]     ${key}      ${input_field}      ${output_message}

    ${user}     Factory User    attempt_be_geek

    Set To Dictionary       ${user}[geek_profile]   ${key}      ${input_field}

    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be  ${output_message}

    Take Screenshot     fullPage=True

Start Session For Attempt Be Geek
    ${user}     Factory User    attempt_be_geek

    Start Session
    Do Login  ${user}
    Go To Geek Form