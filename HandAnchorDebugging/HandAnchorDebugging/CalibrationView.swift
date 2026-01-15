//
//  CalibrationView.swift
//  HandAnchorDebugging
//
//  Created by Luca Langella 1 on 15/01/26.
//

import SwiftUI

struct CalibrationView: View {
    @Bindable var config: GolfConfig
    @Environment(\.openImmersiveSpace) var openSpace
    @Environment(\.dismissImmersiveSpace) var dismissSpace
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hand Anchor Rig").font(.title2).bold()
            
            HStack {
                Button("Start Rig") { Task { await openSpace(id: "HandSpace") } }
                Button("Stop", role: .destructive) { Task { await dismissSpace() } }
            }

            Divider()

            VStack(alignment: .leading) {
                Text("Position (Meters)").font(.caption).bold()
                SliderGroup(value: $config.posX, label: "X", range: -0.1...0.1)
                SliderGroup(value: $config.posY, label: "Y", range: -0.1...0.1)
                SliderGroup(value: $config.posZ, label: "Z", range: -0.1...0.1)
            }
            
            VStack(alignment: .leading) {
                Text("Rotation (Degrees)").font(.caption).bold()
                SliderGroup(value: $config.rotX, label: "X", range: -180...180)
                SliderGroup(value: $config.rotY, label: "Y", range: -180...180)
                SliderGroup(value: $config.rotZ, label: "Z", range: -180...180)
            }
            
            Button("Print Final Values") {
                print("POS: \(config.posX), \(config.posY), \(config.posZ)")
                print("ROT: \(config.rotX), \(config.rotY), \(config.rotZ)")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding().glassBackgroundEffect()
    }
}

struct SliderGroup: View {
    @Binding var value: Float
    let label: String
    let range: ClosedRange<Float>
    var body: some View {
        HStack {
            Text(label).frame(width: 15)
            Slider(value: $value, in: range)
            Text(String(format: "%.3f", value)).monospacedDigit().frame(width: 55)
        }
    }
}

