

import UIKit

class CardViewController: UIViewController {
	
	@IBOutlet var cardView: UIView!
	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var attendeeNameLabel: UILabel!
	@IBOutlet var twitterLabel: UILabel!
	@IBOutlet var emailLabel: UILabel!
	@IBOutlet var githubLabel: UILabel!
	@IBOutlet var jobLabel: UILabel!
	@IBOutlet var attendeeTypeLabel: UILabel!
    @IBOutlet weak var designationLevel: UILabel!
	
	@IBOutlet var backButton: UIButton!
	var isCurrentUser = true
  
  var speaker: Contact?
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		applyBusinessCardAppearance()
    
    if isCurrentUser {
      fetchCurrentUser()
    } else {
      if let speaker = speaker {
        configure(speaker)
      }
    }
    
    backButton.isHidden = isCurrentUser
	}
  
  func fetchCurrentUser() { // 1
    RWService.shared.getCurrentUser { contact in
      if let contact = contact {
        self.configure(contact)
      }
    }
  }
  
  func configure(_ contact: Contact) { // 2
    self.attendeeNameLabel.attributedText = NSAttributedString.attributedString(for: contact.firstName, and: contact.lastName)
    self.twitterLabel.text = contact.twitterName
    if self.twitterLabel.text == "@enigma_meraj"{
        self.designationLevel.text = "CTO"
    } else if self.twitterLabel.text == "@AFahim" || self.twitterLabel.text == "@iAtiq" {
        self.designationLevel.text = "Android Developer"
    }
    
    
    self.emailLabel.text = contact.email
    self.githubLabel.text = contact.githubLink
    self.profileImageView.image = UIImage(named: contact.imageName)
    self.attendeeTypeLabel.text = contact.contactTypeToString()
  }
	
	// MARK: Appearance
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	func applyBusinessCardAppearance() {
		// Apply rounded corners
		cardView.layer.cornerRadius = 5
		cardView.layer.masksToBounds = true
		
		// Circular Profile Pic
		profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2.0
		profileImageView.clipsToBounds = true
		profileImageView.layer.borderWidth = 2.0
		profileImageView.layer.borderColor = #colorLiteral(red: 0, green: 0.407166779, blue: 0.2167538702, alpha: 1).cgColor
	}
	
	@IBAction func tapBack(_ sender: Any) {
		_ = navigationController?.popViewController(animated: true)
	}
}
