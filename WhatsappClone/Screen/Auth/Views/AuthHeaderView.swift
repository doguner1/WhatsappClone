//
//  AuthHeaderView.swift
//  WhatsappClone
//
//  Created by qwerty on 9/4/24.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        HStack{
            Image(.whatsapp)
                .resizable()
                .frame(width: 40,height: 40)
            
            Text("WhatsApp")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    AuthHeaderView()
}
