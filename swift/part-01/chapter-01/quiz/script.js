const correctAnswers = {
    q1: 1,
    q2: 2,
    q3: 1,
    q4: 3,
    q5: 1,
    q6: 1,
    q7: 2,
    q8: 2,
    q9: 1,
    q10: 2
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
        grade = "Отлично 🌟";
        message = "Превосходный результат! Вы отлично усвоили материал.";
    } else if (percent >= 70) {
        grade = "Хорошо 👍";
        message = "Хороший результат! Но есть над чем поработать.";
    } else if (percent >= 50) {
        grade = "Удовлетворительно 📚";
        message = "Стоит повторить материал и пройти тест еще раз.";
    } else {
        grade = "Неудовлетворительно 📖";
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