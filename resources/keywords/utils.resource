*** Settings ***
Library             AppiumLibrary
Library             OperatingSystem
Library             Collections


*** Keywords ***
Load Capabilities
    [Arguments]    ${profile}
    ${json_string}=    OperatingSystem.Get File    ${CURDIR}/../../config/capabilities.json
    ${caps}=           Evaluate    json.loads(r"""${json_string}""")    json
    RETURN    ${caps}[${profile}]