    x = $('x_in').val();
    y = $('.y_in').val();
    r = $('input[name=radius]:checked').val();
    a = false;
    let position;
    let xLast;
    let yLast;

    let svg = document.querySelector("svg");

$(function () {
    $('.graph').on('click', function (event) {
        if (checkR()) {
            a = true;
            r = $('input[name=radius]:checked').val();
            position = getMousePosition(svg, event);
            x = position.x;
            y = position.y;
            xLast = x;
            yLast = y;
            //alert(x+"\n"+"\n"+y+"\n"+r);
            //let x_val = (((x - 200) * r / 120) / 0.5).toFixed() * 0.5;
            point1(x, y, r);
           // $('input[name=x][value=\"' + x_val + '\"]').prop('checked', true);
            $('.x_in').val((-(155 - x) * r / 100).toFixed(2));
            //$('x_in').disabled();
            $('.y_in').val(((155 - y) * r / 100).toFixed(2));
            //$('y_in').disabled();
           // $('.exceptionY').html('');
           // $('.exceptionX').html('');
           point1(x, y, r);
            return true
        }else alert("Честно говоря, хотелось бы подробностей... Тыкните по значению для R");
    });
});

/*
    function forX() {
        if (a === true) {
            position = getMousePosition(svg, event);
            x = $('x_in').val();
            xLast = x;
            r = $('input[name=radius]:checked').val();
            y = yLast;
            //alert(x + "\n" + "\n" + y + "\n" + r);
            //let x_val = (((x - 200) * r / 120) / 0.5).toFixed() * 0.5;
            point1(x, y, r);
            // $('input[name=x][value=\"' + x_val + '\"]').prop('checked', true);
            $('.x_in').val((-(155 - x) * r / 100).toFixed(2));
            $('.y_in').val(((155 - y) * r / 100).toFixed(2));
            point1(x, y, r);
        }
    }

    $("#yId").keyup(function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            if (a === true) {
                r = $('input[name=radius]:checked').val();
                x = xLast;
                position = getMousePosition(svg, event);
                y = 155-$('y_in').val()*100/r;
                yLast = y;
                //alert(x + "\n" + "\n" + y + "\n" + r);
                //let x_val = (((x - 200) * r / 120) / 0.5).toFixed() * 0.5;
                point1(x, y, r);
                // $('input[name=x][value=\"' + x_val + '\"]').prop('checked', true);
                $('.x_in').val((-(155 - x) * r / 100).toFixed(2));
                //$('.y_in').val(((155 - y) * r / 100).toFixed(2));
                point1(x, y, r);
                $('y_in').blur();
            }
        }
    });
    */

function forR() {
    if (a === true) {
        position = getMousePosition(svg, event);
        x = xLast;
        r = $('input[name=radius]:checked').val();
        y = yLast;
        //alert(x + "\n" + "\n" + y + "\n" + r);
        //let x_val = (((x - 200) * r / 120) / 0.5).toFixed() * 0.5;
        point1(x, y, r);
        // $('input[name=x][value=\"' + x_val + '\"]').prop('checked', true);
        $('.x_in').val((-(155 - x) * r / 100).toFixed(2));
        $('.y_in').val(((155 - y) * r / 100).toFixed(2));
        point1(x, y, r);
    }
}

function point1(x, y, r) {
    $('#point').attr("cx", x)
        .attr("cy", y);
}

function getMousePosition(svg, event) {
    let rect = svg.getBoundingClientRect();
    return {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top
    };
}