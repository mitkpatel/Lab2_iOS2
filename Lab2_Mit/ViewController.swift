//
//  ViewController.swift
//  Lab2_Mit
//
//  Created by user214044 on 1/29/22.
//

import UIKit

class UserModel {
    var userImage: UIImage?
    var name: String?
    var age: String?
    
    init(user: UIImage, name: String, age: String) {
        self.userImage = user
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }

    @objc func didTapButton() {
        // Create and present tab bar comtroller
        let tabBarVC = UITabBarController()
        let HomeVC = UINavigationController(rootViewController: HomeVC())
        let FavoriteVC =  UINavigationController(rootViewController: FavoriteVC())
        let AboutVC = UINavigationController(rootViewController: AboutVC())
        
        HomeVC.title = "Home"
        AboutVC.title = "About"
        FavoriteVC.title = "List"
        
        UITabBar.appearance().barTintColor = UIColor.gray
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.tintColor = .blue
        tabBarVC.setViewControllers([ HomeVC , FavoriteVC , AboutVC ], animated: false)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["house", "star", "gear"]
        
        for x in 0..<items.count {
            items[x].badgeValue = "1"
            items[x].image = UIImage(systemName: images[x])
        }
    
    }
}


class HomeVC: UIViewController {
    
    var tableView = UITableView()
    
    var userModel = [UserModel]()
    
    var userArr = [UserModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"

        userArr.append(UserModel(user: UIImage.init(named: "Charlize Theron")!, name: "Mit", age: "24"))
        userArr.append(UserModel(user: UIImage.init(named: "Emma Stone")!, name: "Emma Stone", age: "30"))
        userArr.append(UserModel(user: UIImage.init(named: "Amber Heard")!, name: "Angelina Jolie", age: "43"))
        userArr.append(UserModel(user: UIImage.init(named: "Jennifer Lawrence")!, name: "Scarlett Johansson", age: "34"))
        userArr.append(UserModel(user: UIImage.init(named: "Angelina Jolie")!, name: "Jennifer Lawrence", age: "28"))
        userArr.append(UserModel(user: UIImage.init(named: "Scarlett Johansson")!, name: "Charlize Theron", age: "43"))
        userArr.append(UserModel(user: UIImage.init(named: "Emma Stone")!, name: "Emma Stone", age: "30"))
        userArr.append(UserModel(user: UIImage.init(named: "Amber Heard")!, name: "Angelina Jolie", age: "43"))
        userArr.append(UserModel(user: UIImage.init(named: "Jennifer Lawrence")!, name: "Scarlett Johansson", age: "34"))
        userArr.append(UserModel(user: UIImage.init(named: "Angelina Jolie")!, name: "Jennifer Lawrence", age: "28"))
        userArr.append(UserModel(user: UIImage.init(named: "Scarlett Johansson")!, name: "Charlize Theron", age: "43"))

        
        setTableView()
    }
    
    
    func setTableView() {
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.red
        self.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row)"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as?
            CustomTableViewCell else { fatalError("Unable to create cell")}
        cell.userImage.image = userArr[indexPath.row].userImage
        cell.namelbl.text = userArr[indexPath.row].name
        cell.agelbl.text = userArr[indexPath.row].age
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
}

class FavoriteVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Favorite"
    }
}

class AboutVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "About"
    }
}


