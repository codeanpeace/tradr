$(document).ready(function(){
  var refresh_stocks_table = function(){
    $.ajax({
      dataType: "script",
      type: "get",
      url: "/users/refresh_table"
    });
  };

  // $("#refresh_stocks").on('click', refresh_stocks_table);

  setInterval(refresh_stocks_table, 1000);


  // make into hash with key as symbol and value as data array
  var morris_data_hash = {};


  var create_graph = function(){
    var symbol = $(this)[0].value;
    console.log(symbol);
    $.ajax({
      url: "/stocks/graph/" + symbol,
      type: "GET",
      dataType: "json"
    }).done(function(stock_data){
      var body = $('body');
      body.append('<div id="' + symbol + '_graph" class="graph"/>');
      // if the key value pair doesn't exist, create it
      if(!morris_data_hash[symbol]){
        morris_data_hash[symbol] = [];
      }
      var morrisTemplate = {
        element: symbol + '_graph',
        data: morris_data_hash[symbol],
        xkey: 'time',
        xLabels: 'time',
        ykeys: ['latest_price'],
        ymin: '0',
        labels: ['Real Time Stock Performance']
      };
      morrisTemplate.data.push(stock_data);
      Morris.Line(morrisTemplate);
    });
  };

  var refresh_graphs = function(){
    $(".graph").remove();
    $("input:checked").each(create_graph);
  };

  setInterval(refresh_graphs, 5000);


  $("input[type=checkbox]").on("click", create_graph);


  // setInterval(refresh_stocks_chart, 1000);
});