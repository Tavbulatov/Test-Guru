document.addEventListener('turbolinks:load', () => {
  let testPassagePage = document.querySelector(".test_passage")

  if(!testPassagePage) {
    sessionStorage.seconds = 60
  }


  if(testPassagePage) {
    let timer = document.getElementById('timer')
    let testTime = timer.dataset.time
    let seconds = sessionStorage.seconds

    setTimeout(() => {
      alert('Ваше время истекло')
      document.querySelector('form').submit()
    }, (testTime * 60) * 1000 )

    setInterval(() => {
      seconds --

      if(seconds == 0) {seconds = 60; testTime -- }

      timer.innerHTML = `${testTime - 1}:${seconds}`
      sessionStorage.setItem('seconds',seconds)
      console.log( sessionStorage.seconds)
    }, 1000)
  }
})
