//
//  TODO_ListApp.swift
//  TODO-List
//
//  Created by Apple on 08/08/23.
//
import FirebaseCore
import SwiftUI

@main
struct TODO_ListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
