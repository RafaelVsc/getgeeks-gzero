*Settings*

Documentation       Base Test File

Library     Browser
Library     Collections
Library     factories/Users.py
Library     Utils.py
Library     String

Resource    actions/_SharedActions.robot
Resource    actions/AuthActions.robot
Resource    actions/SignupActions.robot
Resource    actions/BeGeekActions.robot

Resource    Database.robot
Resource    Helpers.robot
Resource    Services.robot

*Variables*
${BASE_URL}     https://getgeeks-vescio.herokuapp.com

*Keywords*
Start Session
    New Browser             ${BROWSER}      headless=${HEADLESS}      slowMo=00:00:00
    New Page                ${BASE_URL}
    Set Viewport Size       1280    768

After Test
    ${shot_name}        Screenshot Name
    Sleep       1
    Take Screenshot     fullPage=True       filename=${shot_name}