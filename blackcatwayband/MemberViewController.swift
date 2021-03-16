//
//  MemberViewController.swift
//  blackcatwayband
//
//  Created by 張俊傑 on 2021/2/1.
//

import UIKit
import AVFoundation

class MemberViewController: UIViewController {

    let player = AVPlayer()
    var isPlaying = true
    var playItem: AVPlayerItem!
    
    @IBAction func memberHandler(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            imageView.image = UIImage(named: "狗狗2.jpg")
            titleView.text = "吉他手 / 狗狗"
            textView.text = "動漫系女孩\n美編設計一把罩\n吉他合聲樣樣行"
            playView.setImage(UIImage(named: "bigPlay"),for: .normal)
            player.pause()
           
        case 2:
            imageView.image = UIImage(named: "嘉彥2.jpg")
            titleView.text = "吉他手 / 嘉彥"
            textView.text = "冷面笑將\n邁向專業音樂人\n黑貓道御用混音師"
            playView.setImage(UIImage(named: "bigPlay"),for: .normal)
            player.pause()
          
        case 3:
            imageView.image = UIImage(named: "傑克2.jpg")
            titleView.text = "主唱 / Jack"
            textView.text = "暖男系主唱\nSwift新手村修煉中\n唱歌寫歌兼打雜"
            playView.setImage(UIImage(named: "bigPlay"),for: .normal)
            player.pause()
          
        case 4:
            imageView.image = UIImage(named: "阿楷2.jpg")
            titleView.text = "貝斯手 / 阿楷"
            textView.text = "黑貓道表情包\n器材王就是我\n吉他貝斯樣樣行"
            playView.setImage(UIImage(named: "bigPlay"),for: .normal)
            player.pause()
           
        case 5:
            imageView.image = UIImage(named: "昭瑋2.jpg")
            titleView.text = "鼓手 / 昭瑋"
            textView.text = "21世紀新好男人\n超高EQ公務員\n穩固tempo就靠他"
            playView.setImage(UIImage(named: "bigPlay"),for: .normal)
            player.pause()
           
        default:
            print("Error")
        }
        
    }
    @IBOutlet weak var memberView: UIButton!
 
    @IBAction func playHandler(_ sender: UIButton) {
        let fileUrl = Bundle.main.url(forResource: "Jack音檔", withExtension: "mp3")!
        playItem = AVPlayerItem(url: fileUrl)
        if isPlaying == true{
            playView.setImage(UIImage(named: "blank"), for: .normal)
            isPlaying = false
            player.replaceCurrentItem(with: playItem)
            player.play()
        }else{
            playView.setImage(UIImage(named: "bigPlay"),for: .normal)
            isPlaying = true
            player.replaceCurrentItem(with: playItem)
            player.pause()

        }
    }
  
    @IBOutlet weak var playView: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var textView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        playView.setImage(UIImage(named: "bigPlay"), for: .normal)
        //TO DO團員大頭照做類似IG限動的外框
//        參考：https://ithelp.ithome.com.tw/articles/10224205
//        makeCircle(object: imageView)
       
        //TO DO換頁時音樂要停止
        
        imageView.image = UIImage(named: "狗狗2.jpg")
        titleView.text = "吉他手 / 狗狗"
        textView.text = "動漫系女孩\n美編設計一把罩\n吉他合聲樣樣行"
       
        
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
