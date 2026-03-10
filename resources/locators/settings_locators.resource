*** Settings ***
Documentation    Lokátory pre Android Settings 

*** Variables ***
# settings items
${NETWORK_INTERNET_ITEM}        xpath=//android.widget.TextView[@text='Network & internet']
${INTERNET_ITEM}                xpath=//android.widget.TextView[@text='Internet']
${WIFI_MENU_ITEM}               xpath=//android.widget.TextView[@text='Wi-Fi']

# wifi tpggle
${WIFI_TOGGLE}                  xpath=//android.widget.Switch[@resource-id='com.android.settings:id/switchWidget']


