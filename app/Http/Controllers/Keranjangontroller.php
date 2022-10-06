<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\keranjang;
use App\Models\Pengajuan;
use App\Models\Pengajuan_detail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Pusher\Pusher;

class Keranjangontroller extends Controller
{
    public function index()
    {
        $keranjang = keranjang::where('user_id', Auth::user()->id)->get();
        $barang = Barang::all();
        return view('keranjang.index', compact('keranjang', 'barang'));
    }

    public function store(Request $request)
    {
        $databarang = Barang::where('id', $request->barang_id)->first();

        $keranjang = keranjang::where('user_id', Auth::user()->id)->where('barang_id', $request->barang_id)->first();

        if (empty($keranjang)) {
            $create = [
                'barang_id' => $databarang->id,
                'jumlah' => $request->jumlah,
                'harga_satuan' => $databarang->harga_barang,
                'user_id' => Auth::user()->id
            ];

            Keranjang::create($create);
            return back()->with('success', 'Berhasil Menambahkan Data');
        }

        return back()->with('error', 'Data Sudah Ada');
    }

    public function store_approve(Request $request)
    {
        // dd($request);
        $barang = Barang::where('id', $request->barang_id)->first();
        $keranjang = Pengajuan_detail::where('pengajuan_id', $request->pengajuan_id)->where('barang_id', $request->barang_id)->first();

        if (empty($keranjang)) {
            $create = [
                'pengajuan_id' => $request->pengajuan_id,
                'barang_id' => $barang->id,
                'jumlah_barang' => $request->jumlah_barang,
                'harga_satuan' => $barang->harga_barang,
            ];

            Pengajuan_detail::create($create);

            $pengajuan_detail = Pengajuan_detail::where('pengajuan_id', $request->pengajuan_id)->get();

            $jsonNilai = array();
            foreach ($pengajuan_detail as $p) {
                $row =  $p->jumlah_barang * $p->harga_satuan;
                array_push($jsonNilai, $row);
            }

            Pengajuan::where('id', $request->pengajuan_id)->update([
                'total_biaya' => array_sum($jsonNilai),
            ]);

            return response()->json([
                'status' => 200,
            ]);
        }



        return response()->json([
            'status' => 400,
        ]);
    }

    public function detail()
    {
        $keranjang = keranjang::with('barang')->where('user_id', Auth::user()->id)->get();
        return view('keranjang.detail' , compact('keranjang'));
    }

    public function storePengajuan(Request $request)
    {

    // foreach($keranjang as $p){
        $create = [
            'tanggal' => \Carbon\Carbon::now()->format('Y-m-d'),
            'user_id_pengajuan' => Auth::user()->id,
        ];

        $pengajuan = Pengajuan::create($create);

        $keranjang = keranjang::where('user_id', Auth::user()->id)->get();
        
        
        $jsonNilai = array();
        foreach ($keranjang as $p) {
            $row =  $p->harga_satuan * $p->jumlah;
            array_push($jsonNilai, $row);
            $detail = [
                'pengajuan_id' => $pengajuan->id,
                'barang_id' => $p->barang_id,
                'jumlah_barang' => $p->jumlah,
                'harga_satuan' => $p->harga_satuan,
            ];

            Pengajuan_detail::create($detail);
        }

        $pu = Pengajuan::where('id', $pengajuan->id)->update([
            'total_biaya' => array_sum($jsonNilai),
        ]);

        foreach ($keranjang as $p) {
            keranjang::Find($p->id)->delete();
        }
        // $options = array(
        //     'cluster' => env('PUSHER_APP_CLUSTER'),
        //     'encrypted' => true
        // );
        // $pusher = new Pusher(
        //     env('PUSHER_APP_KEY'),
        //     env('PUSHER_APP_SECRET'),
        //     env('PUSHER_APP_ID'),
        //     $options
        // );
        // $pe = Pengajuan::all();
        // $data['message'] = $pe;
        // $pusher->trigger('notify-channel', 'App\\Events\\Notify', $data);


        return back()->with('success', 'Berhasil Mengirim Data Pengajuan');
    }

    public function total()
    {
        $keranjang = keranjang::where('user_id', Auth::user()->id)->get();

        $jsonNilai = array();
        foreach ($keranjang as $p) {
            $row =  $p->harga_satuan * $p->jumlah;
            array_push($jsonNilai, $row);
        }

        return response()->json([
            // array_sum($jsonNilai)
            'data' => array_sum($jsonNilai),
        ]);
    }


    public function delete($id)
    {
        $keranjang = keranjang::Find($id)->delete();
        return back()->with('success', 'Berhasil Menghapus Data');
    }
}
