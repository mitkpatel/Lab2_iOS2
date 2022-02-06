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
        setUpConstraints()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private let backgroundImage: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "images")
        return background
    }()
    
    func setUpConstraints(){
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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

class FavoriteVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        view.backgroundColor = .black
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 4, height: (view.frame.size.width/3) - 4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        title = "Favorite"
        
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            
            return cell
        }
    
}

class AboutVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userName = UILabel.init()
                userName.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 100.0)
                userName.text = "Lab2 - Mit Patel"
                userName.font = UIFont(name: "verdana", size: 20.0)
                userName.textAlignment = .left
                userName.textColor = .blue
                userName.numberOfLines = 0
                self.view.addSubview(userName)
        view.backgroundColor = .lightGray
        title = "About"
    }
    
}


