//
//  SignButtonView.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 25/10/2023.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding(.vertical, 20)
    }
}

#Preview {
    ButtonView(title: "Title", backgroundColor: Color.red){
        
    }
}
