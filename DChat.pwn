#include <a_samp>

#include <discord-connector>

new DCC_Channel:g_Discord_Chat;

public OnFilterScriptInit()
{
	print("\n===================================");
	print("|  DISCORD IRC SYSTEM V.1.0 |");
	print("|  By Lamer1337Crew SYSTEM LOADED SUCCESFULL |");
	print("=====================================\n");
	g_Discord_Chat = DCC_FindChannelById("CHANNEL CLIENT ID"); // Discord channel ID
    return 1;
}

public DCC_OnChannelMessage(DCC_Channel:channel, DCC_User:author, const message[])
{
    new bool:IsBot;
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_Chat && IsBot == false)///Blocking Your Channel Bots Messages InGame
    {
        new user_name[32 + 1], str[128];
        DCC_GetUserName(author, user_name);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {0fbf61}%s",user_name, message);
        SendClientMessageToAll(-1, str);
    }

    return 1;
}

public OnPlayerText(playerid, text[])
{

    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);
    new msg[128]; // The string. We do not need to have it larger than 128, because a message can't be larger than that.
    format(msg, sizeof(msg), "```[%s] %s```", name, text);
    DCC_SendChannelMessage(g_Discord_Chat, msg);
    return 1;
}



public OnPlayerConnect(playerid)
{
   	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("CHANNEL CLIENT ID"); // Discord channel ID

    new string[128];
    format(string, sizeof string, " ```%s Joined The Server.:)```", name);
    DCC_SendChannelMessage(g_Discord_Chat, string);
    return 1;
}
