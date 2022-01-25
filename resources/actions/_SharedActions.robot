*Settings*
Documentation       Shared Actions

*Keywords*

Modal Content Should Be
    [Arguments]     ${expected_text}

    ${title}        Set Variable        css=h2.swal2-title
    ${content}      Set Variable        css=div.swal2-html-container

    Wait For Elements State     ${title}                  visible     5
    Get Text                    ${title}                  equal       Oops...

    Wait For Elements State     ${content}        visible     5
    Get Text                    ${content}           equal       ${expected_text}
