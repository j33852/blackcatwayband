//
//  MusciViewController.swift
//  blackcatwayband
//
//  Created by 張俊傑 on 2021/2/2.
//

import UIKit
import AVFoundation

class MusciViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var musiclist: [musicList] = [musicList(musicName: "LEAVE", songSerial: "1"),
                                  musicList(musicName: "城市裡的蜉蝣", songSerial: "2"),
                                  musicList(musicName: "光與影", songSerial: "3")]
    var player = AVAudioPlayer()
    var isPlaying = true
    
    @IBAction func songPlayHandler(_ sender: UIButton) {
        if isPlaying == true{
            player.play()
            isPlaying = false
            songPlayView.setImage(UIImage(systemName: "pause.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        }else{
            player.pause()
            isPlaying = true
            songPlayView.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        }
    }
    
    @IBOutlet weak var songPlayView: UIButton!
    @IBOutlet weak var timeEndView: UILabel!
    @IBOutlet weak var timeStartView: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var songNameView: UILabel!
    @IBOutlet weak var tableView: UITableView!
    //調整Slider移動歌曲進度
    @IBAction func mySlider(_ sender: UISlider) {
        player.currentTime = Double(timeSlider.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        do{
            let playerPath = Bundle.main.path(forResource: "LEAVE", ofType: ".mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: playerPath!) as URL)
            songPlayView.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
            songNameView.text = "LEAVE"
        } catch{
            print("Error")
        }
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.playingProgress), userInfo: nil, repeats: true)
        timeSlider.maximumValue = Float(player.duration)
        
    }
    @objc func playingProgress(){
        let time:Int = Int(player.currentTime)
        let endTime:Int = Int(player.duration)
        let timeMins = time / 60
        let timeSecs = time % 60
        var timeMin = ""
            if timeMins < 10{
                timeMin = "0\(timeMins)"
            } else {
                timeMin = "\(timeMins)"
            }
        var timeSec = ""
            if timeSecs < 10{
                timeSec = "0\(timeSecs)"
            }else{
                timeSec = "\(timeSecs)"
            }
        let endMins = endTime / 60
        let endSecs = endTime % 60
        var endMin = ""
            if endMins < 10{
                endMin = "0\(endMins)"
            } else {
                endMin = "\(endMins)"
            }
        var endSec = ""
            if endSecs < 10{
                endSec = "0\(endSecs)"
            }else{
                endSec = "\(endSecs)"
            }
        
        timeStartView.text = "\(timeMin):\(timeSec)"
        timeEndView.text = "\(endMin):\(endSec)"
        timeSlider.value = Float(player.currentTime)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musiclist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicID", for: indexPath) as! MusicTableViewCell
        let music = musiclist[indexPath.row]
        cell.numLabel?.text = music.songSerial
        cell.songName?.text = music.musicName
    
        return cell
    }
    //選取歌名即可改變下方歌曲
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do{
            let name = musiclist[indexPath.row]
            let playerPath = Bundle.main.path(forResource: name.musicName, ofType: ".mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: playerPath!) as URL)
            songPlayView.setImage(UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
            songNameView.text = name.musicName
        } catch{
            print("Error")
        }
    }
    
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
