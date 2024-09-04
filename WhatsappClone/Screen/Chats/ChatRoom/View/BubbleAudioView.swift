//
//  BubbleAudioView.swift
//  WhatsappClone
//
//  Created by qwerty on 9/3/24.
//

import SwiftUI

struct BubbleAudioView: View {
    var item: MessageItem
    @State private var sliderValue: Double = 0
    @State private var sliderRange: ClosedRange<Double> = 0...20
    var body: some View {
        VStack(alignment: item.horizontalAlignment){
            HStack{
                playButton()
                Slider(value: $sliderValue, in: sliderRange)
                    .tint(.gray)
                
                Text("04:00")
                    .foregroundStyle(.gray)
            }
            .padding(10)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
            .padding(5)
            .background(item.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
            .applyTail(item.direction)
            
            timeStampTextView()
        }
        .shadow(color: Color(.systemGray3).opacity(0.1),radius: 5,x: 0,y: 20)
        .frame(maxWidth: .infinity,alignment: item.alignment)
        .padding(.leading,item.direction == .received ? 5 : 100)
        .padding(.trailing, item.direction == .received ? 100 : 5)
        
    }
    
    private func playButton() -> some View {
        Button(action: {}) {
            Image(systemName: "play.fill")
                .padding(10)
                .background(item.direction == .received ? .green : .white)
                .clipShape(Circle())
                .foregroundStyle(item.direction == .received ? .white : .black)
        }
    }
    
    private func timeStampTextView() -> some View{
        HStack{
            Text("11:13 AM")
                .font(.system(size: 10))
                .foregroundStyle(.gray)
            
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15,height: 15)
            }
        }
        .padding(.vertical,2.5)
        .padding(.horizontal)
        .background(Color(.systemGray4))
        .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
        .padding(9)
    }
}

#Preview {
    BubbleAudioView(item: .sentPlaceHolder)
}
