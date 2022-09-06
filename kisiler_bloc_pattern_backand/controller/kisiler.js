
const Kisi = require('../models/kisiler');

exports.postKisi = async (req,res,next) => {

   
    try{
        const id  = Math.random();
        const kisi_name = req.body.kisi_name;
        const kisi_phone = req.body.kisi_phone;
    
        const kisi = new Kisi(id,kisi_name,kisi_phone);
        kisi.save()
        .then(result =>{
            res.json(kisi);
            console.log(kisi);
        })
        .catch(err=>{
            console.log(err);
        })

    }catch(error){
        console.log(error);
    }
}

exports.getKisiler = async (req, res, next) => {
    try{

        Kisi.fetchAll()
        .then(kisiler =>{
            res.json(kisiler);
            console.log(kisiler);
        })
        .catch(err => {
            console.log(err);
        })
    }catch(error){
        console.log(error);
    }
}
exports.updateKisi = async (req, res, next) => {

    const kisi_id = req.body.kisi_id;
    const kisi_name = req.body.kisi_name;
    const kisi_phone = req.body.kisi_phone;

    try{
        Kisi.update(kisi_id,kisi_name,kisi_phone)
        .then(kisi => {
            res.json(kisi);
            console.log(kisi);
        })
        .catch(err => {
            console.log(err);
        })
    }catch(error){
        console.log(error);
    }
}

exports.deleteKisi = async (req, res, next) => {

    const kisi_id = req.body.kisi_id;
    try{
        Kisi.delete(kisi_id)
        .then(result=>{
            console.log(result);
            res.json(result);
        })
        .catch(err =>{
            console.log(err);
        })
    }catch(error){
        console.log(error);
    }
} 

exports.searchKisi = async (req, res, next) => {
    const kisi_name = req.body.kisi_name;

    try{
        Kisi.search(kisi_name)
        .then(result => {
            console.log(result);
            res.json(result);
        })
    }catch(error){
        console.log(error);
    }
}