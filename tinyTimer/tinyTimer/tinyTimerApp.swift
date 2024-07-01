//
//  tinyTimerApp.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 21.06.2023.
//

import SwiftUI
import Combine


struct timerSettingView: View {
    @AppStorage("timerMinutes") var mins: Int = 0
    @AppStorage("timerSeconds") var secs: Int = 0
    
    var body: some View {
        HStack {
            VStack {
                Text("min(s):")
                HStack {
                    Stepper("\(mins)", value:$mins, in:0...60)
                }
                
            }
            VStack {
                Text("sec(s):")
                HStack {
                    Stepper("\(secs)", value:$secs, in:0...59)
                }
                
            }
        }
    }
}

@main
struct tinyTimerApp: App {
    let persistenceController = PersistenceController.shared
//    var mins = Int(UserDefaults.standard.string(forKey: "timerMinutes")!)!*60
//    var secs = Int(UserDefaults.standard.string(forKey: "timerSeconds")!)!
    @State var started: Bool = false
    @State var sp_button_text: String = "start"
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var now = Date.now
    var body: some Scene {
        MenuBarExtra {
            VStack {
                timerSettingView()
                Button {
                    started.toggle()
                    
                } label: {
                    Text("start")
                }
            }
            .padding()
        } label: {
            if started {
                HStack {
                    Text("\(UserDefaults.standard.string(forKey: "timerMinutes")!):\(UserDefaults.standard.string(forKey: "timerSeconds")!)")
                        .onReceive(timer) { t in
                        }
                    Image(systemName: "timer")
                }
            } else {
                Image(systemName: "timer")
            }
        }
        .menuBarExtraStyle(.window)
        
    }
}
