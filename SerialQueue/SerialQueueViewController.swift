//
//  SerialQueueViewController.swift
//  SerialQueue
//
//  Created by sun on 14/05/2022.
//

import UIKit

final class SerialQueueViewController: UIViewController {
    
    let serialQueueOne = DispatchQueue(label: "serial.queue.one")
    let serialQueueTwo = DispatchQueue(label: "serial.queue.two")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runSerialQueueTwo()
        runSerialQueueOne()
    }
    
    private func runSerialQueueOne() {
        print("\n\n---- Serial Queue One ---- Start ----")
        for i in 1...3 {
            serialQueueOne.sync {
                print("---\(i)---- Serial Queue One --  💙 --- on Thread ----- ", Thread.current)
                sleep(1)
            }
        }
        print("---- Serial Queue One ---- End ----")
    }
    
    private func runSerialQueueTwo() {
        print("\n\n---- Serial Queue Two ---- Start ----")
        for i in 1...3 {
            serialQueueOne.async {
                print("---\(i)---- Serial Queue Two --  🟥 --- on Thread ----- ", Thread.current)
                sleep(1)
            }
        }
        print("---- Serial Queue Two ---- End ----")
    }
}
