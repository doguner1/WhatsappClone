//
//  LoginScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 9/4/24.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var authScreenModel = AuthScreenModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                AuthHeaderView()
                
                AuthTextField(type: .email, text: $authScreenModel.email)
                AuthTextField(type: .password, text: $authScreenModel.password)
                forgetPasswordButton()
                
                AuthButton(title: "Login in now"){
                    
                }
                .disabled(authScreenModel.disableLoginButton)
                Spacer()
                signUpButton()
                    .padding(.bottom,30)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.teal.gradient)
            .ignoresSafeArea()
        }
    }
    
    private func forgetPasswordButton()->some View{
        Button {
            
        } label: {
            Text("Forgot Password?")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,32)
                .bold()
                .padding(.vertical)
        }

    }
    
    private func signUpButton()->some View{
        NavigationLink{
            SignUpScreen(authScreenModel: authScreenModel)
        }label: {
            HStack{
                Image(systemName: "sparkles")
                (
                    Text("Don't have an account ?")
                    +
                    Text("Create one").bold()
        
                )
                Image(systemName: "sparkles")
            }
        }
    }
}

#Preview {
    LoginScreen()
}

/*
 Hangi Durumda Hangi Özellik Kullanılır?
 @StateObject Kullanımı:
 Bir view kendi durumunu yönetiyorsa.
 Diğer view'lerden bağımsız, yerel bir state ihtiyacı varsa.
 Bir view'de oluşturulan nesnenin, başka bir view'de paylaşılmasına gerek yoksa.
 @ObservedObject Kullanımı:
 Bir ObservableObject nesnesi, birden fazla view tarafından paylaşılacaksa.
 Bir view'den diğerine geçildiğinde, durumun senkronize kalması isteniyorsa.
 Sonuç
 Eğer LoginScreen ve SignUpScreen arasında veri senkronizasyonu istemiyorsanız, her iki view'de de @StateObject kullanmanız uygun olacaktır. Ancak, veri paylaşımı ve senkronizasyonu istiyorsanız, LoginScreen'de @StateObject, SignUpScreen'de ise @ObservedObject kullanmalısınız. Bu, iki view arasında aynı nesneyi paylaşmanızı sağlar.
 */
