//
//  NetworkMonitor.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import Foundation
import Network

/// Monitor internet availability
final class NetworkMonitor{
    static let shared = NetworkMonitor()
    
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true
    
    func isInternetAvailable() -> Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status != .satisfied {
                print("No internet connection!")
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
