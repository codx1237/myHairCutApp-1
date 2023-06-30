//
//  SignUp.swift
//  HairCutApp
//
//  Created by Fırat Ören on 27.06.2023.
//

import SwiftUI

struct SecondPage: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var email : String
    
    var body: some View {
        ZStack {
            Color("bg_color")
                .ignoresSafeArea()
            
            VStack {
                Text("User: \(email)")
            }
        }.navigationBarBackButtonHidden()
            .navigationBarItems(trailing:
                                    HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Logout")
                        .foregroundColor(.black)
                    Image(systemName: "arrow.right.square")
                        .foregroundColor(.red)
                }

                
                
            }
            
            )
       
    }
}

//struct SecondPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondPage()
//    }
//}
