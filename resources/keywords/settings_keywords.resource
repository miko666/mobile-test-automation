*** Settings ***
Library             AppiumLibrary
Library             OperatingSystem
Library             Collections
Resource            ../locators/settings_locators.resource
Resource            utils.resource

*** Keywords ***
Open Settings App
    [Documentation]    otvorí Settings pomocou capabilities z conf jsonu
    [Arguments]    ${profile}
    ${caps}=    Load Capabilities    ${profile}
    Open Application
    ...    http://localhost:4723
    ...    platformName=${caps}[platformName]
    ...    deviceName=${caps}[appium:deviceName]
    ...    automationName=${caps}[appium:automationName]
    ...    noReset=${caps}[appium:noReset]
    ...    appPackage=${caps}[appium:appPackage]
    ...    appActivity=${caps}[appium:appActivity]
    ...    forceAppLaunch=${caps}[appium:forceAppLaunch]

Go To Settings
    Close Application
    Open Settings App    profile=settings

Navigate To WiFi Settings
    [Documentation]    Naviguje na WiFi nastavenia
    Wait Until Element Is Visible    ${NETWORK_INTERNET_ITEM}    timeout=10s
    Click Element                    ${NETWORK_INTERNET_ITEM}
    Wait Until Element Is Visible    ${INTERNET_ITEM}            timeout=10s
    Click Element                    ${INTERNET_ITEM}
    Wait Until Element Is Visible    ${WIFI_TOGGLE}              timeout=10s