*** Settings ***
Resource            ../resources/keywords/settings_keywords.resource
Resource            ../resources/keywords/wifi_keywords.resource

Test Setup         Open Settings App    profile=settings
Suite Teardown      Close Application

*** Test Cases ***
WiFi - Turn On
    [Documentation]    Zapne WiFi, ak je vypnuté, a overí, že je zapnuté
    Open WiFi Settings
    Ensure WiFi Is On

WiFi - Turn Off
    [Documentation]    Vypne WiFi, ak je zapnuté, a overí, že je vypnuté
    Open WiFi Settings
    Ensure WiFi Is Off