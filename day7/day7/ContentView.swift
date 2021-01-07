//
//  ContentView.swift
//  day7
//
//  Created by alqattan on 05/01/2021.
//
struct feild {
    var player : String
    var enabled : Bool
}
import SwiftUI

struct ContentView: View {
    
   
    @State var winner = ""
    @State var winnerstatus = false
    @State var drawcounter = 0
    @State var feilds:[[feild]] = .init (repeating: .init (repeating : feild (player : "" , enabled: true),count :3), count : 3)
    @State var playerturn : String = "x"
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
        VStack(spacing : 10){
            if winnerstatus == false  {
            Text("\(playerturn) turn ")
                .foregroundColor(.white)
                .bold()
            }
            else {
                Text(winner)
                    .foregroundColor(.white)
                    .bold()
            }
                    
            
            ForEach(0..<3){ r in
                HStack (spacing: 10){
                    ForEach(0..<3){c in

                        Button( action:
                            
                                {
                                    
                                    if feilds [r][c].enabled {
                                feilds [r][c].player = playerturn
                                        drawcounter += 1
                                        checkwinner()
                                        if winnerstatus == false {
                                            playerturn =  playerturn == "x" ? "o" : "x"
                                            feilds[r][c].enabled=false
                                        }}
                                        
                                        
                                        else {
                                            feilds[0][0].enabled = false
                                            feilds[0][1].enabled = false
                                            feilds[0][2].enabled = false
                                            feilds[1][0].enabled = false
                                            feilds[1][1].enabled = false
                                            feilds[1][2].enabled = false
                                            feilds[2][0].enabled = false
                                            feilds[1][1].enabled = false
                                            feilds[2][2].enabled = false
                                        }
                                }
                                    , label: {
                                        
                                    Text(feilds[r][c].player)
                                            .font(.system (size:60))
                                            .foregroundColor(Color.black)
                                            .frame(width: 90, height: 90, alignment: .center)
                                            .background(Color.white)
                                    })
                              
                   
                }
                }

        }
            
            
            if winner != "" {
                Button (action: { restartg()})
                {
                    Text("restart")
                        .font(.system(size: 30 , weight:.bold,design:.rounded))
                        .frame(width: 180 , height:40 , alignment:.center)
                        .background(Color.white)
                
            }
                .padding(.top, 20)
           
            }
            
            
            }
            
        }
    }
    func checkwinner(){
        
        let r1 = feilds[0][0].player == playerturn
            && feilds [0][1].player == playerturn
            && feilds[0][2].player == playerturn
        
        
        let r2 = feilds[1][0].player == playerturn
            && feilds [1][1].player == playerturn
            && feilds[1][2].player == playerturn
        
        let r3 = feilds[2][0].player == playerturn
            && feilds [2][1].player == playerturn
            && feilds[2][2].player == playerturn
        
        
        let c1 = feilds[0][0].player == playerturn
            && feilds [1][0].player == playerturn
            && feilds[2][0].player == playerturn
        
        
        let c2 = feilds[0][1].player == playerturn
            && feilds [1][1].player == playerturn
            && feilds[2][1].player == playerturn
        
        
        let c3 = feilds[0][2].player == playerturn
            && feilds [1][2].player == playerturn
            && feilds[2][2].player == playerturn
        
        let d1 = feilds[0][0].player == playerturn
            && feilds [1][1].player == playerturn
            && feilds[2][2].player == playerturn
        
        let d2 = feilds[0][2].player == playerturn
            && feilds [1][1].player == playerturn
            && feilds[2][0].player == playerturn
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            
            winner = ("\(playerturn) win ")
            winnerstatus = true }
        
        else if drawcounter == 9 {
            
           winner = "draw"
            winnerstatus = true }
            
        }
    func restartg() {
        feilds = .init (repeating: .init (repeating : feild (player : "" , enabled: true),count :3), count : 3)
                       playerturn = "x"
                       winner = ""
                       winnerstatus = false
        drawcounter = 0
    }
        
    

    
    
    }
    
   


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}


