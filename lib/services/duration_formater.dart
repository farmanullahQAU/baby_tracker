   
   class DurationServices{
   static String? buildTime(Duration duration){
//if both feeded then it will format the duration for both other wise it will set null for other if one is feeded
     if(duration.inSeconds>0)
     {
       String buildTowDigits(int duration)=>duration.toString().padLeft(2,"0");

final seconds=buildTowDigits(duration.inSeconds.remainder(60));
final minutes=buildTowDigits(duration.inMinutes.remainder(60));
return 
"$minutes:$seconds";

     }
else{

  return null;
}






  }

  

   }
   
