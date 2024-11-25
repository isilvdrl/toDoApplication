//
//  BigButtonView.swift
//  toDoApp
//
//  Created by IŞIL VARDARLI on 25.11.2024.
//

import SwiftUI

struct BigButtonView: View {
    var title : String
    var action : () -> Void
    
    var body: some View {
        Button(action: action,
               label:{
                Text(title)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                }
        )
        .background(Color("specialPurple"))
        .cornerRadius(10)
        .padding(.top,25)
        
    }
}

#Preview {
    BigButtonView(title: "title", action: {})
}
