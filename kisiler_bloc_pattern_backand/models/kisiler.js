
const sql = require('mssql');

const cfg  = require('../database/cfg');

module.exports = class Kisiler {

    constructor(kisi_id,kisi_name,kisi_phone){
        this.kisi_id = kisi_id,
        this.kisi_name= kisi_name,
        this.kisi_phone = kisi_phone

    }

    async save() {

        try{
            const connection = await sql.connect(cfg);
            const request = await connection.request()
            .input("kisi_id",sql.Float,this.kisi_id)
            .input("kisi_name",sql.NVarChar,this.kisi_name)
            .input('kisi_phone',sql.NVarChar,this.kisi_phone)
            .query('insert into kisiler values(@kisi_id,@kisi_name,@kisi_phone)');
            return request.recordset;
        }catch(error){
            console.log(error);
        }
    }

    static async fetchAll(){
        try{
            const connection = await sql.connect(cfg);
            const request = await connection.request()
            .query("select * from kisiler")
            return request.recordset;

        }catch(error){
            console.log(error);
        }
    }

    static async update(id,name,phone){

        try{
            const connection = await sql.connect(cfg)
            const request = await connection.request()
            .input('id',sql.Float,id)
            .input('name',sql.NVarChar,name)
            .input('phone',sql.NVarChar,phone)
            .query('update kisiler set kisi_name=@name,kisi_phone=@phone WHERE kisi_id=@id')
            return request.recordset;

        }catch(error){
            console.log(error);
        }

    }

    static async delete(id){
        try{
            const connection = await sql.connect(cfg)
            const request = await connection.request()
            .input('id',sql.Float,id)
            .query('delete from kisiler where kisi_id=@id')
            return request.recordset;
        }catch(error){
            console.log(error);
        }
    }

    static async search(name){
        try{
            const connection = await sql.connect(cfg);
            const request = await connection.request()
            .input('name',sql.NVarChar,name)
            .query("select * from kisiler WHERE kisi_name LIKE '%' + @name + '%' ")
            return request.recordset;
        }catch(error){
            console.log(error);
        }
    }

}
