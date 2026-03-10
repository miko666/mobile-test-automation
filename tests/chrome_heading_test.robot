*** Settings ***
Library           AppiumLibrary
Resource          ../resources/keywords/chrome_keywords.resource
Suite Setup       Open Chrome App    profile=chrome
Suite Teardown    Close Application
Test Setup        Go To Chrome Home

*** Test Cases ***
Chrome - Verify Example Domain Heading
    [Documentation]    Test na overenie nadpisu na stránke example.com
    Go To Url    https://example.com
    ${heading}=    Get Text    xpath=//h1
    Log    Nadpis stranky: ${heading}
    Should Be Equal    ${heading}    Example Domain

