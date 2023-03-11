//
//  ToDoView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI

struct ToDoView: View {
    
    @ObservedObject var viewModel: ToDoViewModel = .init(unsplashRepository: UnsplashRepository.shared, unsplashServer: UnsplashServer.shared)
    
    var body: some View {
        ZStack {
            if let urlString = viewModel.imageUrl, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color(UIColor.systemBackground)
                }
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            }
            
            ScrollView {
                Text("Hello World")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView().preferredColorScheme(.dark)
    }
}
