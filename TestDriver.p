
// Test driver that checks the system with a single Client.
machine TestWithSingleClient
{
  start state Init {
    entry {
      // since client
      SetupClientServerSystem(1);
    }
  }
}

// Test driver that checks the system with multiple Clients.
machine TestWithMultipleClients
{
  start state Init {
    entry {
      // multiple clients between (2, 4)
      SetupClientServerSystem(choose(3) + 2);
    }
  }
}

fun SetupClientServerSystem(numClients: int)
{
  var i: int;
  var server: Server;
  var input : tInput;
  
  server = new Server();

  while(i < numClients) {
    new Client((serv = server, clientId = i));
    i = i + 1;
  }
}