//
//  ViewController.swift
//  UiKit Swift
//
//  Created by Usuário Convidado on 18/08/2018.
//  Copyright © 2018 Andre Goncalves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var meuSegmento: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch meuSegmento.selectedSegmentIndex {
        case 0:
            print("Voce escolheu o primeiro botao")
            break
        case 1:
            print("Voce escolheu o segundo botao")
            break
        case 2:
            print("Voce escolheu o \(meuSegmento.titleForSegment(at: meuSegmento.selectedSegmentIndex)!)")
            break
        default:
            break;
        }
    }
    
    @IBOutlet weak var labelAno: UILabel!
    
    @IBOutlet weak var labelKm: UILabel!
    
    @IBOutlet weak var labelRota: UILabel!
    
    @IBOutlet weak var meuStepper: UIStepper!
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        labelAno.text = "\(Int(meuStepper.value))"
    }
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        labelKm.text = "\(Int(mySlider.value))"
    }
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func switchValueChanged(_ sender: Any) {
        print((NSNumber(value:mySwitch.isOn)))
    }
    
    @IBAction func escolherRota(_ sender: Any) {
        let alerta = UIAlertController(
            title: "Forma para receber a rota",
            message: "Faca sua escolha",
            preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alerta.addAction(UIAlertAction(title: "SMS",
                            style: UIAlertActionStyle.default,
                            handler: { action in
                                self.labelRota.text = action.title}))
        
        alerta.addAction(UIAlertAction(title: "E-mail",
                                       style: UIAlertActionStyle.default,
                                       handler: { action in
                                        self.labelRota.text = action.title}))
        
        alerta.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:nil))
        present(alerta,animated: true,completion: nil)
    }
    
    @IBAction func salvarDados(_ sender: Any) {
        var msg : String
        var tipo : String
        
        if meuSegmento.selectedSegmentIndex >= 0 {
            tipo = meuSegmento.titleForSegment(at: meuSegmento.selectedSegmentIndex)!
            msg = "veiculo \(tipo) do ano \(labelAno.text!) salvo com sucesso"
        }else{
            tipo = ""
            msg = "Antes de salvar escolha o veiculo"
        }
        
        let alerta = UIAlertController(title:"Atencao", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        present(alerta,animated: true,completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelAno.text = "1980"
        labelKm.text = "7500"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

