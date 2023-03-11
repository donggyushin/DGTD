//
//  ToDoView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI

struct ToDoView: View {
    
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        NavigationStack {
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
            .navigationDestination(isPresented: $viewModel.shouldLogin) {
                AuthView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(viewModel: DI.viewModel.toDo()).preferredColorScheme(.dark)
    }
}
