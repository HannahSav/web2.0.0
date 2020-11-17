xFlag=true;
yFlag=true;
rFlag=true;
r = 100;
x = 0;
y = 0;

rValues = ["1","2","3","4","5"];


function getY(){
    return document.getElementById('yId').value;
}

function getX(){
    return document.getElementById('xId').value;
}

function checkX(x){
    if (x==='') yFlag=false;
    else if(x >= -3 && x <= 3) xFlag=true;
}

function checkY(y){
    if (y==='') yFlag=false;
    else if(y >= -3 && y <= 3) yFlag=true;
}

function checkR(){
    var inp = document.getElementsByName('radius');
    for (var i = 0; i < inp.length; i++) {
        if (inp[i].type === "radio" && inp[i].checked) {
            r = rValues[i];
            return  true;
        }
    }
    return false;
}

function createRequest(){
    y = getY();
    x = getX();
    xFlag=false;
    yFlag=false;
    rFlag=checkR();
    checkX(x);
    checkY(y);
    if(!xFlag)document.getElementById('xText').innerHTML = "выберите X от -3 до 3";
    else document.getElementById('xText').innerHTML = "";
    if(!yFlag)document.getElementById('yText').innerHTML = "выберите Y от -3 до 3";
    else document.getElementById('yText').innerHTML = "";
    if(!rFlag)document.getElementById('rText').innerHTML = "выберите R";
    else document.getElementById('rText').innerHTML = "";
    if(xFlag && yFlag && rFlag) {
        $.post(
            "controller",
            {x: x, y: y, r: r},
            function (response) {
                window.close();
                window.open("answer.jsp");
            }
        );
    }

}
// } else {
//     event.preventDefault()
// }


/*$(function () {
    $('#button').on('click', function (event) {
        //createRequest();
        if (xFlag && yFlag && rFlag) {
            document.getElementById('yText').innerHTML = "сделаано мой генерал";
            $.post(
                "/controller",
                {x: x, y: y, r: r}
            );
        } else {
            event.preventDefault()
        }
        event.preventDefault()
    });
});*/