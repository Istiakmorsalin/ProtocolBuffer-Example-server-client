
import Foundation

class SpeakersViewModel {
  var speakers: Speakers!
  var selectedSpeaker: Contact?
  
  init(speakers: Speakers) {
    self.speakers = speakers
  }
  
  func numberOfRows() -> Int {
    return speakers.contacts.count
  }
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func getSpeaker(for indexPath: IndexPath) -> Contact {
    return speakers.contacts[indexPath.item]
  }
  
  func selectSpeaker(for indexPath: IndexPath) {
    selectedSpeaker = getSpeaker(for: indexPath)
  }
}
