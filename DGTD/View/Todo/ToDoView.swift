//
//  ToDoView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI

struct ToDoView: View {
    
    @ObservedObject var viewModel: ToDoViewModel =
        .init(unsplashRepository: UnsplashRepository.shared,
              unsplashServer: UnsplashServer.shared,
              quotesRepository: QuotesRepository.shared,
              quotesServer: QuotesServer.shared
        )
    
    var body: some View {
        ZStack {
            if let urlString = viewModel.imageUrl, let url = URL(string: urlString) {
                BackgroundView(url: url)
            }
            
            ScrollView {
                InputView(inputText: $viewModel.todoText, onSubmit: viewModel.onSubmit)
            }
            .padding(.horizontal, 20)
            
            VStack {
                Spacer()
                QuoteView(quote: $viewModel.quote)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView().preferredColorScheme(.dark)
    }
}
