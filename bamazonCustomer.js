// Require modules.
var mysql = require('mysql');
var inquirer = require('inquirer');
// Connection to Database.
var connection = mysql.createConnection({
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: 'isoto0808',
	database: 'bamazon_db'
})
// Testing connection.
connection.connect(function(err){
	if(err) throw err;
	console.log("Successfuly connected to Bamazon!");
	createTable();
})
// Displays table on 'cmd'.
var createTable = function(){
	// MySQL string query
	connection.query("SELECT * FROM products", function(err,res){
		for(var i = 0; i < res.length; i++){
			console.log(res[i].item_id + " | " + res[i].product_name + " | " + 
				res[i].deparment_name + " | " + res[i].price + " | " + res[i].stock_quantity + "\n");
		}
	promptUser(res);
	})
}
// Prompts the user to make a selection on a product.
var promptUser = function(res){
	inquirer.prompt([{
		type: 'input',
		name: 'choice',
		message: "Welcome to Bamazon, select an item from the store! (exit app with: e)"
	}]).then(function(answer){
		var correct = false;
		// Give user the option to exit the app with a simple command.
		// If selection is made with upper case, lowerCase() will convert the letter to lower case. 
		if(answer.choice.toLowerCase() == "e"){
			connection.end();
		}
		// This loops runs thru the product list.
		for(var i = 0; i < res.length; i++){
			if(res[i].product_name == answer.choice){
				correct = true;
				// Sets the input choice of the user.
				var product = answer.choice;
				// ID is the chosen product.
				var id = i;
				// Prompt user the quantity amount.
				inquirer.prompt({
					type: 'input',
					name: 'quantity',
					// User has to option to add the amount of items.
					message: 'How many would you like to add to the shopping cart?',
					validate: function(value){
						if(isNaN(value) == false){
							return true;
						} else {
							return false;
						}
					}
				}).then(function(answer){
					if((res[id].stock_quantity - answer.quantity) > 0){
						// MySQL string, and response arguments pass to SQL.
						connection.query("UPDATE products SET stock_quantity='" + (res[id].stock_quantity - answer.quantity) + "' WHERE product_name= '" + product + "'", function(err,res2){
							// Displays to the user the item has been purchased
							console.log("Product Purchased!");
							createTable();
						})
					} else {
						console.log("Nope! try again!");
						promptUser(res);
					}
				})
			}
		}
		if(i == res.length && correct == false){
				console.log("Error, Try again!");
				promptUser(res);
		}
	})
}