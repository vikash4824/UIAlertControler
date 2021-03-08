//
//  ViewController.swift
//  2012_AlertControler
//
//  Created by mamidisetty Vikash on 05/03/21.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    var label1:UILabel!
    var label2:UILabel!
    var nameTF:UITextField!
    var urlTF:UITextField!
    var showBtn:UIButton!
    var addBtn:UIButton!
    var clearBtn:UIButton!
    var leaders = [[Leaders]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        nameTF.delegate = self
        urlTF.delegate = self
        
        hideKeyboardWhenTappedAround()
        addBtn.addTarget(self, action: #selector(addPerson), for: UIControl.Event.touchUpInside)
        clearBtn.addTarget(self, action: #selector(clearFields), for: UIControl.Event.touchUpInside)
        showBtn.addTarget(self, action: #selector(showDetails), for: UIControl.Event.touchUpInside)
    }

    func setUp()
    {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Worlds-Greatest-Scientists-Inventors-Biographies-of-Inspirational-Personalities-For-Kids-Paperback-1.jpg")!)
        
        
        label1 = UILabel()
        label1.frame = CGRect(x: 98, y: 44, width: 200, height: 28)
        label1.text = "SCIENTIST"
        label1.textAlignment = .center
        label1.textColor = UIColor.red
        label1.backgroundColor = UIColor(white: 1, alpha: 0.5)
        label1.font = UIFont.boldSystemFont(ofSize: 30)
        label1.layer.cornerRadius = 10
        view.addSubview(label1)
        
        
        label2 = UILabel()
        label2.frame = CGRect(x: 44, y: 315, width: 80, height: 33)
        
        nameTF = UITextField()
        nameTF.frame = CGRect(x: 44, y: 148, width: 327, height: 100)
        nameTF.backgroundColor = UIColor.white
        nameTF.layer.cornerRadius = 10
        nameTF.layer.shadowOpacity = 1
        nameTF.layer.shadowOffset = .zero
        nameTF.layer.shadowRadius = 10
        nameTF.placeholder = "Enter Name"
        nameTF.textAlignment = .center
        view.addSubview(nameTF)
        
        urlTF = UITextField()
        urlTF.frame = CGRect(x: 44, y: 356, width: 327, height: 171)
        urlTF.backgroundColor = UIColor.white
        urlTF.layer.cornerRadius = 10
        urlTF.layer.shadowOpacity = 1
        urlTF.layer.shadowOffset = .zero
        urlTF.layer.shadowRadius = 10
        urlTF.placeholder = "Enter URL:"
        urlTF.textAlignment = .center
        view.addSubview(urlTF)
        
        showBtn = UIButton()
        showBtn.frame = CGRect(x: 44, y: 543, width: 100, height: 53)
        showBtn.backgroundColor = UIColor.systemTeal
        showBtn.layer.cornerRadius = 15
        showBtn.layer.shadowOpacity = 1
        showBtn.layer.shadowOffset = .zero
        showBtn.layer.shadowRadius = 10
        showBtn.setTitle("Show", for: UIControl.State.normal)
        showBtn.setTitleColor(.black, for: .normal)
        view.addSubview(showBtn)
        
        addBtn = UIButton()
        addBtn.frame = CGRect(x: 157, y: 543, width: 100, height: 53)
        addBtn.backgroundColor = UIColor.systemTeal
        addBtn.layer.cornerRadius = 15
        addBtn.layer.shadowOpacity = 1
        addBtn.layer.shadowOffset = .zero
        addBtn.layer.shadowRadius = 10
        addBtn.setTitle("ADD", for: UIControl.State.normal)
        addBtn.setTitleColor(.black, for: .normal)
        view.addSubview(addBtn)
        
        
        clearBtn = UIButton()
        clearBtn.frame = CGRect(x: 271, y: 543, width: 100, height: 53)
        clearBtn.backgroundColor = UIColor.systemTeal
        clearBtn.layer.cornerRadius = 15
        clearBtn.layer.shadowOpacity = 1
        clearBtn.layer.shadowOffset = .zero
        clearBtn.layer.shadowRadius = 10
        clearBtn.setTitle("Clear", for: UIControl.State.normal)
        clearBtn.setTitleColor(.black, for: .normal)
        view.addSubview(clearBtn)
        
    }
    
   @objc func addPerson()
    {
    if nameTF.text!.count >= 0 && urlTF.text!.count >= 0 && urlTF.text!.isValidUrl(){
        leaders.append([Leaders(name: nameTF.text!, url: urlTF.text!)])
        
        print(leaders)
        
        let alert = UIAlertController(title: "Alert", message: "Submited Sucessifully", preferredStyle: .alert)

                // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style:
        UIAlertAction.Style.default, handler: {_ in
            self.nameTF.text = ""
            self.urlTF.text = ""
                }))

                // show the alert
                self.present(alert, animated: true, completion: nil)
    }
    else
    {
        let alert = UIAlertController(title: "Alert", message: "Please Enter Valid URL", preferredStyle: .alert)

               
        alert.addAction(UIAlertAction(title: "OK", style:
        UIAlertAction.Style.default, handler: {_ in

                }))

                // show the alert
                self.present(alert, animated: true, completion: nil)

    }
    }
        
    @objc func showDetails()
    {

        let alert = UIAlertController(title: "Alert", message: "Submited Sucessifully", preferredStyle: .actionSheet)
       
        
        for leader in leaders where !leader.isEmpty {
            alert.addAction(UIAlertAction(title: leader[0].name, style: .default, handler:{_ in
                let ABC = self.storyboard?.instantiateViewController(identifier: "UrlNavigation") as! UrlNavigation
                
                ABC.modalPresentationStyle = .automatic
                ABC.modalTransitionStyle = .flipHorizontal
                self.present(ABC, animated: true) {[self]in
                    let url = URL(string: "\(leader[0].url)")
                    if url != nil{
                        ABC.myWebView.load(URLRequest(url: url!))
                    }
                    
                }

                }))
            
         
        }
        alert.addAction(UIAlertAction(title: "Cancel", style:
        UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
        
    }
   @objc func clearFields()
    {
    self.nameTF.text = ""
    self.urlTF.text = ""
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var returnValue:Bool = false
              if(textField == nameTF)
              {
               returnValue = true
              }else if(textField == urlTF)
              {
               if (nameTF.text!.count > 2)
               {
                   returnValue = true
               }else
               {
                   returnValue = false
               }
               
              }
              else if(textField == urlTF)
              {
               if (nameTF.text!.count > 2 && urlTF.text!.count > 2)
               {
                   returnValue = true
               }else
               {
                   returnValue = false
               }
              }
                      return returnValue
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        var returnValue = true
                if(textField == nameTF)
                {
                    if(textField.text!.count >= 3)
                    {
                        returnValue = true
                    }else
                    {
                        returnValue = false
                    }
                }
                else if(textField == urlTF)
                {
                    returnValue = true
                }
                return returnValue
            }



////    //Regular expression for URL
//
//    func verifyUrl (urlString: String?) -> Bool {
//       if let urlString = urlString {
//           if let url = NSURL(string: urlString) {
//               return UIApplication.shared.canOpenURL(url as URL)
//           }
//       }
//       return false
////   }

    func textFieldDidBeginEditing(_ textField: UITextField)
       {
           textField.backgroundColor = UIColor.red
       }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if ((nameTF.text?.isEmpty != nil) && (urlTF.text?.isEmpty != nil)){
            self.addBtn.isEnabled = true

           }else{
               self.addBtn.isEnabled = false
               addBtn.backgroundColor = .black
           }
           textField.backgroundColor = UIColor.white
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        if(string == "")
        {
            return true
        }
        
        if(textField == nameTF)
            {
            var allowCharacters = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
                if(string.rangeOfCharacter(from: allowCharacters) != nil)
                        
            {
                return true
            }
                else
            {
                return false
            }
        }
               return true
           }
    
    
    

}

extension String {func isValidUrl() -> Bool {
    let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
    let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
    let result = urlTest.evaluate(with: self)
    return result}}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
