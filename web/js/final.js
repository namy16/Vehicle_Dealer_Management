/**
 * Created by parashan on 7/18/2017.
 */

function addoperator() {
    var a1=document.getElementById("addoperator");
    document.getElementById("main").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("main").innerHTML=document.getElementById("addoperator").innerHTML;
    a1.style.display="block";
}
function removeoperator() {
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    var a1=document.getElementById("removeoperator");
    document.getElementById("main").innerHTML=document.getElementById("removeoperator").innerHTML;
    a1.style.display="block";
}
function addvehicle() {
    var a1=document.getElementById("addvehicle");
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("main").innerHTML=document.getElementById("addvehicle").innerHTML;
    a1.style.display="block";
}
function removevehicle() {
    var a1=document.getElementById("removevehicle");
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("main").innerHTML=document.getElementById("removevehicle").innerHTML;
    a1.style.display="block";
}
function addsparepart() {
    var a=document.getElementById("main");
    var a1=document.getElementById("addsparepart");
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("main").innerHTML=document.getElementById("addsparepart").innerHTML;
    a1.style.display="block";
}
function removesparepart() {
    var a=document.getElementById("main");
    var a1=document.getElementById("removesparepart");
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").innerHTML=document.getElementById("removesparepart").innerHTML;
    a1.style.display="block";
}
function addvehiclestock() {
    var a1=document.getElementById("addvehiclestock");
    document.getElementById("main2").style.display="none";
    document.getElementById("addsparepartstock").style.display="none";
    document.getElementById("sellvehicle").style.display="none";
    document.getElementById("sellsparepart").style.display="none";
    document.getElementById("oviewvehicles").style.display="none";
    document.getElementById("oviewspareparts").style.display="none";
    document.getElementById("main2").innerHTML=document.getElementById("addvehiclestock").innerHTML;
    a1.style.display="block";
}
function sellvehicle() {
    var a1=document.getElementById("sellvehicle");
    document.getElementById("main2").style.display="none";
    document.getElementById("addsparepartstock").style.display="none";
    document.getElementById("addvehiclestock").style.display="none";
    document.getElementById("sellsparepart").style.display="none";
    document.getElementById("oviewvehicles").style.display="none";
    document.getElementById("oviewspareparts").style.display="none";
    document.getElementById("main2").innerHTML=document.getElementById("sellvehicle").innerHTML;
    a1.style.display="block";
}
function addsparepartstock() {
    var a1=document.getElementById("addsparepartstock");
    document.getElementById("oviewvehicles").style.display="none";
    document.getElementById("oviewspareparts").style.display="none";
    document.getElementById("main2").style.display="none";
    document.getElementById("sellvehicle").style.display="none";
    document.getElementById("addvehiclestock").style.display="none";
    document.getElementById("sellsparepart").style.display="none";
    document.getElementById("main2").innerHTML=document.getElementById("addsparepartstock").innerHTML;
    a1.style.display="block";
}
function sellsparepart() {
    var a1=document.getElementById("sellsparepart");
    document.getElementById("oviewvehicles").style.display="none";
    document.getElementById("oviewspareparts").style.display="none";
    document.getElementById("main2").style.display="none";
    document.getElementById("addsparepartstock").style.display="none";
    document.getElementById("addvehiclestock").style.display="none";
    document.getElementById("sellvehicle").style.display="none";
    document.getElementById("main2").innerHTML=document.getElementById("sellsparepart").innerHTML;
    a1.style.display="block";
}