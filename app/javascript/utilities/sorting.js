document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title')
  if(control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  let table = document.querySelector('table')
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  //сортировка элементов таблицы без заголовка
  for(let i = 1; i < rows.length; i++) {sortedRows.push(rows[i])}

  //сортировка по возрастанию и убыванию
  if(this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }
  //создание новой таблицы
  let sortedTable = document.createElement('table')

  //создание клаасса для таблицы
  sortedTable.classList.add('table')
  sortedTable.classList.add('table-hover')

  //создание контейнера и тела
  let head = document.createElement('thead')
  let body = document.createElement('tbody')

  //добавление в таблицу контейнера и тела
  sortedTable.appendChild(head)
  sortedTable.appendChild(body)

  //добавление в контейнер заголовка
  head.appendChild(rows[0])

  //добавление в тело элементов таблицы
  for(let i = 0; i < sortedRows.length; i++) {
    body.appendChild(sortedRows[i])
  }

  //замена текущей таблицы(вызывая у нее же функцию) на новую созданную выше
  table.parentNode.replaceChild(sortedTable, table)
 }

//фун-я сравнения по возрастанию
function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if(testTitle1 < testTitle2) {return -1}
  if(testTitle1 > testTitle2) {return 1}
  return 0
}

//фун-я сравнения по убыванию
function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if(testTitle1 < testTitle2) {return 1}
  if(testTitle1 > testTitle2) {return -1}
  return 0
}
