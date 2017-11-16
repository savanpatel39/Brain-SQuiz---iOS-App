//
//  startQuizView.swift
//  
//
//  Created by Savan Patel on 2015-10-16.
//
//

import UIKit

class startQuizView: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func checkName(sender: UIButton)
    {
        let nf = self.nameField.text;
        if ( nf!.isEmpty )
        {
            let msg = "Please enter a name...";
            let alertAction = UIAlertController(title: "Uh,oh.. ", message: msg, preferredStyle: .Alert);
            
            let okAction = UIAlertAction(title: "Okay", style: .Default, handler: nil);
            
            alertAction.addAction(okAction);
            self.presentViewController(alertAction,animated : true , completion : nil);
        }
    }
    
    
    @IBAction func backgroundTap(sender: UIControl)
    {
        self.nameField.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        let qv = segue.destinationViewController as! quizView;
        
        qv.name = self.nameField.text;
    }
}
