//
//  NoteTableViewCell.swift
//  Remind
//
//  Created by Chakery on 2017/7/12.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class NoteTableViewCell: UITableViewCell {
    private let avatarSize = CGSize(width: 44, height: 44)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public private(set) lazy var avatarImageView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    public private(set) lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.text
        label.textColor = UIColor.hightGray
        return label
    }()
    
    public private(set) lazy var remainingDaysLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public private(set) lazy var nextAgeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mediumGray
        label.font = UIFont.text
        return label
    }()
    
    public private(set) lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mediumGray
        label.font = UIFont.text
        return label
    }()
    
    private func setupView() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(remainingDaysLabel)
        addSubview(nextAgeLabel)
        addSubview(birthdayLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(avatarSize)
            make.centerY.equalToSuperview()
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(4)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        
        remainingDaysLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(usernameLabel)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        
        birthdayLabel.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImageView)
            make.leading.equalTo(usernameLabel)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        
        nextAgeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(birthdayLabel)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
    }
}

extension NoteTableViewCell {
    
    public func dataBind() {
        avatarImageView.backgroundColor = UIColor.red
        usernameLabel.text = "Chakery"
        remainingDaysLabel.text = "100天"
        birthdayLabel.text = "07月12日"
        nextAgeLabel.text = "12039天"
    }
    
}
