/////////////////////////////////HIDE/SHOW//////////////////////////////////////////////////////////////////
$(function() {
    $("#comQ, #resiQ, #corpQ, #hybQ").hide();
    $('#building_type').change(function(){
        if($('#building_type').val() == 'Residential') {
            $('#resiQ').show(500); 
            clear();
        } else {
            $('#resiQ, #Qst').hide(); 
        } 
        if ($('#building_type').val() == 'Commercial') {
            $('#comQ').show(500);
            clear();
        } else {
            $('#comQ').hide(); 
        } 
        if($('#building_type').val() == 'Corporate') {
            $('#corpQ').show(500);
            clear();
        } else {
            $('#corpQ').hide(); 
        } 
        if($('#building_type').val() == 'Hybrid') {
            $('#hybQ').show(500);
            clear();
        } else {
            $('#hybQ').hide(); 
        } 

    });
}); /// SHOW HIDE
function clc() {
    
    var input = document.querySelectorAll('input[type=radio]:checked')[0];
    if(input.value == "standard" ) {
       return RadStd; 
       

    }
    if(input.value == "premium" ) {
        return RadPrem; 

    }
    if(input.value == "excelium" ){
        return RadExcl;

    }
} /// CLEAR CALC////////////
function clear(){
    $(".rst").val("")
    document.getElementById('TotalElevators').value = "0";
    document.getElementById('perc').value = "10%";
    document.getElementById('TotalFinal').value = "0.00$";

}
////////////////// RADIO VARIABLES ////////////////////////////////////////////////////////////////////////
var RadStd = (7565 * 1.10);// Prix Standard en $
var RadPrem = (12345 * 1.13);// Prix Premium en $
var RadExcl = (15400* 1.16);// Prix Excelium en $
/////////////////////////////////VARIABLES et CALCULS Commercial///////////////////////////////////////////
function CalcCom(){
    var NbElevCom = parseInt(document.getElementById('NbCageCom').value);
    TtNbElevCom =Math.ceil(NbElevCom);
    
    TtNbElevComRad = (TtNbElevCom * clc()).toFixed(2);
    document.getElementById('TotalElevators').value = TtNbElevCom;
    document.getElementById('totalele').innerHTML = TtNbElevCom;
    document.getElementById('TotalFinal').value = TtNbElevComRad;
    document.getElementById('totalfin').innerHTML = '$' + TtNbElevComRad;
    
    if(isNaN(TtNbElevComRad,TtNbElevCom) == true){
    TtNbElevComRad = document.getElementById('totalfin').innerHTML = 'Calculating...';
    TtNbElevCom = document.getElementById('totalele').innerHTML = 'Calculating...';
}
}
/////////////////////////////////VARIABLES et CALCULS Residential//////////////////////////////////////////
function CalcRes(){
    var NbAppRes = parseInt(document.getElementById('NbApartRes').value); // Nombre d'appartement Residential
    var NbStageRes = parseInt(document.getElementById('NbStageRes').value); // Nombre d'etage Residential

    AppR = NbAppRes / NbStageRes;
    NbElevRes = Math.ceil(AppR / 6);
    NbColRes = Math.ceil(NbStageRes / 20); 
    TtNbElevRes = NbElevRes * NbColRes;

    TtNbElevResRad = (TtNbElevRes * clc()).toFixed(2);
    document.getElementById('TotalElevators').value = TtNbElevRes;
    document.getElementById('totalele').innerHTML = TtNbElevRes;
    document.getElementById('TotalFinal').value = TtNbElevResRad;
    document.getElementById('totalfin').innerHTML = '$' + TtNbElevResRad;

    
    if(isNaN(TtNbElevResRad,TtNbElevRes)){
        TtNbElevRes = document.getElementById('totalele').innerHTML = 'Calculating...'; 
        TtNbElevResRad = document.getElementById('totalfin').innerHTML = 'Calculating...';
    }
}
/////////////////////////////////VARIABLES et CALCULS Corporate////////////////////////////////////////////
function CalcCorp(){
    var MaxOccuCorp = parseInt(document.getElementById('MaxOccCorp').value);
    var NbStageCorp = parseInt(document.getElementById('NbStageCorp').value);
    var NbSsCorp = parseInt(document.getElementById('NbSsCorp').value);
    var RealLevel = NbStageCorp + NbSsCorp;

    OccTtCorp = Math.ceil(RealLevel* MaxOccuCorp);
    NbColCorp = Math.ceil(RealLevel/20);
    NbElevCorp = Math.ceil((OccTtCorp / 1000) / NbColCorp);
    TtElev= Math.ceil(NbElevCorp / NbColCorp);
    TtNbElevCorp= NbColCorp * NbElevCorp;
    
    TtNbElevCorpRad = (TtNbElevCorp * clc()).toFixed(2);
    document.getElementById('TotalElevators').value = TtNbElevCorp;
    document.getElementById('totalele').innerHTML = TtNbElevCorp;
    document.getElementById('TotalFinal').value = TtNbElevCorpRad;
    document.getElementById('totalfin').innerHTML = '$' + TtNbElevCorpRad;
  
    if(isNaN(TtNbElevCorpRad,TtNbElevCorp)){
        TtNbElevCorp = document.getElementById('totalele').innerHTML = 'Calculating...'; 
        TtNbElevCorpRad = document.getElementById('totalfin').innerHTML = 'Calculating...';
    }
}
/////////////////////////////////VARIABLES et CALCULS Hybride//////////////////////////////////////////////
function CalcHyb() {
    
    var MaxOccuHyb = parseInt(document.getElementById('MaxOccHyb').value);
    var NbStageHyb = parseInt(document.getElementById('NbStageHyb').value);
    var NbSsHyb = parseInt(document.getElementById('NbSsHyb').value);
    var RealLvl = NbStageHyb + NbSsHyb; 

    OccTtHyb = Math.ceil(RealLvl * MaxOccuHyb);
    NbColHyb = Math.ceil(RealLvl / 20);
    NbElevHyb = Math.ceil((OccTtHyb / 1000) / NbColHyb);
    TtElev= Math.ceil(NbElevHyb / NbColHyb);
    TtNbElevHyb = NbColHyb * NbElevHyb;

    TtNbElevHybRad = (TtNbElevHyb * clc()).toFixed(2);
    document.getElementById('TotalElevators').value = TtNbElevHyb;
    document.getElementById('totalele').innerHTML = TtNbElevHyb;
    document.getElementById('TotalFinal').value = TtNbElevHybRad;
    document.getElementById('totalfin').innerHTML = '$' + TtNbElevHybRad;

    if(isNaN(TtNbElevHybRad,)){
        TtNbElevHyb = document.getElementById('totalele').innerHTML = 'Calculating...'; 
        TtNbElevHybRad = document.getElementById('totalfin').innerHTML = 'Calculating...';
    }
}
////////////////////////////////RADIO BOUTON///////////////////////////////////////////////////////////////
function checkRadiovalue() {
    var input = document.querySelectorAll('input[type=radio]:checked')[0];
    if(input.value == "standard" ) {
       //clc()
       document.getElementById('perc').value = '10%'; 
    }
    if(input.value == "premium" ) {
       //clc()
         document.getElementById('perc').value = '13%'; 

    }
    if(input.value == "excelium" ){
      //clc()
    document.getElementById('perc').value = '16%';

    }
    var building_Type = document.getElementById('building_type').value;
    if(building_Type == "Residential"){
        CalcRes()
    }
    if(building_Type == "Commercial"){
        CalcCom()
    }
    if(building_Type == "Corporate"){
        CalcCorp()
    }
    if(building_Type == "Hybrid"){
        CalcHyb()
     }   
     
    }
    
    ////////////////////////////////CALCULS////////////////////////////////////////////////////////////////////

    ////////////////////////////////SEND_QUOTE/////////////////////////////////////////////////////////////////
    
// function Send_Quote()
// {
//     var BT = document.getElementById('building_type').value;
//     var Grade = document.querySelectorAll('input[type=radio]:checked')[0].value;
//     var Apart = 0;
//     var Busi = 0;
//     var Stage = 0;
//     var Ss = 0;
//     var Park = 0;
//     var Cage = 0;
//     var Occ = 0;
//     var Hour = 0;

//         if(BT == "Residential")
//         {
           
//             Apart = document.getElementById('NbApartRes').value;
//             Stage = document.getElementById('NbStageRes').value;
//             Ss = document.getElementById('NbSsRes').value;

//         }
//         if(BT == "Commercial")
//         {
          
//             Busi = document.getElementById('NbBusiCom').value;
//             Stage = document.getElementById('NbStageCom').value;
//             Ss = document.getElementById('NbSsCom').value;
//             Park = document.getElementById('NbParkCom').value;
//             Cage = document.getElementById('NbCageCom').value;
//         }
//         if(BT == "Corporate")
//         {
            
//             Busi = document.getElementById('NbBusiCorp').value;
//             Stage = document.getElementById('NbStageCorp').value;
//             Ss = document.getElementById('NbSsCorp').value;
//             Park = document.getElementById('NbParkCorp').value;
//             Occ = document.getElementById('MaxOccCorp').value;

//         }
//         if(BT == "Hybrid")
//         {
            
//             Busi = document.getElementById('NbBusiHyb').value;
//             Stage = document.getElementById('NbStageHyb').value;
//             Ss = document.getElementById('NbSsHyb').value;
//             Park = document.getElementById('NbParkHyb').value;
//             Occ = document.getElementById('MaxOccHyb').value;
//             Hour = document.getElementById('OppHourHyb').value;

//         }   
//         var Total = document.getElementById('TotalFinal').value;
//         var quote = [{
//                     "Building_Type":BT,
//                     "Product_Grade":Grade,
//                     "Nb_Appartement":Apart,
//                     "Nb_Business":Busi,
//                     "Nb_Floor":Stage,
//                     "Nb_Basement":Ss,
//                     "Nb_Cage":Cage,
//                     "Nb_Parking":Park,
//                     "Nb_OccupantPerFloor":Occ,
//                     "Nb_OpperatingHour":Hour,
//                     "Final_Price":Total
//                     }];

//         console.table(quote)
                 
//      $.ajax({
//          method: "POST",
//          url: "/quote",
//          // The key needs to match your method's input parameter (case-sensitive).
//          data:{ json: JSON.stringify({quote})},
//          dataType: "json",
//          success: function(data){alert(data);},
//          failure: function(errMsg) {
//              alert(errMsg);
        
//             }
         
//      });
// }
