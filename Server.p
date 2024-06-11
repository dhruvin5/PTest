machine Server{
    start state Init{
        entry{
            goto OpenFileReq;
        }
       
    }
    state OpenFileReq
    {
       on eFileOpenReq do (req : tFileOpenReq)
       {
        var response: tFileOpenResp;
        var responseCode : int;
        responseCode = OpenForeignFunction(req.filePath);
        if(responseCode != -1)
        {
            response = (status = responseCode, rId = req.rId);
       
            send req.source, eFileOpenResp, response;
        }
        //print format("{0}",responseCode);
       
       }
    }
}
fun OpenForeignFunction(filePath: string): int;