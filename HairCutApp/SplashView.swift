//
//  SplashView.swift
//  HairCutApp
//
//  Created by Fırat Ören on 30.06.2023.
//

import SwiftUI

struct SplashView: View {
    @State var isAnimating = false
    @State var state = 0
    @Binding var isSplashScreen : Bool
    
    var body: some View {
        
        TabView{
            
            Rectangle()
                .onAppear{
                    if state == 0 {
                        isAnimating.toggle()
                        state += 1
                    }
                }
                .overlay {
                    VStack{
                        Spacer()
                        Image(systemName: "gear.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 250 , height: 250)
                            .rotationEffect(Angle(degrees: isAnimating ? 0 : 360))
                            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
                        Spacer()
                        Text("Hair Cut App")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        HStack{
                            Text("Please Slide To See More..")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.red)
                                .font(.system(size: 24))
                        }
                        
                        Spacer()
                    }
                    
                }
            
            
            Rectangle()
                .overlay {
                    VStack{
                        Text("Get A Hair Cut Whenever You Want ")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                            .padding()
                        Text("Your Demand On Hair Cut is Here ")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        Button {
                            withAnimation {
                                isSplashScreen = true
                            }
                            
                        } label: {
                            Text("Continue")
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.red)
                                .background(.white)
                                .cornerRadius(10)
                                .font(.system(size: 25,weight: .medium))
                                .padding(.top , 20)
                        }

                    }
                }
            
        }
        .tabViewStyle(.page)

    }
}

struct SplashView_Previews: PreviewProvider {

    static var previews: some View {
        SplashView(isSplashScreen: .constant(true))
    }
}
