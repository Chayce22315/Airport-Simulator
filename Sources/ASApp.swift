//  ASApp.swift
//  Simulations Express - Airport Simulation
//  Created on iPhone via GitHub Web

import SwiftUI

@main
struct AirportSimulationApp: App {
    // These objects manage the "Simulations Express" engine logic
    @StateObject private var passengerManager = PassengerSpawnerManager()
    @StateObject private var constructionManager = ConstructionQueueManager()
    @StateObject private var settings = SettingsManager()
    
    var body: some Scene {
        WindowGroup {
            // The starting point: Your interactive title screen!
            TitleScreenView()
                .environmentObject(passengerManager)
                .environmentObject(constructionManager)
                .environmentObject(settings)
        }
    }
}

// MARK: - Manager Helpers
// Bridges your backend logic to the SwiftUI front-end
class PassengerSpawnerManager: ObservableObject {
    @Published var totalOccupancy: Int = 0
}

class ConstructionQueueManager: ObservableObject {
    @Published var activeProjects: [String] = []
}
