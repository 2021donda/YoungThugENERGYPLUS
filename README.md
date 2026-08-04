# Volt Energy – mockup UI (Flutter)

Clone grafico a 3 schermate di un'app "gestione bollette", pensato per
un'esposizione/demo: layout, colori, gradienti e testi replicano il
mockup di riferimento. I dati (le 3 bollette, gli importi) sono statici,
non c'è backend né autenticazione reale.

## Schermate incluse

1. **Splash** (`lib/screens/splash_screen.dart`) – hero banner, titolo
   brand, tagline, pulsanti "Accedi" / "Crea account".
2. **Home** (`lib/screens/home_screen.dart`) – riepilogo bollette attive,
   categorie (Energia Elettrica / Gas / Acqua), lista bollette, bottom
   nav bar.
3. **Dettaglio bolletta** (`lib/screens/bill_detail_screen.dart`) –
   riepilogo importo/scadenza, dati contrattuali, banner promo,
   pulsante "Paga ora" (mostra solo una conferma finta).

## Come avviarlo

Serve Flutter SDK installato ([flutter.dev](https://docs.flutter.dev/get-started/install)).

```bash
cd volt_energy_app
flutter create .        # aggiunge le cartelle android/ios/web mancanti
flutter pub get
flutter run -d chrome   # il modo più rapido per una demo dal vivo (basta il browser)
# oppure: flutter run    # su emulatore/dispositivo collegato
```

## Provarla su iPhone senza un Mac

Apple richiede un Mac con Xcode per compilare app iOS, ma puoi ottenerne
uno gratis "in prestito" nel cloud tramite GitHub Actions, ed installare
il risultato con il tuo Apple ID gratuito (nessun account Developer a
pagamento richiesto):

1. Crea un repository GitHub (va bene anche pubblico) e caricaci questa
   cartella. Il workflow è già pronto in
   `.github/workflows/build-ios.yml`.
2. Su GitHub, vai su **Actions** → **Build iOS IPA (non firmato)** →
   **Run workflow**. Aspetta che finisca (qualche minuto).
3. Scarica l'artifact `volt-energy-app-ipa` prodotto: dentro c'è
   `volt_energy_app.ipa` (non firmato).
4. Sul tuo PC Windows, installa [Sideloadly](https://sideloadly.io)
   (serve anche iTunes, versione "web/non Microsoft Store", per i
   driver del dispositivo).
5. Collega l'iPhone via USB, trascina il file `.ipa` in Sideloadly,
   inserisci il tuo Apple ID quando richiesto: firma e installa l'app
   sul telefono.
6. Sul telefono: **Impostazioni → Generali → VPN e gestione dispositivo**
   → tocca il tuo Apple ID sotto "App per sviluppatori" → **Attendibile**.

Nota: con un Apple ID gratuito l'app smette di aprirsi dopo 7 giorni —
basta ripetere il passaggio 5 con lo stesso Apple ID per rinnovarla,
quindi rifallo un giorno o due prima dell'esposizione.

## Personalizzare nome e immagine del brand

Al posto del personaggio del mockup originale ho usato un nome di
fantasia ("Volt Energy") e un placeholder grafico al posto della foto,
così puoi inserire liberamente i tuoi contenuti:

- **Nome brand**: cerca "VOLT ENERGY" in `home_screen.dart` e
  `bill_detail_screen.dart` e sostituiscilo.
- **Immagine**: crea `assets/images/hero.png`, scommenta la sezione
  `assets:` in `pubspec.yaml`, poi in `splash_screen.dart` passa
  `imagePath: 'assets/images/hero.png'` al widget `HeroBanner`.
- **Colori**: tutti definiti in `lib/theme/app_colors.dart`.

## Struttura del progetto

```
lib/
  main.dart
  theme/app_colors.dart       # palette e gradienti
  models/bill.dart            # modello Bill + dati statici demo
  widgets/                    # componenti riutilizzabili
    gradient_button.dart
    hero_banner.dart
    brand_mark.dart
    bill_card.dart
  screens/
    splash_screen.dart
    home_screen.dart
    bill_detail_screen.dart
```
