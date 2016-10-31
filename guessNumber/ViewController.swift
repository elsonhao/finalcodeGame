import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var bigOrSmall: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var guessTime: UILabel!
    
    
    var generate = 0
    var life = 8
    override func viewDidLoad() {
        super.viewDidLoad()
        generate = Int(arc4random_uniform(100))
    }
    @IBAction func yesOrno(_ sender: UIButton) {
        if life > 0 {
        let i = Int(inputNumber.text!)!
        decide(test: i)
        }else{
            result.text = "不能再猜了"
        }
        
    }
    
    func decide(test:Int){
        
        let secrect = generate
       
        if test > secrect{
            bigOrSmall.text = "在小一點"
            life -= 1
            maxLabel.text = String(test)
            guessTime.text = String(life)
            inputNumber.text = ""
            
        }else if test < secrect {
            bigOrSmall.text = "在大一點"
            life -= 1
            minLabel.text = String(test)
            guessTime.text = String(life)
            inputNumber.text = ""
        }else {
            bigOrSmall.text = ""
            result.text = "恭喜答對了 解答為\(secrect)"
            result.isHidden = false
            inputNumber.text = ""
        }
    }
    @IBAction func Restart(_ sender: UIButton) {
        result.isHidden = true
        inputNumber.text = ""
        life = 8
       generate = Int(arc4random_uniform(100))
        guessTime.text = String(life)
        maxLabel.text = "100"
        minLabel.text = "0"
    }
    


}

