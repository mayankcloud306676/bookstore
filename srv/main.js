const { Authors } = require("#cds-models/myapp");
const cds = require("@sap/cds");

module.exports = cds.service.impl(async function(){

    const { Books } = cds.entities('Z');

    this.before('READ','Books',async(req)=>{
      console.log("This is before Read");
    });


    this.on('addStock','Books',async(req,_)=>{

        const id = req.params[0].ID;
        const mystocky = await SELECT.from('Z.Books').one.columns('stock').where({ID:id});
        const mystock = mystocky.stock + 1;
          console.log(mystock);
        await UPDATE('Z.Books').set({stock:mystock}).where({ID:id});
   

    });

this.on('addDiscount',async(req,_)=>{
 await UPDATE('Z.Books').set({  price: { '*=': 0.9 } });
})

this.on('changeDate','Books',async(req,_)=>{
   const newDate = req.data.newDate;
   const id = req.params[0].ID;
   console.log(newDate);
   await UPDATE('Z.Books').set({publishedAt:newDate}).where({ID:id});
});


this.on('changeStatus','Books',async(req,_)=>{
   const newStatus = req.data.newStatus;
   const id = req.params[0].ID;
   console.log(newStatus);
   await UPDATE('Z.Books').set({status_code:newStatus}).where({ID:id});
})




    this.after('READ',Books,async(data,req)=>{
      
        for(const book of data){
            if (book.genre_code === 'Fiction')
            {
             book.price = book.price * 0.5
             
            }
        }
        console.log("after read");
    });




});