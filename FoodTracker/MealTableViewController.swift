//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by RaguByun on 2016. 12. 1..
//  Copyright © 2016년 RaguByun. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleMeals()
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1.jpg")!
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2.jpg")!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3.jpg")!
        let meal3 = Meal(name: "Pasta widh Meatballs", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell

        let meal = meals[indexPath.row]
        
        cell.mealNameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            let newIndexPath = NSIndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
        }
    }

}
