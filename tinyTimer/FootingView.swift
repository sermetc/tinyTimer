//
//  FootingView.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import SwiftUI

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
