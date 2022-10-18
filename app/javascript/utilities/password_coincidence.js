document.addEventListener('turbolinks:load', () => {
  var user_password_confirmation = document.getElementById('user_password_confirmation')
})
user_password_confirmation.addEventListener('input',checkPassword)

let user_password = document.getElementById('user_password')
let octicon_check = document.querySelectorAll('.octicon-check')
let octicon_thumbsdown = document.querySelectorAll('.octicon-thumbsdown')

function checkPassword() {
  if(user_password_confirmation.value) {
    if(user_password_confirmation.value !== user_password.value){
      for(let i = 0; i < octicon_thumbsdown.length; i++){
        octicon_check[i].classList.add('hide')
        octicon_thumbsdown[i].classList.remove('hide')
      }
    }
    else if(user_password_confirmation.value === user_password.value) {
      for(let i = 0; i < octicon_check.length; i++){
        octicon_thumbsdown[i].classList.add('hide')
        octicon_check[i].classList.remove('hide')
      }
    }
  } else {
  for(let i = 0; i < octicon_check.length; i++){
    octicon_thumbsdown[i].classList.add('hide')
    octicon_check[i].classList.add('hide')
  }
 }
}
