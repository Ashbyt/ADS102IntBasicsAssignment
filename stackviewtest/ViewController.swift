//
//  ViewController.swift
//  stackviewtest
//
//  Created by Ashley Bythell on 1/9/19.
//  Copyright © 2019 Ashley Bythell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnE: UIButton!
    @IBOutlet weak var btnF: UIButton!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var lblPlay: UIButton!
    @IBOutlet weak var labelIntro: UILabel!
    
    var imagearray = [String]() //holds randomised images of fruit
    var wordarray = [String]() //holds randomised word list of fruit
    var selectedWordsArray = [String]() //holds selected words (array index).
    var myword : String = "" //selected word from list
    var wordcounter:Int = 0
    var counter:Int = 0 //counter of successful word selections/matches
    var counterString: String = "" //conversion of counter to string.
    let scoretxt: String = "Score " //constant showing score text
    let gameOvertxt: String = "Game Over!!!" //constant showing game over
    var selectedWord:String = ""
    let myarray : [String] = ["apple", "banana", "pineapple", "grapes", "watermelon", "strawberry"] //initialised array
    var dictionary = [String: Int]()
    var nextWord: String = ""
             var myindex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }
    
    
   
    func handlebutton(title: String, sender: UIButton, buttonNo: Int){
                        nextWord = ""
        print("myword1", myword)
        
        //this bit is a mess?
        for (index1, currentword) in dictionary.enumerated(){
            if ( currentword.value == 0 && currentword.key == myword ){
                print("myword2", myword)
                myindex = index1
                
                print("currentword", currentword)
                    if myword == imagearray[buttonNo]{
                        print("Match", myword)
                        print("match2", imagearray[buttonNo] )
                        counter+=1
                        counterString = scoretxt + String(counter)
                        Score.text = counterString
                        if let oldValue = dictionary.updateValue(1, forKey: myword) {
                            print(oldValue)
                            print("updated dick", dictionary)
                        }
                        if  let buttonImage = UIImage(named: "x2" ){
                            sender.setImage(buttonImage, for: .normal)
                            sender.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)
                            
                        }
                        
                        if counter <= 5 {
                            lblPlay.isHidden = true
                        }                    else{
                            word.text = gameOvertxt
                            lblPlay.isHidden = false
                        }
                    }
                    
                    
                    print("nextword logic")
                    
                    for (index, theword) in dictionary.enumerated() {
                        if theword.value == 0 && index > myindex {
                            nextWord = theword.key
                               print("NextWord11", nextWord)
                            break
                        }
                    }
                    
                    if nextWord == "" {
                        for (index, theword) in dictionary.enumerated() {
                            if theword.value == 0 && index < myindex {
                                nextWord = theword.key
                                print("NextWord2", nextWord)
                                break
                            }
                        }
                    }
                    word.text = nextWord
                    myword = nextWord
            
            
            
        } //if statement
        } //For loop
     
    }
        
        

    


    
    
    @IBAction func btnClickSV(_ sender: UIButton) {
        
        if let title = sender.currentTitle {
            
            switch title {
            case "btnA":
                handlebutton(title: title, sender: sender, buttonNo: 0)
                
            case "btnB":
                handlebutton(title: title, sender: sender, buttonNo: 1
                )
            case "btnC":
                handlebutton(title: title, sender: sender, buttonNo: 2
                )
            case "btnD":
                handlebutton(title: title, sender: sender, buttonNo: 3
                )
            case "btnE":
                handlebutton(title: title, sender: sender, buttonNo: 4
                )
            case "btnF":
                handlebutton(title: title, sender: sender, buttonNo: 5
                )
            case "Play Again?":
                updateUI()
            default:
                print("")
            }
        }
    
    
    }
    

   
    

func updateUI(){
    
    btnA.isHidden = false
    btnA.isHidden = false
    btnB.isHidden = false
    btnC.isHidden = false
    btnD.isHidden = false
    btnE.isHidden = false
    btnF.isHidden = false
    lblPlay.isHidden = true
    counter = 0
    counterString = scoretxt + String(counter)
    Score.text = counterString

    imagearray = shuffle(stringArray: myarray)
    wordarray = shuffle(stringArray: myarray)
    
   
    for wordz in wordarray {
        dictionary[wordz] = 0
    }
    
    print("dictionary", dictionary)
    
    if  let imageA = UIImage(named: imagearray[0]){
        btnA.setImage(imageA, for: .normal)
        self.btnA.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)

    }
    
    if  let imageB = UIImage(named: imagearray[1]){
        btnB.setImage(imageB, for: .normal)
        self.btnB.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)

    }
    
    if  let imageC = UIImage(named: imagearray[2]){
        btnC.setImage(imageC, for: .normal)
        self.btnC.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)
    
    }
    
    if  let imageD = UIImage(named: imagearray[3]){
        btnD.setImage(imageD, for: .normal)
        self.btnD.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)

    }
    
    if  let imageE = UIImage(named: imagearray[4]){
        btnE.setImage(imageE, for: .normal)
        self.btnE.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)
     
    }
    
    if  let imageF = UIImage(named: imagearray[5]){
        btnF.setImage(imageF, for: .normal)
        self.btnF.imageEdgeInsets = UIEdgeInsets.init(top:10, left:10, bottom:10, right:10)

    }
    
    word.text = wordarray[counter]  //use word in array to display on screen
    myword = wordarray[counter] //use word in array to use to compare
    
    
    
}



func shuffle(stringArray:[String]) -> [String] {
    //create a copy of the input array
    var items = stringArray
    
    //our new shuffled array
    var shuffled = [String]();
    
    //iterate through the item array
    for _ in items.enumerated()
    {
        //choose a random number
        let rand = Int(arc4random_uniform(UInt32(items.count)))
        //using that random number, select a random item
        let randomItem = items[rand]
        //append that random item to our new shuffled array
        shuffled.append(randomItem)
        //make sure to remove that item, so we don't pick it again
        items.remove(at: rand)
    }
    return shuffled
}
}


