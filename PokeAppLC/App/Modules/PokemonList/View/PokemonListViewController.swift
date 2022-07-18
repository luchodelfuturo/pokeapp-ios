//
//  PokemonListViewController.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation
import UIKit

protocol PokemonListDelegate {
    func reloadTable()
    func showError(error: String)
}

class PokemonListViewController: UIViewController {

    private var service = PokemonListService()
    private var viewModel: PokemonListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self
        aTable.register(PokemonListTableViewCell.self, forCellReuseIdentifier: String(describing: PokemonListTableViewCell.self))
        view.addSubview(aTable)
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = PokemonListViewModel(service: service, delegate: self)
        self.viewModel?.getPokemons()
    }
    
    private func setupView (){
        title = "Lista de pokemones"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
    }
    
}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = PokemonDetailViewController()
        let pokemon = self.viewModel?.getPokemon(at: indexPath.row)
        detailViewController.pokemonUrl = pokemon?.url ?? ""
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getPokemonsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListTableViewCell.self), for: indexPath) as? PokemonListTableViewCell else {
            return UITableViewCell()
        }
        let pokemon = self.viewModel?.getPokemon(at: indexPath.row)
        cell.name = pokemon?.name.capitalized
        return cell
    }

}

extension PokemonListViewController: PokemonListDelegate {
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        print("Algo fallo,", error)
    }
    
}
