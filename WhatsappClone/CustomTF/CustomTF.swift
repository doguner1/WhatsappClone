//
//  CustomTF.swift
//  WhatsappClone
//
//  Created by qwerty on 9/3/24.
//A
import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    var isPassword: Bool = false
    @Binding var value: String
    @State private var showPassword: Bool = false
    @FocusState private var passwordState: HideState?
    
    enum HideState {
        case hide
        case reveal
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                /// Since I Need Same Width to Align TextFields Equally
                .frame(width: 30)
                /// Slightly Bringing Down
                .offset(y: 2)
            
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        /// Revealing Password when users wants to show Password
                        if showPassword {
                            TextField(hint, text: $value)
                                .focused($passwordState, equals: .reveal)
                        } else {
                            SecureField(hint, text: $value)
                                .focused($passwordState, equals: .hide)
                        }
                    }
                } else {
                    TextField(hint, text: $value)
                }
                
                Divider()
            })
            .overlay(alignment: .trailing) {
                /// Password Reveal Button
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                        passwordState = showPassword ? .reveal : .hide
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                            .contentShape(.rect)
                    })
                }
            }
        })
    }
}
