//
//  ViewController.swift
//  TranslucentTinderSwipe
//
//  Created by Harry Cao on 15/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var originalCardCenter: CGPoint!
  
  let girls = [
    Girl(with: ["name": "Sofia" , "quote": "Podrá nublarse el sol eternamente", "image": #imageLiteral(resourceName: "pic0")]),
    Girl(with: ["name": "Isabella", "quote": "Quiero un paquete de galletas", "image": #imageLiteral(resourceName: "pic1")]),
    Girl(with: ["name": "Valentina", "quote": "Lo siento mucho, pero no estoy libre", "image": #imageLiteral(resourceName: "pic2")]),
    Girl(with: ["name": "Camila", "quote": "Quiero ver el menú, por favor", "image": #imageLiteral(resourceName: "pic3")]),
    Girl(with: ["name": "Valeria", "quote": "No me gusta la historia", "image": #imageLiteral(resourceName: "pic4")]),
    Girl(with: ["name": "Luciana", "quote": "Sólo curioso, gracias", "image": #imageLiteral(resourceName: "pic5")]),
    Girl(with: ["name": "María José", "quote": "Quiero hacer una llamada a cobro revertido", "image": #imageLiteral(resourceName: "pic6")]),
    Girl(with: ["name": "Victoria", "quote": "¿Dónde estan los cubos de basura?", "image": #imageLiteral(resourceName: "pic7")]),
    Girl(with: ["name": "Martina", "quote": "Está el correos abierto mañana", "image": #imageLiteral(resourceName: "pic8")]),
    Girl(with: ["name": "Gabriela", "quote": "Hay otro hotel cerca de aquí", "image": #imageLiteral(resourceName: "pic9")]),
    Girl(with: ["name": "Samantha", "quote": "Cuánto tiempo dure", "image": #imageLiteral(resourceName: "pic10")]),
    Girl(with: ["name": "Natalia", "quote": "Mi coche se he descompuesto", "image": #imageLiteral(resourceName: "pic11")]),
    Girl(with: ["name": "Antonella", "quote": "He aquí una prescripción para algunas", "image": #imageLiteral(resourceName: "pic12")]),
    Girl(with: ["name": "Regina", "quote": "Tienes una mesa para seis personas", "image": #imageLiteral(resourceName: "pic13")]),
    Girl(with: ["name": "Fernanda", "quote": "Choqué con el camión", "image": #imageLiteral(resourceName: "pic14")]),
    Girl(with: ["name": "Georgina", "quote": "Asegurad vuestros cinturones de seguridad", "image": #imageLiteral(resourceName: "pic15")]),
  ]
  
  let bgImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "bg")
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  let mainLabel: UILabel = {
    let label = UILabel()
    label.text = "Clasificar niñas"
    label.textColor = .white
    label.font = UIFont(name: "Zapfino", size: 35)
    label.textAlignment = .center
    label.layer.shadowOpacity = 0.8
    label.layer.shadowOffset = CGSize(width: 0, height: 0)
    label.layer.shadowColor = UIColor(white: 0, alpha: 0.9).cgColor
    label.layer.shadowRadius = 5
    return label
  }()
  
  lazy var cardVisualEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .dark)
    let view = UIVisualEffectView(effect: blurEffect)
    view.backgroundColor = .clear
    view.layer.cornerRadius = 15
    view.layer.masksToBounds = true
    view.clipsToBounds = true
    view.layer.zPosition = 1
    view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanCard)))
    return view
  }()
  
  let cardMainLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "Helvetica-Light", size: 27)
    label.textAlignment = .center
    return label
  }()
  
  let cardSubLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 17)
    label.textAlignment = .center
    return label
  }()
  
  lazy var cardLabelStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.addArrangedSubview(self.cardMainLabel)
    stackView.addArrangedSubview(self.cardSubLabel)
    return stackView
  }()
  
  let cardImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 10
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let loveHateImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.alpha = 0
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    setupBg()
    setupCard()
    setupMainLabel()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    originalCardCenter = cardVisualEffectView.center
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setRandomGirl()
  }
  
  func setRandomGirl () {
    let randomGirl = girls[Int(arc4random_uniform(16))]
    
    cardMainLabel.text = randomGirl.name
    cardSubLabel.text = randomGirl.quote
    cardImageView.image = randomGirl.image
  }
}

