//
//  CountTimer.swift
//  Instagram-Stories-App
//
//  Created by Haaris Iqubal on 5/15/21.
//

import Foundation
import Combine

class CountTimer:ObservableObject{
    @Published var progress: Double
    private var interval: TimeInterval
    private var max:Int
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }
    func start(){
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {_ in
            var newProgress = self.progress + (0.1/self.interval)
            if Int(newProgress) >= self.max {newProgress = 0}
            self.progress = newProgress
        })
    }
    func advancePage(by number:Int) {
        let newProgress = Swift.max((Int(self.progress) + number) % self.max, 0)
        self.progress = Double(newProgress)
    }
}
