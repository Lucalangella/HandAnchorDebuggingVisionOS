//
//  GolfImmersiveVIew.swift
//  HandAnchorDebugging
//
//  Created by Luca Langella 1 on 15/01/26.
//

import SwiftUI
import RealityKit
import ARKit

struct GolfImmersiveView: View {
    var config: GolfConfig
    @State private var clubEntity: Entity?
    
    // Hand Tracking Tools
    let session = ARKitSession()
    let handTracking = HandTrackingProvider()

    var body: some View {
        RealityView { content in
            // 1. Create the Hand Anchor
            let clubAnchor = AnchorEntity(.hand(.right, location: .palm))
            
            if let club = try? await Entity(named: "Golf_club") {
                clubEntity = club
                clubAnchor.addChild(club)
            }
            content.add(clubAnchor)
            
            // 2. Start the Tracking Session
            Task {
                try? await session.run([handTracking])
            }
        }
        .onChange(of: [config.posX, config.posY, config.posZ, config.rotX, config.rotY, config.rotZ]) {
            clubEntity?.position = config.positionVector
            clubEntity?.orientation = config.rotationQuaternion
        }
    }
}

