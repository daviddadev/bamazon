// node modules //
// Getting the hang of this //
var mysql = require('mysql');
var inquirer = require('inquirer');

// sql connection //
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "dave",
    database: "bamazon_db"
});

// send connection
connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    printItems(function(){
      itemSelect();
    });
});


// global variables //
var shoppingCart = [];
var totalCost = 0;

// Generic funtion set up //
function itemSelect(){
  var items = [];

  connection.query('SELECT product_name FROM product', function(err, res){
    if (err) throw err;
    // add to an array
    for (var i = 0; i < res.length; i++) {
      items.push(res[i].product_name)
    }

//  function to prompt the user as to how many of each item they want
function howManyItems(itemNames){
  
  var item = itemNames.shift();
  var itemStock;
  var department;
  //query mysql to get the current stock, price, and department of the item
  connection.query('SELECT stock_quantaties, price, department_name FROM product WHERE ?', {
    product_name: item
  }, function(err, res){
    if(err) throw err;
    //set stock, price, and department in a variable
    itemStock = res[0].stock_quantaties;
    itemCost = res[0].price;
    department = res[0].department_name;
  });
  //prompt the user to ask how many of the item they would like
  inquirer.prompt([
    {
    name: 'amount',
    type: 'text',
    message: 'How many ' + item + ' would you like to purchase?',



function checkout(){
 
  if (shoppingCart.length != 0) {
    var grandTotal = 0;

    console.log('*****************************************');
    console.log('Here is your cart. Are you ready to checkout?');
    for (var i = 0; i < shoppingCart.length; i++) {
      var item = shoppingCart[i].item;
      var amount = shoppingCart[i].amount;
      var cost = shoppingCart[i].itemCost.toFixed(2);
      var total = shoppingCart[i].total.toFixed(2);
      var itemCost = cost * amount;
      grandTotal += itemCost;
      console.log(amount + ' ' + item + ' ' + '$' + total);
    }

    console.log('Total: $' + grandTotal.toFixed(2));

    inquirer.prompt([
      {
        name: 'checkout',
        type: 'list',
        message: 'Ready to checkout?',
        choices: ['Checkout', 'Edit Cart']
      }
    ]).then(function(res){
    
        if (res.checkout === 'Checkout') {
            updateDB(grandTotal);
        } else {
 
          editCart();
        }
      });
  } else {
 
    inquirer.prompt([
      {
      name: 'choice',
      type: 'list',
      message: 'Would you like to keep shopping or leave?',
      choices: ['Keep Shopping', 'Leave']
      }
    ]).then(function(user){
        
        if (user.choice === 'Keep Shopping') {
          printItems(function(){
            userSelectsItem();
          });
        } else {
        
          console.log('Thanks for looking!');
          connection.end();
        }
    });

  }
}




checkout function
    checkout();
  }
}