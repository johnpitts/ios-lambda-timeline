//
//  Recorder.swift
//  LambdaTimeline
//
//  Created by John Pitts on 7/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import AVFoundation

class Recorder {
    
    private var audioRecorder: AVAudioRecorder?
    
    var isRecording: Bool {
        return audioRecorder?.isRecording ?? false
    }
    
    var fileURL: URL?
    
    func toggleRecording() {
        
        // if recording isRunning then stop recording!
              //await user input
        if isRecording {
            stop()
        } else {
            record()
        }
        
        // get url for saving the recording
        
        // begin recording, await user input
        
    }
    
    func stop() {
        audioRecorder?.stop()
        audioRecorder = nil  //not sure why necessary
    }
    
    func record() {
        
        // set up the url to store the recording
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("doc stored here: \(documentDirectory)")
        
        let name = UUID().uuidString
        fileURL = documentDirectory.appendingPathComponent(name).appendingPathExtension("caf")
        let format = AVAudioFormat(standardFormatWithSampleRate: 44_100, channels: 1)!
        
        audioRecorder = try! AVAudioRecorder(url: fileURL!, format: format)
        
        
        
        audioRecorder?.record()
        
        
    }
}
