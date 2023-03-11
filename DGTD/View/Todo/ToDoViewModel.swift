//
//  ToDoViewModel.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine
import Foundation

class ToDoViewModel: ObservableObject {
    
    private let defaultImageUrl = "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"
    
    @Published var todoText: String = ""
    @Published var quote: Quotes.Quote?
    @Published private(set) var imageUrl: String?
    @Published var shouldLogin = false
    
    private let unsplashRepository: UnsplashRepository
    private let unsplashServer: UnsplashDataSource
    private let quotesRepository: QuotesRepository
    private let quotesServer: QuotesDataSource
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(unsplashRepository: UnsplashRepository,
         unsplashServer: UnsplashDataSource,
         quotesRepository: QuotesRepository,
         quotesServer: QuotesDataSource
    ) {
        self.unsplashRepository = unsplashRepository
        self.unsplashServer = unsplashServer
        self.quotesRepository = quotesRepository
        self.quotesServer = quotesServer
        
        fetchPhoto()
        fetchQuote()
    }
    
    func onSubmit() {
        
        if !store.user.isLogin {
            shouldLogin = true
            return
        }
        
        saveTodo()
    }
    
    private func saveTodo() {
        self.todoText = ""
    }
    
    private func fetchPhoto() {
        unsplashRepository.getPhoto(datasource: unsplashServer)
            .map({ $0.urls.full })
            .replaceError(with: defaultImageUrl)
            .receive(on: DispatchQueue.main)
            .sink { fullUrl in
                self.imageUrl = fullUrl
            }
            .store(in: &cancellables)
    }
    
    private func fetchQuote() {
        quotesRepository.getQuates(datasource: quotesServer)
            .map({ $0.contents.quotes.first })
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] quote in
                self?.quote = quote
            }
            .store(in: &cancellables)
    }
}
