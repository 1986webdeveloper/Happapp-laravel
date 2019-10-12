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

use App\Videofavourite;

class ApiController extends Controller
{
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

    public static function json_response_with_count($data, $message, $code,$status_next="") {
        $status = ($code == 200) ? "success" : "failed";
        return response()->json([
                    "meta" => [
                        "status" => $status,
                        "code" => 200,
                        "message" => $message,
                        "next" =>$status_next,
                        "count" =>count($data)
                    ],
                    "data" => $data
                        ], 200);
    }

    public static function get_file_src($file_name, $folder, $default_file_path = "default.jpg") {
        // $images = self::get_file_src($result->profile_picture);
        if (!empty($file_name) && file_exists(public_path("storage/{$folder}/") . $file_name)) {
            return asset("public/storage/{$folder}/{$file_name}");
        } else if (!empty($default_file_path) && file_exists(public_path($default_file_path))) {
            return asset($default_file_path);
        }
        return "";
    }

    public static function login_withJWT(Request $request) {
        $email = $request->input("email");
        $password = $request->input("password");
        $type = $request->input("type");
        $user = Userjwt::where('email',$email)->first();
        if (!empty($user)) {
                if (Hash::check($password, $user->password)) {
                        $user->avatar = asset("storage/".$user->avatar);
                        // $userresult = json_decode(json_encode($result));
                        $token = JWTAuth::fromUser($user);
                        $user->token = $token;
                        unset($user->password);
                        unset($user->email_verified_at);
                        unset($user->remember_token);
                        unset($user->settings);
                        unset($user->created_at);
                        unset($user->settings);
                        $message = 'login successfully';
                        return self::json_response($user, $message, 200);
                } else {
                    $message = 'Password not match';
                    return self::json_response((object) [], $message, 400);
                }
        } else {
            $message = 'Email not match';
            return self::json_response((object) [], $message, 400);
        }
    }


    public static function user_status(Request $request) {
        $user_id = $request->input('user_id');
        $user_detail = DB::table('users')->select('deleted_at')->where('id', $user_id)->get()->first();
        if ($user_detail) {
            if ($user_detail->deleted_at == NULL) {
                $user_detail->deleted_at = true;
            } else {
                $user_detail->deleted_at = false;
            }
        } else {
            $user_detail['deleted_at'] = false;
        }
        $message = 'User Status';
        return self::json_response($user_detail, $message, 200);
    }




    public static function logout(Request $request) {
         $user_id = $request->input("user_id");
         $social_type = $request->input("social_type");
        if($social_type){
        if($social_type == 1){
        $social_id_get = 'facebook_id';
        $social_id_flag = '0';
        $social_id_name = 'is_facebook';

        }else if($social_type == 2){
        $social_id_get = 'twitter_id';
        $social_id_flag = '0';
        $social_id_name = 'is_twitter';
        }else{
        $social_id_get = 'google_id';
        $social_id_flag = '0';
        $social_id_name = 'is_google';
        }

        $userUpdate = array(
        $social_id_name=>$social_id_flag,
        $social_id_get=>''
        );
        $userUpdateDetails= DB::table('users')
        ->where('id', $user_id)
        ->update($userUpdate); 
        }

        $checkUser = DB::table('users as U')
                    ->select('U.id as user_id', 
                    DB::Raw('IFNULL( U.name , "" ) as name'),
                    DB::Raw('IFNULL( U.number , "" ) as number'),
                    DB::Raw('IFNULL( U.email , "" ) as email'),
                    DB::Raw('IFNULL( U.facebook_id , "" ) as facebook_id'),
                    DB::Raw('IFNULL( U.google_id , "" ) as google_id'),
                    DB::Raw('IFNULL( U.twitter_id , "" ) as twitter_id'),
                    DB::Raw('IFNULL( U.is_facebook, "" ) as is_facebook'),
                    DB::Raw('IFNULL( U.is_google , "" ) as is_google'),
                    DB::Raw('IFNULL( U.is_twitter , "" ) as is_twitter'),
                    DB::Raw('IFNULL( U.avatar , "" ) as profile_pic')
                    )
                    ->where('U.id',$user_id);
        $checkUser = $checkUser
                    ->get()
                    ->last();
        $message = 'logout successfully';
        return self::json_response($checkUser, $message, 200);

    }
        public static function login(Request $request) {
            $email = $request->input("email");
            $user_id = $request->input("user_id");
            $social_type = $request->input("social_type");
            $facebook_id = $request->input("facebook_id");
            $twitter_id = $request->input("twitter_id");
            $google_id = $request->input("google_id");
            $profile_pic = $request->input("profile_pic");
            $number = $request->input("number");
            $name = $request->input("name");
            $video_id = $request->input("video_id");
            if($social_type == 1){
                $social_id_get = 'facebook_id';
                $social_id = $request->input("facebook_id");
                $social_id_flag = '1';
                $social_id_name = 'is_facebook';

            }else if($social_type == 2){
                $social_id_get = 'twitter_id';
                $social_id = $request->input("twitter_id");
                $social_id_flag = '1';
                $social_id_name = 'is_twitter';
            }else{
                $social_id_get = 'google_id';
                $social_id = $request->input("google_id");
                $social_id_flag = '1';
                $social_id_name = 'is_google';
            }

            $checkUser = DB::table('users as U')
            ->select('id')
            ->where('U.email',$email)
            //->where('U.'.$social_id_get,$social_id)
            ->where('U.deleted_at', NULL);

            $checkUserCount = $checkUser
            ->count();

            $checkUser = $checkUser
            ->get()
            ->last();

            if($checkUserCount > 0 || $user_id)
            {

            if($user_id){

                $userUpdate = array(
                $social_id_name=>$social_id_flag,
                $social_id_get=>$social_id
            );
            $userUpdateDetails= DB::table('users')
            ->where('id', $user_id)
            ->update($userUpdate); 

            $result = DB::table('users as U')->
            select('U.id as user_id', 
            DB::Raw('IFNULL( U.name , "" ) as name'),
            DB::Raw('IFNULL( U.number , "" ) as number'),
            DB::Raw('IFNULL( U.email , "" ) as email'),
            DB::Raw('IFNULL( U.facebook_id , "" ) as facebook_id'),
            DB::Raw('IFNULL( U.google_id , "" ) as google_id'),
            DB::Raw('IFNULL( U.twitter_id , "" ) as twitter_id'),
            DB::Raw('IFNULL( U.is_facebook, "" ) as is_facebook'),
            DB::Raw('IFNULL( U.is_google , "" ) as is_google'),
            DB::Raw('IFNULL( U.is_twitter , "" ) as is_twitter'),
            DB::Raw('IFNULL( U.avatar , "" ) as profile_pic')
            )
            ->where('U.id',$user_id);
            $result = $result->get()->first(); 
            if($video_id != null)
            {
                $video_explode_id = explode(',', $video_id);
                foreach ($video_explode_id as $video_explode_ids) {                        
                    $video_check = DB::table('video_favourites')
                    ->where('video_id',$video_explode_ids)
                    ->where('is_active',0)
                    ->where('user_id',$user_id)->count();
                    if($video_check == 0){
                        $video_favourites = array(
                        'video_id' =>$video_explode_ids,
                        'user_id'=>$user_id,
                        'created_at'=> now()
                        );
                        $video_favourites_details = DB::table('video_favourites')
                        ->insertGetId($video_favourites);
                    }
                }
            }
            }else{

            $userflag = array(
                'is_facebook'=>'0',
                'facebook_id'=>'',
                'is_twitter'=>'0',
                'twitter_id'=>'',
                'is_google'=>'0',
                'google_id'=>''
            );
            $userUpdateDetailsflag = DB::table('users')
            ->where('id', $checkUser->id)
            ->update($userflag); 

            $userUpdate = array(
                $social_id_name=>$social_id_flag,
                $social_id_get=>$social_id
            );
            $userUpdateDetails= DB::table('users')
            ->where('id', $checkUser->id)
            ->update($userUpdate); 

            $result = DB::table('users as U')->
            select('U.id as user_id', 
            DB::Raw('IFNULL( U.name , "" ) as name'),
            DB::Raw('IFNULL( U.number , "" ) as number'),
            DB::Raw('IFNULL( U.email , "" ) as email'),
            DB::Raw('IFNULL( U.facebook_id , "" ) as facebook_id'),
            DB::Raw('IFNULL( U.google_id , "" ) as google_id'),
            DB::Raw('IFNULL( U.twitter_id , "" ) as twitter_id'),
            DB::Raw('IFNULL( U.is_facebook, "" ) as is_facebook'),
            DB::Raw('IFNULL( U.is_google , "" ) as is_google'),
            DB::Raw('IFNULL( U.is_twitter , "" ) as is_twitter'),
            DB::Raw('IFNULL( U.avatar , "" ) as profile_pic')
            )
            ->where('U.id',$checkUser->id);
            $result = $result->get()->first();  
            if($video_id != null)
            {
                $video_explode_id = explode(',', $video_id);
                foreach ($video_explode_id as $video_explode_ids) {                        
                    $video_check = DB::table('video_favourites')
                    ->where('video_id',$video_explode_ids)
                    ->where('is_active',0)
                    ->where('user_id',$checkUser->id)->count();
                    if($video_check == 0){
                        $video_favourites = array(
                        'video_id' =>$video_explode_ids,
                        'user_id'=>$checkUser->id,
                        'created_at'=> now()
                        );
                        $video_favourites_details = DB::table('video_favourites')
                        ->insertGetId($video_favourites);
                    }
                }
            } 
            } 

            $message = 'login successfully';
            return self::json_response($result, $message, 200);
            }else{

            $userInsert = array(
            $social_id_get =>$social_id,
                'email'=>$email,
                'number'=>$number,
                'avatar'=>$profile_pic,
                'role_id'=> 2,
                'name'=> $name
            );
            $userInsertDetails = DB::table('users')
            ->insertGetId($userInsert);
            $userUpdate = array(
                $social_id_name=>$social_id_flag,
                $social_id_get=>$social_id
            );
            $userUpdateDetails= DB::table('users')
            ->where('id', $userInsertDetails)
            ->update($userUpdate); 
            if($video_id != null)
            {
                $video_explode_id = explode(',', $video_id);
                foreach ($video_explode_id as $video_explode_ids) {                        
                    $video_check = DB::table('video_favourites')
                    ->where('video_id',$video_explode_ids)
                    ->where('is_active',0)
                    ->where('user_id',$userInsertDetails)->count();
                    if($video_check == 0){
                        $video_favourites = array(
                        'video_id' =>$video_explode_ids,
                        'user_id'=>$userInsertDetails,
                        'created_at'=> now()
                        );
                        $video_favourites_details = DB::table('video_favourites')
                        ->insertGetId($video_favourites);
                    }
                }
            }
                $result = DB::table('users as U')->
                select('U.id as user_id', 
                DB::Raw('IFNULL( U.name , "" ) as name'),
                DB::Raw('IFNULL( U.number , "" ) as number'),
                DB::Raw('IFNULL( U.email , "" ) as email'),
                DB::Raw('IFNULL( U.facebook_id , "" ) as facebook_id'),
                DB::Raw('IFNULL( U.google_id , "" ) as google_id'),
                DB::Raw('IFNULL( U.twitter_id , "" ) as twitter_id'),
                DB::Raw('IFNULL( U.is_facebook, "" ) as is_facebook'),
                DB::Raw('IFNULL( U.is_google , "" ) as is_google'),
                DB::Raw('IFNULL( U.is_twitter , "" ) as is_twitter'),
                DB::Raw('IFNULL( U.avatar , "" ) as profile_pic')
                )
                ->where('U.id',$userInsertDetails);
                $result = $result->get()->first();                   
            $message = 'login successfully';
            return self::json_response($result, $message, 200);
            }
        }

     public function getAuthenticatedUser()
        {
                try {
                        if (! $user = JWTAuth::parseToken()->authenticate()) {
                                return response()->json(['user_not_found'], 404);
                        }
                } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

                        return response()->json(['token_expired'], $e->getStatusCode());
                } catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {

                        return response()->json(['token_invalid'], $e->getStatusCode());
                } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

                        return response()->json(['token_absent'], $e->getStatusCode());
                }
                return response()->json(compact('user'));
        }

    public function randomQuotes(){
        $quotetodate = Quote::select('id', 'name','founder_name')
        ->where('quotes_date',date('Y-m-d'));
        $quotetodatecount = $quotetodate->count(); 
        
        if($quotetodatecount > 0){
              $randomQuote = Quote::select('id', 'name','founder_name')
        ->where('quotes_date',date('Y-m-d'));
              $count = $randomQuote->count(); 
        }else{
            $randomQuote = Quote::select('id', 'name','founder_name')
                        ->inRandomOrder()
                        ->where('is_active',1);
        $count = $randomQuote->count(); 
        }
       
        $result = $randomQuote->get()->first();
        if($count > 0 ){
            $message = 'Quote List';
            return self::json_response($result, $message, 200);
        }else{
            $message = 'No data';
            return self::json_response((object)[], $message, 400);
        }
    }

    function xTimeAgo ($oldTime, $newTime){
        $timeCalc = strtotime($newTime) - strtotime($oldTime);

        if ($timeCalc >= (60*60*24)) {$timeCalc = round($timeCalc/60/60/24) . ' days ago';}
        else if ($timeCalc >= (60*60)) {$timeCalc = round($timeCalc/60/60) . ' hours ago';}
        else if ($timeCalc >= 60) {$timeCalc = round($timeCalc/60) . ' minutes ago';}
        else if ($timeCalc > 0) {$timeCalc = ' seconds ago';}

        return $timeCalc;
    }

    public function getVideoListWithTimeConvert(Request $request){
        $array1 = array();
        $result =   Post::select(
                    'id as video_id',
                    'title',
                    'created_at',
                    DB::Raw('IFNULL( `post_video_thumb` , "" ) as post_video_thumb'),
                    DB::Raw('IFNULL( `post_video` , "" ) as post_video'))
                    ->where('title','LIKE','%'.$request->input('search').'%');
        $count = $result->count();
        $result = $result->get()->toArray();
        if($count > 0){
            foreach ($result as $key => $row) {
                    $newtime = date('Y-m-d h:i:s');
                    $oldtime = date($row['created_at']);
                    $final =$this->xTimeAgo($oldtime,$newtime);
                    $row['post_video'] = asset('uploads/videos/'.$row['post_video']);
                    $row['post_video_thumb'] = asset('uploads/videos/'.$row['post_video_thumb']);
                    $row['created_at'] = $final;
                    $array1[] = $row;
                }
            $result = $array1;
            $message = 'Video Lists';
            return self::json_response($result, $message, 200);
        }else{
            $message = 'No Data';
            return self::json_response($result, $message, 400);
        }
    }

    public function page_list(){
        $term_conditions = asset('term_conditions');
        $privacy_policy = asset('privacy_policy');
        $feedback = asset('feedback');
        $result = array(
                    'term_conditions' => $term_conditions, 
                    'privacy_policy' => $privacy_policy, 
                    'feedback' => $feedback
                    );
        $message = 'Page Lists';
        return self::json_response($result, $message, 200);
    }

    public function get_video_list(Request $request){
        $page = $request->input('page');
        $user_id = $request->input('user_id');
        $perpage  = 10;
        $limit = $page * $perpage;
        $off = $limit - $perpage;

        // $result =   Post::select('id as video_id','title','created_at',
        //             DB::Raw('IFNULL( `post_video` , "" ) as post_video'))
        //             ->where('title','LIKE','%'.$request->input('search').'%');

        $result = DB::table('posts as P')
                ->select(
                    'P.id as video_id',
                    'P.title',
                    'P.created_at',
                    'P.status',
                    'P.start_date',
                    'P.end_date',
                    'P.body as video_description',
                    DB::Raw('IFNULL( `post_video` , "" ) as post_video'),
                    DB::Raw('IFNULL( `post_video_thumb` , "" ) as post_video_thumb'),
                    DB::Raw('case when VV.device_id IS NULL then 0 else count("P.id") end as view_count'),
                    DB::Raw('case when VF.id is null then "false" else "true" end as is_favourite'),
                    DB::Raw('case when RV.id is null then "false" else "true" end as is_recommend')
            )
            ->leftJoin('video_viewers as VV', 'VV.video_id', '=', 'P.id')
            ->leftJoin('video_favourites as VF', function($join)use($user_id){
                        $join->on('VF.video_id', '=', 'P.id')
                        ->where('VF.user_id', '=', $user_id)
                        ->where('VF.is_active', '=', 0);

                    })
            ->leftJoin('recommend_videos as RV', function($join)use($user_id){
                        $join->on('RV.video_id', '=', 'P.id')
                        ->where('RV.user_id', '=', $user_id)
                        ->where('RV.is_active', '=', 0);

                    })
            ->where('P.title','LIKE','%'.$request->input('search').'%')
            ->where('deleted_at', NULL)
            ->where('status', 'Active')
            ->where('end_date','>=',date('Y-m-d'))
            ->groupBy('P.id')->orderBy('P.id', 'DESC');
        $count = count($result->get()->all());
        
        $pageShow = ceil($count/$perpage);

        $status_next =($pageShow <= $page) ? false : true;
        // if($pageShow < $page){
        //     $status = 'false';
        // }else{
        //     $status = 'true';
        // }
        $result = $result
                ->skip($off)
                ->take($perpage)
                ->get();
        if($count > 0){
            foreach ($result as $key => $row) {
                $row->post_video = asset('uploads/videos/'.$row->post_video);
                $row->post_video_thumb = asset('uploads/videos/'.$row->post_video_thumb);

                $get_like_count = DB::table('posts as P')
                                ->select(
                                        'P.id'
                                    )
                                ->leftJoin('recommend_videos as RV','RV.video_id','=','P.id')
                                ->where('P.id',$row->video_id)
                                ->where('RV.is_active',0)
                                ->get()->count();
                                $row->recommend_count = $get_like_count;
            }


            $message = 'Video Lists';
            return self::json_response($result, $message, 200,$status_next);
        }else{
            $message = 'No Data';
            return self::json_response($result, $message, 400);
        }
    }


    public function get_new_video_list(Request $request){
        $page = $request->input('page');
        $user_id = $request->input('user_id');
        $last_id = $request->input('last_video_id');
        $perpage  = 10;
        $limit = $page * $perpage;
        $off = $limit - $perpage;

        $result = DB::table('posts as P')
                ->select(
                    'P.id as video_id',
                    'P.title',
                    'P.created_at',
                    'P.status',
                    'P.start_date',
                    'P.end_date',
                    'P.body as video_description',
                    DB::Raw('IFNULL( `post_video` , "" ) as post_video'),
                    DB::Raw('IFNULL( `post_video_thumb` , "" ) as post_video_thumb'),
                    DB::Raw('case when VV.device_id IS NULL then 0 else count("P.id") end as view_count'),
                    DB::Raw('case when VF.id is null then "false" else "true" end as is_favourite'),
                    DB::Raw('case when RV.id is null then "false" else "true" end as is_recommend')
            )
            ->leftJoin('video_viewers as VV', 'VV.video_id', '=', 'P.id')
            ->leftJoin('video_favourites as VF', function($join)use($user_id){
                        $join->on('VF.video_id', '=', 'P.id')
                        ->where('VF.user_id', '=', $user_id)
                        ->where('VF.is_active', '=', 0);

                    })
            ->leftJoin('recommend_videos as RV', function($join)use($user_id){
                        $join->on('RV.video_id', '=', 'P.id')
                        ->where('RV.user_id', '=', $user_id)
                        ->where('RV.is_active', '=', 0);

                    })
            ->where('P.title','LIKE','%'.$request->input('search').'%')
            ->where('deleted_at', NULL)
            ->where('status', 'Active')
            ->where('end_date','>=',date('Y-m-d'))
            ->where('P.id', '>', $last_id)->groupBy('P.id');
        //$count = $result->count();
        $count = count($result->get()->all());
        
        $pageShow = ceil($count/$perpage);
        $status_next =($pageShow <= $page) ? false : false;
        $result = $result->get()->all();
        /*$result = $result
                ->skip($off)
                ->take($perpage)
                ->get();*/
        if($count > 0){
            
            foreach ($result as $key => $row) {
                $row->post_video = asset('uploads/videos/'.$row->post_video);
                $row->post_video_thumb = asset('uploads/videos/'.$row->post_video_thumb);
                $get_like_count = DB::table('posts as P')
                                ->select(
                                        'P.id'
                                    )
                                ->leftJoin('recommend_videos as RV','RV.video_id','=','P.id')
                                ->where('P.id',$row->video_id)
                                ->where('RV.is_active',0)
                                ->get()->count();
                                $row->recommend_count = $get_like_count;
            }

            $message = 'Video Lists';
            return self::json_response($result, $message, 200,$status_next);
        }else{
            $message = 'No Data';
            return self::json_response($result, $message, 400);
        }
    }



    public function get_video_list_test(Request $request){
        $page = $request->input('page');
        $user_id = $request->input('user_id');
        $perpage  = 10;
        $limit = $page * $perpage;
        $off = $limit - $perpage;

        // $result =   Post::select('id as video_id','title','created_at',
        //             DB::Raw('IFNULL( `post_video` , "" ) as post_video'))
        //             ->where('title','LIKE','%'.$request->input('search').'%');

        $result = DB::table('posts as P')
                ->select(
                    'P.id as video_id',
                    'P.title',
                    'P.created_at',
                    'P.body as video_description',
                    DB::Raw('IFNULL( `post_video` , "" ) as post_video'),
                    DB::Raw('IFNULL( `post_video_thumb` , "" ) as post_video_thumb'),
                    DB::Raw('case when VV.device_id IS NULL then 0 else count("P.id") end as view_count'),
                    DB::Raw('case when VF.id is null then "false" else "true" end as is_favourite')
            )
            ->leftJoin('video_viewers as VV', 'VV.video_id', '=', 'P.id')
            ->leftJoin('video_favourites as VF', function($join)use($user_id){
                        $join->on('VF.video_id', '=', 'P.id')
                        ->where('VF.user_id', '=', $user_id)
                        ->where('VF.is_active', '=', 0);

                    })
            ->where('P.title','LIKE','%'.$request->input('search').'%')->groupBy('VV.video_id');
        $count = $result->count();
        $pageShow = ceil($count/$perpage);
        $status_next =($pageShow <= $page) ? false : true;
        // if($pageShow < $page){
        //     $status = 'false';
        // }else{
        //     $status = 'true';
        // }
        $result = $result
                ->skip($off)
                ->take($perpage)
                ->get();
        if($count > 0){
            foreach ($result as $key => $row) {
                $row->post_video = asset('uploads/videos/'.$row->post_video);
                $row->post_video_thumb = asset('uploads/videos/'.$row->post_video_thumb);
            }
            $message = 'Video Lists';
            return self::json_response($result, $message, 200,$status_next);
        }else{
            $message = 'No Data';
            return self::json_response($result, $message, 400);
        }
    }

    public function get_video_details(Request $request){
        $user_id = $request->input('user_id');
        $result = DB::table('posts as P')
                ->select(
                    'P.id as video_id',
                    'P.title',
                    'P.created_at',
                    'P.body as video_description',
                    DB::Raw('IFNULL( `post_video` , "" ) as post_video'),
                    DB::Raw('IFNULL( `post_video_thumb` , "" ) as post_video_thumb'),
                    DB::Raw('case when VV.device_id IS NULL then 0 else count("P.id") end as view_count'),
                    DB::Raw('case when VF.id is null then "false" else "true" end as is_favourite'),
                    DB::Raw('case when RV.id is null then "false" else "true" end as is_recommend')
            )
            ->leftJoin('video_viewers as VV', 'VV.video_id', '=', 'P.id')
            ->leftJoin('video_favourites as VF', function($join)use($user_id){
                        $join->on('VF.video_id', '=', 'P.id')
                        ->where('VF.user_id', '=', $user_id)
                        ->where('VF.is_active', '=', 0);

                    })
            ->leftJoin('recommend_videos as RV', function($join)use($user_id){
                        $join->on('RV.video_id', '=', 'P.id')
                        ->where('RV.user_id', '=', $user_id)
                        ->where('RV.is_active', '=', 0);

                    })
            ->where('P.id',$request->input('video_id'))
            ->where('P.status','Active')
            ->where('deleted_at',NULL)
            ->groupBy('P.id');

      
        // $result =   Post::select('id as video_id','title as video_title',
        //             DB::Raw('IFNULL( `post_video` , "" ) as post_video'))
        //             ->where('id',$request->input('video_id'));
        $count = $result->count();

        $result= $result->get()->first();

          
        if($count > 0){
           $result->post_video = asset('uploads/videos/'.$result->post_video);
          $result->post_video_thumb = asset('uploads/videos/'.$result->post_video_thumb);
            $get_like_count = DB::table('posts as P')
                                ->select(
                                        'P.id'
                                    )
                                ->leftJoin('recommend_videos as RV','RV.video_id','=','P.id')
                                ->where('P.id',$result->video_id)
                                ->where('RV.is_active',0)
                                ->get()->count();
                                $result->recommend_count = $get_like_count;
                                
            $message = 'Video Details';
            return self::json_response($result,$message,200);
        }else{
            $message = 'No Data';
            return self::json_response((object)[],$message,400);
        }
    }


    public function favourite_list(Request $request){
 
        $page = $request->input('page');
        $perpage  = 10;
        $limit = $page * $perpage;
        $off = $limit - $perpage;
        $video_id = $request->input('video_id');
        $video_explode_id = explode(',', $video_id);
        $user_id = $request->input('user_id');
        if($video_id != ''&& $user_id == ''){
            $result = DB::table('posts as P')
                    ->select(
                        "P.id as video_id",
                        "P.title",
                        'P.created_at',
                        'P.body as video_description',
                        DB::raw("'true' as favourite"),
                        DB::Raw("IFNULL( P.post_video , '' ) as post_video"),
                        DB::Raw("IFNULL( P.post_video_thumb , '' ) as post_video_thumb"),
                        DB::Raw("case when VV.device_id is null then 0 else count(VV.id) end as view_count"),
                        DB::Raw('case when VF.id is null then "false" else "true" end as is_favourite'),
                        DB::Raw('case when RV.id is null then "false" else "true" end as is_recommend')
                    )
                    ->leftJoin("video_viewers as VV","VV.video_id","=","P.id")
                    ->leftJoin('video_favourites as VF', function($join)use($user_id){
                        $join->on('VF.video_id', '=', 'P.id')
                        ->where('VF.user_id', '=', $user_id)
                        ->where('VF.is_active', '=', 0);

                    })
                    ->leftJoin('recommend_videos as RV', function($join)use($user_id){
                        $join->on('RV.video_id', '=', 'P.id')
                        ->where('RV.user_id', '=', $user_id)
                        ->where('RV.is_active', '=', 0);

                    })
                    ->whereIn("P.id",$video_explode_id)->groupBy('VV.video_id');
             $count = $result->count();
             $pageShow = ceil($count/$perpage);
             $status_next =($pageShow <= $page) ? false : true;
             $result= $result
                    ->skip($off)
                    ->take($perpage)
                    ->get();
            // $result = Post::select('id as video_id','title as video_title',
            //         '"title" as video_title_test',
            //         DB::Raw('IFNULL( `post_video` , "" ) as post_video'))
            //         ->whereIn('id',$video_id);
            // $count = $result->count();
            // $result= $result->get();
            if($count > 0){
                foreach ($result as $key => $row) {
                    $row->post_video = asset('uploads/videos/'.$row->post_video);
                    $row->post_video_thumb = asset('uploads/videos/'.$row->post_video_thumb);
                }
                $message = 'Video lists';
                return self::json_response_with_count($result,$message,200,$status_next);
            }else{
                $message = 'No data';
                return self::json_response_with_count([],$message,400);
            }
        }else if($video_id == '' && $user_id != ''){
            $result =DB::table('posts as P')
                    ->select(
                            "P.id as video_id",
                            "P.title",
                            'P.created_at',
                            'P.body as video_description',
                            DB::raw("'true' as favourite"),
                            DB::Raw("IFNULL( P.post_video , '' ) as post_video"),
                            DB::Raw("IFNULL( P.post_video_thumb , '' ) as post_video_thumb"),
                            DB::Raw('case when VV.device_id IS NULL then 0 else count( "VV.id") end as view_count')
                        )
                    // ->Join('video_favourites as VF', 'VF.video_id', '=', 'P.id')
                    ->leftJoin('video_viewers as VV', 'VV.video_id', '=', 'P.id')
                    ->leftJoin('video_favourites as VF', function($join)use($user_id){
                        $join->on('VF.video_id', '=', 'P.id')
                        ->where('VF.user_id', '=', $user_id)
                        ->where('VF.is_active', '=', 0);

                    })
                    ->leftJoin('recommend_videos as RV', function($join)use($user_id){
                        $join->on('RV.video_id', '=', 'P.id')
                        ->where('RV.user_id', '=', $user_id)
                        ->where('RV.is_active', '=', 0);

                    })
                    // ->leftJoin('video_viewers as VV', 'VV.video_id', '=', 'P.id')
                    ->where("VF.user_id",$user_id)
                    ->groupBy('VF.video_id');

             $count = count($result->get()->all());
             $pageShow = ceil($count/$perpage);
             $status_next =($pageShow <= $page) ? false : true;
             $result= $result
                    ->skip($off)
                    ->take($perpage)
                    ->get();
            if($count > 0){
                foreach ($result as $key => $row) {
                    $row->post_video = asset('uploads/videos/'.$row->post_video);
                    $row->post_video_thumb = asset('uploads/videos/'.$row->post_video_thumb);
                }
                $message = 'Video lists';
                return self::json_response_with_count($result,$message,200,$status_next);
            }else{
                $message = 'No data';
                return self::json_response_with_count([],$message,400);
            }
        }else{
            $message = 'Pleae enter video_id or user_id';
            return self::json_response_with_count([],$message,400);
        }
    }



    public function viewers_add(Request $request){
        $user_id = $request->input('user_id');
        $video_id = $request->input('video_id');
        $device_id = $request->input('device_id');
        if(!empty($video_id) && !empty($user_id) && !empty($device_id)){
            $viewers_count = DB::table('video_viewers')
                ->where('user_id',$user_id)
                ->where('device_id',$device_id)
                ->where('video_id',$video_id)
                ->count();

            $total_viewers_count = DB::table('video_viewers')
                ->where('video_id',$video_id)
                ->count();

            if($viewers_count > 0){
                $result = array('view_cout'=>$total_viewers_count);
                $message = 'Add your viewers successfully';
                return self::json_response($result,$message,200);
            }else{
                $total_viewers_count++;
                $result = array('view_cout'=>$total_viewers_count);
                $viewers = array(
                    'user_id' =>$user_id,
                    'video_id' =>$video_id,
                    'device_id' =>$device_id,
                    'created_at' =>NOW()
                );
                $viewers_insert = DB::table('video_viewers')->insertGetId($viewers);
                if($viewers_insert){
                    $message = 'Add your viewers successfully';
                    return self::json_response($result,$message,200);
                }
            }
        }else if(!empty($video_id) && empty($user_id) && !empty($device_id)){
               $viewers_count = DB::table('video_viewers')
                ->where('device_id',$device_id)
                ->where('video_id',$video_id)
                ->where('is_active',0)
                ->count();

                $total_viewers_count = DB::table('video_viewers')
                    ->where('video_id',$video_id)
                    ->count();

                if($viewers_count > 0){
                        $result = array('view_cout'=>$total_viewers_count);
                        $message = 'Add your viewers successfully';
                        return self::json_response($result,$message,200);
                }else{
                    $total_viewers_count++;
                    $result = array('view_cout'=>$total_viewers_count);
                    $viewers = array(
                        'user_id' =>0,
                        'video_id' =>$video_id,
                        'device_id' =>$device_id,
                        'created_at' =>NOW()
                    );
                    $viewers_insert = DB::table('video_viewers')->insertGetId($viewers);
                    if($viewers_insert){
                        $message = 'Add your viewers successfully';
                        return self::json_response($result,$message,200);
                    }
                }
        }
    }


     public function add_feedback(Request $request){
        
    	 $email = $request->input('email');
    	 $text  = $request->input('text');
    	 if(empty($email)){
		$message = 'Please enter email address';
		return self::json_response([],$message,400);
	     }
	    if(empty($text)){
		$message = 'Please enter email Description';
		return self::json_response([],$message,400);
	     }
    	$feedback = array(
		    'email' =>$email,
		    'text' =>$text,
		    'created_at' =>NOW()
		);
        $feedback_insert = DB::table('user_feedbacks')->insertGetId($feedback);
        if($feedback_insert){
			$text = 'Hello Admin,';
			$text .= '<br><br> Some one feedback your APP';
			$text .= '<p>Email :'.$email;
			$text .= '</p>';
			Mail::send([],[], function($message) use ($email,$text)
			{
    			$message->subject('HAPPY APP FEEDBACK');
    			$message->from('admin@happyapp.com', 'HAPPY APP');
    			// $message->to('devanand@yopmail.com');
                $message->to('jacklogan955@gmail.com');
    			$message->setBody($text, 'text/html');
			});
			$message = 'Feedback has been sent successfully.';
			return self::json_response([],$message,200);
        }
     }

    
    public function edit_profile(Request $request){
        $user_id = $request->input('user_id');
        $name = $request->input('name');
        $profile_pic = $request->input('profile_pic');
        $number = $request->input('number');
        $email = $request->input('email');
        $check_user = DB::table('users')->where('id',$user_id)->count();        
        if($check_user > 0){
            if(isset($_FILES['profile_pic']['name'])){
                $requestAll=$request->all();
                $profile_pic=$requestAll['profile_pic'];
                $fileName = time().'.'.$profile_pic->getClientOriginalExtension();
                $destinationPath = public_path().'/uploads/profile_pic/';
                $profile_pic->move($destinationPath, $fileName);
                $App_url = config('app.url');
                $image_path = $App_url.'uploads/profile_pic/'; 
                $dbPath = $image_path.$fileName;
                $profilePicUpdate = array('avatar' =>$dbPath);
                $profilePicUpdateDetails = DB::table('users')->where('id',$user_id)->update($profilePicUpdate);
            }
            $user_update = array(
                'name'=>$name,
                'number'=>$number,
                'email'=>$email
            );
            $user_update_details = DB::table('users')
                                    ->where('id', $user_id)
                                    ->update($user_update);
            $getUserDetails = DB::table('users')
                                ->select('id as user_id', 
                                    DB::Raw('IFNULL( name , "" ) as name'),
                                    DB::Raw('IFNULL( number , "" ) as number'),
                                    DB::Raw('IFNULL( email , "" ) as email'),
                                    DB::Raw('IFNULL( facebook_id , "" ) as facebook_id'),
                                    DB::Raw('IFNULL( google_id , "" ) as google_id'),
                                    DB::Raw('IFNULL( twitter_id , "" ) as twitter_id'),
                                    DB::Raw('IFNULL( is_facebook, "" ) as is_facebook'),
                                    DB::Raw('IFNULL( is_google , "" ) as is_google'),
                                    DB::Raw('IFNULL( is_twitter , "" ) as is_twitter'),
                                    DB::Raw('IFNULL( avatar , "" ) as profile_pic')
                                 )
                            ->where('id',$user_id)->get()->first();
            $message = 'Profile has been updated successfully.';
            return self::json_response($getUserDetails,$message,200);
        }else{
            $message = 'Please enter valid user id';
            return self::json_response((object)[],$message,200);
        }
    }


    public function comment_list_backup(Request $request){
        $video_id = $request->input('video_id');
        $video_check = DB::table('user_comments')->where('video_id',$video_id)->count();
        if($video_check > 0){
            $result = DB::table('posts as P')
            ->select(
                    'UC.id as comment_id',
                    'P.id as video_id',
                    'UC.text as comment'
                )
            ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
            ->where('P.id',$video_id)->where('UC.type',0)->get()->last();
        $reply_comment = DB::table('posts as P')
            ->select(
                    'UC.id as comment_id',
                    'P.id as video_id',
                    'UC.text as comment'
                )
            ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
            ->where('P.id',$video_id)->where('UC.type',1)->get();
            $result->reply = $reply_comment;
            $message = 'Comment Lists';
            return self::json_response($result,$message,200);
        }else{
            $message = 'No any comment yet in this video';
            return self::json_response((object)[],$message,200);
        }
     }


     public function comment_list(Request $request){           
        $user_id = $request->input('user_id');
        $video_id = $request->input('video_id');
        $page = $request->input('page');
        $sort = $request->input('sort');
        $perpage  = 10;
        $limit = $page * $perpage;
        $off = $limit - $perpage;

        $video_check = DB::table('user_comments')->where('video_id',$video_id)->count();
        if($video_check > 0){
                    $result = DB::table('posts as P')
                    ->select(
                            'UC.id as parent_id',
                            'P.id as video_id',
                            'UC.text as comment',
                            'U.id as user_id',
                            'U.name',
                            DB::raw("IFNULL(U.avatar, '') as profile_pic"),
                            'UC.created_at as comment_date',
                            DB::Raw('case 
                                        when CLU.id is null then "0" 
                                        when CLU.is_active=0 then "0" 
                                        when CLU.is_active=1 then "1" 
                                        when CLU.is_active=2 then "2" end as is_like
                                    '),
                            DB::Raw('case when FCO.id is null then "false" else "true" end as is_flag')
                        )
                    ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
                    ->leftJoin('users as U','U.id','=','UC.user_id')
                    ->leftJoin('comment_like_unlikes as CLU', function($join)use($user_id){
                        $join->on('CLU.comment_id', '=', 'UC.id')
                        ->where('CLU.user_id', '=', $user_id);
                        // ->where('CLU.is_active', '=', 0);

                    })
                    ->leftJoin('flag_comments as FCO', function($join)use($user_id){
                        $join->on('FCO.comment_id', '=', 'UC.id')
                        ->where('FCO.user_id', '=', $user_id)
                        ->where('FCO.is_active', '=', 0);

                    })
                    ->where('P.id',$video_id)
                    ->where('UC.type',0)
                    ->where('UC.is_active',0)
                    ->orderBy('UC.created_at', $sort);

                    $count = $result->count();
                    // dd($count);
                    $pageShow = ceil($count/$perpage);                    
                    $status_next =($pageShow <= $page) ? false : true;

                    $result = $result
                            ->skip($off)
                            ->take($perpage)
                            ->get();            
                if($count > 0)
                {
                    foreach ($result as $key => $value) {


                         $get_like_count = DB::table('user_comments as UC')
                                        ->select(
                                                'UC.id'
                                            )
                                        ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
                                        ->where('ULU.comment_id',$value->parent_id)
                                        ->where('ULU.is_active',1)
                                        ->get()->count();
                                        $value->like_count = $get_like_count;
                          $get_unlike_count = DB::table('user_comments as UC')
                                        ->select(
                                                'UC.id'
                                            )
                                        ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
                                        ->where('ULU.comment_id',$value->parent_id)
                                        ->where('ULU.is_active',2)
                                        ->get()->count();
                                        $value->unlike_count = $get_unlike_count;
                        $value->total_like_unlike = $get_like_count - $get_unlike_count;

                        $get_reply_comment = DB::table('posts as P')
                                        ->select(
                                                'UC.id as child_id',
                                                'UC.parent_id',
                                                'P.id as video_id',
                                                'UC.text as comment',
                                                'U.id as user_id',
                                                'U.name',
                                                DB::raw("IFNULL(U.avatar, '') as profile_pic"),
                                                'UC.created_at as comment_date'
                                            )
                                        ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
                                        ->leftJoin('users as U','U.id','=','UC.user_id')
                                        ->where('P.id',$video_id)
                                        ->where('UC.parent_id',$value->parent_id)
                                        ->where('UC.type',1)
                                        ->where('UC.is_active',0)
                                        ->get()->count();
                                        $value->reply_comment = $get_reply_comment;

                    }
                    $message = 'Comment Lists';
                    return self::json_response($result,$message,200,$status_next);
                }else{
                    $message = 'No Comment Yet';
                    return self::json_response((object)[],$message,200);
                }
            
        }else{
            $message = 'No any comment yet in this video';
            return self::json_response((object)[],$message,200);
        }
     }


     // public function child_comment_listing(Request $request){
     //    $video_id = $request->input('video_id');
     //    $parent_id = $request->input('parent_id');
     //    $user_id = $request->input('user_id');
     //    $sort = $request->input('sort');
     //    $result = DB::table('posts as P')
     //                        ->select(
     //                                'UC.id as child_id',
     //                                'UC.parent_id',
     //                                'P.id as video_id',
     //                                'UC.text as comment',
     //                                'U.id as user_id',
     //                                'U.name',
     //                                DB::raw("IFNULL(U.avatar, '') as profile_pic"),
     //                                'UC.created_at as comment_date',
     //                                 DB::Raw('case 
     //                                    when CLU.id is null then "0" 
     //                                    when CLU.is_active=0 then "1" 
     //                                    when CLU.is_active=1 then "2" end as is_like
     //                                '),
     //                                DB::Raw('case when FCO.id is null then "false" else "true" end as is_flag')
     //                            )
     //                        ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
     //                        ->leftJoin('users as U','U.id','=','UC.user_id')
     //                        ->leftJoin('comment_like_unlikes as CLU', 
     //                            function($join)use($user_id){
     //                                $join->on('CLU.comment_id', '=', 'UC.id')
     //                                ->where('CLU.user_id', '=', $user_id);
                                    
     //                            })
     //                        ->leftJoin('flag_comments as FCO', function($join)use($user_id){
     //                                $join->on('FCO.comment_id', '=', 'UC.id')
     //                                ->where('FCO.user_id', '=', $user_id)
     //                                ->where('FCO.is_active', '=', 0);

     //                            })
     //                        ->where('P.id',$video_id)
     //                        ->where('UC.parent_id',$parent_id)
     //                        ->where('UC.type',1)
     //                        ->where('UC.is_active',0)
     //                        ->orderBy('UC.created_at', $sort)
     //                        ->get();
     //        foreach ($result as $key => $value) {
     //            $get_like_count = DB::table('user_comments as UC')
     //                            ->select(
     //                                    'UC.id'
     //                                )
     //                            ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
     //                            ->where('ULU.comment_id',$value->child_id)
     //                            ->where('ULU.is_active',0)
     //                            ->get()->count();
     //                            $value->like_count = $get_like_count;
     //            }
     //    $message = 'Comment Lists';
     //    return self::json_response($result,$message,200);
     // }

     public function child_comment_listing(Request $request){
        $video_id = $request->input('video_id');
        $parent_id = $request->input('parent_id');
        $user_id = $request->input('user_id');
        $sort = $request->input('sort');
        $result = DB::table('posts as P')
                            ->select(
                                    'UC.id as child_id',
                                    'UC.parent_id',
                                    'P.id as video_id',
                                    'UC.text as comment',
                                    'U.id as user_id',
                                    'U.name',
                                    DB::raw("IFNULL(U.avatar, '') as profile_pic"),
                                    'UC.created_at as comment_date',
                                    DB::Raw('case 
                                        when CLU.id is null then "0" 
                                        when CLU.is_active=0 then "0" 
                                        when CLU.is_active=1 then "1" 
                                        when CLU.is_active=2 then "2" end as is_like
                                    '),
                                    DB::Raw('case when FCO.id is null then "false" else "true" end as is_flag')
                                )
                            ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
                            ->leftJoin('users as U','U.id','=','UC.user_id')
                            ->leftJoin('comment_like_unlikes as CLU', 
                                function($join)use($user_id){
                                    $join->on('CLU.comment_id', '=', 'UC.id')
                                    ->where('CLU.user_id', '=', $user_id);
                                    
                                })
                            ->leftJoin('flag_comments as FCO', function($join)use($user_id){
                                    $join->on('FCO.comment_id', '=', 'UC.id')
                                    ->where('FCO.user_id', '=', $user_id)
                                    ->where('FCO.is_active', '=', 0);

                                })
                            ->where('P.id',$video_id)
                            ->where('UC.parent_id',$parent_id)
                            ->where('UC.type',1)
                            ->where('UC.is_active',0)
                            ->orderBy('UC.created_at', $sort)
                            ->get();
            foreach ($result as $key => $value) {
                $get_like_count = DB::table('user_comments as UC')
                                ->select(
                                        'UC.id'
                                    )
                                ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
                                ->where('ULU.comment_id',$value->child_id)
                                ->where('ULU.is_active',1)
                                ->get()->count();
                                $value->like_count = $get_like_count;
                $get_unlike_count = DB::table('user_comments as UC')
                                ->select(
                                        'UC.id'
                                    )
                                ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
                                ->where('ULU.comment_id',$value->child_id)
                                ->where('ULU.is_active',2)
                                ->get()->count();
                                $value->unlike_count = $get_unlike_count;
                $value->total_like_unlike = $get_like_count - $get_unlike_count;
                }
        $message = 'Comment Lists';
        return self::json_response($result,$message,200);
     }


    public function video_favourite_unfavourite(Request $request){
        // favourite_type = favourite : 0 , unfavourite : 1 ;
            $favourite_delete = array(
                    'is_active' => 1
                );

        if($request->input('favourite_type') == 0){
            $result =   DB::table('video_favourites')->select('id')
                    ->where('video_id',$request->input('video_id'))
                    ->where('is_active',0)
                    ->where('user_id',$request->input('user_id'));
            $count = $result->count();
            $result = $result->first();
            if($count > 0){
                $message = 'You have choosed already this video as a favourite';
                 return self::json_response((object)[],$message,200);
            }else{
                $favourite = array(
                    'video_id' =>$request->input('video_id'),
                    'user_id' =>$request->input('user_id')
                );
                $favouriteInsert = DB::table('video_favourites')->insertGetId($favourite);
                $message = 'Your video is successfully added to favourite';
                return self::json_response((object)[],$message,200);
            }
        }else{
            $result = DB::table('video_favourites')->select('id')
                    ->where('video_id',$request->input('video_id'))
                    ->where('is_active',0)
                    ->where('user_id',$request->input('user_id'));
            $count = $result->count();
            $result = $result->first();
            if($count > 0){
                // $video_delete= DB::table('video_favourites')
                //                     ->where('video_id', $request->input('video_id'))
                //                     ->where('user_id', $request->input('user_id'))
                //                     ->delete();
                $video_delete= DB::table('video_favourites')
                                    ->where('video_id', $request->input('video_id'))
                                    ->where('user_id', $request->input('user_id'))
                                    ->update($favourite_delete);
                 $message = 'Your video is successfully removed from favourite';
                 return self::json_response((object)[],$message,200);
            }else{
                 $message = 'You need to choose this video first as a favourite';
                 return self::json_response((object)[],$message,200);
            }
        }        
    }

    public function add_comment(Request $request){
        $video_id = $request->input('video_id');
        $user_id = $request->input('user_id');
        $parent_id = $request->input('parent_id');
        $type = $request->input('type');
        $text = $request->input('text');
        $date = date('Y-m-d H:i:s');
        if($type == 0){
            $dataInsertParent = array(
                'video_id'=>$video_id,
                'user_id'=>$user_id,
                'type'=>$type,
                'text'=>$text
            );
            $dataInsertParentDetails = DB::table('user_comments')->insertGetId($dataInsertParent);
            $getCommentDetails = DB::table('posts as P')
                                        ->select(
                                                'UC.id as parent_id',
                                                'P.id as video_id',
                                                'UC.text as comment',
                                                'U.id as user_id',
                                                'U.name',
                                                DB::raw("IFNULL(U.avatar, '') as profile_pic"),
                                                'UC.created_at as comment_date'
                                            )
                                        ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
                                        ->leftJoin('users as U','U.id','=','UC.user_id')
                                        ->where('UC.id',$dataInsertParentDetails)
                                    ->get()
                                    ->first();
                $message = 'Your comment has beend added successfully';
                return self::json_response($getCommentDetails,$message,200);
        }else{
            if($parent_id != ''){
                $dataInsertParent = array(
                'video_id'=>$video_id,
                'user_id'=>$user_id,
                'type'=>$type,
                'text'=>$text,
                'parent_id'=>$parent_id
                );
                $dataInsertParentDetails = DB::table('user_comments')->insertGetId($dataInsertParent);
                $getCommentDetails = DB::table('posts as P')
                                        ->select(
                                                'UC.id as child_id',
                                                'P.id as video_id',
                                                'UC.text as comment',
                                                'U.id as user_id',
                                                'U.name',
                                                DB::raw("IFNULL(U.avatar, '') as profile_pic"),
                                                'UC.created_at as comment_date'
                                            )
                                        ->leftJoin('user_comments as UC','UC.video_id','=','P.id')
                                        ->leftJoin('users as U','U.id','=','UC.user_id')
                                        ->where('UC.id',$dataInsertParentDetails)
                                    ->get()
                                    ->first();
                    $message = 'Your reply has beend added successfully';
                    return self::json_response($getCommentDetails,$message,200);
            }else{
                $message = 'Please enter valid Parent Id';
                return self::json_response((object)[],$message,200);
            }
        }
     }
     
     public function comment_delete(Request $request){
        $child_id = $request->input('child_id');
        $parent_id = $request->input('parent_id');
            $comment_delete = array(
                    'is_active' => 1
                );
            if($child_id != '' && $parent_id == '' ){        
                $child_comment_delete = DB::table('user_comments')
                                        ->where('id',$child_id)
                                        ->update($comment_delete);
                $message = 'Your comment has been removed successfully';
                return self::json_response((object)[],$message,200);
            }else if($child_id == '' && $parent_id != ''){
                $parent_comment_delete = DB::table('user_comments')
                                        ->where('id',$parent_id)
                                        ->update($comment_delete);
                $child_comment_delete = DB::table('user_comments')
                                        ->where('parent_id',$parent_id)
                                        ->update($comment_delete);

                $message = 'Your comment has been removed successfully';
                return self::json_response((object)[],$message,200);

            }else{
                $message = 'Please enter Child Id or Parent Id';
                return self::json_response((object)[],$message,200);
            }
     }

     public function comment_like_unlike(Request $request){
        // like_type = like : 0 , unlike : 1 ;
        $user_id = $request->input('user_id');
        $like_type = $request->input('like_type');
        $comment_id = $request->input('comment_id');
            $delete = array(
                    'is_active' => 1
                );
      

         $result =   DB::table('comment_like_unlikes')->select('id')

                    ->where('comment_id',$comment_id)
                    ->where('user_id',$user_id);
            $count = $result->count();
            $result = $result->first();

            
        if($count > 0){
            $updateLike = array(
            'is_active' =>$like_type
            );
            $likeInsert = DB::table('comment_like_unlikes')
            ->where('id',$result->id)
            ->update($updateLike);

            $get_like_count = DB::table('user_comments as UC')
            ->select('UC.id')
            ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
            ->where('ULU.comment_id',$comment_id)
            ->where('ULU.is_active',1)
            ->get()->count();
            $get_unlike_count = DB::table('user_comments as UC')
            ->select('UC.id')
            ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
            ->where('ULU.comment_id',$comment_id)
            ->where('ULU.is_active',2)
            ->get()->count();
            $total_like_unlike = $get_like_count - $get_unlike_count;
            
             $total_like_unlike = array(
                    'total_like_unlike' => $total_like_unlike
                );
            $message = 'Your comment is successfully removed from like';
            return self::json_response($total_like_unlike,$message,200);
        }else{
            $like = array(
            'comment_id' =>$comment_id,
            'user_id' =>$user_id,
            'is_active' =>$like_type
            );
            $likeInsert = DB::table('comment_like_unlikes')->insertGetId($like); 
            $get_like_count = DB::table('user_comments as UC')
            ->select('UC.id')
            ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
            ->where('ULU.comment_id',$comment_id)
            ->where('ULU.is_active',1)
            ->get()->count();
            $get_unlike_count = DB::table('user_comments as UC')
            ->select('UC.id')
            ->leftJoin('comment_like_unlikes as ULU','UC.id','=','ULU.comment_id')
            ->where('ULU.comment_id',$comment_id)
            ->where('ULU.is_active',2)
            ->get()->count();
            $total_like_unlike = $get_like_count - $get_unlike_count;
            
             $total_like_unlike = array(
                    'total_like_unlike' => $total_like_unlike
                );
            if($like_type == 0){
             $message = 'Your comment is successfully removed from like';
            return self::json_response($total_like_unlike,$message,200);
            }else if($like_type == 1){
                 $message = 'Your comment is successfully like';
            return self::json_response($total_like_unlike,$message,200);
            }else{
                $message = 'Your comment is successfully unlike';
            return self::json_response($total_like_unlike,$message,200);
            }
            
        }
        /*if($like_type == 1){
            $result =   DB::table('comment_like_unlikes')->select('id')

                    ->where('comment_id',$comment_id)
                    ->where('user_id',$user_id);
            $count = $result->count();
            $result = $result->first();
        if($count > 0){
            $updateLike = array(
            'is_active' =>$like_type
            );
            $likeInsert = DB::table('comment_like_unlikes')
            ->where('id',$result->id)
            ->update($updateLike);
            $message = 'Your comment is successfully removed from like';
            return self::json_response((object)[],$message,200);
        }else{
            $like = array(
            'comment_id' =>$comment_id,
            'user_id' =>$user_id,
            'is_active' =>$like_type
            );
            $likeInsert = DB::table('comment_like_unlikes')->insertGetId($like); 
            if($like_type == 0){
             $message = 'Your comment is successfully removed from like';
            return self::json_response((object)[],$message,200);
            }else if($like_type == 1){
                 $message = 'Your comment is successfully like';
            return self::json_response((object)[],$message,200);
            }else{
                $message = 'Your comment is successfully unlike';
            return self::json_response((object)[],$message,200);
            }

        } */       

            
        /*} */     

     }

     // public function comment_like_unlike(Request $request){
     //    // like_type = like : 0 , unlike : 1 ;
     //    $user_id = $request->input('user_id');
     //    $like_type = $request->input('like_type');
     //    $comment_id = $request->input('comment_id');
     //        $delete = array(
     //                'is_active' => 1
     //            );

     //    if($like_type == 0){
     //        $result =   DB::table('comment_like_unlikes')->select('id')
     //                ->where('comment_id',$comment_id)
     //                ->where('is_active',0)
     //                ->where('user_id',$user_id);
     //        $count = $result->count();
     //        $result = $result->first();
     //        if($count > 0){
     //            $message = 'You have choosed already this video as a like';
     //             return self::json_response((object)[],$message,200);
     //        }else{

     //                $check_like =  DB::table('comment_like_unlikes')->select('id')
     //                               ->where('comment_id',$comment_id)
     //                               ->where('is_active',1)
     //                               ->where('user_id',$user_id);
     //                $count_like = $check_like->count();

     //                $result_like = $check_like->first();
     //                if($count_like > 0){
     //                        $updateLike = array(
     //                        'is_active' =>0 
     //                        );
     //                        $likeInsert = DB::table('comment_like_unlikes')
     //                        ->where('id',$result_like->id)
     //                        ->update($updateLike);
     //                }else{
     //                    $like = array(
     //                    'comment_id' =>$comment_id,
     //                    'user_id' =>$user_id
     //                    );
     //                    $likeInsert = DB::table('comment_like_unlikes')->insertGetId($like);
     //                }
                    
     //                $message = 'Your video is successfully added to like';
     //                return self::json_response((object)[],$message,200);
     //        }
     //    }else{
     //        $result = DB::table('comment_like_unlikes')->select('id')
     //                ->where('comment_id',$comment_id)
     //                ->where('is_active',0)
     //                ->where('user_id',$user_id);
     //        $count = $result->count();
     //        $result = $result->first();
     //        if($count > 0){
     //            $like_delete= DB::table('comment_like_unlikes')
     //                                ->where('comment_id', $comment_id)
     //                                ->where('user_id', $user_id)
     //                                ->update($delete);
     //             $message = 'Your video is successfully removed from like';
     //             return self::json_response((object)[],$message,200);
     //        }else{
     //             $message = 'You need to choose this video first as a favourite';
     //             return self::json_response((object)[],$message,200);
     //        }
     //    }        
     // }


     public function video_recommend(Request $request){

        // recommend_type = recommend : 0 , unrecommend : 1 ;
        $user_id = $request->input('user_id');
        $recommend_type = $request->input('recommend_type');
        $video_id = $request->input('video_id');
            $delete = array(
                    'is_active' => 1
                );

        if($recommend_type == 0){
            $result =   DB::table('recommend_videos')->select('id')
                    ->where('video_id',$video_id)
                    ->where('is_active',0)
                    ->where('user_id',$user_id);
            $count = $result->count();
            $result = $result->first();
            if($count > 0){
                $message = 'You have choosed already this video as a recommend';
                 return self::json_response((object)[],$message,200);
            }else{

                    $check_recommend =  DB::table('recommend_videos')->select('id')
                                   ->where('video_id',$video_id)
                                   ->where('is_active',1)
                                   ->where('user_id',$user_id);
                    $count_recomment = $check_recommend->count();

                    $check_recommend = $check_recommend->first();
                    if($count_recomment > 0){
                            $updateRecommend = array(
                            'is_active' =>0 
                            );
                            $likeInsert = DB::table('recommend_videos')
                            ->where('id',$check_recommend->id)
                            ->update($updateRecommend);
                    }else{
                        $recommend = array(
                        'video_id' =>$video_id,
                        'user_id' =>$user_id
                        );
                        $likeInsert = DB::table('recommend_videos')->insertGetId($recommend);
                    }
                    
                    $message = 'Your video is successfully added to recommend';
                    return self::json_response((object)[],$message,200);
            }
        }else{
            $result = DB::table('recommend_videos')->select('id')
                    ->where('video_id',$video_id)
                    ->where('is_active',0)
                    ->where('user_id',$user_id);
            $count = $result->count();
            $result = $result->first();
            if($count > 0){
                $video_delete= DB::table('recommend_videos')
                                    ->where('video_id', $video_id)
                                    ->where('user_id', $user_id)
                                    ->update($delete);
                 $message = 'Your video is successfully removed from recommend';
                 return self::json_response((object)[],$message,200);
            }else{
                 $message = 'You need to choose this video first as a favourite';
                 return self::json_response((object)[],$message,200);
            }
        }
     }


    public function flag_unflag_comment(Request $request){

        // recommend_type = recommend : 0 , unrecommend : 1 ;
        $user_id = $request->input('user_id');
        $flag_type = $request->input('flag_type');
        $comment_id = $request->input('comment_id');
            $delete = array(
                    'is_active' => 1
                );

        if($flag_type == 0){
            $result =   DB::table('flag_comments')->select('id')
                    ->where('comment_id',$comment_id)
                    ->where('is_active',0)
                    ->where('user_id',$user_id);
            $count = $result->count();
            $result = $result->first();
            if($count > 0){
                $message = 'You have choosed already this video as a flag';
                 return self::json_response((object)[],$message,200);
            }else{

                    $check_recommend =  DB::table('flag_comments')->select('id')
                                   ->where('comment_id',$comment_id)
                                   ->where('is_active',1)
                                   ->where('user_id',$user_id);
                    $count_recomment = $check_recommend->count();

                    $check_recommend = $check_recommend->first();
                    if($count_recomment > 0){
                            $updateRecommend = array(
                            'is_active' =>0 
                            );
                            $likeInsert = DB::table('flag_comments')
                            ->where('id',$check_recommend->id)
                            ->update($updateRecommend);
                    }else{
                        $recommend = array(
                        'comment_id' =>$comment_id,
                        'user_id' =>$user_id
                        );
                        $likeInsert = DB::table('flag_comments')->insertGetId($recommend);
                    }
                    
                    $message = 'Your video is successfully added to flag';
                    return self::json_response((object)[],$message,200);
            }
        }else{
            $result = DB::table('flag_comments')->select('id')
                    ->where('comment_id',$comment_id)
                    ->where('is_active',0)
                    ->where('user_id',$user_id);
            $count = $result->count();
            $result = $result->first();
            if($count > 0){
                $video_delete= DB::table('flag_comments')
                                    ->where('comment_id', $comment_id)
                                    ->where('user_id', $user_id)
                                    ->update($delete);
                 $message = 'Your video is successfully removed from flag';
                 return self::json_response((object)[],$message,200);
            }else{
                 $message = 'You need to choose this video first as a flag';
                 return self::json_response((object)[],$message,200);
            }
        }
     }



     public function getAdminEmailForVideoMail()
     {
        $adminEmailForVideoMail = DB::table('settings')
            ->where('key','admin.submit_video_mail')
            ->get()
            ->last();

        // print_r($adminEmailForVideoMail);exit;

        $message = "Admin Email For Send Video Mail";
           
        $responsedata = array(
            'admin_email' =>  $adminEmailForVideoMail->value,
        );
        return self::json_response($responsedata,$message,200);
    }
}
