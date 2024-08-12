const express = require('express');
const {googlefetch, login, register, updatename, addpokemon, viewpokemon, viewallpokemon, buypokemon, editpokemon, deletepokemon, viewalltransaction, viewtransaction, usernameFetch, passwordFetch} = require('../controller/UserController');
const {authCheck} = require('../middleware/Authorization');
const router = express.Router(); // Use express.Router()

router.post('/login',login)
router.post('/register',register)
router.post('/usernamefetch',usernameFetch)
router.post('/passwordfetch',passwordFetch)
router.post('/updatename',updatename)
router.post('/addpokemon',addpokemon)
router.post('/viewpokemon',viewpokemon)
router.get('/viewallpokemon',authCheck,viewallpokemon)
router.get('/viewalltransaction',authCheck,viewalltransaction)
router.post('/buypokemon', buypokemon)
router.post('/editpokemon', editpokemon)
router.post('/googlefetch', googlefetch)
router.post('/deletepokemon',deletepokemon)
router.post('/viewtransaction',viewtransaction)

module.exports = router;
