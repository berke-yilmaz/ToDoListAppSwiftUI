//
//  HeaderView.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50))

                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))

            }
            .padding(.top, 80)
        }
        .offset(y:-150)
        .frame(width: UIScreen.main.bounds.width * 3 ,height: 350)
    }
}

#Preview { 
    HeaderView(title: "title", subtitle: "subtitle", angle: 15, background: .blue)
}
