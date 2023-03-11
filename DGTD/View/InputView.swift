//
//  InputView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI

struct InputView: View {
    
    @Binding var inputText: String
    
    let onSubmit: () -> ()
    
    var body: some View {
        TextField("New Todo", text: $inputText)
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemBackground))
                    .opacity(0.8)
            )
            .onSubmit {
                self.onSubmit()
            }
    }
}

struct InputView_Previews: PreviewProvider {
    
    static func onSubmit() {
        print("dg: on submit")
    }
    
    static var previews: some View {    
        InputView(inputText: .constant(""), onSubmit: onSubmit).preferredColorScheme(.dark)
    }
}
