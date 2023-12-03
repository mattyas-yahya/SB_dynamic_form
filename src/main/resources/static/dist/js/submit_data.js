
var form_gaji = $('#form_gaji');
var form_ongkos = $('#form_ongkos');
var form_payroll = $('#form_payroll');

var form_inventory = $('#form_inventory');
var form_adjustment = $('#form_adjustment');
var form_produksi = $('#form_produksi');


//buat save produksi dan produksi line
$(document).ready( function ()
{
    document.getElementById("prd1").addEventListener("click", function () {
        var ProduksiContainers = document.querySelectorAll('[id^="ProduksiContainers_"]');
        var values = [];
    
        for (var i = 0; i < ProduksiContainers.length; i++) {
            var currentContainer = ProduksiContainers[i];
            var uniqueCountx = i + 1; // Perbarui nilai unik berdasarkan indeks
    
            var id_inventory = currentContainer.querySelector("#id_inventory_" + uniqueCountx);
            var batch_number = currentContainer.querySelector("#batch_number_" + uniqueCountx);
            var product_ref = currentContainer.querySelector("#product_ref_" + uniqueCountx);
            var product_name = currentContainer.querySelector("#product_name_" + uniqueCountx);
            var production_date = currentContainer.querySelector("#production_date_" + uniqueCountx);
            var production_order = currentContainer.querySelector("#production_order_" + uniqueCountx);
            var note = currentContainer.querySelector("#note_" + uniqueCountx);
    
            // Pastikan elemen ditemukan sebelum membaca nilai
            var data_produksi = {
                id_inventory: id_inventory ? id_inventory.value : '',
                batch_number: batch_number ? batch_number.value : '',
                product_ref: product_ref ? product_ref.value : '',
                product_name: product_name ? product_name.value : '',
                production_order: production_order ? production_order.value : '',
                production_date: production_date ? production_date.value : '',
                note: note ? note.value : ''
            };
    
            values.push(data_produksi);
        }
    
        fetch('/production/Save', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(values)
        })
            .then(response => response.json())
            .then(result => {
                console.log('Respon dari server:', result);
            })
            .catch(error => {
                console.error('Kesalahan:', error);
            });
    });
    
});
// save produksi line
$(document).ready( function ()
{
    document.getElementById("prdl1").addEventListener("click", function () {
        var ProduksiLineContainers = document.querySelectorAll('[id^="ProduksiLineContainers_"]');
        var valuesx = [];
    
        for (var i = 0; i < ProduksiLineContainers.length; i++) 
        {
            var currentContainer = ProduksiLineContainers[i];
            var uniqueCountx = i + 1; // Perbarui nilai unik berdasarkan indeks
            var id_production_line = currentContainer.querySelector("#id_production_line_" + uniqueCountx);
            var id_production_ln = currentContainer.querySelector("#id_production_ln_" + uniqueCountx);
            var id_inventory_ln = currentContainer.querySelector("#id_inventory_ln_" + uniqueCountx);
            var batch_order_ln = currentContainer.querySelector("#batch_order_ln_" + uniqueCountx);
            var batch_number_ln = currentContainer.querySelector("#batch_number_ln_" + uniqueCountx);
            var product_ref_ln = currentContainer.querySelector("#product_ref_ln_" + uniqueCountx);
            var product_name_ln = currentContainer.querySelector("#product_name_ln_" + uniqueCountx);
            var production_qty_ln = currentContainer.querySelector("#production_qty_ln_" + uniqueCountx);
    
            // Pastikan elemen ditemukan sebelum membaca nilai
            var data_line_produksi = {
                id_production_line: id_production_line ? id_production_line.value : '',
                id_production_ln: id_production_ln ? id_production_ln.value : '',
                id_inventory_ln: id_inventory_ln ? id_inventory_ln.value : '',
                batch_order_ln: batch_order_ln ? batch_order_ln.value : '',
                batch_number_ln: batch_number_ln ? batch_number_ln.value : '',
                product_ref_ln: product_ref_ln ? product_ref_ln.value : '',
                product_name_ln: product_name_ln ? product_name_ln.value : '',
                production_qty_ln: production_qty_ln ? production_qty_ln.value : ''
            };
    
            valuesx.push(data_line_produksi);
            console.log('Respon dari push:', valuesx);
        }
    
        fetch('/production/line/Save', 
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(valuesx)
        })
            .then(response => response.json())
            .then(result => 
            {
                console.log('Respon dari server:', result);
            })
            .catch(error => {
                console.error('Kesalahan:', error);
            });
    });
});

//buat save inventory

$("#inv1").click(function (event) 
{
// Mengambil semua elemen dengan class "inputContainer"
var inventContainers = document.querySelectorAll('[id^="inventContainers"]');
// Menyiapkan array untuk menyimpan nilai-nilai
var valuesinv = [];
// Mengulangi setiap elemen "inputContainer"
for (var i = 0; i < inventContainers.length; i++) 
{
var Containers = inventContainers[i];
// Mengambil nilai dari elemen-elemen dalam "inputContainer"
var id_inventory = Containers.querySelector("#id_inventory").value;
var item_number = Containers.querySelector("#item_number").value;
var product_ref = Containers.querySelector("#product_ref").value;
var product_name = Containers.querySelector("#product_name").value;
var purchase_date = Containers.querySelector("#purchase_date").value;
var grup = Containers.querySelector("#grup").value;
var model = Containers.querySelector("#model").value;
var location = Containers.querySelector("#location").value;
var inventory_tag = Containers.querySelector("#inventory_tag").value;
var purchase_price = Containers.querySelector("#purchase_price").value;
var guarante = Containers.querySelector("#guarante").value;

// Menyimpan nilai dalam objek atau array
var data_inv = {
id_inventory: id_inventory,
item_number: item_number,
product_ref: product_ref,
product_name: product_name,
purchase_date: purchase_date,
grup: grup,
model: model,
location: location,
inventory_tag: inventory_tag,
purchase_price: purchase_price,
guarante: guarante
};

// Menambahkan data ke array "values"
valuesinv.push(data_inv);
}

// Lakukan permintaan POST dengan nilai-nilai yang telah disimpan
fetch('/inventory/Save', 
{
method: 'POST',
headers: {
'Content-Type': 'application/json'
}
,body: JSON.stringify(valuesinv)

})
.then(response => response.json())
.then(result => 
{
// Handle respon dari server di sini
var result = valuesinv;
console.log('Respon dari server:', result);

})
.catch(error => 
{
// Handle kesalahan jika ada
console.error('Kesalahan:', error);
});



});




//buat save adjustment

        $("#adj1").click(function (event) 
{
        var AdjustmentContainer = document.querySelectorAll('[id^="AdjustmentContainer_"]');
        var values = [];
        for (var i = 0; i < AdjustmentContainer.length; i++) {
            var currentContainer = AdjustmentContainer[i];
            var uniqueCountx = i + 1; // Perbarui nilai unik berdasarkan indeks
            var id_inventory = currentContainer.querySelector("#id_inventory_" + uniqueCountx);
            var item_number = currentContainer.querySelector("#item_number_" + uniqueCountx);
            var product_ref = currentContainer.querySelector("#product_ref_" + uniqueCountx);
            var product_name = currentContainer.querySelector("#product_name_" + uniqueCountx);
            var adjustment_date = currentContainer.querySelector("#adjustment_date_" + uniqueCountx);
            var begin_balance = currentContainer.querySelector("#begin_balance_" + uniqueCountx);
            var adjustment = currentContainer.querySelector("#adjustment_" + uniqueCountx);
            var location = currentContainer.querySelector("#location_" + uniqueCountx);
            var purchase_price = currentContainer.querySelector("#purchase_price_" + uniqueCountx);
            // Pastikan elemen ditemukan sebelum membaca nilai
            var data_adjust= {
                id_inventory: id_inventory ? id_inventory.value : '',
                item_number: item_number ? item_number.value : '',
                product_ref: product_ref ? product_ref.value : '',
                product_name: product_name ? product_name.value : '',
                adjustment_date: adjustment_date ? adjustment_date.value : '',
                begin_balance: begin_balance ? begin_balance.value : '',
                adjustment: adjustment ? adjustment.value : '',
                location: location ? location.value : '',
                purchase_price: purchase_price ? purchase_price.value : ''
            };
    
            values.push(data_adjust);
        }
    
        fetch('/adjustment/Save', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(values)
        })
            .then(response => response.json())
            .then(result => {
                console.log('Respon dari server:', result);
            })
            .catch(error => {
                console.error('Kesalahan:', error);
            });
    });
    


