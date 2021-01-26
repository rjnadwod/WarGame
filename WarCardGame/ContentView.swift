//
//  ContentView.swift
//  WarCardGame
//
//  Created by Riley Nadwodny on 1/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card" + String(Int.random(in: 2...14))
    @State private var cpuCard = "card" + String(Int.random(in: 2...14))
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 250, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                Button(action: {
                    
                    //Generate a random number between 2 and 13
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    //Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    //Update the score
                    if (cpuRand > playerRand) {
                        cpuScore += 1
                    }
                    else if (playerRand > cpuRand) {
                        playerScore += 1
                    }
                },
                       label: {
                    Image("dealbutton")
                        .resizable()
                        .frame(width: 160, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                })
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
