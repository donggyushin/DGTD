//
//  ToDoView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI

struct ToDoView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
