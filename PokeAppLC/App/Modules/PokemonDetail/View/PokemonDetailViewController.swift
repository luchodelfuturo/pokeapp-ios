//
//  PokemonDetailViewController.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import UIKit

protocol PokemonDetailDelegate {
    func pokemonData(data: PokemonDetailDTO)
    func showError(error: String)
}

class PokemonDetailViewController: UIViewController {

    var pokemonUrl: String = ""
    private var service = PokemonDetailService()
    private var viewModel: PokemonDetailViewModel?
    
    private lazy var pokemonBackground: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 70
        aView.backgroundColor = .white.withAlphaComponent(0.1)
        view.addSubview(aView)
        return aView
    }()
    
    private lazy var backgroudImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "pokedex")
        aImage.contentMode = .scaleAspectFill
        view.addSubview(aImage)
        return aImage
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(aImage, aboveSubview: backgroudImage)
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 28)
        aLabel.textAlignment = .center
        view.addSubview(aLabel)
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PokemonDetailViewModel(pokemonUrl: self.pokemonUrl, service: service, delegate: self)
        
        self.viewModel?.getPokemon()

        // Implementación con closure
        /*
        self.viewModel?.getPokemon(onGetPokemon: { data in
            if let sprite = data.sprites.other?.home?.frontDefault, let url = URL(string: sprite) {
                self.pokemonImage.load(url: url)
            }
            
            self.pokemonName.text = data.name.uppercased()
        })
         */
        
        setupView()
    }
    
    private func setupView() {
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backgroudImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroudImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroudImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroudImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 140),
            pokemonImage.widthAnchor.constraint(equalToConstant: 140),
            
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 22),
            
            pokemonBackground.heightAnchor.constraint(equalToConstant: 140),
            pokemonBackground.widthAnchor.constraint(equalToConstant: 140),
            pokemonBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
        ])
    }
}

extension PokemonDetailViewController: PokemonDetailDelegate {
    
    func pokemonData(data: PokemonDetailDTO) {
        
        if let sprite = data.sprites.other?.home?.frontDefault, let url = URL(string: sprite) {
            pokemonImage.load(url: url)
        }
        
        pokemonName.text = data.name.uppercased()
    }
    
    func showError(error: String) {
        print(error)
    }
    
}
