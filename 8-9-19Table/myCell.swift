//
//  myCell.swift
//  8-9-19Table
//
//  Created by Nathaniel Mcdowell on 8/9/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

  
    var data:DataNode?{
        didSet{
            if let local = data {
            nameLabel.text = local.name
            ageLabel.text = "\(local.age) yrs old"
            titleLabel.text = local.title
            }else{return}
        }
    }
    
    var nameLabel:UILabel = {
       let lbl = UILabel()
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 5
        lbl.font = UIFont(name: "GillSans", size: 30)
        lbl.textColor = .black
        return lbl
    }()
    
    var ageLabel:UILabel = {
        let lbl = UILabel()
        lbl.layer.borderColor = UIColor.black.cgColor
          lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 5
        lbl.font = UIFont(name: "GillSans", size: 20)
        lbl.textColor = .red
        return lbl
    }()
    
    var titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.layer.borderColor = UIColor.black.cgColor
          lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 5
        lbl.font = UIFont(name: "GillSans", size: 20)
        lbl.textColor = .blue
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(titleLabel)
        
        nameLabel.DoConstraints(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, topPad: 5, leadingPad: 5, bottomPad: 5, trailingPad: 5, width: 100, height: 60)
        
        titleLabel.DoConstraints(top: contentView.topAnchor, leading: nameLabel.trailingAnchor, bottom: nil, trailing: nil, topPad: 5, leadingPad: 5, bottomPad: 5, trailingPad: 5, width: 100, height: 30)
        
        ageLabel.DoConstraints(top: titleLabel.bottomAnchor, leading: nameLabel.trailingAnchor, bottom: nil, trailing: nil, topPad: 5, leadingPad: 5, bottomPad: 5, trailingPad: 5, width: 100, height: 30)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
