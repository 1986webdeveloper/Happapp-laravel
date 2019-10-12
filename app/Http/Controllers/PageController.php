<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Hash;
use Storage;
use Mail;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use App\Userjwt;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Quote;
use App\Post;

class PageController extends Controller
{
    public function term_conditions(){
        $title = 'Term Conditions';
        $term_conditions = DB::table('pages')->select('body')->where('id','3')->get()->first();
        if($term_conditions){
        $term_conditions_detail = $term_conditions->body;
        }else{
        $term_conditions_detail = 'Term Conditions';    
        }
          return view('term_conditions',compact('title','term_conditions_detail'));
    }

    public function privacy_policy(){
        $title = 'Privancy policy';
        $user_detail = DB::table('pages')->select('body')->where('id','2')->get()->first();
        if($user_detail){
        $privancy_detail = $user_detail->body;
        }else{
        $privancy_detail = 'Privancy policy';    
        }
        
        return view('privacy_policy',compact('title','privancy_detail'));
    }

     public function support(){
        $title = 'Support';
        $support = DB::table('pages')->select('body')->where('id','4')->get()->first();
        if($support){
        $support_detail = $support->body;
        }else{
        $support_detail = 'Support';    
        }
        
        return view('support',compact('title','support_detail'));
    }


     public function marketing(){
        $title = 'Marketing';
        $manrketing = DB::table('pages')->select('body')->where('id','5')->get()->first();
        if($manrketing){
        $manrketing_detail = $manrketing->body;
        }else{
        $manrketing_detail = 'Marketing';    
        }
        
        return view('marketing',compact('title','manrketing_detail'));
    }

    public function feedback(){
        return view('feedback');
    }
    public static function json_response($data, $message, $code,$status_next="") {
    $status = ($code == 200) ? "success" : "failed";
    return response()->json([
                "meta" => [
                    "status" => $status,
                    "code" => 200,
                    "message" => $message,
                    "next" =>$status_next
                ],
                "data" => $data
                    ], 200);
    }

    public function redirectDeepLink(Request $request){
            
            try {

                $device = $this->isMobileDevice();
                $id = $request->input('v');

                $app = config('constants.DEEPLINKING.APP') . $id;
                $data = array();


            if ($device == 'iPhone') {

                $data['primaryRedirection'] = $app;
                $data['secndaryRedirection'] = config('constants.DEEPLINKING.ANDROIDAPPSTORE');
               $redirect = 'com.happyapp://videoDetail/'.$id; 

            }else if ($device == 'Android'){

                $data['primaryRedirection'] = $app;
                $data['secndaryRedirection'] = config('constants.DEEPLINKING.IOSAPPSTORE');
                $redirect = 'com.happyapp://videoDetail/'.$id;
                

            }else{
                
                /*$result =   Post::select('id as video_id','title as video_title',
                DB::Raw('IFNULL( `post_video` , "" ) as post_video'))
                ->where('id',$id);
                 $result= $result->get()->first();
                  $result->post_video = asset('uploads/videos/'.$result->post_video);

                $redirect = $result->post_video;*/
                //$redirect = config('constants.DEEPLINKING.WEBSITE');
                //echo $redirect; exit;
               // $data['WebRedirection'] = config('constants.DEEPLINKING.WEBSITE').$id;
                // $redirect = config('constant.DEEPLINKING.WEBSITE');
                exit;
               return redirect($redirect);
            }
            return redirect($redirect);
            die;
                $message = 'Deep link URL';
                return self::json_response($data,$message,200);

            } catch (Exception $e) {
                Log::error(__METHOD__ . ' ' . $e->getMessage());
                return Utilities::responseError(__('messages.SOMETHING_WENT_WRONG') . $e->getMessage());
            }

     }

      private function isMobileDevice() {

        $aMobileUA = array(
            '/iphone/i' => 'iPhone',
            '/ipod/i' => 'iPod',
            '/ipad/i' => 'iPad',
            '/android/i' => 'Android',
            '/blackberry/i' => 'BlackBerry',
            '/webos/i' => 'Mobile'
        );
        //Return true if Mobile User Agent is detected
        foreach ($aMobileUA as $sMobileKey => $sMobileOS) {
            if (preg_match($sMobileKey, $_SERVER['HTTP_USER_AGENT'])) {
                return $sMobileOS;
            }
        }
        //Otherwise return false..
        return false;
    }
}
