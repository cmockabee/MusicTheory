//
//  IntervalViewController.swift
//  MusicTheory
//
//  Created by Cameron Mockabee on 9/6/20.
//  Copyright © 2020 Cameron Mockabee. All rights reserved.
//

import UIKit

class IntervalViewController: UIViewController {

    @IBOutlet weak var KeyLabel: UILabel!
    
    @IBOutlet weak var C: UIImageView!
    @IBOutlet weak var C_sharp: UIImageView!
    @IBOutlet weak var D: UIImageView!
    @IBOutlet weak var D_sharp: UIImageView!
    @IBOutlet weak var E: UIImageView!
    @IBOutlet weak var F: UIImageView!
    @IBOutlet weak var F_sharp: UIImageView!
    @IBOutlet weak var G: UIImageView!
    @IBOutlet weak var G_sharp: UIImageView!
    @IBOutlet weak var A: UIImageView!
    @IBOutlet weak var A_sharp: UIImageView!
    @IBOutlet weak var B: UIImageView!
    
    @IBOutlet weak var One: UILabel!
    @IBOutlet weak var Two: UILabel!
    @IBOutlet weak var Three: UILabel!
    @IBOutlet weak var Four: UILabel!
    @IBOutlet weak var Five: UILabel!
    @IBOutlet weak var Six: UILabel!
    @IBOutlet weak var Seven: UILabel!
    
    @IBOutlet weak var nextKey: UIButton!
    
    // Button to proceed game
    @IBAction func nexKey(_ sender: Any) {
        let noteArray = [(C, "C"), (C_sharp, "C#"), (D, "D"), (D_sharp, "D#"), (E, "E"), (F, "F"), (F_sharp, "F#"), (G, "G"), (G_sharp, "G#"), (A, "A"), (A_sharp, "A#"), (B, "B")]
        let labelArray = [One, Two, Three, Four, Five, Six, Seven]
        
        setKeyLabel(array: noteArray)
        hideLabels(array: labelArray)
        setLabels(labelArray: labelArray, imageArray: noteArray)
        imageSetup(array: noteArray)
        correct = 0
        nextKey.isHidden = true
    }
    
    
    // Number of correct answers (7 needed)
    var correct = 0
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noteArray = [(C, "C"), (C_sharp, "C#"), (D, "D"), (D_sharp, "D#"), (E, "E"), (F, "F"), (F_sharp, "F#"), (G, "G"), (G_sharp, "G#"), (A, "A"), (A_sharp, "A#"), (B, "B")]
        
        let labelArray = [One, Two, Three, Four, Five, Six, Seven]
        
        KeyLabel.text = "Hello"
        
        nextKey.isHidden = true
        setKeyLabel(array: noteArray)
        hideLabels(array: labelArray)
        setLabels(labelArray: labelArray, imageArray: noteArray)
        
        imageSetup(array: noteArray)
        addGestures(array: noteArray)
    }

        
    // Gestures for button recognition
    @objc func C_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "C", image: C)
        checkComplete()
    }
    @objc func Cs_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "C#", image: C_sharp)
        checkComplete()
    }
    @objc func D_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "D", image: D)
        checkComplete()
    }
    @objc func Ds_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "D#", image: D_sharp)
        checkComplete()
    }
    @objc func E_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "E", image: E)
        checkComplete()
    }
    @objc func F_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "F", image: F)
        checkComplete()
    }
    @objc func Fs_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "F#", image: F_sharp)
        checkComplete()
    }
    @objc func G_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "G", image: G)
        checkComplete()
    }
    @objc func Gs_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "G#", image: G_sharp)
        checkComplete()
    }
    @objc func A_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "A", image: A)
        checkComplete()
    }
    @objc func As_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "A#", image: A_sharp)
        checkComplete()
    }
    @objc func B_gesture(gesture : UITapGestureRecognizer){
        testShowLabel(note: "B", image: B)
        checkComplete()
    }
    
    
    // Reset buttons to original blue circles
    func imageSetup(array: [(UIImageView?, String)]) {
        var x = 0
        
        for (image, name) in array {
            image?.image = UIImage(named: name)
            image?.isUserInteractionEnabled = true
            image?.tag = x
            x+=1
        }
    }
    
    // Add gestures to each button
    func addGestures(array: [(UIImageView?, String)]) {
        C.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(C_gesture)))
        C_sharp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Cs_gesture)))
        D.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(D_gesture)))
        D_sharp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Ds_gesture)))
        E.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(E_gesture)))
        F.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(F_gesture)))
        F_sharp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Fs_gesture)))
        G.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(G_gesture)))
        G_sharp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Gs_gesture)))
        A.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(A_gesture)))
        A_sharp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(As_gesture)))
        B.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(B_gesture)))
    }

    // Randomly pick key to test
    func setKeyLabel(array: [(UIImageView?, String)]) {
        let num = Int.random(in: 0...11)
        KeyLabel.text = array[num].1
    }
    
    // Check if all 7 answers found
    func checkComplete() {
        if correct >= 7 {
            nextKey.isHidden = false
        }
    }
    
    // Hides all answers
    func hideLabels(array: [UILabel?]) {
        for x in array {
            x?.isHidden = true
        }
    }
    
    // Sets labels to correct answers
    func setLabels(labelArray: [UILabel?], imageArray: [(UIImageView?, String)]) {
        let i = imageArray.firstIndex(where: {$1 == KeyLabel.text})
        
        One.text = imageArray[i!].1
        Two.text = (i!+2)<11 ? imageArray[i! + 2].1 : imageArray[(i! + 2)%12].1
        Three.text = (i!+4)<11 ? imageArray[i! + 4].1 : imageArray[(i! + 4)%12].1
        Four.text = (i!+5)<11 ? imageArray[i! + 5].1 : imageArray[(i! + 5)%12].1
        Five.text = (i!+7)<11 ? imageArray[i! + 7].1 : imageArray[(i! + 7)%12].1
        Six.text = (i!+9)<11 ? imageArray[i! + 9].1 : imageArray[(i! + 9)%12].1
        Seven.text = (i!+11)<11 ? imageArray[i! + 7].1 : imageArray[(i! + 11)%12].1
        
        for i in labelArray {
            print(i!.text)
        }
    }
    
    // Tests if selected note is correct and changes color accordingly
    func testShowLabel(note: String, image: UIImageView) {
        if(showLabel(note: note)) {
            let image2 = image.image
            let tintableImage = image2!.withRenderingMode(.alwaysTemplate)
            image.image = tintableImage
            image.tintColor = UIColor.green
        } else {
            let image2 = image.image
            let tintableImage = image2!.withRenderingMode(.alwaysTemplate)
            image.image = tintableImage
            image.tintColor = UIColor.red
        }
    }
    
    // Tests if selected note is in labels
    func showLabel(note: String) -> Bool {
        let labelArray = [One, Two, Three, Four, Five, Six, Seven]
        
        for label in labelArray {
            if label?.text == note {
                label?.isHidden = false
                correct += 1
                return true
            }
        }
        return false
    }
}

// UIImage extension for changing image color
extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
