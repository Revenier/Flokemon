const pool = require("../controller/DBController");

const authCheck = (req,res,next) => {

    if(
        req.headers.authorization && req.headers.authorization.startsWith("Bearer")
    ){
        const username = req.body.username

    const query = "SELECT * FROM msaccount WHERE token = ? AND username = ?";
    token = req.headers.authorization.split(" ")[1]
        pool.query(query, [token,username],(err,result)=>{
            // print(result);
            if(err){
                res.status(500).send("Error")
            }else{
                if(result.length>0){
                    res.send("Authorized")
                }
                else{
                    //jikabenar
                    next()
                }
            }
        })
    }
    if(!token){
        res.status(401).send("Missing Token!")
    }
    
}

module.exports = {
    authCheck
}
    
