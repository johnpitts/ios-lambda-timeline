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
    
    let captureSession = AVCaptureSession()
    lazy private var fileOutput = AVCaptureMovieFileOutput()
    private var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //establish which camera to use on phone
        let camera = bestCamera()
        
        // setup VIDEO input
        guard let cameraInput = try? AVCaptureDeviceInput(device: camera) else {
            fatalError("couldn't wrap video INPUT in a capture device")
        }
        // setting up a session, which must have an input device, and a start/stop running
        if captureSession.canAddInput(cameraInput) {    // a boolean test
            captureSession.addInput(cameraInput)
        } else {
            fatalError("couldn't add cameraInput")
        }
        
        // setup AUDIO
        guard let microphone = AVCaptureDevice.default(for: .audio) else {
            fatalError("couldn't load mic")
        }
        
        guard let microphoneInput = try? AVCaptureDeviceInput(device: microphone) else {
            fatalError("input from mic failed")
        }
        
        if captureSession.canAddInput(microphoneInput) {
            captureSession.addInput(microphoneInput)
        } else {
            fatalError("adding mic input to captureSession failed")
        }
        
        // setup OUTPUT
        if captureSession.canAddOutput(fileOutput) {
            captureSession.addOutput(fileOutput)
        }
        
        captureSession.commitConfiguration()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesure(_:)))
        view.addGestureRecognizer(tapGesture)
        
        
    }
    
    // function for choosing the best available camera, allowing for more than just 1 option
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
    
    
    @objc func handleTapGesure(_ tapGesture: UITapGestureRecognizer) {
        
        // play the movie
        print("Play movie")
        if let player = player {
            
            player.seek(to: CMTime.zero) // sets playback to a specific time in the video
            player.play()
        }
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
