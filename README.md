Application Name: PMA

This application is configured to run either in the Development Environment or Production Environment using the SQLite database

To run an application server in the Production Environment use =>  'rails server -e production'
To run an application server in the Development Environment use => 'rails server' or 'rails server -e development'
Note: do not include the single quotation marks for the above commands

The user will initially be presented a Signup / Signin page

Brand new users should select(click) the Signup link and follow the prompts for email address, password, and password confirmation.

Once the user is an established user, the user should use the Signin link to initiate his/her session.

After the user has signed in, he/she will be presented a data entry page allowing the user to create new stock symbol entries.  Notice the
'Search' and 'Create' action links in the upper right of the page.

The user will click on the 'Create' link to create a new Stock Entry.

Upon successful entry of a valid stock symbol, a price, and a quantity, the application will dynamically retrieve stock information 
from http://finance.yahoo.com and present this information in a dynamic table (using ActiveScaffold).

The user will then be able to Edit, Delete, or Show information about each created record.

There are 3 physical columns in the table that can be sorted, either Ascending or Descending.  These are 'Stock Symbol', 'Purchased Price', and 'Quantity Purchased'.

The remaining columns are dynamically generated using the information from http://finance.yahoo.com.

The main Stock table is paginated, having a maximum of 15 entries per page.  This maximum is initially ignored if the user wishes to, initially, enter
a large series of Stock symbol entries.

Validations are provided to ensure that Stock symbols are unique, numeric fields remain numeric, and required fields are filled in by the user.



