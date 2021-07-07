# The Diagon Alley Site

## About

This project is an online representation of Diagon alley, a fictional cobblestoned wizarding alley and shopping area in the Harry Potter universe. It is an app built using **HTML5**, **CSS3**(+ the Twitter Bootstrap 5 framework), **JavaScript** for front-end, and **Ruby on Rails(6)** along with PostgreSQl object-relational database system for the back-end. 

For production, the app is deployed using **Heroku**, with Cloudinary(integrated with Rail's active storage) as add-on for storing pictures.

## Models and Tables

There ares several models/tables used in this app, which are shown below in the picture. The first heading is the model name, the second within the bracket is the table name, and the bubbles are the table columns.

![Screenshot (327)](https://user-images.githubusercontent.com/64131298/124757500-43533580-df4b-11eb-9b08-653859fb7aba.png)

## Personas

There are 3 personas:
- Customer(a new wizard/witch who wants to shop!)
- Billing Clerk
- Owner
<br />

### Customer

- Customer can sign up to create a new account. If they are existing users they can sign-in using their email and password.
- Appropiate errors pop up if they try to sign up using an existing user's email, or if they leave the form blank.
- They can also sign-out whenever they want to.

***!! HP Trivia !!*** 

The sign-in and sign-up pages have a brick wall background to mimic Diagon Alley's entrance through the Leaky Cauldron. The background image of the homepage is an actual picture of Diagon Alley. 'Alohomora' is the spell to open up locks(thus is used to open up the page for you!)

(video)

- Customers can see the shops, shop categories and shop items by toggling them.
- They can add the shop items to cart(which is always visible on the LHS of the screen), and increase their quanitity. 
- When they are satisfied with the cart, they can checkout and confirm the order.
- After confirming, it will be visible in 'Pending Orders' until delivered.

***!! HP Trivia !!***

'Wingardium Leviosa' is a spell that makes objects levitate/fly to another position. Thus confirming the order means we are sending it away! 'Reverte' is a spell that reverses any magical change, so it is a button to go back to the homepage. 

(video)

- Walk-in customers' orders are made by a billing clerk, and the orders are shown in the pening/delivered sites.
- Finally, customers can sign out when they are finished.
<br />

### Clerk

- Clerks cannot make a new account on their own as their accounts are made by the owners. They can only sign-in.
- They can mark the pending orders(both online and walk-in) as delivered, and can see the orders they have delivered.

(video)

- Clerks can make orders for walk in customers as well, and have to specify the name of the customer who is ordering, who should already have an account.

(video)
<br />

### Owner

- Owners can also only sign-in. The app is built with an owner already created.
- The owner can add new shops/shop categories/shop items. An error is generated is the owner tries to sign out without a shop having atleast 1 category and 1 item.

(video)

- The owner can edit and delete any shops/shop category/shop item.

***!! HP Trivia !!***

'Duro' is the hardening Charm that turns an object to stone, thus confirming the edit we commit to any object.

(video)

-The owner can see all pending and delivered orders

(video)

- The owner can create new clerks and owners.

(video)

- The owner can see a list of all the users, and can edit the clerks/owners info there. On clicking on a customer, all their deliveries are shown.

(video)
