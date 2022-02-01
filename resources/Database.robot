*Settings*
Documentation       Database helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres

    Connect To Database     psycopg2
    ...                     aijoqnfz
    ...                     aijoqnfz
    ...                     7ZtdZf9SbhiaYQyK_VM3h0VKjXjxMwC9
    ...                     castor.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Insert User
    [Arguments]     ${u}

    ${hashed_pass}      Get Hashed Pass     ${u}[password]

    ${qry}      Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values('${u}[name] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false)
    Execute SQL String      ${qry}           


Users Seed
    ${user}         Factory User    login
    Insert User     ${user}

    ${user_geek}     Factory User   be_geek
    Insert User      ${user_geek}

    ${user_short_desc}      Factory User    short_desc
    Insert User             ${user_short_desc}

    ${user_long_desc}       Factory User    long_desc
    Insert User             ${user_long_desc}