//
//  WorkingMemoryGame.swift
//  Memo
//
//  Created by mccl on 17/04/23.
//

import SwiftUI

struct WorkingMemoryGame: View {
    
    @State private var monsters: [String] = ["pink-monster", "yellow-monster", "green-monster", "blue-monster", "orange-monster", "purple-monster", "red-monster"].shuffled()
    
    @State private var monstersShuffled: [String] = ["purple-monster", "blue-monster", "pink-monster", "red-monster", "green-monster", "orange-monster", "yellow-monster"].shuffled()
    
    @State private var monstersChosen: [String] = []
    
    @State private var rectangles = [String](repeating: "rectangle-yellow", count: 7)
    
    @State private var currentRectangleIndex: Int = 0
    
    @State private var countView: Int = 0
    
    @State private var instructions: Bool = false
    
    @State private var shouldAnimate: Bool = false
    
    @State private var droppedMonster = [Bool](repeating: false, count: 7)
    
    @State var countDownTimer = 5
    @State var countDownTimerRunning = true
    @State var textTimer = true
    
    @State var gameTimer = 10
    @State var gameTimerRunning = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let monstersReversedArray: [String] = monsters.reversed()
            
            ZStack {
                BackgroundViewModel(imageName: "bg-second-game")
                
                if countView == 1 {
                    
                    ZStack {
                        Color("pink-600")
                        
                    }
                    .background(Color("pink-600"))
                    .cornerRadius(10)
                    .frame(width: geometry.size.width * 0.11, height: geometry.size.height * 0.08, alignment: .center)
                    .offset(x: geometry.size.width * 0.35, y: -geometry.size.height * 0.35)
                    
                    Text(textTimer ? "00:\(gameTimer)" : "00:0\(gameTimer)")
                        .onReceive(timer) {
                            _ in
                            
                            if gameTimer > 0 && gameTimerRunning {
                                gameTimer -= 1
                                if gameTimer < 10 {
                                    textTimer = false
                                }
                            } else {
                                gameTimerRunning = false
                                countView = 2
                            }
                        }
                        .offset(x: geometry.size.width * 0.35, y: -geometry.size.height * 0.35)
                        .font(.system(size: 32, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                    
                    
                }
                
                if countView == 0 {
                    
                    ZStack {
                        
                        Image("pink-rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.4)
                        
                        VStack {
                            Text("Prepare yourself!")
                                .frame(width: geometry.size.width * 0.15)
                                .font(.system(size: 32, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("\(countDownTimer)")
                                .onReceive(timer) {
                                    _ in
                                    
                                    if countDownTimer > 1 && countDownTimerRunning {
                                        countDownTimer -= 1
                                    } else {
                                        countDownTimerRunning = false
                                        countView = 1
                                    }
                                }
                                .font(.system(size: 128, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                    
                }
                
                if countView == 2 {
                    
                    VStack(spacing: geometry.size.height * 0.02) {
                        
                        VStack(spacing: geometry.size.height * 0.05) {
                            
                            ZStack {
                                
                                Image("blue-monster")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.1)
                                
                                Image("hand")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.09)
                                    .offset(x: 35, y: 35)
                                    .scaleEffect(shouldAnimate ? 1.2 : 1)
                                    .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
                                    .onAppear() {
                                        self.shouldAnimate = true
                                        
                                    }
                                
                            }
                            
                            Image("instructions-second-game")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.8)
                        }
                        
                      
                            
                            Button {
                                countView = 3
                                print(monstersReversedArray)
                            } label: {
                                Text("START")
                                    .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold, design: .default))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .foregroundColor(Color("pink-200"))
                                    )
                            }
                            .allowsHitTesting(instructions ? true : false)
                            .opacity(instructions ? 1 : 0)
                            
                            
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                instructions = true
                            }
                        }
                    }
                
                if countView > 0 && countView != 2 {
                    
                    VStack {
                        
                        Text(countView == 3 ? "Place the items in the REVERSE order that you memorized them." : "Memorize once again where each item is. You have 10 seconds.")
                            .frame(width: countView == 3 ? geometry.size.width * 0.9 : geometry.size.width * 0.5)
                            .font(.system(size: 32, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        if countView == 3 {
                            Text("You can change the ones you already chose by tapping on the last item picked.")
                                .frame(width: geometry.size.width * 0.8)
                                .font(.system(size: 24, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                        
                        ZStack {
                            
                            Image("monsters-bg-second-game")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.35)
                            
                            if countView == 1 {
                                HStack(alignment: .bottom, spacing: 20) {
                                    ForEach(0..<7) { number in
                                        MonsterViewModel(imageName: self.monsters[number], index: number, width: geometry.size.width * 0.1)
                                        
                                        
                                    }
                                }
                            } else if countView == 3 {
                                
                                HStack(alignment: .bottom, spacing: 20) {
                                    
                                    ForEach(0..<7) { number in
                                        
                                        RectangleViewModel(imageName: self.rectangles[number], index: number, width: geometry.size.width * 0.1)
                                            .scaleEffect(droppedMonster[number] ? 1.1 : 1)
                                            .animation(Animation.easeInOut(duration: 0.7), value: droppedMonster)
                                            .onTapGesture {
                                                if number == (currentRectangleIndex - 1) {
                                                    itemDismissed(monsterIndex: number, monsterName: monstersChosen[number])
                                                }
                                                
                                            }

                                        
                                    }
                                }
                            }
                        }
                        
                        
                        HStack(alignment: .bottom, spacing: 20) {
                            ForEach(0..<monstersShuffled.count, id: \.self) { number in
                                MonsterViewModel(imageName: self.monstersShuffled[number], index: number, width: geometry.size.width * 0.1)
                                    .onTapGesture {
                                        itemTapped(rectangleIndex: currentRectangleIndex, monsterIndex: number, monsterName: self.monstersShuffled[number])
                                        
                                    }
                            }
                            
                        }.padding()
                        .opacity(countView == 3 ? 1 : 0)
                        
                        
                    }
                }
                
                NavigationButtonViewModel(nextView: WorkingMemoryFeedback(numberOfPoints: endGame(monstersReversedArray: monstersReversedArray)), text: "DONE")
                    .allowsHitTesting(monstersChosen.count == 7 ? true : false)
                    .opacity(monstersChosen.count == 7 ? 1 : 0)
                    .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    func itemTapped(rectangleIndex: Int, monsterIndex: Int, monsterName: String) {
        
        rectangles[rectangleIndex] = monsterName
        currentRectangleIndex += 1
        
        droppedMonster[rectangleIndex] = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            droppedMonster[rectangleIndex] = false
        }
        
        monstersChosen.append(monsterName)
        monstersShuffled.remove(at: monsterIndex)
        
        print("posição do quadrado:\(rectangleIndex)")
        print("posição do monstro:\(monsterIndex)")
        print("lista atual:\(monstersChosen)")
    }
    
    
    func itemDismissed(monsterIndex: Int, monsterName: String) {
        
        print(currentRectangleIndex)
        
        rectangles[currentRectangleIndex - 1] = "rectangle-yellow"
        monstersShuffled.append(monsterName)
        monstersChosen.removeLast()
        currentRectangleIndex -= 1
        
        print("lista renovada:\(monstersChosen)")
        
        
        
    }
    
    func endGame(monstersReversedArray: [String]) -> Int {
        
        var correctAnswers: Int = 0

        if monstersChosen.count == 7 {
            for index in 0...6 {
                if monstersChosen[index] == monstersReversedArray[index] {
                    correctAnswers += 1
                }
            }
        }
        
        
        return correctAnswers
    }
}

struct WorkingMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        WorkingMemoryGame()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
