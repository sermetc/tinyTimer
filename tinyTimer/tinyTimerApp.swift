//
//  tinyTimerApp.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import SwiftUI

struct IconLabelView: View {
    @AppStorage("timerStatus") var status = false
    @AppStorage("timerMinLabel") var min = 0
    @AppStorage("timerSecLabel") var sec = 0
    let image: NSImage = {
            let ratio = $0.size.height / $0.size.width
            $0.size.height = 18
            $0.size.width = 18 / ratio
            return $0
    }(NSImage(named: "chicken-white")!)
    var body: some View {
        if status {
            Text("\(min, specifier: "%02d"):\(sec, specifier: "%02d")")
        }
        Image(nsImage: image)
            .renderingMode(.template)
            .tint(.white)
            .foregroundColor(.white)
    }
}


@main
struct tinyTimerApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        Settings {
            AboutView()
                .navigationTitle("tinyTimer")
        }
        MenuBarExtra {
            VStack {
                TimerSettingView()
                Divider()
                FootingView()
            }
            .padding()
            .frame(width: 220)
        } label: {
            IconLabelView()
        }
        .menuBarExtraStyle(.window)
    }
}
