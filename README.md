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

<hr />

### Customer

- Customer can sign up to create a new account. If they are existing users they can sign-in using their email and password.
- Appropiate errors pop up if they try to sign up using an existing user's email, or if they leave the form blank.
- They can also sign-out whenever they want to.

***!! HP Trivia !!*** 

The sign-in and sign-up pages have a brick wall background to mimic Diagon Alley's entrance through the Leaky Cauldron. The background image of the homepage is an actual picture of Diagon Alley. 'Alohomora' is the spell to open up locks(thus is used to open up the page for you!)

https://user-images.githubusercontent.com/64131298/124811641-4caac500-df80-11eb-8d29-dfd4e31def70.mp4

<hr />

- Customers can see the shops, shop categories and shop items by toggling them.
- They can add the shop items to cart(which is always visible on the LHS of the screen), and increase their quanitity. 
- When they are satisfied with the cart, they can checkout and confirm the order.
- After confirming, it will be visible in 'Pending Orders' until delivered.

***!! HP Trivia !!***

'Wingardium Leviosa' is a spell that makes objects levitate/fly to another position. Thus confirming the order means we are sending it away! 'Reverte' is a spell that reverses any magical change, so it is a button to go back to the homepage. 

https://user-images.githubusercontent.com/64131298/124812657-85976980-df81-11eb-9ae3-791b659c08e8.mp4

<hr />

- Walk-in customers' orders are made by a billing clerk, and the orders are shown in the pening/delivered sites.
- Finally, customers can sign out when they are finished.
<hr />

### Clerk

- Clerks cannot make a new account on their own as their accounts are made by the owners. They can only sign-in.
- They can mark the pending orders(both online and walk-in) as delivered, and can see the orders they have delivered.

https://user-images.githubusercontent.com/64131298/124813229-4289c600-df82-11eb-8840-c514e906086b.mp4

<hr />

- Clerks can make orders for walk in customers as well, and have to specify the name of the customer who is ordering, who should already have an account.

https://user-images.githubusercontent.com/64131298/124815407-dbb9dc00-df84-11eb-9b61-752f0ffe5c63.mp4

<hr />

### Owner

- Owners can also only sign-in. The app is built with an owner already created.
- The owner can add new shops/shop categories/shop items. An error is generated is the owner tries to sign out without a shop having atleast 1 category and 1 item.

https://user-images.githubusercontent.com/64131298/124820170-c0ea6600-df8a-11eb-8bfb-e0a9d865e69c.mp4

https://user-images.githubusercontent.com/64131298/124820613-5554c880-df8b-11eb-8e8f-f52997dfe30a.mp4

<hr />

- The owner can edit and delete any shops/shop category/shop item.

***!! HP Trivia !!***

'Duro' is the hardening Charm that turns an object to stone, thus confirming the edit we commit to any object.

https://user-images.githubusercontent.com/64131298/124822244-4707ac00-df8d-11eb-8ea8-4fc1510cdc05.mp4

<hr />

-The owner can see all pending and delivered orders
- The owner can create new clerks and owners.
- The owner can see a list of all the users, and can edit the clerks/owners info there. On clicking on a customer, all their deliveries are shown.

(video)

<hr />

<br />

## The End!

**_\~tadaaah\~_** that's my project!

Heroku Link: https://diagon-alley-site.herokuapp.com/ (may take a while to open for the first time)

A special thanks and a huge shoutout to the Pupilfirst team for selecting me for their WD201 course(https://www.pupilfirst.school/courses/123/curriculum), and for their excellent guidance in **Ruby on Rails(6)**!


