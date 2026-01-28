//
//  SettingsView.swift
//  StudioInfo
//
//  Created by Aaron on 12.06.25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("ipAdress") private var ipAdress = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("StudioInfo Einstellungen")
                .font(.headline)

            TextField("IP-Adresse", text: $ipAdress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Speichern") {
                NSApp.keyWindow?.close()
            }
            .keyboardShortcut(.defaultAction)

        }
        .padding()
    }
}




#Preview {
    SettingsView()
}


//Mit AppStorage hier in Setting neu Builden und über Terminal nochmal probieren obs
//wenigstens theoretisch geht.
