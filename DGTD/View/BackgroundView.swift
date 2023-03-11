//
//  BackgroundView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI

struct BackgroundView: View {
    
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            Color(UIColor.systemBackground)
        }
        .ignoresSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = URL(string: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg") {
            BackgroundView(url: url)
        }
    }
}
