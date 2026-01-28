# StudioInfo

StudioInfo is a lightweight macOS menu bar application designed to provide quick access to a web-based information portal. It allows users to configure an IP address and open it directly in their default web browser from the system menu bar.

## Features

*   **Menu Bar Access:** Runs discreetly in the macOS menu bar for easy and constant access.
*   **Quick Link:** Provides a one-click option to open a predefined URL (based on an IP address) in your browser.
*   **Configurable IP Address:** The target IP address can be set through a simple settings panel.
*   **Admin-Protected Settings:** Access to the settings panel is restricted to administrator accounts to prevent unauthorized changes.

## How to Use

1.  Launch the application. A gear icon will appear in your menu bar.
2.  Click the gear icon to open the menu, which contains the following options:
    *   `StudioInfo`: Opens the configured web page.
    *   `Einstellungen` (Settings): Opens the settings window.
    *   `Beenden` (Quit): Closes the application.

### Configuration
1.  Click the menu bar icon and select `Einstellungen` (Settings).
2.  If you are logged in as an administrator, a settings window will appear.
3.  Enter the target IP address of the service you want to access.
4.  Click `Speichern` (Save). The window will close, and the IP address will be saved.

### Accessing the Portal
Once configured, click the menu bar icon and select `StudioInfo`. This will launch your default web browser and navigate to `http://<configured_ip_address>`.

## Administrator Requirement

The settings panel where the IP address is configured is only accessible to users with administrator privileges. The application verifies this by checking if the current user is a member of the `admin` group on the system. If a non-admin user attempts to open the settings, an access denied alert will be shown.

## Building from Source

To build the application yourself, follow these steps:

1.  Clone the repository:
    ```sh
    git clone https://github.com/aar0nsx/studioinfo.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd studioinfo
    ```
3.  Open the `StudioInfo.xcodeproj` file in Xcode.
4.  Use the `Product > Build` or `Product > Run` command to build and run the application.
