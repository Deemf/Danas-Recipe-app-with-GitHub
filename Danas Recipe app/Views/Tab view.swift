//
//  Tab view.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-03-06.
//

import SwiftUI

struct Tab_view: View {
    var body: some View {
        TabView {
            Text("Featured View").tabItem {
                VStack {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            ContentView()
                .tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                    }
                }
        }
        
    }
}

struct Tab_view_Previews: PreviewProvider {
    static var previews: some View {
        Tab_view()
    }
}
