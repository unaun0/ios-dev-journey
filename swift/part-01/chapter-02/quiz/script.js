const correctAnswers = {
    q1: 1,
    q2: 0,
    q3: 1,
    q4: 0,
    q5: 1,
    q6: 1,
    q7: 3,
    q8: 0,
    q9: 1,
    q10: 0,
    q11: 1,
    q12: 0,
    q13: 1,
    q14: 0,
    q15: 0,
    q16: 0,
    q17: 2,
    q18: 1,
    q19: 2,
    q20: 0,
    q21: 0,
    q22: 3,
    q23: 0,
    q24: 1,
    q25: 2,
    q26: 2,
    q27: 0,
    q28: 2,
    q29: 0,
    q30: 2,
    q31: 0,
    q32: 0,
    q33: 2,
    q34: 3,
    q35: 0,
    q36: 0,
    q37: 3,
    q38: 1,
    q39: 2,
    q40: 2,
    q41: 1,
    q42: 1,
    q43: 0,
    q44: 0,
    q45: 0,
    q46: 0,
    q47: 1,
    q48: 0,
    q49: 1,
    q50: 1,
    q51: 1,
    q52: 1,
    q53: 2,
    q54: 1,
    q55: 1,
    q56: 2
};

function checkAnswers() {
    let score = 0;
    let total = Object.keys(correctAnswers).length;
    
    for (let key in correctAnswers) {
        let radios = document.getElementsByName(key);
        let selectedValue = null;
        
        for (let i = 0; i < radios.length; i++) {
            if (radios[i].checked) {
                selectedValue = i;
                break;
            }
        }
        
        if (selectedValue !== null && selectedValue === correctAnswers[key]) {
            score++;
        }
    }
    
    let percent = Math.round((score / total) * 100);
    let grade = "";
    let message = "";
    
    if (percent >= 90) {
        grade = "Отлично 😊";
        message = "Превосходный результат!";
    } else if (percent >= 70) {
        grade = "Хорошо 🙂";
        message = "Хороший результат, но есть над чем поработать.";
    } else if (percent >= 50) {
        grade = "Удовлетворительно 🙁";
        message = "Стоит повторить материал и пройти тест еще раз.";
    } else {
        grade = "Неудовлетворительно 😖";
        message = "Рекомендуется перечитать главу и повторить основные понятия.";
    }
    
    let resultDiv = document.getElementById("result");
    resultDiv.style.display = "block";
    resultDiv.innerHTML = `
        <h3>Результат: ${grade}</h3>
        <p>Вы набрали ${score} из ${total} (${percent}%)</p>
        <p>${message}</p>
    `;
    
    if (percent >= 70) {
        resultDiv.className = "result-success";
    } else {
        resultDiv.className = "result-fail";
    }
    
    resultDiv.scrollIntoView({ behavior: 'smooth' });
}

function clearResult() {
    document.getElementById("result").style.display = "none";
    document.getElementById("result").innerHTML = "";
}