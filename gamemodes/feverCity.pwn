#define SSCANF_NO_NICE_FEATURES
#include <a_samp>
#include <streamer>
#include <sscanf2>
#include <zcmd>
#include <a_mysql>

new NombreJugador[MAX_PLAYERS][MAX_PLAYER_NAME];
new MySQL:database;

main()
{
	print("\n----------------------------------");
	print("  Bare Script\n");
	print("----------------------------------\n");
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid, "~w~SA-MP: ~r~Bare Script", 5000, 5);
	GetPlayerName(playerid, NombreJugador[playerid], MAX_PLAYER_NAME);
	new DB_Query[146], Cache:ResultCache_;
	mysql_format(database, DB_Query, sizeof(DB_Query), "SELECT * FROM cuentas WHERE nombre=%s LIMIT 1",
		NombreJugador[playerid]
	);
 	ResultCache_ = mysql_query(database, DB_Query);
    if(cache_num_rows()){
    }else{
    }
    cache_delete(ResultCache_);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
   	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

#define MYSQL_URL "127.0.0.1"
#define MYSQL_USERNAME "root"
#define MYSQL_PASSWORD ""
#define MYSQL_DB "test"

public OnGameModeInit()
{
	SetGameModeText("Roleplay");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	AllowAdminTeleport(1);

	database = mysql_connect(MYSQL_URL, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DB);
	if(database == MYSQL_INVALID_HANDLE || mysql_errno(database) != 0){
		print("MySQL: La conexion a la base de datos no se ha podido dar, server closed.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL: La conexion a la base de datos ha sido exitosa");
	return 1;
}

CMD:dardinero(playerid, params [])
{
	if(sscanf(params, "ud", params[0], params[1]))
	    return SendClientMessage(playerid, -1, "/dardinero [ID/Nombre] [Cantidad]");
	GivePlayerMoney(params[0], params[1]);
	return 1;
}
