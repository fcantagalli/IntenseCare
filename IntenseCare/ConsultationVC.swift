//
//  ConsultationVC.swift
//  IntenseCare
//
//  Created by Felipe on 5/6/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class ConsultationViewController: UIViewController, UITextFieldDelegate {
    
    //OUTLETS AND ACTIONS
    @IBOutlet weak var navItem: UINavigationItem!
    
        //Respiratory System
    @IBOutlet weak var FIO2TF: UITextField!
    @IBOutlet weak var pa02: UITextField!
    @IBOutlet weak var mechVentSwitch: UISwitch!
    
    @IBAction func RespiratorySaveButton(sender: AnyObject) {
        // save here
    }
    
        //Nervous System
    @IBOutlet weak var glasgowTF: UITextField!
    @IBAction func NervousSaveButton(sender: AnyObject) {
        // save here
        
    }
    
        //Liver
    @IBOutlet weak var bilirubinTF: UITextField!
    @IBAction func liverSaveButton(sender: AnyObject) {
        // save here
    }
    
        // cardio vascular system
    @IBOutlet weak var mapTF: UITextField!
    @IBOutlet weak var vasopressorsSwitch: UISwitch!
    @IBOutlet weak var dopTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var epiTF: UITextField!
    @IBOutlet weak var norTF: UITextField!
    
    @IBAction func CardioSaveButton(sender: AnyObject) {
        //save here
    }
    
        // Coagulation
    @IBOutlet weak var plateletsTF: UITextField!
    @IBAction func coagulationSaveButton(sender: AnyObject) {
        //save here
    }
    
        // Renal System
    @IBOutlet weak var creatinineTF: UITextField!
    @IBOutlet weak var creaUrineSegment: UISegmentedControl!
    @IBOutlet weak var creaUrineLabel: UILabel!
    
    // altera os cantos de sistema renal dependendo a escolha
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: // creatine
            self.creaUrineLabel.text = "Creatinine"
            self.creatinineTF.placeholder = "mg/dL"
            break
        case 1: // urine
            self.creaUrineLabel.text = "Urine Output"
            self.creatinineTF.placeholder = "mL/day"
            break
        default:
            break
        }
    }
    
    @IBAction func renalSaveButton(sender: UIButton) {
        // save here
        
        
    }
    
    func calcResultSofa(){
        
        if (sofa >= 0 && sofa <= 6){
            
            //mortality = 10%
            //paciente recebe a cor: #D1F2A5
        }
            
        else if (sofa >= 7 && sofa <= 9){
            
            //mortality = 15% - 20%
            //paciente recebe a cor: #EFFAB4
        }
            
        else if (sofa >= 10 && sofa <= 12){
            
            //mortality = 40 - 50%
            //paciente recebe a cor: #FFC48C
        }
            
        else if (sofa >= 13 && sofa <= 14){
            
            //mortality = 50% - 60%
            //paciente recebe a cor: #FF9F80
        }
            
        else if (sofa >= 15){
            
            //mortality > 60%
            //paciente recebe a cor: #F56991
        }
            
        else{
            //erro
        }
    }//fim da funcao calc result sofa
    
    var sofa:Int=0
    
    func calcSofa(FIO2TF:String, pa02:String, mechVentSwitch:UISwitch, glasgowTF:String, bilirubinTF:String, mapTF:String, dopTF:String, dobTF:String, epiTF:String, norTF:String, vasoopressorSwitch:String, plateletsTF:String, creatitineTF:String, urineTF:String){
        
        if (FIO2TF != "" && pa02 != "" && glasgowTF != "" && bilirubinTF != "" && (mapTF != "" || dopTF != "" || dobTF != "" || epiTF != "" || norTF != "") && vasoopressorSwitch != "" && plateletsTF != "" && creatitineTF != "" && urineTF != ""){

            //calculating FIO2
            
            //fio2 comes in %
            
            var floatFIO2:Float = (FIO2TF as NSString).floatValue
            
            /*
            
            A PaO2 (pressão parcial arterial de O2) é dada em mmHG (medida de pressão) ==> colhe o sangue arterial - diferente do usual para outros exames que usa o sangue da veia -  e manda para o laboratório
            
            A FiO2 (fração inspirada de O2) é dada em % (media de proporção) ==> diz a respeito de quanto se está ofertando de O2 ao paciente, é controlada de acordo com o equipamento usado para suplementar oxigênio ao paciente:
            
            21% se o paciente não estiver recebendo suplementação de O2, ou seja respirando ar ambiente;
            
            24 a 28% se estiver recebendo O2 por cateter nasal (o que é até no máximo de 4l/min pelo cateter de oxigênio, se não estiver funcionando troca-se por uma máscara);
            
            e até 50% se for necessário usar uma máscara (nos melhores lugares, a de Venturi);
            
            mais do que isso o paciente precisa ser intubado e rebe o oxigênio pelo aparelho de ventilação mecânica, ajustado de acordo com a necessidade pelo fisioterapêuta ou médico. Na ventilação mecânica, o parelho pode oferecer qualquer quantidade.
            
            O oxigênio em altas proporções é tóxico para as células pulmonares (pneumócitos), entào, a tentativa é sempre deixar o mais perto possível da composição normal do ar ambiente, desde que mantido a quantidade de oxigênio necessidade dos orgãos vitais (especialmente cérebro)
            
            ==> de 21 (o valor esperado de O2 no ar ambiente) a 100% (valor máximo dado pelo aparelho de ventilação mecânica.
            
            if(floatFIO2 > 20 && floatFIO2 < 24){
            
            sofa = sofa+1
            
            }
            
            else if (floatFIO2 >= 24 && floatFIO2 < 29){
            
            sofa = sofa+2
            
            }
            
            else if (floatFIO2 >= 29 && floatFIO2 < 51){
            
            sofa = sofa+3
            
            }
            
            else if (floatFIO2 >= 51 && mechVentSwitch.on){
            
            sofa = sofa+4
            
            }
            
            else{
            
            //erro
            
            }*/
            
            //calculating pa02
            
            //pa02 comes in mmHg
            
            //Exemplo : PaO2 = 90 mmHg com FiO2 = 60% ==> PaO2/FiO2 = 150 (SOFA 3)
            
            var floatpa02:Float = (pa02 as NSString).floatValue
            
            var floatRespiratory = floatpa02 / floatFIO2
            
            if (floatRespiratory > 400){
                sofa = sofa+0
            }
                
            else if(floatpa02 > 300 && floatpa02 <= 400){
                sofa = sofa+1
            }
                
            else if (floatpa02 > 200 && floatpa02 <= 300){
                sofa = sofa+2
            }
                
            else if (floatpa02 > 100 && floatpa02 <= 200
                
                && mechVentSwitch.on ){
                    sofa = sofa+3
                    
            }
                
            else if (floatpa02 >= 1 && floatpa02 <= 100 && mechVentSwitch.on){
                
                sofa = sofa+4
                
            }
                
            else{
                //erro Apenas preciso verificar se mechVentSwith sempre vai estar ON nos dois ultimos casos
            }

            //calculating glasgow
            
            /*
            
            3 = coma profundo com 85% de probabilidade de morte, estado vegetativo
            
            4 = coma profundo
            
            7 = coma intermediario
            
            11 = coma superficial
            
            15 = normalidade
            
            
            
            Nao aceitar valores < 0
            
            */
            
            var floatglasgow:Float = (glasgowTF as NSString).floatValue
            
            if(floatglasgow == 13 || floatglasgow == 14){
                
                sofa = sofa+1
                
            }
                
            else if (floatglasgow >= 10 && floatglasgow <= 12){
                
                sofa = sofa+2
                
            }
                
            else if (floatglasgow >= 6 && floatglasgow <= 9 ){
                
                sofa = sofa+3
                
            }
                
            else if (floatglasgow < 6 && floatglasgow >= 0){
                
                sofa = sofa+4
                
            }
                
            else if (floatglasgow == 15){
                
                sofa = sofa+0
                
            }
                
            else{
                
                //erro
                
            }

            //calculating bilirubing
            
            /*
            
            bilirubin tem duas unidades mesmo. A em mg/dl pode ser float
            
            a em mol eh inteiro. Acho melhor tratarmos como float tudo.
            
            */
            
            var floatBilirubin:Float = (bilirubinTF as NSString).floatValue
            
            if (floatBilirubin < 1.2 || floatBilirubin < 20 ){
                
                sofa = sofa+0
                
            }
            
            if( (floatBilirubin >= 1.2 && floatBilirubin <= 1.9)
                
                || (floatBilirubin >= 20 && floatBilirubin <= 32) ){
                    
                    sofa = sofa+1
            }
                
            else if( (floatBilirubin > 1.9 && floatBilirubin <= 5.9)
                
                || (floatBilirubin > 32 && floatBilirubin <= 101) ){
                    
                    sofa = sofa+2
            }
                
            else if( (floatBilirubin > 5.9 && floatBilirubin <= 11.9)
                
                || (floatBilirubin > 101 && floatBilirubin <= 204) ){
                    
                    sofa = sofa+3
            }
                
            else if( floatBilirubin > 11.9 || floatBilirubin > 204 ){
                
                sofa = sofa+4
            }
                
            else{
                //erro
            }

            //calculating cardiovascular using wikipedia
            
            /*
            
            MAP = pressao arterial media
            
            dop = dopamina
            
            dob = dobutamina
            
            epi = epinefrina ou adrenalina (mesma coisa)
            
            nor = noradrenalina
            
            */
            
            var floatMap:Float = (mapTF as NSString).floatValue
            
            var floatDop:Float = (dopTF as NSString).floatValue
            
            var floatEpi:Float = (epiTF as NSString).floatValue
            
            var floatNor:Float = (norTF as NSString).floatValue
            
            if (floatMap < 70){
                
                sofa = sofa+1
                
            }
                
            else if (floatDop <= 5 || dobTF != ""){
                
                sofa = sofa+2
                
            }
                
            else if ((floatDop > 5 && floatDop <= 15) || floatEpi <= 0.1 || floatNor <= 0.1){
                
                sofa = sofa+3
                
            }
                
            else if (floatDop > 15 || floatEpi > 0.1 || floatNor > 0.1){
                
                sofa = sofa+4
                
            }
                
            else{
                
                //erro
                
            }

            //calculating coagulation (platelets)
            
            var floatPlatelets:Float = (plateletsTF as NSString).floatValue
            
            if (floatPlatelets > 150){
                
                sofa = sofa+0
                
            }
                
            else if(floatPlatelets > 100 && floatPlatelets <= 150){
                
                sofa = sofa+1
                
            }
                
            else if (floatPlatelets > 50 && floatPlatelets <= 100){
                
                sofa = sofa+2
                
            }
                
            else if (floatPlatelets > 20 && floatPlatelets <= 50 ){
                
                sofa = sofa+3
                
            }
                
            else if (floatPlatelets > 0 && floatPlatelets <= 20 ){
                
                sofa = sofa+4
            }
                
            else{
                
                //erro
                
            }

            //calculating creatinine
            //arrumar para caso creatinina, caso urina output
            
            var floatCreatinine:Float = (creatitineTF as NSString).floatValue
            
            var selected:Int = creaUrineSegment.selectedSegmentIndex
            
            // creatinine
            
            if (selected == 0){
                
                if (floatCreatinine < 1.2 || floatCreatinine < 110){
                    
                    sofa = sofa+0
                    
                }
                    
                else if( (floatCreatinine >= 1.2 && floatCreatinine <= 1.9)
                    
                    || (floatCreatinine >= 110 && floatCreatinine <= 170) ){
                        
                        sofa = sofa+1
                        
                }
                    
                else if( (floatCreatinine > 1.9 && floatCreatinine <= 3.4)
                    
                    || (floatCreatinine > 170 && floatCreatinine <= 299) ){
                        
                        sofa = sofa+2
                        
                }
                    
                else if( (floatCreatinine > 3.4 && floatCreatinine <= 4.9)
                    
                    || (floatCreatinine > 299 && floatCreatinine <= 440) ){
                        
                        sofa = sofa+3
                        
                }
                    
                else if( floatCreatinine > 4.9 || floatCreatinine > 440 ){
                    
                    sofa = sofa+4
                    
                }
                    
                else{
                    
                    //erro
                    
                }
                
            }//fim do if de selected == 0
                
            else {
                
                //urine output
                
                if (floatCreatinine < 500 && floatCreatinine >= 200){
                    
                    sofa = sofa+3
                    
                }
                    
                else if (floatCreatinine < 200){
                    
                    sofa = sofa+4
                    
                }
                    
                else{
                    //erro
                }
                
            }//fim do else de selected = 1
        }//end of if

    }//fim da funcao
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabController = self.tabBarController as! ConsultationTabsController
        
        self.parentViewController?.navigationItem.title = tabController.patientName
        self.parentViewController?.navigationController?.navigationBar.barTintColor = tabController.barColor
        self.parentViewController?.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // esses dois métodos são para o teclado minimizar quando clicar fora
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}