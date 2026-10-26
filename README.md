# Werknemers-portfolio

Portfolio-versie van de **werknemers-app (winkeltool)** van Visual Shopping, het online boodschappen- en
spaarplatform van Coop Lubbers Groningen. Medewerkers gebruiken deze app in de winkel om bestellingen te
verzamelen, uit te geven en af te rekenen, en om de winkel te beheren.

De app hoort bij:
- [Visualshopping-Server-portfolio](https://github.com/chrisfaber95/Visualshopping-Server-portfolio): de Node/Express-API
- [Client-portfolio](https://github.com/chrisfaber95/Client-portfolio): de app voor klanten

Gebouwd met Vue 3, Vue Router 4 en Vuex 4 (Vue CLI).

## Schermen

| Route | Scherm |
|-------|--------|
| `/bestellingen` | Online bestellingen |
| `/actie_orders` | Bestellingen uit spaaracties |
| `/bezorging` | Bezorgingen |
| `/afhaalscanner` | Bestelling uitgeven bij het ophalen |
| `/actiescanner` | Actiebestellingen scannen |
| `/kassascanner` | Bestellingen afhandelen bij de kassa, met dagoverzicht |
| `/scanner` | Scannen bij verzamelen en afhalen |
| `/discounts` | Aanbiedingen |
| `/store` | Winkelinstellingen: bezorging, openingstijden, assortiment, vacatures |
| `/admin` | Administratie met omzetgrafieken, en gebruikersaccounts |

## Starten

```
npm install
cp .env.example .env.development   # en vul VUE_APP_API in
npm run serve
```

Productiebuild: `npm run build`. Lint: `npm run lint`.

De variabelen staan in [`.env.example`](.env.example). `VUE_APP_*`-waarden komen in de gebouwde JavaScript
terecht en zijn dus zichtbaar voor iedereen: zet daar geen geheimen in.

## Wat is aangepast voor deze portfolio

Dit is een momentopname van de broncode (stand begin 2024) zonder git-geschiedenis.

Niet opgenomen:

| Bestand | Reden |
|---|---|
| `.env`, `.env.development` | echte API-URL en public API key |
| `.vscode/`, `dist/`, `node_modules/` | editorconfig en build-output |

Vervangen door een versie zonder persoonsgegevens:

| Bestand | Origineel | Vervanger |
|---|---|---|
| `src/assets/Coop Lubbers-gebruiksvoorwaarden-online.pdf` | naam, woonadres en KvK-nummer van de leverancier (eenmanszaak) | zelfde tekst, met die gegevens vervangen door `[NAAM LEVERANCIER]`, `[ADRES LEVERANCIER]` en `[KVK-NUMMER]` |
| `public/img/soon.jpg` | herkenbare foto van een persoon | zelfde tekst en logo zonder foto |

## Draaien met Docker

```
docker compose up -d --build
```

De app wordt gebouwd (Node 16) en door nginx geserveerd op poort 8108. nginx stuurt `/api/`
door naar de server (`Visualshopping-Server`, variabele `API_UPSTREAM` in `docker-compose.yml`). Inloggen met de
demo-werknemer uit de server-repo: `demo@example.com` / `demo1234`.
