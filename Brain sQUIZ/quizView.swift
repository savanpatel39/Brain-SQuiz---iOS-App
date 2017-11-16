//
//  quizView.swift
//  
//
//  Created by Savan Patel on 2015-10-16.
//
//

import UIKit
import AudioToolbox

class quizView: UIViewController {

    var que : Questions!;
    var score : Int!;
    var index : [Int]!;
    var count : Int!;
    var ans : String!;
    var name : String!;
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet var optionsButtons: [UIButton]!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var clickSoundID: SystemSoundID = 0
    private var winSoundID: SystemSoundID = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        score = 0;
        count = 0;
        que = Questions();
        index = que.randomizeQuestionIndex();
        showQuestions();
        self.scoreLabel.text = "\(score) \\ 5";
    }

    func showQuestions()
    {
        if(count < 5)
        {
            var t = que.getQuestion( index[count] );
            self.questionLabel.text = t.question;
            self.ans = t.answer;
        
            var delay = 0.00;
            for i in 0..<t.options.count
            {
                delay = delay + 0.15;
                self.optionsButtons[i].setTitle(t.options[i], forState: .Normal);
            }
            count = count + 1;
        }
        else
        {
            showResult();
        }
    }
    
    @IBAction func checkAnswer(sender: UIButton)
    {
        self.playClickSound();
        if ( sender.currentTitle == self.ans )
        {
            score = score + 1;
            showQuestions();
            self.scoreLabel.text = "\(score) \\ 5";
        }
        else
        {
            sender.wrongAnswer();
            showQuestions();
        }
    }
    
    func showResult()
    {
        print("Score : \(score)");
        var msg = " ";
        var title1 = " ";
        var title2 = " ";
        var flag_lose = false;
        var flag_win = false;
        
        title1 = "Result";
        if( (score >= 0) && (score <= 2))
        {
            msg = "\(name),your score is \(score)\nPlease try again! ";
            title2 = "Try again";
            flag_lose = true;
        }
        else if ( score == 3 )
        {
            msg = "\(name),your score is \(score)\nGood job! ";
            title2 = "Okay";
            flag_win = true;
        }
        else if ( score == 4 )
        {
            msg = "\(name),your score is \(score)\nExcellent work! ";
            title2 = "Okay";
            flag_win = true;
        }
        else if ( score == 5 )
        {
            msg = "\(name),your score is \(score)\nYou are a genius! ";
            title2 = "Okay";
            flag_win = true;
        }
        
        let alertAction = UIAlertController(title: title1, message: msg, preferredStyle: .Alert);
        
        let okAction = UIAlertAction(title: title2, style: .Default, handler: { action in
            if (flag_lose)
            {
                self.view.userInteractionEnabled = true;
                self.viewDidLoad()
            }
        });
        
        if ( flag_win )
        {
            self.playWinSound();
        }
        
        alertAction.addAction(okAction);
        self.presentViewController(alertAction,animated : true , completion : nil);
        
        
        self.view.userInteractionEnabled = false;
    }
    
    func playClickSound() {
        if clickSoundID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource("click_1_trimmed", withExtension: "wav")! as CFURLRef
            AudioServicesCreateSystemSoundID(soundURL, &clickSoundID)
        }
        AudioServicesPlaySystemSound(clickSoundID)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {

        }
    }

    
    func playWinSound() {
        if winSoundID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource("clap_1_trimmed", withExtension: "wav")! as CFURLRef
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            
        }
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
