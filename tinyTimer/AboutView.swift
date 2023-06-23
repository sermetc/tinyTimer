//
//  AboutView.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack (alignment: .center) {
            Image("chicken-white-large")
                .resizable()
                .frame(width: 65, height: 65)
                .padding(.top, 15)
            Text("tinyTimer")
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
            Text("v0.0.1")
                .font(.footnote)
            Text("Copyright © 2023 Sermet Cagan. All rights reserved.")
                .font(.footnote)
            Spacer()
            
            Button {
                //
            } label: {
                Text("github")
                    .foregroundColor(.white)
                    .font(.footnote)
            }
            .buttonStyle(.plain)

                
        }
        .padding(.bottom)
        .frame(minWidth: 280, maxWidth: 280, minHeight: 170, maxHeight: 170)
    }
}

