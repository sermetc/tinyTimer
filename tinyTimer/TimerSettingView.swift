//
//  TimerSettingView.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import SwiftUI

struct TimerSettingView: View {
    @State var mins: Int = 0
    @State var secs: Int = 0
    
    @AppStorage("timerMinLabel") var min_label: Int = 0
    @AppStorage("timerSecLabel") var sec_label: Int = 0
    
    @State var totalTimeInSeconds: Int = 0
    @State var remainingTimeAfterPauseInSeconds: Int = 0
    
    @AppStorage("timerStatus") var timerStatus: Bool = false //  working or not
    @AppStorage("timerPaused") var timerPaused: Bool = false // paused or not
    
    @AppStorage("playsound") var soundOn: Bool = false
    
    @State private var startTime = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let player = Player()

    var body: some View {
        VStack {
            Text("\(min_label, specifier: "%02d") : \(sec_label, specifier: "%02d")")
                .font(.largeTitle)
                .onReceive(timer) { _ in
                    if totalTimeInSeconds >= 0 {
                        min_label = totalTimeInSeconds/60
                        sec_label = totalTimeInSeconds - min_label*60
                        totalTimeInSeconds -= 1
                    } else {
                        timerStatus = false
                    }
                }
                .onAppear() {
                    totalTimeInSeconds = mins*60 + secs
                    timer.upstream.connect().cancel()
                }
                .onChange(of: timerStatus) { newValue in
                    if timerStatus == false && soundOn  {
                        player.play()
                    }
                }
            HStack {
                Button {
                    if timerStatus {
                        timerPaused = true
                        timer.upstream.connect().cancel()
                        remainingTimeAfterPauseInSeconds = totalTimeInSeconds
                    } else {
                        totalTimeInSeconds = mins*60 + secs
                        if timerPaused {
                            totalTimeInSeconds = remainingTimeAfterPauseInSeconds
                            timerPaused = false
                        }
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    }
                    timerStatus.toggle()
                } label: {
                    Text(timerStatus ? "pause" : "start")
                        .foregroundColor(.white)
                        .frame(width: 75)
                }
                Button {
                    min_label = mins
                    sec_label = secs
                    totalTimeInSeconds = mins*60 + secs
                    if timerStatus {
                        timerStatus.toggle()
                    }
                    timer.upstream.connect().cancel()
                } label: {
                    Text("reset")
                        .foregroundColor(.white)
                        .frame(width: 75)
                }
            }
            HStack {
                Stepper("min(s): \(mins, specifier: "%02d")", value: $mins, in: 0...60) {_ in
                    min_label = mins
                }
                Stepper("sec(s): \(secs, specifier: "%02d")", value: $secs, in: 0...60) { _ in
                    sec_label = secs
                }
            }
        }
    }
}

