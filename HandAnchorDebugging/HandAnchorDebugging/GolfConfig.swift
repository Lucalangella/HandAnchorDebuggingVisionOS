//
//  GolfConfig.swift
//  HandAnchorDebugging
//
//  Created by Luca Langella 1 on 15/01/26.
//

import Foundation
import Observation
import simd

@Observable
class GolfConfig {
    var posX: Float = 0.0
    var posY: Float = 0.0
    var posZ: Float = 0.0
    
    var rotX: Float = 0.0
    var rotY: Float = 0.0
    var rotZ: Float = 0.0
    
    var positionVector: SIMD3<Float> { SIMD3(posX, posY, posZ) }
    
    var rotationQuaternion: simd_quatf {
        let angles = SIMD3<Float>(rotX, rotY, rotZ) * .pi / 180
        return simd_quatf(angle: angles.x, axis: [1, 0, 0]) *
               simd_quatf(angle: angles.y, axis: [0, 1, 0]) *
               simd_quatf(angle: angles.z, axis: [0, 0, 1])
    }
}
