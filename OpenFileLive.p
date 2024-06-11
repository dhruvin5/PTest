spec GuaranteedProgress observes eFileOpenReq, eFileOpenResp {
    // keep track of the pending withdraw requests
    var pendingWDReqs: set[int];
  
    start state NopendingRequests {
      on eFileOpenReq goto PendingReqs with (req: tFileOpenReq) {
        pendingWDReqs += (req.rId);
      }
    }
  
    hot state PendingReqs {
      on eFileOpenResp do (resp: tFileOpenResp) {
        assert resp.rId in pendingWDReqs,
          format ("unexpected rId: {0} received, expected one of {1}", resp.rId, pendingWDReqs);
        pendingWDReqs -= (resp.rId);
        if(sizeof(pendingWDReqs) == 0) // all requests have been responded
          goto NopendingRequests;
      }
  
      on eFileOpenReq goto PendingReqs with (req: tFileOpenReq){
        pendingWDReqs += (req.rId);
      }
    }
  }