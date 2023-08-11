//
//  HomeViewController.swift
//  AsyncAwaitApicall
//
//  Created by Narayanasamy on 10/08/23.
//

import UIKit

class HomeViewController: UIViewController {

        // MARK: - Property
    
        @IBOutlet weak var dataTableView: UITableView!
        
        private let   viewModel = UserViewModel()
    
        // MARK: - LifeCycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
            initModel()
            // Do any additional setup after loading the view.
        }
    
    // MARK: - initModel
    
        func initModel() {
            viewModel.userDelegate = self
            viewModel.fetchUsers()
        }
        
    }

// MARK: - UITableViewDataSource

    extension  HomeViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel.users.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            else{ return UITableViewCell()}
            let user = viewModel.users[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = "\(user.postId) (\(user.id)) (\(user.name)) (\(user.email) -\(user.body)"

            cell.contentConfiguration = content
            return cell
        }
    }

// MARK: -UITableViewDelegate

//extension HomeViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//

     // MARK: - Userserrvices
    
extension HomeViewController: Userservices {
    
    func reloadata() {
        //   DispatchQueue.main.async {
        self.dataTableView.reloadData()
    }
            
}



