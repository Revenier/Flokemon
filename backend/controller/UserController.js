const pool = require("./DBController");
const {authCheck} = require('../middleware/Authorization');

// TODO : Generate Token here

const googlefetch = (req,res) =>{
    const email = req.body.email;
    const query = "SELECT * FROM msaccount WHERE email = ?"

    pool.query(query,[email], (err, result)=>{
        if(err){
            res.status(500).send("Error in getting data")
        }
        else if(result.length > 0){
            res.status(200).send(result)
        }
        else{
            res.status(404).send("Data not found!");
        }

    })
}

const usernameFetch = (req,res) =>{
    const username = req.body.username;
    const query = "SELECT * FROM msaccount WHERE username = ?"

    pool.query(query,[username], (err, result)=>{
        if(err){
            res.status(500).send("Error in getting data")
        }
        else if(result.length > 0){
            res.status(200).send(result)
        }
        else{
            res.status(404).send("Data not found!");
        }

    })
}

const passwordFetch = (req,res) =>{
    const userpass = req.body.userpass;
    const query = "SELECT * FROM msaccount WHERE userpass = ?"

    pool.query(query,[userpass], (err, result)=>{
        if(err){
            res.status(500).send("Error in getting data")
        }
        else if(result.length > 0){
            res.status(200).send(result)
        }
        else{
            res.status(404).send("Data not found!");
        }

    })
}

function login (req,res){
    const username = req.body.username;
    const userpass = req.body.userpass;

    const query = "SELECT * FROM msaccount WHERE username = ? AND userpass = ?"

    pool.query(query,[username,userpass], (err, result)=>{
        if(err){
            res.status(500).send("Not Found")
        }
        else{
            res.status(200).send(result)
        }

    })

}

function generateToken(){
    const stringToken = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    let token = ''
    for(let i = 0; i < 10; i++){
        const index = Math.floor(Math.random() * stringToken.length)
        token += stringToken.charAt(index)
    }

    return token
}

const register = (req, res, next) =>{

    const username = req.body.username;
    const email = req.body.email;
    const userpass = req.body.userpass;
    const name = username;
    const accountstatus = 1;
    const token = generateToken();
    const querycheck = "SELECT email FROM msaccount WHERE email = ?"
    // TODO : Generate token and save it to database too along with the user credentials
    const query = "INSERT INTO `msaccount` (`name`,`email`,`username`, `userpass`,`accountstatus`,`token`) VALUES (?,?,?,?,?,?)";
    // const querycheck = "SELECT email,username FROM msuser WHERE username = ? AND password = ?"
    // const token = generateToken()
    pool.query(querycheck,[email],(error, rescheck) => {
        if(error) throw error;
        else if(rescheck.length>0){
            return res.status(500).send("Email already in used");
        }
        
        pool.query(query, [name,email,username, userpass,accountstatus,token], (err, result) => {
            console.log(email, name,username, userpass,accountstatus,token);
            if(err){
                res.status(500).send("Error in inserting user")
            }
            
            res.status(200).send(result)
        })
    })
    
}


const updatename = (req, res, next) =>{
    const oldname = req.body.oldname;
    const newname = req.body.newname;
    const query = "UPDATE msaccount SET name = ? WHERE name = ?";

    pool.query(query, [newname,oldname], (err, result) => {
        if(err){
            res.status(500). send("Error updating name")
        }
        
        res.status(200).send(result)
    })

}

const addpokemon = (req, res, next) =>{
    const id = req.body.id;
    const name = req.body.name;
    const type1 = req.body.type1;
    const type2 = req.body.type2;
    const height = req.body.height;
    const weight = req.body.weight;
    const description = req.body.description;
    const price = req.body.price;
    const imagelink = "temp";


    const query = "INSERT INTO `mspokemon` (`id`,`name`,`type1`,`type2`, `height`,`weight`,`description`,`price`,`imagelink`) VALUES (?,?,?,?,?,?,?,?,?)";
    pool.query(query, [id,name,type1,type2, height,weight, description, price, imagelink], (err, result) => {
        if(err){
            res.status(500). send("Error in inserting pokemon")
        }
        
        res.status(200).send("Success")
    })
}


const viewpokemon = (req, res, next) =>{
    const username = req.body.username;

    const query = "SELECT mp.* FROM mspokemon mp LEFT JOIN mstransaction mt ON mp.id = mt.pokemonID LEFT JOIN msaccount ma ON ma.email = mt.useremail WHERE ma.username = ? GROUP BY mt.pokemonID";
    pool.query(query, [username], (err, result) => {
        if(err){
            res.status(500). send("Error in viewing pokemon")
        }
        
        res.status(200).send(result)
    })
}

const viewallpokemon = (req, res, next) =>{
    
    const query = "SELECT * FROM mspokemon";
    pool.query(query, (err, result) => {
        if(err){
            res.status(500). send("Error in viewing pokemon")
        }
        
        res.status(200).send(result)
    })
}

const viewtransaction = (req, res, next) =>{
    const username = req.body.username;

    const query = "SELECT ma.username,imagelink, mp.name, price, quantity FROM mstransaction mt LEFT JOIN mspokemon mp ON mt.pokemonID = mp.id LEFT JOIN msaccount ma ON ma.email = mt.useremail WHERE ma.username = ?";
    pool.query(query, [username], (err, result) => {
        if(err){
            res.status(500). send("Error in viewing transaction")
        }
        
        res.status(200).send(result)
    })
}

const viewalltransaction = (req, res, next) =>{
    
    const query = "SELECT mp.name, imagelink, price, quantity, ma.username FROM mstransaction mt LEFT JOIN mspokemon mp ON mt.pokemonID = mp.id LEFT JOIN msaccount ma ON ma.email = mt.useremail";
    pool.query(query, (err, result) => {
        if(err){
            res.status(500). send("Error in viewing transaction")
        }
        
        res.status(200).send(result)
    })
}

const buypokemon = (req, res, next) =>{
    const id = req.body.id;
    const quantity = req.body.quantity;
    const useremail = req.body.useremail;
    const transactionID = 0;
    const query = "INSERT INTO `mstransaction` VALUES (?,?,?,?)";
    pool.query(query, [useremail,id,quantity,transactionID], (err, result) => {
        if(err){
            res.status(500).send("Error in buying pokemon")
        }
        
        res.status(200).send(result)
    })
}

const editpokemon = (req, res, next) =>{
    const oldid = req.body.oldid;
    const pokename = req.body.pokename;
    const type1 = req.body.type1;
    const type2 = req.body.type2;
    const height = req.body.height;
    const weight = req.body.weight;
    const description = req.body.description;
    const price = req.body.price;
    const pokeid = req.body.pokeid;
    const query = "UPDATE mspokemon SET `id` = ?, `name` = ? ,`type1` = ?,`type2` = ?, `height` = ?,`weight` = ?,`description` = ?,`price` = ? WHERE id = ?";
    pool.query(query, [pokeid, pokename,type1,type2, height,weight, description, price, oldid], (err, result) => {
        if(err){
            res.status(500). send("Error in editing pokemon")
        }
        
        res.status(200).send(result)
    })
}

const deletepokemon = (req, res, next) =>{
    const id = req.body.id;
    const query = "DELETE FROM mspokemon WHERE id = ?";
    pool.query(query, [id], (err, result) => {
        if(err){
            res.status(500).send("Error in deleting pokemon")
        }
        
        res.status(200).send(result)
    })
}



module.exports={
    login,
    register,
    usernameFetch,
    passwordFetch,
    updatename,
    addpokemon,
    viewpokemon,
    viewallpokemon,
    viewalltransaction,
    viewtransaction,
    buypokemon,
    editpokemon,
    googlefetch,
    deletepokemon
}