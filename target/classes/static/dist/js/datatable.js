

var tabel_inventory;
var tabel_inventory1;
var tab_inventory;
var tabel_adjustment;
var tabel_produksi;
var tabel_produksi1;
var tabel_produksi_line;

//buat produksi line
$(document).ready( function ()
{
    tabel_produksi_line = $('#tabel_produksi_line').DataTable({
        "columnDefs":[{ "orderable": false,"className": "select-checkbox","targets": 0,"checkboxes": {"selectRow": true}}],
        "select": {"style": "multi"},
        "scrollX": "200px",
        "sAjaxDataProp": "",
        "order": [[1, "asc"]],
        "sAjaxSource": "/production/line/All",
        "aoColumns": [
        { "mData": "id_production_line","defaultContent": "" ,"visible":false},
        { "mData": "id_production_ln" ,"defaultContent": "" ,"visible":false},
        { "mData": "id_inventory_ln","defaultContent": "" ,"visible":false },
        { "mData": "batch_number_ln" },
        { "mData": "batch_order_ln" },
        { "mData": "product_ref_ln" },
        { "mData": "product_name_ln" },
        { "mData": "production_qty_ln" }
        ]
        });
});

//buat produksi
$(document).ready( function ()
{
let uniqueCount = 1;
$('#production_date').daterangepicker({
singleDatePicker: true,
showDropdowns: true,
locale: {
format: 'YYYY-MM-DD'
}
});
$.ajax({
url: '/inventory/All', // Ganti dengan URL endpoint Anda
type: 'GET',
dataType: 'json',
success: function(data) {
var select = $('[id="product_ref_ln"]');
$.each(data, function(index, item) {
select.append('<option value="' + item.product_name + '">' + item.product_ref + '</option>');
});

// Event listener untuk mengisi input lain saat elemen select berubah
select.on('change', function() {
var selectedValue = $(this).val();
$('[id="product_name_ln"]').val(selectedValue);
});
},
error: function(xhr, status, error) {
console.error('Terjadi kesalahan:', error);
}
});
let ProduksiContainersCount = 1;
$("#copy,#new").click(function (event) {
// Membuat clone dari elemen dengan ID "ProduksiContainers"
const originalContainer = document.getElementById("ProduksiContainers");
const clone = originalContainer.cloneNode(true);
// Menetapkan ID unik untuk clone
const uniqueId = "ProduksiContainers_" + ProduksiContainersCount;
clone.id = uniqueId;
// Menambahkan clone ke dalam form
const form = document.getElementById("form_produksi");
form.appendChild(clone);
// Menemukan semua elemen input di dalam clone
const inputs = clone.querySelectorAll('input');
inputs.forEach((input) => {
// Menetapkan ID unik untuk setiap elemen input di dalam clone
const originalId = input.id;
const uniqueInputId = originalId + "_" + ProduksiContainersCount;
input.id = uniqueInputId;
});


// Increment uniqueCountx untuk memastikan ID selalu unik di setiap clone
ProduksiContainersCount++;
$(clone).show();

});
let uniqueCounts = 1;
$("#copy_line,#copy_l").click(function (event) 
{
// Membuat clone dari elemen dengan ID "ProduksiContainers"
const originalContainer = document.getElementById("ProduksiLineContainers");
const clone = originalContainer.cloneNode(true);
// Menetapkan ID unik untuk clone
const uniqueId = "ProduksiLineContainers_" + uniqueCounts;
clone.id = uniqueId;
// Menambahkan clone ke dalam form
const form = document.getElementById("form_produksi_line");
form.appendChild(clone);

// Menemukan semua elemen input di dalam clone
const inputs = clone.querySelectorAll('input');
inputs.forEach((input) => {
// Menetapkan ID unik untuk setiap elemen input di dalam clone
const originalId = input.id;
const uniqueInputId = originalId + "_" + uniqueCounts;
input.id = uniqueInputId;
});

// Increment uniqueCountx untuk memastikan ID selalu unik di setiap clone
uniqueCounts++;

// Menampilkan elemen yang di hidden dan baru saja ditambahkan
$(clone).show();
});
$("#line").click(function (event) 
{
$("#add_line").show();
});
$("#new").click(function (event) 
{
$("#add_new").show();
});
$("#overview").click(function (event) 
{
$("#add_line").hide();
$("#add_new").hide();
});
$("#copy_l").click(function (event) 
{
$("#copy_l").hide();
});
$("#add_line").hide();
$("#line").hide();
$("#add_new").hide();
$("#ProduksiLineContainers").hide();
$("#ProduksiContainers").hide();
tabel_produksi = $('#tabel_produksi').DataTable({
"columnDefs":[{ "orderable": false,"className": "select-checkbox","targets": 0,"checkboxes": {"selectRow": true}}],
"select": {"style": "multi"},
"scrollX": "200px",
"sAjaxDataProp": "",
"order": [[1, "asc"]],
"sAjaxSource": "/production/All",
"aoColumns": [
{ "mData": "id_production"},
{ "mData": "id_inventory" ,"defaultContent": "" ,"visible":false},
{ "mData": "batch_number"},
{ "mData": "product_ref" },
{ "mData": "product_name" },
{ "mData": "production_order" },
{ "mData": "production_date" },
{ "mData": "note" }
]
});
$("#line").click(function (event)
{
var form = this;
var rows_selected = tabel_produksi.column(0).checkboxes.selected();
$('#id_production').val(rows_selected.join(","));
tabel_produksi1 = $('#tabel_produksi').DataTable().row('.selected').data();
$('[id="id_production_ln"]').val(tabel_produksi1['id_production']);
$('[id="batch_number_ln"]').val(tabel_produksi1['batch_number']);

//  $('[id="work_order"]').val(tabel_produksi1['work_order']);
});
$('#tabel_produksi').on('click', 'tbody tr', function () 
{
    // Mendapatkan data work_order dari baris yang dipilih pada tabel produksi
    var selectedData = $('#tabel_produksi').DataTable().row(this).data();
    var batch_number = selectedData['batch_number'];
    tabel_produksi_line.column(3).search(batch_number).draw();

});
$("#tabel_produksi").click(function (event)
{
  //fungsi untuk menampilkan data dr datatable ke inputan
  $("#line").show();

var tabel_produksi1 = $('#tabel_produksi').DataTable().row('.selected').data();
// Memperbarui nilai dan atribut ID serta nama dengan nomor urutan unik
$('#batch_number' ).val(tabel_produksi1['batch_number']);
$('#batch_order' ).val(tabel_produksi1['batch_order']);
$('#product_ref' ).val(tabel_produksi1['product_ref']);
$('#product_name' ).val(tabel_produksi1['product_name']);
$('#production_order' ).val(tabel_produksi1['production_order']);
$('#note' ).val(tabel_produksi1['note']);

 // Meningkatkan nomor urutan unik setiap kali tombol "selected" ditekan

});
 // Fungsi untuk menghapus Produksi Container
 $("#rmvprd1").click(function (event) 
 {
    // Mengambil elemen AdjustmentContainer berdasarkan ID
    const ProduksiContainersId = $("#form_produksi").children().last().attr("id");
    // Memeriksa apakah elemen AdjustmentContainer ada sebelum menghapusnya
    if (ProduksiContainersId) {
        // Menghapus elemen AdjustmentContainer
        $("#" + ProduksiContainersId).remove();
        console.log("Elemen AdjustmentContainer berhasil dihapus.");
    } else {
        console.log("Elemen AdjustmentContainer tidak ditemukan.");
    }
});
 // Fungsi untuk menghapus Produksi Container
 $("#rmvprdl1").click(function (event) 
 {
    // Mengambil elemen AdjustmentContainer berdasarkan ID
    const ProduksiLineContainersId = $("#form_produksi_line").children().last().attr("id");
    // Memeriksa apakah elemen AdjustmentContainer ada sebelum menghapusnya
    if (ProduksiLineContainersId) {
        // Menghapus elemen AdjustmentContainer
        $("#" + ProduksiLineContainersId).remove();
        console.log("Elemen ProduksiLineContainersId berhasil dihapus.");
    } else {
        console.log("Elemen ProduksiLineContainersId tidak ditemukan.");
    }
});
});

//buat adjustment
$(document).ready( function ()
{
    $("#AdjustmentContainer").hide();

tabel_adjustment = $('#tabel_adjustment').DataTable({
    "columnDefs":[{ "orderable": false,"className": "select-checkbox","targets": 0,"checkboxes": {"selectRow": true}}],
    "select": {"style": "multi"},
    "scrollX": "200px",
    "sAjaxDataProp": "",
    "order": [[1, "asc"]],
    "sAjaxSource": "/adjustment/All",
    "aoColumns": [
    { "mData": "id_adjustment"},
    { "mData": "id_inventory","visible":false },
    { "mData": "item_number" },
    { "mData": "product_ref" },
    { "mData": "product_name" },
    { "mData": "adjustment_date" },
    { "mData": "begin_balance" },
    { "mData": "adjustment" },
    { "mData": "location" },
    { "mData": "purchase_price" }

    ]
    });


$('#adjustment_date').daterangepicker({
singleDatePicker: true,
showDropdowns: true,
locale: {
format: 'YYYY-MM-DD'
}
});

var uniqueCountz=1;
//cug iki nama button buat copy inputan
$("#cug,#add_new_adj").click(function (event) 
{
    // Membuat clone dari elemen dengan ID "ProduksiContainers"
    const originalContainer = document.getElementById("AdjustmentContainer");
    const clone = originalContainer.cloneNode(true);
    // Menetapkan ID unik untuk clone
    const uniqueId = "AdjustmentContainer_" + uniqueCountz;
    clone.id = uniqueId;
    // Menambahkan clone ke dalam form
    const form = document.getElementById("form_adjustment");
    form.appendChild(clone);
    // Menemukan semua elemen input di dalam clone
    const inputs = clone.querySelectorAll('input');
    inputs.forEach((input) => {
    // Menetapkan ID unik untuk setiap elemen input di dalam clone
    const originalId = input.id;
    const uniqueInputId = originalId + "_" + uniqueCountz;
    input.id = uniqueInputId;
    });
    
    // Increment uniqueCountx untuk memastikan ID selalu unik di setiap clone
    uniqueCountz++;
    $(clone).show();
    
    });
    $("#add_new_adj").click(function (event) 
    {
        $("#add_new_adj").hide();
    });
    // Fungsi untuk menghapus AdjustmentContainer
 $("#remove").click(function (event) 
 {
    // Mengambil elemen AdjustmentContainer berdasarkan ID
    const adjustmentContainerId = $("#form_adjustment").children().last().attr("id");
    // Memeriksa apakah elemen AdjustmentContainer ada sebelum menghapusnya
    if (adjustmentContainerId) {
        // Menghapus elemen AdjustmentContainer
        $("#" + adjustmentContainerId).remove();
        console.log("Elemen AdjustmentContainer berhasil dihapus.");
    } else {
        console.log("Elemen AdjustmentContainer tidak ditemukan.");
    }
});

});

//buat inventory
$(document).ready( function ()
{
$('#purchase_date').daterangepicker({
singleDatePicker: true,
showDropdowns: true,
locale: {
format: 'YYYY-MM-DD'
}
});
$("#cug1").click(function (event) 
{
const nodes = document.getElementById("inventContainers");
const clones = nodes.cloneNode(true);

// Dapatkan elemen <form>
const form = document.getElementById("form_inventory");

// Tambahkan elemen yang telah di-clone ke dalam <form>
form.appendChild(clones);
});

tabel_inventory = $('#tabel_inventory').DataTable({
"columnDefs":[{ "orderable": false,"className": "select-checkbox","targets": 0,"checkboxes": {"selectRow": true}}],
"select": {"style": "multi"},
"scrollX": "200px",
"sAjaxDataProp": "",
"order": [[1, "asc"]],
"sAjaxSource": "/inventory/All",
"aoColumns": [
{ "mData": "id_inventory"},
{ "mData": "item_number" },
{ "mData": "product_ref" },
{ "mData": "product_name" },
{ "mData": "purchase_date" },
{ "mData": "grup" },
{ "mData": "model" },
{ "mData": "location" },
{ "mData": "inventory_tag" },
{ "mData": "purchase_price" },
{ "mData": "guarante" }
]
});

let uniqueCountx = 1;
$("#selected").click(function (event)
 {
var rows_selected = tabel_inventory.column(0).checkboxes.selected();
// Mengatur nilai untuk elemen dengan ID yang sesuai
$('#id_inventory_' + uniqueCountx).val(rows_selected.join(","));
var tabel_inventory1 = $('#tabel_inventory').DataTable().row('.selected').data();
// Memperbarui nilai dan atribut ID serta nama dengan nomor urutan unik
$('#id_inventory_ln_' + uniqueCountx).val(tabel_inventory1['id_inventory']);
$('#product_ref_' + uniqueCountx).val(tabel_inventory1['product_ref']);
$('#product_ref_ln_' + uniqueCountx).val(tabel_inventory1['product_ref']);
$('#product_name_' + uniqueCountx).val(tabel_inventory1['product_name']);
$('#product_name_ln_' + uniqueCountx).val(tabel_inventory1['product_name']);
 $('#item_number_' + uniqueCountx).val(tabel_inventory1['item_number']);
 $('#location_' + uniqueCountx).val(tabel_inventory1['location']);
 $('#purchase_price_' + uniqueCountx).val(tabel_inventory1['purchase_price']);

console.log("Info klik...." + uniqueCountx);

console.log("Cek elemen: ", $('#id_inventory_' + uniqueCountx).length);
console.log("Cek elemen: ", $('#id_inventory_ln_' + uniqueCountx).length);
console.log("Cek elemen: ", $('#product_ref_' + uniqueCountx).length);
console.log("Cek elemen: ", $('#product_ref_ln_' + uniqueCountx).length);
console.log("Cek elemen: ", $('#product_name_' + uniqueCountx).length);
console.log("Cek elemen: ", $('#product_name_ln_' + uniqueCountx).length);

uniqueCountx++; // Meningkatkan nomor urutan unik setiap kali tombol "selected" ditekan
});

 // Fungsi untuk menghapus inventory Container
 $("#remove1").click(function (event) 
 {
    // Mengambil elemen AdjustmentContainer berdasarkan ID
    const inventContainers = $("#form_inventory").children().last().attr("id");
    // Memeriksa apakah elemen AdjustmentContainer ada sebelum menghapusnya
    if (inventContainers) {
        // Menghapus elemen AdjustmentContainer
        $("#" + inventContainers).remove();
        console.log("Elemen ProduksiLineContainersId berhasil dihapus.");
    } else {
        console.log("Elemen ProduksiLineContainersId tidak ditemukan.");
    }
});


});


//buat adjustment
$(document).ready( function ()
{
let uniqueCountx = 1;
$("#copy").click(function (event) {
// Membuat clone dari elemen dengan ID "ProduksiContainers"
const originalContainer = document.getElementById("AdjustmentContainer");
const clone = originalContainer.cloneNode(true);
// Menetapkan ID unik untuk clone
const uniqueId = "AdjustmentContainer_" + uniqueCountx;
clone.id = uniqueId;
// Menambahkan clone ke dalam form
const form = document.getElementById("form_adjustment");
form.appendChild(clone);
// Menemukan semua elemen input di dalam clone
const inputs = clone.querySelectorAll('input');
inputs.forEach((input) => {
// Menetapkan ID unik untuk setiap elemen input di dalam clone
const originalId = input.id;
const uniqueInputId = originalId + "_" + uniqueCountx;
input.id = uniqueInputId;
});


// Increment uniqueCountx untuk memastikan ID selalu unik di setiap clone
uniqueCountx++;
$(clone).show();

});
});
//buat restart apps
$(document).ready( function ()
{
function restartApplication() 
{
fetch('/actuator/restart', { method: 'POST' })
.then(response => {
if (response.ok) {
alert('Aplikasi sedang melakukan restart.');
} else {
alert('Gagal melakukan restart aplikasi.');
}
})
.catch(error => {
console.error('Terjadi kesalahan:', error);
});
}
});