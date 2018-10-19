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
        document.getElementById("form").submit(event);
}

function check(input) {
    input.value = input.value.replace(/[^-0-9\,\.]/g, '');
}

function connectionError() {
    $(".error-y").each((i, e) => {
        if (i == 0) {
            e.innerHTML = '<div style="color:red">Произошла ошибка</span></div>';
        }
        else
            e.innerHTML = '<div style="color:red">Проверьте подключение к сети</div>';
    });
}

function drawPoint(match) {
    alert(match);
}

/*$(document).on('submit','#form', function submit(event) {
    let y = checkY(), x = checkX(), r = checkR();
    if (!x || !y || !r) {
        outputError(x,y,r);
        event.preventDefault();
    }
});*/