import SwiftUI

struct SignInPage: View {
    @State private var rememberMe = false
    @State private var isHomeUserActive = false

    
    var body: some View {
        ZStack {
            
            VStack(spacing: 30) {
                Image("logo1")
                    .resizable()
                    .frame(width: 269, height: 160)
                    .padding(.top, 30)
                
                Text("Sign in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(spacing: 15) {
                    HStack {
                        Image("email")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 10)
                            .foregroundColor(Color(hex: "747688"))
                        
                        TextField("Email", text: .constant(""))
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(5.0)
                    }
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(radius: 2.0)
                    
                    HStack {
                        Image("Password")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 10)
                            .foregroundColor(Color(hex: "747688"))
                        
                        SecureField("Password", text: .constant("")) // Use SecureField for passwords
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(5.0)
                        
                        Image("lock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                            .foregroundColor(Color(hex: "747688"))
                    }
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(radius: 2.0)
                    
                    HStack {
                        Toggle(isOn: $rememberMe) {
                            Text("Remember Me")
                                .font(.subheadline)
                        }
                        .padding(.trailing, 30)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Forgot Password?")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                        }
                    }
                    
                    Button(action: {
                        withAnimation {
                            isHomeUserActive.toggle()
                        }
                    }) {
                        Text("SIGN IN")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(5.0)
                            .shadow(radius: 2.0)
                    }
                    .fullScreenCover(isPresented: $isHomeUserActive, content: {
                        UserHomeView()
                    })
                    
                    Text("OR")
                    
                    VStack(spacing: 15) {
                        Button(action: {}) {
                            HStack {
                                Image("google_logo")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text("Login with Google")
                                    .font(.subheadline)
                            }
                        }
                        
                        Button(action: {}) {
                            HStack {
                                Image("apple_logo")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text("Login with Apple")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .foregroundColor(.black)
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.subheadline)
                        
                        Button(action: {}) {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
