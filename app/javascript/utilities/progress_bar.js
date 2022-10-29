document.addEventListener('turbolinks:load', ()=> {
  const progressBar = document.getElementById('progress-bar')

  if(progressBar) {
    let questionsCount = progressBar.dataset.questionsCount
    let remainingQuestionsSumm = progressBar.dataset.remainingQuestionsSumm
    progressBar.style.width = `${(remainingQuestionsSumm * 100 ) / questionsCount}%`
  }
})
