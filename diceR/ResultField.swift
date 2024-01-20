//
//  ResultField.swift
//  diceR
//
//  Created by MY on 2024-01-13.
//
import Foundation
import SwiftUI

struct ResultFieldView: View {
    @Binding var path: NavigationPath
    @StateObject var vm: ViewModel
    @State private var index = 0

    var body: some View {
        NavigationView {
            ZStack (alignment: .leading){
                LinearGradient(colors: [.white, .blue, .white], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    Text("")
                        .navigationBarItems(trailing:
                                                HStack{
                            
                            Button("<") { increaseIndex() }
                            Text("\(index + 1)/\(vm.history.count)")
                            Button(">") { decreaseIndex() }
                        }.font(.title)
                            .foregroundColor(.black)
                        )
                }
                VStack (alignment: .leading) {
                    Spacer()
                    Group{
                        DieRollResult(die: Die.d4, vm: vm, index: $index)
                        DieRollResult(die: Die.d6, vm: vm, index: $index)
                        DieRollResult(die: Die.d8, vm: vm, index: $index)
                        DieRollResult(die: Die.d10, vm: vm, index: $index)
                        DieRollResult(die: Die.d12, vm: vm, index: $index)
                        DieRollResult(die: Die.d20, vm: vm, index: $index)
                    }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
                        .font(.title)
                    
                        
                    Spacer()
                    HStack {
                       MyButton(text: "back") { path.removeLast() }
                    }
                }
            }
        }
    }
    
    private func decreaseIndex() {
        if index > 0 {
            index -= 1
        }
    }
    
    private func increaseIndex() {
        if index < (vm.history.count - 1) {
            index += 1
        }
    }
    
}
struct DieRollResult: View {
    let die: Die
    @StateObject var vm: ViewModel
    @Binding var index: Int

    var body: some View {
        HStack {
            Image(die.name).resizable().frame(width: 75, height: 75)
            Text(vm.printDieRolls(historyIndex: index, die: die))
        }
    }
}
