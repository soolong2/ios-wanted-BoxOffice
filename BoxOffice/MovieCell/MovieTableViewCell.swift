//
//  MovieTableViewCell.swift
//  BoxOffice
//
//  Created by so on 2022/10/17.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var openingDateLabel: UILabel!
    @IBOutlet weak var audienceLabel: UILabel!
    @IBOutlet weak var increaseRanking: UILabel!
    @IBOutlet weak var newRankingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func movieModel(_ model: MovieModel) {
        rankingLabel.text = "영화순위: \(model.순위)"
        openingDateLabel.text = "개봉 날짜: \(model.오픈날짜)"
        newRankingLabel.text = model.신규진입
        if newRankingLabel.text == "OLD"{
            newRankingLabel.textColor = .blue
        }else {
            if newRankingLabel.text == "NEW" {
                newRankingLabel.textColor = .red
            }
        }
        movieNameLabel.text = "영화명: \(model.영화제목)"
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let 관객수 = numberFormatter.string(from: NSNumber(value: Int(model.관객수) ?? 0)) else {return}
        audienceLabel.text = "오늘의 관객수: \(관객수)명"
        if model.순위증감 > "0" {
            increaseRanking.textColor = .red
            increaseRanking.text = "전날 대비 순위: \(model.순위증감)"
            let attributeString = NSMutableAttributedString(string:  increaseRanking.text ?? "")
            attributeString.addAttribute(.foregroundColor, value: UIColor.black, range: ( increaseRanking.text! as NSString).range(of: "전날 대비 순위:"))
            increaseRanking.attributedText = attributeString
        } else if model.순위증감 < "0" {
            increaseRanking.textColor = .blue
            increaseRanking.text = "전날 대비 순위: \(model.순위증감)"
            let attributeString = NSMutableAttributedString(string:  increaseRanking.text ?? "")
            attributeString.addAttribute(.foregroundColor, value: UIColor.black, range: ( increaseRanking.text! as NSString).range(of: "전날 대비 순위:"))
            increaseRanking.attributedText = attributeString
        } else {
            increaseRanking.text = "전날 대비 순위: \(model.순위증감)"
        }
    }
}

