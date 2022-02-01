*Settings*

Documentation       Base Test File

Library     Browser
Library     Collections
Library     factories/Users.py

Resource    actions/_SharedActions.robot
Resource    actions/AuthActions.robot
Resource    actions/SignupActions.robot
Resource    actions/BeGeekActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}     https://getgeeks-vescio.herokuapp.com

*Keywords*
Start Session
    New Browser     chromium      headless=false      slowMo=00:00:00
    New Page        ${BASE_URL}

Finish Session
    Sleep       1
    Take Screenshot     fullPage=True