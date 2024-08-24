//
//  BubbleTailView.swift
//  WhatsappClone
//
//  Created by qwerty on 8/23/24.
//

import SwiftUI

struct BubbleTailView: View {
    var direction: MessageDirection
    
    private var backgorunColor: Color{
        return direction == .received ? .bubbleWhite : .bubbleGreen
    }
    var body: some View {
        Image(direction == .sent ? .outgoingTail : .incomingTail)
            .renderingMode(.template)
            .resizable()
            .frame(width: 10,height: 10)
            .offset(y: 3)
            .foregroundColor(backgorunColor)
    }
}

#Preview {
    BubbleTailView(direction: .sent)
}
