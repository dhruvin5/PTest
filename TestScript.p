test tcSingleClient [main=TestWithSingleClient]:
  assert GuaranteedProgress in
  (union Client, Server, { TestWithSingleClient });

// assert the properties for the two clients and single server scenario
test tcMultipleClients [main=TestWithMultipleClients]:
  assert GuaranteedProgress in
  (union Client, Server, { TestWithMultipleClients });