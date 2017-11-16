//
//  Questions.swift
//  Brain sQUIZ
//
//  Created by Savan Patel on 2015-10-16.
//  Copyright (c) 2015 Savan Patel. All rights reserved.
//

import Foundation

public class Questions
{
    public var questions : [String]!;
    public var answers : [String]!;
    public var options : [[String]]!;
    public var index : Int!;
    
    private var q = [
                        "In which decade was Rolls-Royce Limited founded?",
                        "Which car manufacturer acquired Rolls-Royce in 2003?",
                        "Which car has the fastest 0-60 time?",
                        "What type of wood does Rolls-Royce traditionally use for its dashboards?",
                        "In what year did Rolls-Royce sell Bentley to another auto manufacturer?",
                        "How much horsepower does a 2010 Rolls-Royce Ghost Sedan have?",
                        "Where is the 2014 Rolls-Royce Wraith assembled?",
                        "In what year did Rolls-Royce acquire Bentley?",
                        "Which Rolls-Royce model was NOT sold during the 1980's?",
                        "The 1998-2002 Rolls-Royce Silver Seraph is closely related to which vehicle?"
                    ];

    private var a = [
                        "1910's",
                        "BMW",
                        "2011 Rolls-Royce Ghost",
                        "Walnut",
                        "1998",
                        "563",
                        "Goodwood, England",
                        "1931",
                        "Silver Dawn",
                        "Bentley Arnage"
                    ];

    private var o = [
                        ["1890's","1900's","1920's","1910's"],
                        ["Fiat","General Motors","Volkswagen","BMW"],
                        ["2011 Rolls-Royce Ghost","1995 Rolls-Royce Silver Spirit","2009 Rolls-Royce Phantom Coupe","1995 Rolls-Royce Flying Spur"],
                        ["Walnut","Cherry","Poplar","Mahogany"],
                        ["2001","2000","1998","2003"],
                        ["390","618","453","563"],
                        ["Goodwood, England","Crewe, England","Liverpool, England","Derby, England"],
                        ["1920","1945","1931","1984"],
                        ["Silver Shadow","Silver Dawn","Silver Spirit","Corniche II"],
                        ["Bentley Continental GT","Acura RL","Bentley Arnage","Audi A8L"]
                    ];
    
    
    
    public init()
    {
        questions = [];
        answers = [];
        options = [[]];
        for i in 0..<10
        {
            self.questions.insert(q[i], atIndex : i);
            self.answers.insert(a[i], atIndex : i);
            self.options.insert(o[i],  atIndex : i);
        }
        self.index = -1;
        //println(options);
    }
    
    
    
    public func randomizeQuestionIndex() -> [Int]
    {
        var a : [Int] = [];
        
        while( a.count<5 )
        {
            let temp = Int( arc4random_uniform(9) ) + 1;
            
            if( !a.contains(temp) )
            {
                a.append(temp);
            }
        }
        
        return a;
    }
    
    
    
    
    public func getQuestion(index : Int) ->(question : String,answer : String,options : [String])
    {
        return (self.questions[index],self.answers[index],self.options[index]);
    }
}