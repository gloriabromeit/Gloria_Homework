// from data.js
var tableData = data;
// console.log(data);
// YOUR CODE HERE!
// var table = d3.select("#ufo-table");

// Get the value property of the input element

var tbody = d3.select("tbody");

// Console.log the weather data from data.js
console.log(data);


data.forEach(function(ufo) {
    console.log(ufo);
    var row = tbody.append("tr");
  
    Object.entries(ufo).forEach(function([key, value]) {
      console.log(key, value);
      var cell = row.append("td");
      cell.text(value);
    });
  });


// Select the button
var button = d3.select("#filter-btn");

button.on("click", function() {

  var inputElement = d3.select("#datetime");

  var inputValue = inputElement.property("value");
  
  console.log(inputValue);

  var filteredData = tableData.filter(person => person.datetime === inputValue);

  console.log(filteredData);
  var tdclear = d3.select("tbody");
  tdclear.html('');

  filteredData.forEach(function(ufo2) {

      console.log(ufo2);
      var row = tbody.append("tr");


      Object.entries(ufo2).forEach(function([keys, values]) {
        console.log(keys, values);
        var cell = row.append("td");
        cell.text(values);

      });
      });
    });



    var button = d3.select("#filter-btn-city");

    button.on("click", function() {
    
        // Select the input element and get the raw HTML node
      var inputElement = d3.select("#city");
        // Get the value property of the input element
      var inputValue = inputElement.property("value");
      
      console.log(inputValue);
    
      var filteredData = tableData.filter(person => person.city === inputValue);
    
      console.log(filteredData);
      var tdclear = d3.select("tbody");
      tdclear.html('');
    
      filteredData.forEach(function(ufo3) {
    
          console.log(ufo3);
          var row = tbody.append("tr");
    
    
          Object.entries(ufo3).forEach(function([keys, values]) {
            console.log(keys, values);
            var cell = row.append("td");
            cell.text(values);
    
          });
          });
        });

        var button = d3.select("#filter-btn-state");

        button.on("click", function() {
        
            // Select the input element and get the raw HTML node
          var inputElement = d3.select("#state");
            // Get the value property of the input element
          var inputValue = inputElement.property("value");
          
          console.log(inputValue);
        
          var filteredData = tableData.filter(person => person.state === inputValue);
        
          console.log(filteredData);
          var tdclear = d3.select("tbody");
          tdclear.html('');
        
          filteredData.forEach(function(ufo3) {
        
              console.log(ufo3);
              var row = tbody.append("tr");
        
        
              Object.entries(ufo3).forEach(function([keys, values]) {
                console.log(keys, values);
                var cell = row.append("td");
                cell.text(values);
        
              });
              });
            });