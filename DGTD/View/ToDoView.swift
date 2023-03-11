//
//  ToDoView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI
import URLImage

struct ToDoView: View {
    
    @ObservedObject var viewModel: ToDoViewModel = .init(unsplashRepository: UnsplashRepository.shared, unsplashServer: UnsplashServer.shared)
    
    var body: some View {
        ZStack {
            
            if let urlString = viewModel.imageUrl, let url = URL(string: urlString) {
                URLImage(url) { image, info in
                    image
                        .aspectRatio(contentMode: .fill)
                }
            }
            ScrollView {
                Text("Why this text disappeared after image view rendered?")
            }.padding(.top, 100)
            
            
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView().preferredColorScheme(.dark)
    }
}
