//
//  PokemonListTableViewCell.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation
import UIKit

class PokemonListTableViewCell: UITableViewCell {

    var name: String? {
        didSet {
            pokemonName.text = name
        }
    }
    
    private lazy var placeholderImage: UIImageView = {
        let aImage = UIImageView()
        
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .lightGray
        aImage.image = UIImage(named: "pokeball")
        
        contentView.addSubview(aImage)
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray
        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setupConstraints()
    }
    
    private func setupConstraints(){

        NSLayoutConstraint.activate([
            placeholderImage.heightAnchor.constraint(equalToConstant: 60),
            placeholderImage.widthAnchor.constraint(equalToConstant: 60),
            
            
            placeholderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placeholderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            placeholderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            pokemonName.leadingAnchor.constraint(equalTo: placeholderImage.trailingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pokemonName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            pokemonName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    
        ])
        
    }
    
    
}
