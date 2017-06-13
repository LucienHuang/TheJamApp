//
//  ViewController.swift
//  JAM
//
//  Created by Lucien on 5/14/17.
//  Copyright © 2017 Lucien. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import ImageIO
import UIKit

class ViewController: UIViewController,GMSMapViewDelegate {

    var mapView:GMSMapView!
    
    var locationManager = CLLocationManager()
    var locationNow:CLLocation?
    var gifPin: UIImageView?
    
    
    var london:GMSMarker?
    var londonView:UIImageView?
    //var imageList: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0.0, width: 375, height: 554), camera: GMSCameraPosition.camera(withLatitude: 48.860654, longitude: 2.352111, zoom: 15.0))
        mapView?.isMyLocationEnabled = true
        mapView?.center = self.view.center
        
        mapView?.delegate = self
        
        self.view.addSubview(mapView!)
        shows()
        
        let button = UIButton(frame: CGRect(x: 156, y: 533, width: 62, height: 62))
        button.setImage(#imageLiteral(resourceName: "button"), for: .normal)
        button.addTarget(self, action: #selector(self.putPin(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        self.locationNow = locationManager.location
    }
    
    func shows(){
        let position1 = CLLocationCoordinate2D(latitude:48.870473, longitude: 2.332354)
        for _ in 0 ... 7{
            randomPin(position: position1)
        }
        let musicMarker1 = GMSMarker(position: position1)
        musicMarker1.title = "Music Show Here"
        musicMarker1.icon = #imageLiteral(resourceName: "music")
        musicMarker1.map = mapView
        musicMarker1.appearAnimation = .none
        
        let position2 = CLLocationCoordinate2D(latitude:48.86381, longitude: 2.335027)
        for _ in 0 ... 3{
            randomPin(position: position2)
        }
        let musicMarker2 = GMSMarker(position: position2)
        musicMarker2.title = "Music Show Here"
        musicMarker2.icon = #imageLiteral(resourceName: "music")
        musicMarker2.map = mapView
        musicMarker2.appearAnimation = .none
        
        let position3 = CLLocationCoordinate2D(latitude:48.853316, longitude: 2.348678)
        for _ in 0 ... 5{
            randomPin(position: position3)
        }
        let musicMarker3 = GMSMarker(position: position3)
        musicMarker3.title = "Music Show Here"
        musicMarker3.icon = #imageLiteral(resourceName: "music")
        musicMarker3.map = mapView
        musicMarker3.appearAnimation = .none
        
        let position4 = CLLocationCoordinate2D(latitude:48.860023, longitude: 2.351280)
        for _ in 0 ... 12{
            randomPin(position: position4)
        }
        let danceMarker1 = GMSMarker(position: position4)
        danceMarker1.title = "Dance Show Here"
        danceMarker1.icon = #imageLiteral(resourceName: "dance")
        danceMarker1.map = mapView
        danceMarker1.appearAnimation = .none
        
        let position5 = CLLocationCoordinate2D(latitude:48.847278, longitude: 2.337396)
        for _ in 0 ... 2{
            randomPin(position: position5)
        }
        let danceMarker2 = GMSMarker(position: position5)
        danceMarker2.title = "Dance Show Here"
        danceMarker2.icon = #imageLiteral(resourceName: "dance")
        danceMarker2.map = mapView
        danceMarker2.appearAnimation = .none
    }
    
    func randomPin(position: CLLocationCoordinate2D){
        let position = position
        let marker = GMSMarker(position: position)
        marker.title = "A SHOW!"
        marker.snippet = "CHECK IT OUT"
        marker.icon = #imageLiteral(resourceName: "ani_30").withAlignmentRectInsets(UIEdgeInsetsMake(50*randomNumber(), 50*randomNumber(), 50*randomNumber(), 50*randomNumber()))
        marker.appearAnimation = .pop
        marker.map = mapView
        
    }
    
    func putPin(sender:UIButton!){
        mapView.clear()
        shows()
        
        let show = #imageLiteral(resourceName: "ani_30").withRenderingMode(.alwaysOriginal)
        let markerView = UIImageView(image: show.withAlignmentRectInsets(UIEdgeInsetsMake(30*randomNumber(), 30*randomNumber(), 30*randomNumber(), 30*randomNumber())))
        
        markerView.animationRepeatCount = 1
        markerView.animationImages = [#imageLiteral(resourceName: "ani_0"),#imageLiteral(resourceName: "ani_1"),#imageLiteral(resourceName: "ani_2"),#imageLiteral(resourceName: "ani_3"),#imageLiteral(resourceName: "ani_4"),#imageLiteral(resourceName: "ani_5"),#imageLiteral(resourceName: "ani_6"),#imageLiteral(resourceName: "ani_7"),#imageLiteral(resourceName: "ani_8"),#imageLiteral(resourceName: "ani_9"),#imageLiteral(resourceName: "ani_10"),#imageLiteral(resourceName: "ani_11"),#imageLiteral(resourceName: "ani_12"),#imageLiteral(resourceName: "ani_13"),#imageLiteral(resourceName: "ani_14"),#imageLiteral(resourceName: "ani_15"),#imageLiteral(resourceName: "ani_16"),#imageLiteral(resourceName: "ani_17"),#imageLiteral(resourceName: "ani_18"),#imageLiteral(resourceName: "ani_19"),#imageLiteral(resourceName: "ani_20"),#imageLiteral(resourceName: "ani_21"),#imageLiteral(resourceName: "ani_22"),#imageLiteral(resourceName: "ani_23"),#imageLiteral(resourceName: "ani_24"),#imageLiteral(resourceName: "ani_25"),#imageLiteral(resourceName: "ani_26"),#imageLiteral(resourceName: "ani_27"),#imageLiteral(resourceName: "ani_28"),#imageLiteral(resourceName: "ani_29"), #imageLiteral(resourceName: "ani_30")]
        markerView.startAnimating()
        
        londonView = markerView
        
        
        //for i in 0 ... 29{
        //    imageList += UIImage(named: "i")
        //}
        
        let position = CLLocationCoordinate2D(latitude:(locationNow?.coordinate.latitude)!, longitude: (locationNow?.coordinate.longitude)!)
        let marker = GMSMarker(position: position)
        
        marker.title = "A SHOW!"
        marker.snippet = "CHECK IT OUT"
        marker.infoWindowAnchor = CGPoint(x: 0, y: 0)
        
        marker.iconView = markerView
        marker.tracksViewChanges = true
        marker.map = mapView
        london = marker
        
        //london.icon = UIImage.gif(name: "icon_1")?.withAlignmentRectInsets(UIEdgeInsetsMake(100*randomNumber(), 50*randomNumber(), 50*randomNumber(), 50*randomNumber()))
        
        //london.icon = #imageLiteral(resourceName: "icon_1").withAlignmentRectInsets(UIEdgeInsetsMake(30*randomNumber(), 30*randomNumber(), 30*randomNumber(), 30*randomNumber()))
        //london.map = mapView
        
    }
    
    func mapView(_ mapView:GMSMapView, idleAt position:GMSCameraPosition){
        UIView.animate(withDuration:1.0, animations: { () -> Void in
            
            self.londonView?.alpha = 1.0
        }, completion: {(finished) in
            // Stop tracking view changes to allow CPU to idle.
            self.london?.tracksViewChanges = false
            
        })
    }
    
    func randomNumber() -> CGFloat{
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    

    
//    override func loadView() {
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 12.0)
//        let mapView = GMSMapView.map(withFrame: CGRect(x: 100, y: 100, width: 200, height: 200), camera: camera)
//        mapView.isMyLocationEnabled = true
//        mapView.center = self.view.center
//        
//        view.addSubview(mapView)
//        
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        locationNow = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 15.0)
        
        self.mapView?.animate(to: camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
        
    }
    
}
