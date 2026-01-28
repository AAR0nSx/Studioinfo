//
//  AdminCheck.swift
//  StudioInfo
//
//  Created by Aaron on 12.06.25.
//

import Foundation

//fragt nicht explizit nach admin, sondern nach den Gruppen die der User angehört
//Wenn der User zur Gruppe admin gehört, passt alles
struct AdminCheck {
    static func isAdminUser() -> Bool {
        let task = Process()
        task.launchPath = "/usr/bin/id"
        task.arguments = ["-Gn"]

        let pipe = Pipe()
        task.standardOutput = pipe

        do {
            try task.run()
            task.waitUntilExit()
        } catch {
            print("Fehler bei Adminprüfung: \(error)")
            return false
        }

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? ""
        return output.components(separatedBy: .whitespacesAndNewlines).contains("admin")
    }
}

