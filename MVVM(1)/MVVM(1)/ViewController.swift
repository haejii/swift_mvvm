//
//  ViewController.swift
//  MVVM(1)
//
//  Created by 양혜지 on 2022/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // ViewModel 인스턴스화해서 사용
    private var personViewModel = ViewModel()

    // MARK: - @IBOutlet Properties
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var setProfileButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var ageTextfield: UITextField!
    
    // MARK: - View life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // View Model 이 업데이트 되면 view를 바꿀 수 있도록 data binding 을 한다.
        personViewModel.image.bind { image in
            self.profileImg.image = image
        }
        
        personViewModel.name.bind { name in
            self.nameLabel.text = name
        }
        
        personViewModel.age.bind { age in
            self.ageLabel.text = age
        }
        
    }
    
    // MARK: - @IBAction Properties
    
    // @IBAtion 으로 View Model을 업데이트 한다.
    

    @IBAction func touchSetProfile(_ sender: UIButton) {
        personViewModel.setImage(to: "person.fill")
     }
     
    @IBAction func touchSetNameButton(_ sender: UIButton) {
         if let name = nameTextfield.text {
             personViewModel.setName(to: name)
         }
     }
     
    @IBAction func touchSetAgeButton(_ sender: UIButton) {
         if let age = ageTextfield.text {
             personViewModel.setAge(to: age)
         }
     }


}

