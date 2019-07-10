//
//  CameraPreviewView.swift
//  LambdaTimeline
//
//  Created by John Pitts on 7/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit                 // layer is a property of UIKit
import AVFoundation


class CameraPreviewView: UIView {
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPlayerView: AVCaptureVideoPreviewLayer {
    return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session: AVCaptureSession? {
        get { return videoPlayerView.session }
        set { videoPlayerView.session = newValue}
    }
}


