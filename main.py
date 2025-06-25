import mysql.connector
from mysql.connector import Error
from tabulate import tabulate

def connect_to_database():
    """Establish a connection to the MySQL database."""
    try:
        connection = mysql.connector.connect(
            host="localhost", 
            user="root",      
            password="Saiyam20_", 
            database="Minecraft" 
        )
        if connection.is_connected():
            print("Successfully connected to the database!")
        return connection
    except Error as e:
        print(f"Error while connecting to the database: {e}")
        return None

def execute_query(connection, query):
    """Execute a given SQL query."""
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        if "SELECT" in query.upper():
            # Fetch results for SELECT queries
            results = cursor.fetchall()
            for row in results:
                print(row)
        else:
            # Commit changes for INSERT, UPDATE, DELETE queries
            connection.commit()
            print("Query executed successfully!")
    except Error as e:
        print(f"Error executing query: {e}")
    finally:
        cursor.close()

def add_new_player(connection):
    """Adds a new player."""
    print("Welcome to BondBrothers Minecraft!")
    
    try:
        pid = int(input("Enter Player ID: "))
        gamertag = input("Enter Gamertag: ")

        skin_path = input("Enter the file path of the player's skin image: ")
        with open(skin_path, "rb") as file:
            skin = file.read()
        
        skin_hex = skin.hex()   
        
        query = f"""
            INSERT INTO PLAYERS (Pid, skin, gamertag)
            VALUES ({pid}, UNHEX('{skin_hex}'), '{gamertag}');
            """
        
        # query = f"""
        #     INSERT INTO PLAYER (Pid, gamertag)
        #     VALUES ({pid}, '{gamertag}');
        #     """
            
        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
    except FileNotFoundError:
        print("Error: Skin file not found. Please check the file path.")
    except ValueError:
        print("Error: Invalid input. Please enter correct values.")
        
def add_new_world(connection, pid):
    """Adds a new world."""
    try:
        owner_pid = pid
        wname = input("Enter World Name: ")
        def_gamemode = input("Enter Default Gamemode (or leave empty): ")
        difficulty = input("Enter Difficulty (or leave empty): ")
        cheats = (input("Allow Cheats? (1 for Yes, 0 for No, or leave empty): "))
        tickspeed = (input("Enter Tick Speed (or leave empty): "))

        # Handle empty inputs and convert them to NULL
        def_gamemode = f"'{def_gamemode}'" if def_gamemode else "'survival'"
        difficulty = f"'{difficulty}'" if difficulty else "'normal'"
        cheats = cheats if cheats else 0
        tickspeed = tickspeed if tickspeed else 20
        
        # Define the query using f-string
        query = f"""
        INSERT INTO WORLD (
            Owner_pid, Wname,
            Def_gamemode, Difficulty, Cheats, Tickspeed
        )
        VALUES (
            {owner_pid}, '{wname}',
            {def_gamemode}, {difficulty}, {cheats}, {tickspeed}
        );
        """
            
        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
    except ValueError:
        print("Error: Invalid input. Please enter correct values.")     
        
def show_my_worlds(connection, pid):   
    """Shows list of world"""
    try:
        # Insert query
        query = f"""
        SELECT Wname, Spawn_x_coord, Spawn_y_coord, Spawn_z_coord, Def_gamemode, Difficulty, Cheats, Tickspeed
        FROM WORLD WHERE
        Owner_pid = {pid};
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        
        if results:
             print(tabulate(results, headers=[
                "Wname", "Spawn_x_coord", "Spawn_y_coord", "Spawn_z_coord",
                "Def_gamemode", "Difficulty", "Cheats", "Tickspeed", 
                "Create_year", "Create_month", "Create_date", "Create_time"
            ], tablefmt="grid"))
        else:
            print(f"No worlds found for PID {pid}.")
    except Error as e:
        print(f"Error: {e}")
        
def delete_world(connection, pid):
    """Delete a world"""
    try:
        wname = input("Enter World Name: ")
        
        # Check if the given pid is the owner of the world
        query_check_owner = f"""
        SELECT * FROM WORLD WHERE Owner_pid = {pid} AND Wname = '{wname}';
        """
        # result = execute_query(connection, query_check_owner)
        cursor = connection.cursor()
        cursor.execute(query_check_owner)
        result = cursor.fetchall()
        cursor.close()
        
        # If no result is returned, it means the pid is not the owner
        if not result:
            print("Error: You are not the owner of this world.")
            return
        
        # If the owner matches, proceed with the deletion
        query_delete = f"""
        DELETE FROM WORLD WHERE Owner_pid = {pid} AND Wname = '{wname}';
        """
        execute_query(connection, query_delete)
        print(f"World '{wname}' has been deleted successfully.")
        
    except Error as e:
        print(f"Error: {e}")
        
def update_spawn(connection, pid):
    """Updates player's spawn."""
    try:
        world_name = input("Enter a world name: ")
        x_coord = input("Enter new Spawn_x_coord: ")
        y_coord = input("Enter new Spawn_y_coord: ")
        z_coord = input("Enter new Spawn_z_coord: ")

        # Insert query
        query = f"""
        UPDATE WORLD SET
        Spawn_x_coord = {x_coord},
        Spawn_y_coord = {y_coord},
        Spawn_z_coord = {z_coord}
        WHERE Owner_pid = {pid} AND Wname = '{world_name}';
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
    except ValueError:
        print("Error: Invalid input. Please enter correct values.")
    
def add_new_friend(connection, pid):
    """Adds a new friend"""
    try:
        friend_gamer_tag = input("Enter friends gamer tag: ")
        friend_pid = get_player_id(connection, friend_gamer_tag)
        
        # Insert query
        query = f"""
        INSERT INTO FRIENDSHIP (PID1, PID2)
        VALUES ({pid}, {friend_pid});
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")

def delete_friend(connection, pid):
    """Delete a friend"""
    try:
        friend_gamer_tag = input("Enter friends gamer tag: ")
        friend_pid = get_player_id(connection, friend_gamer_tag)
        
        # Insert query
        query = f"""
        DELETE FROM FRIENDSHIP WHERE
        (PID1 = "{pid}" AND PID2 = "{friend_pid}") 
        OR
        (PID1 = "{friend_pid}" AND PID2 = "{pid}");
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
        
def show_friends(connection, pid):
    """Shows list of friends"""
    try:
        # Insert query
        query = f"""
        SELECT PID2 FROM FRIENDSHIP WHERE
        PID1 = {pid};
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results1 = cursor.fetchall()
        cursor.close()
        
        query = f"""
        SELECT PID1 FROM FRIENDSHIP WHERE
        PID2 = {pid};
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results2 = cursor.fetchall()
        cursor.close()
        
        results = results1 + results2
        
        results_names = []
        
        for result in results:
            friend_pid = result[0]
            friend_gamer_tag = get_gamertag_by_pid(connection, friend_pid)
            results_names.append((friend_gamer_tag,))
        
        if results_names:
            print(tabulate(results_names, headers=["Friend_Name"], tablefmt="grid"))
        else:
            print(f"No friends found for PID {pid}.")
    except Error as e:
        print(f"Error: {e}")
        
def buy_minecoins(connection, pid):
    """Buys minecoins"""
    try:
        amount = int(input("Enter amount of minecoins to buy: "))
        # Insert query
        query = f"""
        UPDATE PLAYER SET minecoins = minecoins + {amount} WHERE Pid = {pid};
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
    except ValueError:
        print("Error: Invalid input. Please enter correct values.")
        
def show_mobs(connection):
    """Shows list of mobs"""
    try:
        query = f"""
        SELECT MName, Type, Max_HP, Base_Damage
        FROM MOB;
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        
        if results:
            print(tabulate(results, headers=["Mob_Name", "Type", "Mob_Health", "Mob_Damage"], tablefmt="grid"))
        else:
            print("No mobs found in the game.")
    except Error as e:
        print(f"Error: {e}")
        
def get_item_name_by_id(connection, item_id):
    """Gets item name by id"""
    try:
        query = f"""
        SELECT Iname
        FROM ITEM
        WHERE Item_id = {item_id};
        """

        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchone()
        cursor.close()
        
        if result:
            return result[0]
        else:
            return None
    except Error as e:
        print(f"Error: {e}")
        return None
        
def get_flammable_blocks(connection):
    """Shows list of flammable blocks"""
    try:
        query = f"""
        SELECT Item_id
        FROM BLOCK
        WHERE Flammable = 1;
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results_id = cursor.fetchall()
        cursor.close()
        
        results = []
        
        for result_id in results_id:
            item_id = result_id[0]
            item_name = get_item_name_by_id(connection, item_id)
            results.append((item_name,))
        
        if results:
            print(tabulate(results, headers=["Bname"], tablefmt="grid"))
        else:
            print("No flammable blocks found in the game.")
    except Error as e:
        print(f"Error: {e}")
        
def search_biomes(connection):
    """Shows list of biomes of particular type"""
    try:
        biome_type = input("Enter biome type: ")
        
        query = f"""
        SELECT Bname
        FROM BIOME WHERE BType = '{biome_type}';
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        
        if results:
            print(tabulate(results, headers=["Bname"], tablefmt="grid"))
        else:
            print("No biomes found in the game.")
    except Error as e:
        print(f"Error: {e}")
        
def mob_with_max_damage(connection):
    """Shows mob with maximum damage"""
    try:
        query = f"""
        SELECT MName, Base_Damage
        FROM MOB
        ORDER BY Base_Damage DESC
        LIMIT 1;
        """

        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchone()
        cursor.close()
        
        if result:
            print(f"Mob with maximum damage: {result[0]} - Damage: {result[1]}")
        else:
            print("No mobs found in the game.")
    except Error as e:
        print(f"Error: {e}")
    
def search_in_items(connection):
    """Searches for items in the game"""
    try:
        search_term = input("Enter search term: ")
        
        query = f"""
        SELECT Iname, Itype
        FROM ITEM
        WHERE Iname LIKE '%{search_term}%'
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        
        if results:
            print(tabulate(results, headers=["Iname", "Itype"], tablefmt="grid"))
        else:
            print(f"No items found with search term: {search_term}")
    except Error as e:
        print(f"Error: {e}")
        
def get_stats(connection,pid):
    """Get stats of player"""
    try:
        query = f"""
        SELECT 
            Pid,
            SUM(Blocks_placed) AS Total_Blocks_Placed,
            SUM(Items_crafted) AS Total_Items_Crafted,
            SUM(Distance_travelled) AS Total_Distance_Travelled
        FROM 
            PLAYER_INSTANCE
        WHERE 
            Pid = {pid}
        GROUP BY 
            Pid;
        """

        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        
        if results:
            print(tabulate(results, headers=[
                "Pid", "Total_Blocks_Placed", "Total_Items_Crafted", "Total_Distance_Travelled"
            ], tablefmt="grid"))
        else:
            print(f"No Stats found for PID {pid}.")
    except Error as e:
        print(f"Error: {e}")


def get_player_id(connection, gamertag):
    """Gets the player id from database using gamertag"""
    try:
        # Query to get player id from gamertag
        query = f"""
        SELECT Pid
        FROM PLAYER
        WHERE Gamertag = '{gamertag}';
        """

        cursor = connection.cursor()
        cursor.execute(query)

        result = cursor.fetchone()
        if result:
            return result[0] 
        else:
            print(f"No player found with gamertag: {gamertag}")
            return None
    except Error as e:
        print(f"Error: {e}")
        
def get_gamertag_by_pid(connection, friend_pid):
    """Gets the player gamer tag from database using player id"""
    try:
        # Query to get player id from gamertag
        query = f"""
        SELECT gamertag
        FROM PLAYER
        WHERE Pid = '{friend_pid}';
        """

        cursor = connection.cursor()
        cursor.execute(query)

        result = cursor.fetchone()
        if result:
            return result[0] 
        else:
            print(f"No player found with gamertag: {gamertag}")
            return None
    except Error as e:
        print(f"Error: {e}")

def kill_mob(connection):
    """Getting max or min kills """
    # opn = input("Enter 'max' or 'min' to get the max or min kills: ")
    operations = {
        'max': 'MAX',
        'min': 'MIN',
        'avg': 'AVG',
        'sum': 'SUM'
    }

    opn = input("Enter 'max', 'min','avg' or 'sum' to get the respective kills: ").lower()

    if opn not in operations:
        print("Invalid input. Please enter 'max', 'min', or 'avg'.")
        return
    
    try:
        cursor = connection.cursor()
        query_map = {
        "max": """
            SELECT Mname, SUM(Count) as kill_count
            FROM KILLS
            GROUP BY Mname
            ORDER BY kill_count DESC
            LIMIT 1;
        """,
        "min": """
            SELECT Mname, SUM(Count) as kill_count
            FROM KILLS
            GROUP BY Mname
            ORDER BY kill_count ASC
            LIMIT 1;
        """,
         "avg": """
            SELECT Mname, AVG(Count) as avg_kills
            FROM KILLS
            GROUP BY Mname
            ORDER BY avg_kills DESC;
        """,
        "sum": """
            SELECT Mname, SUM(Count) as total_kills
            FROM KILLS
            GROUP BY Mname
            ORDER BY total_kills DESC;
        """
    }
        
        query= query_map[opn]
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        print(tabulate(results, headers=["Mname", "kill_count"], tablefmt="grid"))

    except Error as e:
        print(f"Error: {e}")

def change_mob_health(connection):
    """Change mob health"""
    try:
        mname = input("Enter mob name: ")
        health = int(input("Enter new health: "))
        
        # Insert query
        query = f"""
        UPDATE MOB SET Max_HP = {health} WHERE Mname = '{mname}';
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
    except ValueError:
        print("Error: Invalid input. Please enter correct values.")

def update_item_texture():
    """Update item texture"""
    try:
        item_id = input("Enter item ID: ")
        skin_path = input("Enter the file path of the item's texture image: ")
        with open(skin_path, "rb") as file:
            skin = file.read()
        
        skin_hex = skin.hex()   
        
        # Insert query
        query = f"""
        UPDATE ITEM SET Texture = '{skin_hex}' WHERE Item_id = {item_id};
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
        
def acquire_item(connection):
    """Getting max or min item acquisitions or sum/avg of item acquisitions."""
    
    # Available operations
    operations = {
        'max': 'MAX',
        'min': 'MIN',
        'avg': 'AVG',
        'sum': 'SUM'
    }

    # Taking input from user
    opn = input("Enter 'max', 'min', 'avg' or 'sum' to get the respective item acquisitions: ").lower()

    if opn not in operations:
        print("Invalid input. Please enter 'max', 'min', 'avg', or 'sum'.")
        return
    
    try:
        cursor = connection.cursor()
        
        # Define the queries for each operation
        query_map = {
            "max": """
                SELECT Item_id, MAX(Count) as max_acquired
                FROM ACQUIRES
                GROUP BY Item_id
                ORDER BY max_acquired DESC
                LIMIT 1;
            """,
            "min": """
                SELECT Item_id, MIN(Count) as min_acquired
                FROM ACQUIRES
                GROUP BY Item_id
                ORDER BY min_acquired ASC
                LIMIT 1;
            """,
            "avg": """
                SELECT Item_id, AVG(Count) as avg_acquired
                FROM ACQUIRES
                GROUP BY Item_id
                ORDER BY avg_acquired DESC;
            """,
            "sum": """
                SELECT Item_id, SUM(Count) as total_acquired
                FROM ACQUIRES
                GROUP BY Item_id
                ORDER BY total_acquired DESC;
            """
        }
        
        # Get the query based on user input
        query = query_map[opn]
        cursor.execute(query)
        
        # Fetch the results
        results = cursor.fetchall()
        cursor.close()

        # Print the results in tabular format
        print(tabulate(results, headers=["Item_id", "acquisition_count"], tablefmt="grid"))
        
    except Error as e:
        print(f"Error: {e}")

def add_mob_drop(connection):
    """Add mob drop"""
    try:
        mname = input("Enter mob name: ")
        item_id = int(input("Enter item ID: "))
        drop_rate = float(input("Enter drop rate: "))
        
        # Insert query
        query = f"""
        INSERT INTO DROPS (Mname, Item_id, Drop_rate) VALUES
        ('{mname}', {item_id}, {drop_rate});
        """

        execute_query(connection, query)
    except Error as e:
        print(f"Error: {e}")
    except ValueError:
        print("Error: Invalid input. Please enter correct values.")


if __name__ == "__main__":
    connection = connect_to_database()
    if connection == None:
        exit(1)
        
    role = input("Enter your role: ")
    
    if(role == "player"):
        old_player = input("Do you have an account: (signup/signin): ")
    
        if(old_player.upper() == "signup"):
            add_new_player(connection)
        
        gamertag = input("Enter Gamertag: ")
        pid = get_player_id(connection, gamertag)
        if(pid == None):
            print("Player not found.")
            if connection.is_connected():
                connection.close()
            exit(1)
        
        while(True):
            print("\nWelcome to BondBrothers Minecraft!")
            print("1. Add new world")
            print("2. Show my Worlds")
            print("3. Delete World")
            print("4 Update SpawnPoint")
            print("5. Add new friend")
            print("6. Delete friend")
            print("7. Show friends")
            print("8. Buy Minecoins")
            print("9. Show Mobs List")
            print("10. Show Flammable Blocks")
            print("11 Search Biome")
            print("12. Mob With Max Damage")
            print("13. Search Item")
            print("14. Get Stats")
            print("15. Exit")
            
            choice = int(input("Enter your choice: "))
            

            if choice == 1:
                add_new_world(connection, pid)
            elif choice == 2:
                show_my_worlds(connection, pid)
            elif choice == 3:
                delete_world(connection, pid)
            elif choice == 4:
                update_spawn(connection, pid)
            elif choice == 5:
                add_new_friend(connection, pid)
            elif choice == 6:
                delete_friend(connection, pid)
            elif choice == 7:
                show_friends(connection, pid)
            elif choice == 8:
                buy_minecoins(connection, pid)
            elif choice == 9:
                show_mobs(connection)
            elif choice == 10:
                get_flammable_blocks(connection)
            elif choice == 11:
                search_biomes(connection)
            elif choice == 12:
                mob_with_max_damage(connection)
            elif choice == 13:
                search_in_items(connection)
            elif choice == 14:
                get_stats(connection, pid)
            elif choice == 15:
                print("Goodbye!")
                break
            else:
                print("Invalid choice. Please try again.")    
        
    elif(role == "game developer"):
        while(True):
            print("\nWelcome Game Developer!")
            print("1. Get MOB KILLS data")
            print("2. Get ITEM data")
            print("3. Change MOB Health")
            print("4. Update ITEM Texture")
            print("5 Add MOB Drop")
            print("6. Exit")
            choice = int(input("Enter your choice: "))
            if choice == 1:
                kill_mob(connection)
            elif choice == 2:
                acquire_item(connection)
            elif choice == 3:
                change_mob_health(connection)
            elif choice == 4:
                update_item_texture()
            elif choice == 5:
                add_mob_drop(connection)
            elif choice == 6:
                print("Goodbye!")
                break 
            else:
                print("Invalid choice. Please try again.")
    else:
        print("Invalid role. Please choose 'player' or 'game developer'.")
        if connection.is_connected():
            connection.close()
        exit(1)
        
    
    if connection.is_connected():
        connection.close()
    exit(0)