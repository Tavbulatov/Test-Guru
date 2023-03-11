document.addEventListener('turbolinks:load', () => {
  const form = document.querySelector('.new_user')
  if(form) {
    const passwordConfirmation = form.elements.user_password_confirmation
    const password = form.elements.user_password
    const octiconCheck = form.querySelectorAll('.octicon-check')
    const octiconThumbsdown = form.querySelectorAll('.octicon-thumbsdown')

    if(passwordConfirmation && password) {
      passwordConfirmation.addEventListener('input',checkPassword)
      password.addEventListener('input',checkPassword)}

    function checkPassword() {
      if(passwordConfirmation.value !== password.value && passwordConfirmation.value !== ''){
        for(let i = 0; i < octiconCheck.length; i++){
          octiconCheck[i].classList.add('hide')
          octiconThumbsdown[i].classList.remove('hide')
        }
      }
      else if(passwordConfirmation.value === password.value && passwordConfirmation.value !== '') {
        for(let i = 0; i < octiconCheck.length; i++){
          octiconThumbsdown[i].classList.add('hide')
          octiconCheck[i].classList.remove('hide')
        }
      } else {
          for(let i = 0; i < octiconCheck.length; i++){
            octiconThumbsdown[i].classList.add('hide')
            octiconCheck[i].classList.add('hide')
        }
      }
    }
  }
})
