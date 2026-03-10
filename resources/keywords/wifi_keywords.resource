*** Settings ***
Library             AppiumLibrary
Library             OperatingSystem
Library             Collections
Resource            ../locators/settings_locators.resource
Resource            ../resources/keywords/settings_keywords.resource

*** Keywords ***
Open WiFi Settings
    Navigate To WiFi Settings
    Wait Until Element Is Visible    ${WIFI_TOGGLE}    10s

Get WiFi State
    ${state}=    Get Element Attribute    ${WIFI_TOGGLE}    checked
    RETURN    ${state}

Ensure WiFi Is On
    ${state}=    Get WiFi State
    Log    Aktuálny stav WiFi: ${state}
    IF    '${state}' == 'false'
        Click Element    ${WIFI_TOGGLE}
    END
    ${state}=    Get WiFi State
    Should Be Equal    ${state}    true

Ensure WiFi Is Off
    ${state}=    Get WiFi State
    Log    Aktuálny stav WiFi: ${state}
    IF    '${state}' == 'true'
        Click Element    ${WIFI_TOGGLE}
    END
    ${state}=    Get WiFi State
    Should Be Equal    ${state}    false