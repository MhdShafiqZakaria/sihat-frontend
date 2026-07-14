# flutter_test_sihat

A Flutter front-end prototype for a health service queue dashboard, built for UNIMAS Sihat.

## What this project does

`flutter_test_sihat` presents a mobile-first dashboard screen for patients to view queue status, estimated wait time, and upcoming health service appointments. The app includes a queue ticket API integration and a polished interface with branded UI components.

## Why this is useful

- Shows the current serving queue and registration counter
- Displays upcoming health checkups and follow-up services
- Provides a clear onboarding screen for joining a patient queue
- Includes a reusable queue service layer for backend integration
- Uses Flutter widgets and Google Fonts for a clean UI

## Key features

- `HomeDashboard` screen with queue status and appointment cards
- Queue ticket service in `lib/networking/queue/get_queue_number_service.dart`
- DTO support for queue response data in `lib/dto/queue/queueNumberDto.dart`
- Custom UI components in `lib/widgets/dashboard/`
- Theme setup with `GoogleFonts.manrope`

## Getting started

### Prerequisites

- Flutter SDK 3.12.x or newer
- A supported device or emulator for Android, iOS, web, or desktop

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

To target a specific platform, use:

```bash
flutter run -d chrome
flutter run -d windows
flutter run -d android
flutter run -d ios
```

### Configure API integration

The queue service is implemented in `lib/networking/queue/get_queue_number_service.dart`. Replace the backend endpoint and credentials provider there when connecting to a live API.

## Project structure

- `lib/main.dart` – app entry point
- `lib/widgets/` – dashboard UI and reusable widgets
- `lib/networking/queue/` – HTTP service and queue fetch logic
- `lib/dto/queue/` – data transfer objects for queue responses
- `lib/utils/constant.dart` – shared UI colors and app constants

## Where to get help

If you need support, open an issue in this repository or contact the maintainer through the project issue tracker.

## Contributing

Contributions are welcome. Please open an issue first if you want to propose changes, or submit a pull request with improvements.
