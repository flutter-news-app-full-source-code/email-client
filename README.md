<div align="center">
  <img src="https://avatars.githubusercontent.com/u/202675624?s=400&u=dc72a2b53e8158956a3b672f8e52e39394b6b610&v=4" alt="Flutter News App Toolkit Logo" width="220">
  <h1>Email Client</h1>
  <p><strong>An abstract interface for sending emails within the Flutter News App Toolkit.</strong></p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/coverage-100%25-green?style=for-the-badge" alt="coverage">
  <a href="https://flutter-news-app-full-source-code.github.io/docs/"><img src="https://img.shields.io/badge/LIVE_DOCS-VIEW-slategray?style=for-the-badge" alt="Live Docs: View"></a>
  <a href="https://github.com/flutter-news-app-full-source-code"><img src="https://img.shields.io/badge/MAIN_PROJECT-BROWSE-purple?style=for-the-badge" alt="Main Project: Browse"></a>
</p>

This `email_client` package defines the abstract interface (`EmailClient`) for sending emails within the [**Flutter News App Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code). It establishes a clear contract that concrete implementations (e.g., using SMTP, AWS SES, SendGrid) should adhere to. This approach decouples application logic from specific email service providers and email content/styling, which can be managed directly within your chosen email service. This package is crucial for backend services (like a Dart Frog API) that require robust and flexible email dispatch capabilities.

## ⭐ Feature Showcase: Flexible & Provider-Agnostic Email Dispatch

This package offers a comprehensive set of features for managing email sending operations.

<details>
<summary><strong>🧱 Core Functionality</strong></summary>

### 🚀 Abstract `EmailClient` Interface
- **`EmailClient` Abstract Class:** Defines a generic, provider-agnostic interface for sending transactional emails. This decouples application logic from specific email service providers.
- **`sendTransactionalEmail` Method:** Provides a method for sending emails using pre-defined templates, requiring `senderEmail`, `recipientEmail`, `subject`, `templateId`, and `templateData`. This allows email content and styling to be managed directly within the email service provider.

### 🛡️ Standardized Error Handling
- **`HttpException` Propagation:** Implementations are expected to handle underlying service errors and map them to standard `HttpException` subtypes (from `core`), ensuring consistent error management across the application layers.

### 💉 Implementation Agnostic
- **Interchangeable Implementations:** Designed to be implemented by various email service providers (e.g., SendGrid, AWS SES, local SMTP), allowing developers to swap email solutions without altering core application logic.

> **💡 Your Advantage:** This package provides a clear, abstract interface for email sending, decoupling your application from specific email service providers. This design promotes flexibility, testability, and maintainability, allowing you to easily integrate and swap email solutions as needed.

</details>

## 🔑 Licensing

This `email_client` package is an integral part of the [**Flutter News App Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code). For comprehensive details regarding licensing, including trial and commercial options for the entire toolkit, please refer to the main toolkit organization page.
