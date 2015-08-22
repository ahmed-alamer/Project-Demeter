//Type Ahead matching function as is from typeahead.js docs
var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substrRegex;
      // an array that will be populated with substring matches
      matches = [];
      // regex used to determine if a string contains the substring `q`
      substrRegex = new RegExp(q, 'i');
      // iterate through the pool of strings and for any string that
      // contains the substring `q`, add it to the `matches` array
      $.each(strs, function(i, str) {
        if (substrRegex.test(str.name)) {
          // the typeahead jQuery plugin expects suggestions to a
          // JavaScript object, refer to typeahead docs for more info
          matches.push({
            value: str.name
          });
        }
      });
      cb(matches);
    };
};

//This function is for full name typeaheads
var substringMatcherFullName = function(strs) {
  return function findMatches(q, cb) {
    var matches, substrRegex;
    // an array that will be populated with substring matches
    matches = [];
    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');
    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      var full_name = str.first_name + " " +str.last_name;
      if (substrRegex.test(full_name)) {
        // the typeahead jQuery plugin expects suggestions to a
        // JavaScript object, refer to typeahead docs for more info
        matches.push({
          value: full_name
        });
      }
    });
    cb(matches);
  };
};  

function bindTypeaheadFullName(domObject, resource) {
  $.ajax({
    url: "/"+resource+".json",
    method: "get",
    dataType: "json",
    contentType: "application/json",
    success: function (result) {
      projects = result;
      $("#" + domObject).typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        }, {
          displayKey: 'value',
          source: substringMatcherFullName(result)
      });
    },
    error: function (errorObj) {
      console.log(errorObj);
    }
  });  
}

function bindTypeahead (domObject, resource) {
  $.ajax({
    url: "/"+resource+".json",
    method: "get",
    dataType: "json",
    contentType: "application/json",
    success: function (result) {
      projects = result;
      $("#" + domObject).typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        }, {
          displayKey: 'value',
          source: substringMatcher(result)
      });
    },
    error: function (errorObj) {
      console.log(errorObj);
    }
  });
}