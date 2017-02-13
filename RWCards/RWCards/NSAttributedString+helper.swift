
import UIKit

extension NSAttributedString {
	class func attributedString(for firstName:String, and lastName: String) -> NSMutableAttributedString {
		let firstNameAttribute = NSAttributedString(string: firstName, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)])
		let spaceAttribute = NSAttributedString(string: " ")
		let lastNameAttribute = NSAttributedString(string: lastName, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20 )])
		let mutableAttribute = NSMutableAttributedString()
		mutableAttribute.append(firstNameAttribute)
		mutableAttribute.append(spaceAttribute)
		mutableAttribute.append(lastNameAttribute)
		return mutableAttribute
	}
}
