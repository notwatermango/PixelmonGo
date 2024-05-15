//
//  FindView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        NavigationStack {
            Text("Radar View")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            // Show temporary radar
                        } label: {
                            Image(systemName:"magnifyingglass")
                        }
                        .controlSize(.large)
                        .background(in: Capsule())
                    }
                }
        }
    }
}

#Preview {
    FindView()
}
