# Mobile Test Automation Framework

> Robot Framework + Appium | Android | Python

---

## Test cases

### 1. WiFi Toggle
Zapnutie a vypnutie WiFi cez systémové nastavenia Androidu.

### 2. Chrome – načítanie stránky
Otvorenie prehliadača Chrome, načítanie stránky `example.com` a overenie hlavného nadpisu na stránke.

---

## Architektúra

- **Robot Framework** + **AppiumLibrary**
- Capabilities sú centralizované v **JSON súbore** — jednoduchý switch medzi aplikáciami (Settings, Chrome)

---

## Spustenie testov

```bash
robot --outputdir results tests/
```

> Výstup (logy, reporty) sa uloží do priečinka `results/`

---

## Spustenie na reálnom zariadení

### Android

1. Zapnúť **Developer Options** na zariadení
2. Povoliť **USB Debugging**
3. Pripojiť zariadenie cez USB alebo WiFi
4. Overiť pripojenie:

```bash
adb devices
```

5. Upraviť capabilities — napr. `"appium:deviceName"` podľa skutočného zariadenia
6. Prípadne navýšiť **waity**, keďže fyzické zariadenia reagujú inak ako emulátor

---

### iOS

1. Pripojiť zariadenie a **trust this computer**
2. Zistiť UDID zariadenia:

```bash
idevice_id -l
```

3. Pripraviť **WebDriverAgent (WDA)** v Xcode:
   - Otvoriť projekt WDA v Xcode
   - Nastaviť **Team** a **Bundle ID** v *Signing & Capabilities*
   - Spustiť build na zariadenie

4. Upraviť capabilities — napr. `bundleId`, `udid`, `useNewWDA`

---

## Reporting

### Vstavaný Robot Framework report

Po každom behu sa automaticky generujú:

| Súbor | Popis |
|---|---|
| `report.html` | Prehľadný HTML report |
| `log.html` | Detailný log každého kroku |
| `output.xml` | Strojovo čitateľný výstup |

---

### TestRail integrácia

```bash
pip install trcli
```

Generovanie JUnit XML výstupu:

```bash
robot --xunit output.xml ./tests
```

Nahranie výsledkov do TestRailu:

```bash
trcli -y \
  -h https://daky-testrail.io \
  --project "nazov" \
  -u email@example.com \
  -p heslo \
  parse_junit \
  --file output.xml \
  --title "Výsledky testov"
```

---

### Jira – Xray integrácia

```bash
pip install robotframework-jira
```

Odoslanie výsledkov cez REST API:

```bash
curl -H "Content-Type: application/xml" \
     -H "Authorization: BearerTOKEN" \
     -X POST "https://jira.firma.com/rest/raven/1.0/import/execution/robot" \
     --data @output.xml
```
