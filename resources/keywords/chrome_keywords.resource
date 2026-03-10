*** Settings ***
Library            AppiumLibrary
Resource           utils.resource
Resource           ../locators/chrome_locators.resource

*** Keywords ***
Open Chrome App
    [Documentation]    otvorí Chrome pomocou capabilities z conf json
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

Go To Chrome Home
    [Documentation]    Naviguje na homepage Chrome
    Start Activity    com.android.chrome    com.google.android.apps.chrome.Main

Go To Url
    [Arguments]    ${url}
    [Documentation]    Naviguje na danú URL
    Input Text    ${CHROME_URL_INPUT}    ${url}
    Press Keycode    66    # Enter
    Wait Until Page Contains Element    xpath=//h1    10s