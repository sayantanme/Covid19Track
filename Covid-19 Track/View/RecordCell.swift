//
//  RecordCell.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 19/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {

    @IBOutlet weak var lblPlaceName: UILabel!
    @IBOutlet weak var lblConfirmedCount: UILabel!
    @IBOutlet weak var lblActiveCount: UILabel!
    @IBOutlet weak var lblRecvdCount: UILabel!
    @IBOutlet weak var lblDcsdCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(st: Statewise?) {
        lblPlaceName.text = st?.state
        lblConfirmedCount.text = st?.confirmed
        lblActiveCount.text = st?.active
        lblRecvdCount.text = st?.recovered
        lblDcsdCount.text = st?.deaths
    }

}
