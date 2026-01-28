//
//  StudioInfoApp.swift
//  StudioInfo
//
//  Created by Aaron on 12.06.25.
//

import SwiftUI

@main
struct StudioInfoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // Kein Fenster, keine UI hier nötig
        Settings {
            EmptyView()
        }
    }
}
