
const questions = document.querySelectorAll(".faq-question");

questions.forEach((question) => {
    question.addEventListener("click", () => {
        const item = question.parentElement;

        document.querySelectorAll(".faq-item.active").forEach(openItem => {
            if (openItem !== item) openItem.classList.remove("active");
        });

        item.classList.toggle("active");
    });
});

