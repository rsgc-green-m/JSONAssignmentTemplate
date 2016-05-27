//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

class ViewController : UIViewController {
    
    // Views that need to be accessible to all methods
    let boys2to3 = UILabel()
    let boys4to8 = UILabel()
    let boys9to13 = UILabel()
    let girls2to3 = UILabel()
    let girls4to8 = UILabel()
    let girls9to13 = UILabel()
    
    // If data is successfully retrieved from the server, we can parse it here
    func parseMyJSON(theData : NSData) {
        
        // Print the provided data
        print("")
        print("====== the data provided to parseMyJSON is as follows ======")
        print(theData)
        
        // De-serializing JSON can throw errors, so should be inside a do-catch structure
        do {
            
            // Do the initial de-serialization
            // Source JSON is here:
            // http://www.learnswiftonline.com/Samples/subway.json
            //
            let json = try NSJSONSerialization.JSONObjectWithData(theData, options: NSJSONReadingOptions.AllowFragments) as! AnyObject
            
            // Print retrieved JSON
            print("")
            print("====== the retrieved JSON is as follows ======")
            //print(json)
            
            // Now we can parse this...
            print("")
            print("Now, add your parsing code here...")
            
            // Now we will get the top level dictionary
            guard let topLevelDictionary : [ String : AnyObject ] = json as? [ String : AnyObject] else {
                
                print("Could not create top level dictionary")
                return
                
            }
            
            // Now print out the contents of this dictionary
            print("======")
            print("The top level dictionary value for the key 'servings to per to miy'")
            print(topLevelDictionary["servings to per to miy"])
            
            // Now get an array of servings information
            guard let servingsInfo : [AnyObject] = topLevelDictionary["servings to per to miy"] as? [ AnyObject ] else {
                print("Could not create array")
                return
            }
            // Now print out the contents of this dictionary
            print("======")
            print("The first value in the array is")
            print(servingsInfo[0])
            
            //*******
            // Get the servings data for the first element in the array
            guard let girls2to3Data : [ String : String ] = servingsInfo[0] as? [ String : String] else {
                print("Could not get girls 2 to 3 servings dictionary")
                return
            }
            
            // Get the actual servings value
            guard let girls2to3Servings : String = girls2to3Data["servings"]! as String else {
                print("Could not get servings value for girls 2 to 3")
                return
            }

            //*******
            guard let girls4to8Data : [ String : String ] = servingsInfo[2] as? [ String : String] else {
                print("Could not get girls 4 to 8 servings dictionary")
                return
            }

            guard let girls4to8Servings : String = girls4to8Data["servings"]! as String else {
                print("Could not get servings value for girls 4 to 8")
                return
            }
            
            //*******
            guard let girls9to13Data : [ String : String ] = servingsInfo[4] as? [ String : String] else {
                print("Could not get girls 9 to 13 servings dictionary")
                return
            }
            
            guard let girls9to13Servings : String = girls9to13Data["servings"]! as String else {
                print("Could not get servings value for girls 9 to 13")
                return
            }
            
            //*******
            guard let boys2to3Data : [ String : String ] = servingsInfo[1] as? [ String : String] else {
                print("Could not get boys 2 to 3 servings dictionary")
                return
            }
            
            guard let boys2to3Servings : String = boys2to3Data["servings"]! as String else {
                print("Could not get servings value for boys 2 to 3")
                return
            }
            
            //*******
            guard let boys4to8Data : [ String : String ] = servingsInfo[3] as? [ String : String] else {
                print("Could not get boys 4 to 8 servings dictionary")
                return
            }
            
            guard let boys4to8Servings : String = boys4to8Data["servings"]! as String else {
                print("Could not get servings value for boys 4 to 8")
                return
            }
            
            //*******
            guard let boys9to13Data : [ String : String ] = servingsInfo[5] as? [ String : String] else {
                print("Could not get boys 9 to 13 servings dictionary")
                return
            }
            
            guard let boys9to13Servings : String = boys9to13Data["servings"]! as String else {
                print("Could not get servings value for boys 9 to 13")
                return
            }
            
            
            // Now print out the contents of this dictionary
            print("======")
            print("The second value in the array is")
            print(servingsInfo[1])
            
            
            // Now we can update the UI
            // (must be done asynchronously)
            dispatch_async(dispatch_get_main_queue()) {
                self.girls2to3.text = "2 to 3: \(girls2to3Servings)"
                self.girls4to8.text = "4 to 8: \(girls4to8Servings)"
                self.girls9to13.text = "9 to 13: \(girls9to13Servings)"
                self.boys2to3.text = "2 to 3: \(boys2to3Servings)"
                self.boys4to8.text = "4 to 8: \(boys4to8Servings)"
                self.boys9to13.text = "9 to 13: \(boys9to13Servings)"
            }
            
        } catch let error as NSError {
            print ("Failed to load: \(error.localizedDescription)")
        }
        
        
    }
    
    // Set up and begin an asynchronous request for JSON data
    func getMyJSON() {
        
        let filePath = NSBundle.mainBundle().pathForResource("servings_per_day-en", ofType: "json")
        let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
        
        parseMyJSON(contentData!)


        
    }
    
    // This is the method that will run as soon as the view controller is created
    override func viewDidLoad() {
        
        // Sub-classes of UIViewController must invoke the superclass method viewDidLoad in their
        // own version of viewDidLoad()
        super.viewDidLoad()

        // Make the view's background be gray
        view.backgroundColor = UIColor.lightGrayColor()

        /*
         * Further define label that will show JSON data
         */
        
        let programTitle = UILabel()
        
        // Set the label text and appearance
        programTitle.text = "Fruits & Veggies"
        programTitle.font = UIFont.systemFontOfSize(24)
        programTitle.textColor = UIColor.whiteColor()
        programTitle.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        programTitle.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        programTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(programTitle)
        
        let boysTitle = UILabel()
        
        // Set the label text and appearance
        boysTitle.text = "Boys"
        boysTitle.font = UIFont.systemFontOfSize(18)
        boysTitle.textColor = UIColor.whiteColor()
        boysTitle.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        boysTitle.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        boysTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(boysTitle)
        
        let girlsTitle = UILabel()
        
        // Set the label text and appearance
        girlsTitle.text = "Girls"
        girlsTitle.font = UIFont.systemFontOfSize(18)
        girlsTitle.textColor = UIColor.whiteColor()
        girlsTitle.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        girlsTitle.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        girlsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(girlsTitle)
        
        
        // Set the label text and appearance
        boys2to3.text = "2 to 3:"
        boys2to3.font = UIFont.systemFontOfSize(12)
        boys2to3.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        boys2to3.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        boys2to3.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(boys2to3)
        
        // Set the label text and appearance
        boys4to8.text = "4 to 8:"
        boys4to8.font = UIFont.systemFontOfSize(12)
        boys4to8.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        boys4to8.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        boys4to8.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(boys4to8)
        
        // Set the label text and appearance
        boys9to13.text = "9 to 13:"
        boys9to13.font = UIFont.systemFontOfSize(12)
        boys9to13.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        boys9to13.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        boys9to13.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(boys9to13)

        // Set the label text and appearance
        girls2to3.text = "2 to 3:"
        girls2to3.font = UIFont.systemFontOfSize(12)
        girls2to3.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        girls2to3.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        girls2to3.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(girls2to3)
        
        // Set the label text and appearance
        girls4to8.text = "4 to 8:"
        girls4to8.font = UIFont.systemFontOfSize(12)
        girls4to8.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        girls4to8.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        girls4to8.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(girls4to8)
        
        // Set the label text and appearance
        girls9to13.text = "9 to 13:"
        girls9to13.font = UIFont.systemFontOfSize(12)
        girls9to13.numberOfLines = 0   // makes number of lines dynamic
        // e.g.: multiple lines will show up
        girls9to13.textAlignment = NSTextAlignment.Center
        
        // Required to autolayout this label
        girls9to13.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(girls9to13)
        
        /*
         * Add a button
         */
        let getData = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        
        // Make the button, when touched, run the calculate method
        getData.addTarget(self, action: #selector(ViewController.getMyJSON), forControlEvents: UIControlEvents.TouchUpInside)
        
        // Set the button's title
        getData.setTitle("Get my JSON!", forState: UIControlState.Normal)
        
        // Required to auto layout this button
        getData.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button into the super view
        view.addSubview(getData)

        /*
         * Layout all the interface elements
         */
        
        // This is required to lay out the interface elements
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create an empty list of constraints
        var allConstraints = [NSLayoutConstraint]()
        
        // Create a dictionary of views that will be used in the layout constraints defined below
        let viewsDictionary : [String : AnyObject] = [
            "boys2to3": boys2to3,
            "boys4to8": boys4to8,
            "boys9to13": boys9to13,
            "girls2to3": girls2to3,
            "girls4to8": girls4to8,
            "girls9to13": girls9to13,
            "programTitle": programTitle,
            "boysTitle": boysTitle,
            "girlsTitle": girlsTitle,
            "getData": getData]
        
        // Define the vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-50-[programTitle]-[boysTitle]-[boys2to3]-[boys4to8]-[boys9to13]-[girlsTitle]-[girls2to3]-[girls4to8]-[girls9to13]-[getData]",
            options: [],
            metrics: nil,
            views: viewsDictionary)
        
        // Add the vertical constraints to the list of constraints
        allConstraints += verticalConstraints
        
        // Activate all defined constraints
        NSLayoutConstraint.activateConstraints(allConstraints)
        
    }
    
}

// Embed the view controller in the live view for the current playground page
XCPlaygroundPage.currentPage.liveView = ViewController()
// This playground page needs to continue executing until stopped, since network reqeusts are asynchronous
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
