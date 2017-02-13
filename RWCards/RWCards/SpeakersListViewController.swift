
import UIKit

class SpeakersListViewController: UITableViewController {
	
	var speakersModel: SpeakersViewModel?
	
	// MARK: Appearance
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
    
    RWService.shared.getSpeakers { [unowned self] speakers in
      if let speakers = speakers {
        self.speakersModel = SpeakersViewModel(speakers: speakers)
        self.tableView.reloadData()
      }
    }
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showCard" {
			if let vc = segue.destination as? CardViewController {
				vc.isCurrentUser = false
				vc.speaker = speakersModel?.selectedSpeaker
			}
		}
	}
}

// MARK: - UITableView DataSource
extension SpeakersListViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return speakersModel?.numberOfSections() ?? 0
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return speakersModel?.numberOfRows() ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell", for: indexPath) as! SpeakerCell
    if let speaker = speakersModel?.getSpeaker(for: indexPath) {
      cell.configure(with: speaker)
    }
    return cell
	}
}

// MARK: - UITableView Delegate
extension SpeakersListViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    speakersModel?.selectSpeaker(for: indexPath)
		performSegue(withIdentifier: "showCard", sender: self)
	}
}
