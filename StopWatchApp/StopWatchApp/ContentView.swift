//
//  ContentView.swift
//  StopWatchApp
//
//  Created by Haaris Iqubal on 6/4/21.
//

import SwiftUI

struct LapClass:Identifiable {
    var id = UUID()
    let lap:Double
    init(_ lap: Double) {
        self.lap = lap
    }
}

struct ContentView: View {
    
    @ObservedObject var managerClass = ManagerClass()
    @State private var lapTimings: [LapClass] = []
    
    var body: some View {
        NavigationView{
        VStack{
            Text(String(format: "%.2f", managerClass.secondElapsed))
                .font(.largeTitle)
            switch managerClass.mode {
            case .stopped:
                withAnimation{
                    Button(action: {
                        managerClass.start()
                    }, label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(100)
                    })
                }
            case .running:
                HStack{
                    withAnimation{
                        Button(action: {
                            managerClass.stop()
                            lapTimings = []
                        }, label: {
                            Image(systemName: "stop.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(100)
                        })
                    }
                    withAnimation{
                        Button(action: {
                            let newLap = LapClass(managerClass.secondElapsed)
                            lapTimings.append(newLap)
                        }, label: {
                            Image(systemName: "stopwatch.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(100)
                        })
                    }
                    withAnimation{
                        Button(action: {
                            managerClass.pause()
                        }, label: {
                            Image(systemName: "pause.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(100)
                        })
                    }
                    
                }
            case .paused:
                HStack{
                    withAnimation{
                        Button(action: {
                            managerClass.stop()
                            lapTimings = []
                        }, label: {
                            Image(systemName: "stop.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(100)
                        })
                    }
                withAnimation{
                    Button(action: {
                        managerClass.start()
                    }, label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(100)
                    })
                }
                
                }
            }
            
            List(lapTimings){lap in
                Text("\(String(format: "%.2f", lap.lap)) s")
            }
            
        }
        .navigationTitle("Stop Watch App")
        }
        }
}

enum mode {
    case running
    case stopped
    case paused
}

class ManagerClass:ObservableObject {
    @Published var secondElapsed = 0.0
    @Published var mode: mode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
            self.secondElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        secondElapsed = 0
        mode = .stopped
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
