//
//  DeliveryViewController.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 29/11/21.
//

import UIKit

class DeliveryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var DeliveryTable: UITableView!
    
    var deliveryList: [Delivery] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deliverySearch()
        self.DeliveryTable.delegate = self
        self.DeliveryTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemDelivery", for: indexPath) as! DeliveryTableViewCell
        let itemDelivery = deliveryList[indexPath.row]
        cell.idLabel.text = String(format: "%@ %@", "Id Pedido: ", itemDelivery.deliveryId)
        cell.statusLabel.text = String(format: "%@ %@", "Estado Pedido: ", itemDelivery.status)
        return cell
    }
    
    func deliverySearch(){
            let urlSearch = String(format: "%@","https://projectjavaspring.herokuapp.com/api/v1/delivery/")
            let url = URL(string: urlSearch)!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: url){data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else{
                    print("error", error!)
                    return
                }
                
                let status = response.statusCode
                guard (200...299).contains(status) else {
                print("Response code =  \(status)")
                return
                }
                
                if data == data {
                  do {
                    let delivery = try JSONDecoder().decode(DeliveryResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.deliveryList = delivery.delivery
                        print(delivery.delivery)
                        self.DeliveryTable.reloadData()
                     }
                  } catch let jsonError as NSError {
                    print("JSON decode failed: \(jsonError.localizedDescription)")
                  }
                  return
                }
            }
            task.resume()
        }
}
