//
//  ContentView.swift
//  SwiftUIListItemsUpdateDuringAnimationBug
//
//  Created by Ralf Ebert on 27.11.20.
//

import Combine
import SwiftUI

struct ContentView: View {

    @State var items = [String]()
    @State var isExpanded = false

    var body: some View {
        Form {
            Section(header: Text("Tap here")) {
                List(self.visibleItems, id: \.self) { item in
                    Button(item) {
                        withAnimation {
                            self.isExpanded.toggle()
                        }
                        self.items += Array(repeating: "A", count: 2)
                    }
                }
            }

            Text("⇣ should have \(self.items.count) items below")
            List {
                ForEach(self.items, id: \.self) { item in
                    Text(item)
                }
            }
            Text("⇡ should have \(self.items.count) items above")
        }
    }

    var visibleItems: [String] {
        Array(repeating: "Tap here", count: self.isExpanded ? 2 : 1)
    }

}
