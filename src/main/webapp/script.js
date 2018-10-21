const width = 270;
const hight = 270;
const r = 45;
const extraValue = 90;

function checkY() {
    let number = parseFloat($("input[name='param-y']").val().replace(",", "."));
    return number >= -5 && number <= 3;
}

function checkR() {
    let number = parseFloat($("input[name='param-r']").val().replace(",", "."));
    return number >= 1 && number <= 4;
}

function clearY() {
    $(".error-y").each((i, e) => {
        e.innerHTML = '';
    });
}

function clearR() {
    $(".error-r").each((i, e) => {
        e.innerHTML = '';
    });
}

function outputErrorY() {
    $(".error-y").each((i, e) => {
        if (i == 0) {
            e.innerHTML = '<div style="color:red">Неверная координата <span class="param">Y</span></div>';
        }
        else
            e.innerHTML = '<div style="color:red">Пожалуйста, повторите ввод</div>';
    });
    $('[name="param-y"]').val('');
}

function outputErrorR() {
    $(".error-r").each((i, e) => {
        if (i == 0) {
            e.innerHTML = '<div style="color:red">Неверная координата <span class="param">R</span></div>';
        }
        else
            e.innerHTML = '<div style="color:red">Пожалуйста, повторите ввод</div>';
    });
    $('[name="param-r"]').val('');
}

function clickTable(event) {
    if (event.target.classList[0] == "param-button") {
        $(event.currentTarget).find(".param-button").each(function () {
            if (this.disabled)
                this.disabled = false;
        });
        event.target.setAttribute("disabled", "true");
        $("[name='param-x']").val(event.target.innerText);
    }
}

$(() => {
    $("#form").submit(function submit(event) {
        if (!checkY())
            outputErrorY();
        if (!checkR())
            outputErrorR();
        event.preventDefault();
    });
});

function formSubmit() {
    let flag = false;
    if (!checkY()) {
        outputErrorY();
        flag = true;
    }
    else
        clearY();
    if (!checkR()) {
        outputErrorR();
        flag = true;
    }
    else
        clearR();
    if (!flag)
        document.getElementById("form").submit();
}

function canvasSubmit(event) {
    if (!checkR()) {
        outputErrorR();
        return;
    }
    else
        clearR();
    let rect = $("#canvas")[0].getBoundingClientRect();
    let paramR = $("[name='param-r']").val();
    let x = (event.clientX - rect.left - width / 2) / r * paramR;
    let y = (hight / 2 - (event.clientY - rect.top)) / r * paramR;
    $("[name='param-x']").val(x);
    $("[name='param-y']").val(y);
    document.getElementById("form").submit();
}

function check(input) {
    input.value = input.value.replace(/[^-0-9\,\.]/g, '');
}

function drawPoints() {
    let canvas = document.getElementById("canvas");
    let ctx = canvas.getContext("2d");

    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, width + extraValue, hight + extraValue);

    ctx.fillStyle = "#03899C";
    ctx.beginPath();
    ctx.moveTo(width / 2, hight / 2);
    ctx.lineTo(width / 2, hight / 2 + r / 2);
    ctx.arc(width / 2, hight / 2, r / 2, Math.PI / 2, Math.PI, false);
    ctx.lineTo(width / 2 - r / 2, hight / 2 - r);
    ctx.lineTo(width / 2, hight / 2 - r);
    ctx.lineTo(width / 2, hight / 2 - r / 2);
    ctx.lineTo(width / 2 + r / 2, hight / 2);
    ctx.lineTo(width / 2, hight / 2);
    ctx.stroke();
    ctx.fill();

    ctx.fillStyle = "#FFAE00";
    let values = $("#result-table td").toArray();
    for (let i = 0; i < values.length / 4; ++i) {
        ctx.beginPath();
        ctx.arc(values[i * 4].innerText * r / values[i * 4 + 2].innerText + width / 2, -values[i * 4 + 1].innerText * r / values[i * 4 + 2].innerText + hight / 2, 2, 0, Math.PI * 2, false);
        ctx.stroke();
        ctx.fill();
    }

    drawBase(ctx);
}

function drawBase(ctx) {

    ctx.beginPath();
    ctx.moveTo(0, hight / 2);
    ctx.lineTo(width + extraValue, hight / 2);
    ctx.lineTo(width - 10 + extraValue, hight / 2 - 5);
    ctx.moveTo(width + extraValue, hight / 2);
    ctx.lineTo(width - 10 + extraValue, hight / 2 + 5);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(width / 2, hight + extraValue);
    ctx.lineTo(width / 2, 0);
    ctx.lineTo(width / 2 - 5, 10);
    ctx.moveTo(width / 2, 0);
    ctx.lineTo(width / 2 + 5, 10);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(width / 2 + r, hight / 2 - 5);
    ctx.lineTo(width / 2 + r, hight / 2 + 5);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(width / 2 - r, hight / 2 - 5);
    ctx.lineTo(width / 2 - r, hight / 2 + 5);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(width / 2 - 5, hight / 2 + r);
    ctx.lineTo(width / 2 + 5, hight / 2 + r);
    ctx.stroke();

    ctx.fillStyle = "#03899C";
    ctx.font = "10px Arial";
    ctx.fillText("X", width - 10 + extraValue, hight / 2 - 15);
    ctx.fillText("Y", width / 2 - 18, 12);
    ctx.fillText("R", width / 2 + r - 5, hight / 2 + 15);
    ctx.fillText("R", width / 2 + 4, hight / 2 - r + 5);
    ctx.fillText("-R", width / 2 - r - 5, hight / 2 + 15);
    ctx.fillText("-R", width / 2 + 4, hight / 2 + r + 5);
    ctx.fillText("R/2", width / 2 + r / 2 - 5, hight / 2 + 15);
    ctx.fillText("R/2", width / 2 + 6, hight / 2 - r / 2 + 5);
    ctx.fillText("-R/2", width / 2 - r / 2 - 20, hight / 2 - 5);
    ctx.fillText("-R/2", width / 2 + 4, hight / 2 + r / 2 + 5);
}

$(() => {
    drawPoints();
    $("#result-table tr").mouseover((event) => {
        if (event.currentTarget.id == "table-header")
            return;
        event.currentTarget.style.backgroundColor = "#5FB0CF"; //#5FC0CE - #FFF
        let values = $(event.currentTarget).find("td").toArray();
        let canvas = document.getElementById("canvas");
        let ctx = canvas.getContext("2d");
        ctx.fillStyle = "red";
        ctx.beginPath();
        ctx.arc(values[0].innerText * r / values[2].innerText + width / 2, -values[1].innerText * r / values[2].innerText + hight / 2, 2, 0, Math.PI * 2, false);
        ctx.stroke();
        ctx.fill();
    }).mouseout((event) => {
        if (event.currentTarget.id == "table-header")
            return;
        event.currentTarget.style.backgroundColor = null;
        let values = $(event.currentTarget).find("td").toArray();
        let canvas = document.getElementById("canvas");
        let ctx = canvas.getContext("2d");
        ctx.fillStyle = "#FFAE00";
        ctx.beginPath();
        ctx.arc(values[0].innerText * r / values[2].innerText + width / 2, -values[1].innerText * r / values[2].innerText + hight / 2, 2, 0, Math.PI * 2, false);
        ctx.stroke();
        ctx.fill();
        drawPoints();
    });
});