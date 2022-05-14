//
//  ConcurrentQueueViewController.swift
//  ConcurrentQueue
//
//  Created by sun on 14/05/2022.
//

import UIKit

final class ConcurrentQueueViewController: UIViewController {
    
    let concurrentQueueOne = DispatchQueue(label: "concurrent.queue.one")
    let concurrentQueueTwo = DispatchQueue(label: "concurrent.queue.two")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runConcurrentQueueOne()
        runConcurrentQueueTwo()
    }
    
    private func runConcurrentQueueOne() {
        print("\n\n---- Concurrent Queue One ---- Start ----")
        for i in 1...3 {
            concurrentQueueOne.sync {
                print("---\(i)---- Concurrent Queue One --  💙 --- on Thread ----- ", Thread.current)
                sleep(1)
            }
        }
        print("---- Concurrent Queue One ---- End ----")
    }
    
    private func runConcurrentQueueTwo() {
        print("\n\n---- Concurrent Queue Two ---- Start ----")
        for i in 1...3 {
            concurrentQueueTwo.async {
                print("---\(i)---- Concurrent Queue Two --  🟥 --- on Thread ----- ", Thread.current)
                sleep(1)
            }
        }
        print("---- Concurrent Queue Two ---- End ----")
    }
}
