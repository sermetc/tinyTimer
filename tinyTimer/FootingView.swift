//
//  FootingView.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import SwiftUI
import LaunchAtLogin

struct SettingsView: View {
    @AppStorage("playsound") var soundOn: Bool = false
    var body: some View {
        VStack (alignment: .leading) {
            LaunchAtLogin.Toggle {
                Text("launch at login")
            }
            Toggle("play sound", isOn: $soundOn)
                .toggleStyle(.checkbox)
        }
        .frame(width: 190, alignment: .leading)
        Divider()
    }
}

struct FootingView: View {
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            SettingsView()
            Button {
                NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
                NSApp.activate(ignoringOtherApps: true)
            } label: {
                HStack {
                    Text("About")
                        .foregroundColor(.white)
                    Spacer()
                    Text("⌘ A")
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.plain)
            .keyboardShortcut("a", modifiers: [.command])
            .padding(.bottom, 5)
            Button {
                // reset user defaults
                NSApplication.shared.terminate(nil)
            } label: {
                HStack {
                    Text("Quit")
                        .foregroundColor(.white)
                    Spacer()
                    Text("⌘ Q")
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.plain)
            .keyboardShortcut("q", modifiers: [.command])
        }
    }
}
