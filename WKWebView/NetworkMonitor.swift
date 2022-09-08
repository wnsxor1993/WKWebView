//
//  NetworkMonitor.swift
//  WKWebView
//
//  Created by Zeto on 2022/09/02.
//

import Foundation
import Network

final class NetworkCheck {
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    static let shared = NetworkCheck()
    private let monitor: NWPathMonitor
    private(set) var isConnected: Bool = false
    private(set) var connectionType: ConnectionType = .unknown
    
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        monitor.start(queue: DispatchQueue.global())
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
            self?.getConnectionType(path)
            
            guard let connected = self?.isConnected, connected else {
                print("네트워크 연결 안 됨")
                return
            }
            
            print("네트워크 연결 됨")
        }
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}

private extension NetworkCheck {
    
    func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        
        } else {
            connectionType = .unknown
        }
    }
}
