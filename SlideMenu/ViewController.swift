//
//  ViewController.swift
//  SlideMenu
//
//  Created by daicudu on 12/17/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var coverButton: UIButton!
    
    
    var btnMenu: UIButton = UIButton()
    var viewMenu: UIView = UIView()
    var tblViewMenu: UITableView = UITableView()
    var arrMenu: Array<String> = ["Trang chu","Trang 1","Trang 2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupViewMenu()
        setupTblView()
        swipeGetSture()
        self.coverButton.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func swipeGetSture() {
        let right = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.right))
        right.direction = .right
        view.addGestureRecognizer(right)
        let left = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.left))
        left.direction = .left
        view.addGestureRecognizer(left)
    }
    
    @objc func right() {
        if (viewMenu.frame.origin.x < 0) {
            UIView.animate(withDuration: 0.4) {
                self.viewMenu.frame.origin.x += self.view.frame.width / 2
                self.coverButton.isHidden = false
                self.navigationController?.navigationBar.isHidden = true
            }
        }
    }
    
    @objc func left() {
        if (viewMenu.frame.origin.x >= 0) {
            UIView.animate(withDuration: 0.4) {
                self.viewMenu.frame.origin.x -= self.view.frame.width / 2
                self.coverButton.isHidden = true
                self.navigationController?.navigationBar.isHidden = false
            }
        }
    }
    
    func setupButton() {
        btnMenu = UIButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        btnMenu.setBackgroundImage(UIImage(named: "MenuImage"), for: .normal)
        navigationController?.navigationBar.addSubview(btnMenu)
        btnMenu.addTarget(self, action: #selector(ViewController.showMenu), for: .touchUpInside)
    }
    @objc func showMenu() {
        print("Da show")
        if(viewMenu.frame.origin.x < 0) {
            UIView.animate(withDuration: 0.4) {
                self.viewMenu.frame.origin.x += self.view.frame.width / 2
                self.coverButton.isHidden = false
                self.navigationController?.navigationBar.isHidden = true
                }
            }
        else {
            UIView.animate(withDuration: 0.4) {
                self.viewMenu.frame.origin.x -= self.view.frame.width / 2
                self.coverButton.isHidden = true
                self.navigationController?.navigationBar.isHidden = false
            }
        }
    }
    func setupViewMenu() {
        viewMenu = UIView(frame: CGRect(x: -view.frame.width / 2, y: 20 , width: view.frame.width / 2, height: view.frame.height))
        navigationController?.view.addSubview(viewMenu)
        viewMenu.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)    }
    
    func setupTblView() {
        tblViewMenu = UITableView(frame: CGRect(x: 0, y: 0, width: viewMenu.frame.width, height: viewMenu.frame.height))
        viewMenu.addSubview(tblViewMenu)
        tblViewMenu.delegate = self
        tblViewMenu.dataSource = self
        tblViewMenu.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = arrMenu[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

}


