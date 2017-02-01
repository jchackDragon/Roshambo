//
//  mactch.swift
//  Roshambo
//
//  Created by Juan Carlos Lopez on 11/2/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//


import Foundation

struct Match{
    var p1: RoshambonOptions
    var p2: RoshambonOptions
    var message:Message
    
    var description: String
    
    init(p1:RoshambonOptions, p2:RoshambonOptions){
        self.p1 = p1
        self.p2 = p2
        
        switch (self.p1, self.p2) {
        case ( .rock, .scissors ):// where computerChoose == RoshambonOptions.SCISSORS:
            self.description = "Rock crushes Scissor. You Win!"
            self.message = .rock_WIN(description)
        break;
        case ( .paper, .rock ):// where computerChoose == RoshambonOptions.ROCK:
            self.description = "Paper cover Rock. You Win!"
            self.message = .paper_WIN(description)
        break;
        case ( .scissors, .paper ):// where computerChoose == RoshambonOptions.PAPER:
            self.description = "Scissors cut Paper. You Win!"
            self.message = .scissors_WIN(description)
        break;
        case ( .rock, .rock), ( .paper, .paper), (.scissors, .scissors):
            self.description = "Is a Tid!"
            self.message = .tid(self.description)
        break;
        default:
            self.description = "\(self.p1) beat \(self.p2) You Lost"
            self.message = .lost(description)
        }
    }
    
}
