
import UIKit

class SpeakerCell: UITableViewCell {
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var profileImageView: UIImageView!
	
	func applyBusinessCardVisual() {
		// Apply rounded corners
		containerView.layer.cornerRadius = 5
		containerView.layer.masksToBounds = true
		
		// Circular Profile Pic
		profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2.0
		profileImageView.clipsToBounds = true
		profileImageView.layer.borderWidth = 2.0
		profileImageView.layer.borderColor = #colorLiteral(red: 0, green: 0.407166779, blue: 0.2167538702, alpha: 1).cgColor
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		applyBusinessCardVisual()
	}
	
  func configure(with contact: Contact) {
    profileImageView.image = UIImage(named: contact.imageName)
    nameLabel.attributedText = NSAttributedString.attributedString(for: contact.firstName, and: contact.lastName)
  }
}
