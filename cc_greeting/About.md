This project is a simple script which generates a SQL entry when a new player joins the server.

When a player joins, a SQL database is checked for the player's FiveM License. If any entry exists, the greeting is displayed. If it is a new player, a default is generated and displayed.
Players can update their greeting with "/setgreeting [greeting]", which will update the SQL database to show their new greeting, which will be displayed whenever they join the server. 
The command "/testgreeting" can be used to check the current greeting stored in the database.
