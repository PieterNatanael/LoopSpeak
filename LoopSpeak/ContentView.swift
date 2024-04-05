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
        ScrollView {
            VStack {
                Text("Behind the Scenes.")
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)

                                // Your ad content here...

                                Text("Thank you for buying our app with a one-time fee, it helps us keep up the good work. Explore these helpful apps as well. ")
                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .multilineTextAlignment(.center)
                
                
                
             
             Text("SingLOOP.")
                 .font(.title)
 //                           .monospaced()
                 .padding()
                 .foregroundColor(.white)
                 .onTapGesture {
                     if let url = URL(string: "https://apps.apple.com/id/app/sing-l00p/id6480459464") {
                         UIApplication.shared.open(url)
                     }
                 }
 Text("Record your voice effortlessly, and play it back in a loop.") // Add your 30 character description here
                    .font(.title3)
//                    .italic()
                   .multilineTextAlignment(.center)
                   .padding(.horizontal)
                   .foregroundColor(.white)
                
                Text("Time Tell.")
                    .font(.title)
//                           .monospaced()
                    .padding()
                    .foregroundColor(.white)
                    .onTapGesture {
                        if let url = URL(string: "https://apps.apple.com/app/time-tell/id6479016269") {
                            UIApplication.shared.open(url)
                        }
                    }
  Text("it will announce the time every 30 seconds, no more guessing and checking your watch, for time-sensitive tasks, workouts, and mindfulness exercises.") // Add your 30 character description here
                      .font(.title3)
//                                 .italic()
                      .multilineTextAlignment(.center)
                      .padding(.horizontal)
                      .foregroundColor(.white)
                
             
                
                Text("Insomnia Sheep.")
                    .font(.title)
     //                           .monospaced()
                    .padding()
                    .foregroundColor(.white)
                    .onTapGesture {
                        if let url = URL(string: "https://apps.apple.com/id/app/insomnia-sheep/id6479727431") {
                            UIApplication.shared.open(url)
                        }
                    }
             Text("Design to ease your mind and help you relax leading up to sleep.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .padding(.horizontal)
                                 .multilineTextAlignment(.center)
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
             Text("Go-to solution for a comfortable reading experience, by adjusting font size to suit your preference.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .multilineTextAlignment(.center)
                                 .padding(.horizontal)
                                 .foregroundColor(.white)
                           
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
             Text("Custom affirmations, schedule notifications, stay inspired daily.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .multilineTextAlignment(.center)
                                 .padding(.horizontal)
                                 .foregroundColor(.white)
                           
                        
                      
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
             Text("One button to track milestones, monitor progress, stay motivated.") // Add your 30 character description here
                                 .font(.title3)
//                                 .italic()
                                 .multilineTextAlignment(.center)
                                 .padding(.horizontal)
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
           .background(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
           .cornerRadius(15.0)
       .padding()
        }
   }
}

struct ShowExplainView: View {
   var onConfirm: () -> Void

    var body: some View {
       VStack {
           Text("Type or paste your text, then press the start button to initiate the speech loop.")
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
       .background(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
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
