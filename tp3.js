function affichagetab()
{
    document.write('<table border=2px width=30%');
    for(let i = 0; i <= 50; i++)
    {
        document.write('<tr><td>*</td><td>*</td><td>*</td></tr>');
    }
    document.write('</table>');
}

function affichagetab2()
{
    document.write('<table border=2px width=30%');
    var count = prompt("Combien de lignes souhaitez vous ?");

    document.write('<table border=2px width=30%')
    for(let i = 0; i <= count; i++)
    {
        document.write("<tr><td>"+i+"</td><td>*</td><td>*</td></tr>");
    }
    document.write('</table>');
}

function seconnecter()
{
    var login = prompt("Donner votre nom d'utilisateur");
    var password = prompt("Entrer votre mot de passe");
    if( login == "admin" &&  password == "admin")
    {
        document.write("Bienvenue : "+login);
    }
    else
    alert("Accès refusé")
}

function seconnecter2(){
var i=0
do {
    var login = prompt("Donner votre nom d'utilisateur");
    var password = prompt("Entrer votre mot de passe");
    if( login == "admin" &&  password == "admin")
    {
        document.write("Bienvenue : "+login);
        break;
    }
    else
    alert("Accès refusé")
    i+=1;
    } while (i<3);
    if (i==3)
    alert("Délai dépassé")
}

function cdc(){
var chaine = prompt("Donnez un mot");
document.write(chaine.toUpperCase()+"<br>");
document.write(chaine.toUpperCase()+"<br>");
document.write("a chaine contient"+chaine.length+"caractères   "+"<br>");
document.write("la première lettre est " + chaine.substr(0,1)+"<br>");
}

function color(){
    var color = prompt ("Entrez une couleur")
    switch(color)
{
    case "rouge" : document.body.style.background = "red";
    break;
    case "ROUGE" : document.body.style.background = "red";
    break;
    case "bleu" : document.body.style.background = "blue";
    break;
    case "BLEU" : document.body.style.background = "blue";
    break;

    default:alert("couleur non définie");
}
}