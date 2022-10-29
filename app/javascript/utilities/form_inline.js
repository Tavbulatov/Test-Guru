document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInLineLinkHandler)
    }

    let errors = document.querySelector('.resource-errors')

    if (errors) {
      let resourceId = errors.dataset.resourceId
      formInLineHandler(resourceId)
    }
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInLineHandler(testId)
  console.log(testId)
}

function formInLineHandler(testId) {
  let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  let testTitle = document.querySelector('.title-test[data-test-id="' + testId +'"]')
  let formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
console.log(testTitle)
  if (formInLine.classList.contains('hide')) {
    formInLine.classList.remove('hide')
    testTitle.classList.add('hide')
    link.textContent = 'Cancel'
  } else {
    formInLine.classList.add('hide')
    testTitle.classList.remove('hide')
    link.textContent = 'Edit'
  }
}
