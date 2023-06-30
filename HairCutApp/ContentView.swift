//
//  ContentView.swift
//  HairCutApp
//
//  Created by Fırat Ören on 27.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var isSignUp = false
    @State var mySignStatus : signStatus = .signIn
    @State var isSplashScreen = false
    
    enum signStatus {
        case signIn
        case signUp
    }
    
    var body: some View {
        
        NavigationView {
            ZStack() {
                if isSplashScreen {
                    // Background
                    
                    Image("bg2")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .offset(y : -70)
                    
                    // Foreground
                    
                    VStack {
                        VStack(){
                            
                            Text(isSignUp ? "Sign Up" : "Sign In")
                                .frame(maxWidth : .infinity,alignment: .leading)
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .padding()
                                .padding(.top, 25)
                            
                            
                            TextField("Type your Email", text: $text)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .textInputAutocapitalization(.never)
                            Divider()
                                .padding(.horizontal)
                            if verifyEmail() {
                                NavigationLink {
                                    switch mySignStatus {
                                    case .signIn :
                                        SecondPage(email: $text)
                                        
                                    case .signUp :
                                        SecondPage(email: $text)
                                        
                                    }
                                } label: {
                                    Text("Continue")
                                        .padding()
                                        .padding(.horizontal)
                                        .foregroundColor(.white)
                                        .background(verifyEmail() ? .black : .gray)
                                        .cornerRadius(10)
                                        .padding(.top , 35)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                }
                            }
                            
                            else {
                                Text("Continue")
                                    .padding()
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                    .background(verifyEmail() ? .black : .gray)
                                    .cornerRadius(10)
                                    .padding(.top , 35)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            
                            
                            Spacer()
                            HStack {
                                
                                
                                Text(isSignUp ? "" : "New User?")
                                    .fontWeight(.light)
                                Button(isSignUp ? "Already Have an Account ?" : "Create an Account") {
                                    isSignUp.toggle()
                                    mySignStatus = isSignUp ? .signUp : .signIn
                                }
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                
                            }
                            
                            Spacer()
                            
                        }
                        .frame( width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
                        .background(.white)
                        .roundedCorner(70, corners: .topLeft)
                        
                        
                        
                        
                    }.frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height,alignment: .bottom)
                } else {
                    SplashView(isSplashScreen: $isSplashScreen)
                }
            } // end of zstack
        } // end of navview
    }
    
    func Continue(email : String) {
        switch mySignStatus {
        case .signIn :
            print("sign up : \(email)")
            text = ""
        case .signUp :
            print("sign in : \(email)")
            text = ""
        }
    }
    
    func verifyEmail() -> Bool{
        
        if text.count > 5 {
            return true
        }
        
        return false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
       
    }
}


extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
