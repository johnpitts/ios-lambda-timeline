//
//  CameraViewController.swift
//  LambdaTimeline
//
//  Created by John Pitts on 7/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var cameraView: CameraPreviewView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = bestCamera()
    }
    
    func bestCamera() -> AVCaptureDevice {
        
        if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
            return device
        }
        
        //2nd option if 1st one doesn't work
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            return device
        }
        
        fatalError("No cameras exist-- probably running simulator-- or have wimpy phone")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
