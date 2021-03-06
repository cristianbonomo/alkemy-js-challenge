const User = require('../models/User');
const {generateJWT} = require('../helpers/jwt');
const bcrypt = require('bcrypt');

const signIn = async (req,res) => {
    let body = req.body;
    let email = req.body.email.toLowerCase();
    //Buscamos el usuario en bd
    const userFound = await User.findOne({where: {email: `${email}`}});

    const passwordMatch = await User.comparePassword(body.password,userFound.dataValues.password);

    if(!userFound){
        return res.status(400).json({
            ok: false,
            message: 'Usuario o contraseña incorrectos'
        });
    } else if(!passwordMatch){
        return res.status(400).json({
            ok: false,
            message: 'usuario o Contraseña incorrectos'
            
        });
    }
     else
    {
        let token = await generateJWT(userFound.id,userFound.firstName);

        res.json({ //Login exitoso
            ok: true,
            id: userFound.id,
            name: userFound.firstName,
            token
        });
    }};


const renewToken = async (req,res = response) => {

    const id = req.uid;
    const name = req.name;
    
    let token = await generateJWT(id,name);

    res.json({
        ok:true,
        id,
        name,
        token
    })
}

module.exports = {
    signIn,
    renewToken 
}
