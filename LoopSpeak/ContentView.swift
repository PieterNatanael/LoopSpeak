//
//  ContentView.swift
//  LoopSpeak
//
//  Created by Pieter Yoshua Natanael on 29/11/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var textToRead = ""
    @State private var isReading = false
    @State private var timer: Timer? // Mark timer as @State
    @State private var showAd: Bool = false
    @State private var showExplain: Bool = false
    
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            //AdView button
            HStack{
                Button(action: {
                    showAd = true
                }) {
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.system(size: 30))
//                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Button(action: {
                        showExplain = true
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: 30))
//                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }

            
            Text("LoopSpeak")
                .font(.largeTitle)
                .padding()

            TextEditor(text: $textToRead)
                .padding()

            Button(action: {
                if isReading {
                    stopLoop()
                } else {
                    startLoop()
                }
                isReading.toggle()
            }) {
                Text(isReading ? "Stop" : "Start")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(isReading ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
        }
        //ViewAd and other button
        .sheet(isPresented: $showAd) {
            ShowAdView(onConfirm: {
                showAd = false
            })
        }
        
        .sheet(isPresented: $showExplain) {
            ShowExplainView(onConfirm: {
                showExplain = false
            })
        }
        .padding()
    }

    func speak(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }

    func startLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.speak(text: self.textToRead) // Explicitly use self here
        }
    }

    func stopLoop() {
        timer?.invalidate()
        timer = nil
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ShowAdView: View {
   var onConfirm: () -> Void

    var body: some View {
       VStack {
           Text("Ad.")
                          .font(.title)
//                           .bold()
//                           .monospaced()
                          .padding()
                          .foregroundColor(.white)
                      
                      Text("Dry Eye Read.")
                          .font(.title)
//                           .monospaced()
                          .padding()
                          .foregroundColor(.white)
                          .onTapGesture {
                              if let url = URL(string: "https://apps.apple.com/id/app/dry-eye-read/id6474282023") {
                                  UIApplication.shared.open(url)
                              }
                          }
                      
                      Text("iProgramMe.")
                          .font(.title)
//                           .monospaced()
                          .padding()
                          .foregroundColor(.white)
                          .onTapGesture {
                              if let url = URL(string: "https://apps.apple.com/id/app/iprogramme/id6470770935") {
                                  UIApplication.shared.open(url)
                              }
                          }
                      
                      Text("LoopSpeak.")
                          .font(.title)
//                           .monospaced()
                          .padding()
                          .foregroundColor(.white)
                          .onTapGesture {
                              if let url = URL(string: "https://apps.apple.com/id/app/loopspeak/id6473384030") {
                                  UIApplication.shared.open(url)
                              }
                          }
                      
                      Text("TimeTell.")
                          .font(.title)
//                           .monospaced()
                          .padding()
                          .foregroundColor(.white)
                          .onTapGesture {
                              if let url = URL(string: "https://apps.apple.com/app/time-tell/id6479016269") {
                                  UIApplication.shared.open(url)
                              }
                          }
                      
                      Text("TemptationTrack.")
                          .font(.title)
//                           .monospaced()
                          .padding()
                          .foregroundColor(.white)
                          .onTapGesture {
                              if let url = URL(string: "https://apps.apple.com/id/app/temptationtrack/id6471236988") {
                                  UIApplication.shared.open(url)
                              }
                          }


           Spacer()

           Button("Close") {
               // Perform confirmation action
               onConfirm()
           }
           .font(.title)
           .padding()
           .foregroundColor(.black)
           .background(Color.white)
           .cornerRadius(25.0)
           .padding()
       }
       .padding()
       .background(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
       .cornerRadius(15.0)
       .padding()
   }
}

struct ShowExplainView: View {
   var onConfirm: () -> Void

    var body: some View {
       VStack {
           Text("Type or paste the words, then press the start button to initiate the speech loop.")
               .font(.title)
               .multilineTextAlignment(.center)
//                       .monospaced()
               .padding()
               .foregroundColor(.white)



           Spacer()

           Button("Close") {
               // Perform confirmation action
               onConfirm()
           }
           .font(.title)
           .padding()
           .foregroundColor(.black)
           .background(Color.white)
           .cornerRadius(25.0)
           .padding()
       }
       .padding()
       .background(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
       .cornerRadius(15.0)
       .padding()
   }
}


/*
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var textToRead = ""
    @State private var isReading = false
    @State private var timer: Timer? // Mark timer as @State
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Text("LoopSpeak")
                .font(.largeTitle)
                .padding()

            TextEditor(text: $textToRead)
                .padding()

            Button(action: {
                if isReading {
                    stopLoop()
                } else {
                    startLoop()
                }
                isReading.toggle()
            }) {
                Text(isReading ? "Stop" : "Start")
                    .padding()
                    .foregroundColor(.white)
                    .background(isReading ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func speak(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }

    func startLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.speak(text: self.textToRead) // Explicitly use self here
        }
    }

    func stopLoop() {
        timer?.invalidate()
        timer = nil
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
