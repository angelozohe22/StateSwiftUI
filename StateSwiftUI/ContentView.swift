//
//  ContentView.swift
//  StateSwiftUI
//
//  Created by Luis Angel Inga Mendoza on 6/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countLikes: Int = 0
    @State private var isLiked: Bool = false
    @State private var textWritten: String = ""
    @State private var amount: Int = 0
    @State private var amountString: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text(textWritten)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            VStack(spacing: 8) {
                Button {
                    isLiked.toggle()
                    if isLiked {
                        countLikes += 1
                    }else {
                        countLikes -= 1
                    }
                } label: {
                    HStack {
                        Image(systemName: !isLiked ? "heart" : "heart.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                        Text(String(countLikes))
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }
                Button {
                    amount += Int(amountString == "" ? "0" : amountString) ?? 0
                } label: {
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                        Text(String(amount))
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }

            }
            TextField("Inserta un titulo", text: $textWritten)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.namePhonePad)
            TextField("Inserta un monto", text: $amountString)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
        }
        .padding(.horizontal, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
