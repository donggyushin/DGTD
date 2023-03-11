//
//  QuoteView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI

struct QuoteView: View {
    
    @Binding var quote: Quotes.Quote?
    
    var body: some View {
        VStack {
            Text(quote?.quote ?? "")
                .multilineTextAlignment(.center)
            
            Text(quote?.author ?? "")
                .font(.footnote)
                .padding(.top, 1)
        }
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: .constant(.init(quote: "Some men see things as they are and say why.. I dream things that never were and say why not.", author: "George Bernard Shaw", date: "2023-03-11")))
            .preferredColorScheme(.dark)
    }
}
