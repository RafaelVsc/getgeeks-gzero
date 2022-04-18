*Settings*

Documentation       Geeks route test suite

Resource        ${EXECDIR}/resources/Base.robot


*Test Cases*
Be a geek


    ${user}     Factory Be Geek
    Remove User  ${user}
    
    # Dado um novo usuário no sistema
    POST User  ${user}

    # E usuario possui token valido
    ${token}    Get Token  ${user}

    # Quando realizar requisição na rota /geeks
    ${response}     POST Geek  ${token}     ${user}[geek_profile]

    # Então deve retornar 201
    Status Should Be    201     ${response}

    # E consultar o usuário na API Users
    ${response}     GET User    ${token}

    # Então retorna o perfil geek
    Should Be Equal As Strings     ${user}[name]                            ${response.json()}[name]
    Should Be Equal As Strings     ${user}[email]                           ${response.json()}[email]

    Should Be Equal As Strings     ${user}[geek_profile][whatsapp]          ${response.json()}[whatsapp]
    Should Be Equal As Strings     ${user}[geek_profile][desc]              ${response.json()}[desc]
    Should Be Equal As Strings     ${user}[geek_profile][printer_repair]    ${response.json()}[printer_repair]
    Should Be Equal As Strings     ${user}[geek_profile][work]              ${response.json()}[work]

    ${expected_cost}       Convert To Number    ${user}[geek_profile][cost]
    ${got_cost}            Convert To Number    ${response.json()}[cost]
    Log                    ${got_cost}
    Log                    ${expected_cost}


    Should Be Equal           ${expected_cost}       ${got_cost}


    Should Be Equal As Strings     None                             ${response.json()}[avatar]
    Should Be Equal As Strings     True                             ${response.json()}[is_geek]



Get Geek List
    ${data}     Factory Search For Geeks

    FOR     ${geek}     IN         @{data}[geeks]
        POST User  ${geek}
        ${token}    Get Token  ${geek}

        POST Geek  ${token}  ${geek}[geek_profile]
    END

    POST User  ${data}[user]

    ${token}    Get Token  ${data}[user]

    ${response}     GET Geeks  ${token}
    Status Should Be    200     ${response}

    Log     ${response.json()}[Geeks]

    ${total}        Get Length      ${response.json()}[Geeks]

    Should Be True  ${total} > 0
