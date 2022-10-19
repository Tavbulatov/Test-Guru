document.addEventListener('turbolinks:load', () => {
  let user_password_confirmation = document.getElementById('user_password_confirmation')
  user_password_confirmation.addEventListener('input',checkPassword)
})

function checkPassword() {
  let password = document.getElementById('user_password')
  let password_confirmation = document.getElementById('user_password_confirmation')
  let octicon_check = document.querySelectorAll('.octicon-check')
  let octicon_thumbsdown = document.querySelectorAll('.octicon-thumbsdown')

  if(password_confirmation.value !== password.value && password_confirmation.value !== ''){
    for(let i = 0; i < octicon_thumbsdown.length; i++){
      octicon_check[i].classList.add('hide')
      octicon_thumbsdown[i].classList.remove('hide')
    }
  }
  else if(password_confirmation.value === password.value) {
    for(let i = 0; i < octicon_check.length; i++){
      octicon_thumbsdown[i].classList.add('hide')
      octicon_check[i].classList.remove('hide')
    }
  } else {
      for(let i = 0; i < octicon_check.length; i++){
        octicon_thumbsdown[i].classList.add('hide')
        octicon_check[i].classList.add('hide')
    }
  }
}
