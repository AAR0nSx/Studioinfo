//
//  AppDelegate.swift
//  StudioInfo
//
//  Created by Aaron on 12.06.25.
//

import AppKit
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var settingsWindow: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Tray-Symbol einrichten
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.image = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "StudioInfo")

        let menu = NSMenu()

        menu.addItem(NSMenuItem(title: "StudioInfo", action: #selector(openStudioInfo), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Einstellungen", action: #selector(openSettings), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Beenden", action: #selector(quitApp), keyEquivalent: ""))

        statusItem.menu = menu
    }

    @objc func openStudioInfo() {
        let ip = UserDefaults.standard.string(forKey: "ipAdress") ?? ""
        guard !ip.isEmpty, let url = URL(string: "http://\(ip)") else {
            NSSound.beep()
            return
        }
        NSWorkspace.shared.open(url)
    }

    @objc func openSettings() {
        if !AdminCheck.isAdminUser() {
            let alert = NSAlert()
            alert.alertStyle = .critical
            alert.icon = NSImage(systemSymbolName: "lock.slash", accessibilityDescription: nil)
            alert.messageText = "Zugriff verweigert"
            alert.informativeText = "Nur Administratoren dürfen die Einstellungen öffnen.\nBitte melden Sie sich mit einem Admin-Konto an."
            alert.addButton(withTitle: "OK")
            alert.runModal()
            return
        }

        
        if settingsWindow == nil {
            let view = SettingsView()
            settingsWindow = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 300, height: 150),
                styleMask: [.titled, .closable],
                backing: .buffered,
                defer: false
            )
            settingsWindow?.center()
            settingsWindow?.title = "Einstellungen"
            settingsWindow?.contentView = NSHostingView(rootView: view)
            settingsWindow?.isReleasedWhenClosed = false
        }
        settingsWindow?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    @objc func quitApp() {
        NSApp.terminate(nil)
    }
}
