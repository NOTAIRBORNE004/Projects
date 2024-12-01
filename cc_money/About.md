This script utilizes a SQL database to generate, store, and allow players to send each other money. When a player joins the server for the first time, they are assigned $25,000 starting
money. All player money is stored to the database based on the player's FiveM license number. 

Features:
  - Paycheck
    - Every ten minutes, players recieve a $1,500 paycheck
  - Pay other players
    - Players can use "/pay [TargetPlayerId] [Amount]" to send the player money. As a precaution, the script verifies the playerId is valid, and the player sending the money has
      sufficient funds. Both players are notified of the transaction, with the script advising both parties the username of the player who sent/was sent the money. In the scripts
      current form, players are able to pay themselves. This was done to ensure the script was functioning properly due to the fact I was testing the script alone.
  - A simple NUI was used to display the player's current balance in the top right of their screen. The NUI updates every five seconds.
  - Test/Dev Commands
    - "/testmoney" displays the user's current balance in the chat. This was originally used to verify the database was functioning properly prior to the NUI.
    - "/+setmoney" allows the player to set a custom balance. 
      
