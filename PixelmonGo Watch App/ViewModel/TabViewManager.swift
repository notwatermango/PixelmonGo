//
//  TabViewManager.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 26/05/24.
//

import Foundation

class TabViewManager: ObservableObject {
    @Published var currentTab = 1
    
    func changeCurrentTab(selectTab: Int) {
        currentTab = selectTab
    }
}
