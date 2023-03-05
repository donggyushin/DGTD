//
//  ToDoView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI

struct ToDoView: View {
    
    @ObservedObject var viewModel: ToDoViewModel = .init(unsplashRepository: UnsplashRepository.shared, unsplashDatasource: UnsplashDataSourceLive.shared)
    
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
        ToDoView().preferredColorScheme(.dark)
    }
}
