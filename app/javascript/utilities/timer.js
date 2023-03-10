document.addEventListener('turbolinks:load', () => {
  let testPassagePage = document.querySelector(".test_passage")

  if(testPassagePage) {
    let timer = document.getElementById('timer')
    let testTime = 0 //timer.dataset.time
    let currentQuestionFirst = timer.dataset.currentQuestionFirst
    console.log(currentQuestionFirst)
    let seconds

    if(currentQuestionFirst) {seconds = 60}

    if(timer) {
      seconds = sessionStorage.seconds
      seconds ||= 60
      setInterval(() => {
        seconds --
        if(seconds <= 0) {
          seconds = 60

          if(testTime == 0) {
            sessionStorage.seconds = 60
            return  document.querySelector('form').submit()

          }
        }
        timer.innerHTML = `${testTime}:${seconds}`
        sessionStorage.setItem('seconds',seconds)
        console.log( sessionStorage.seconds)
      }, 1000)
    }
  }
})
