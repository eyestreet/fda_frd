$ ->

  console.log 'loading morris charts'

  Morris.Donut
    element: 'morris-donut-chart'
    data: [
      { label: 'Class I', value: $('#class_one_count').html() },
      { label: 'Class II', value: $('#class_two_count').html() },
      { label: 'Class III', value: $('#class_three_count').html() }
    ]
    colors: ['#5bc0de', '#faebcc', '#ebccd1']
    resize: true
