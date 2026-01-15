//
//  HandAnchorDebuggingApp.swift
//  HandAnchorDebugging
//
//  Created by Luca Langella 1 on 15/01/26.
//

import SwiftUI

@main
struct HandAnchorDebuggingApp: App {
        @State private var config = GolfConfig()

        var body: some Scene {
            WindowGroup(id: "Controls") {
                CalibrationView(config: config)
            }
            .windowStyle(.plain)
            .defaultSize(width: 400, height: 600)

            ImmersiveSpace(id: "HandSpace") {
                GolfImmersiveView(config: config)
            }
        }
    }
