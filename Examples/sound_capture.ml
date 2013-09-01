open OcsfmlSystem
open OcsfmlAudio


let _ =
  if not (SoundRecorder.is_available ())
  then failwith "Sorry, audio capture is not supported by your system" ;
    
  let sample_rate =
    print_string "Please choose the sample rate for sound capture (44100 is CD quality) : " ;
    read_int ()
  in
  
  let _ =
    print_string "Press enter to start recording audio" ;
    read_line ()
  in
  
  let recorder = new sound_buffer_recorder in
  recorder#start ~sample_rate () ;
  
  let _ =
    print_string "Recording... press enter to stop" ;
    read_line ()
  in
  
  recorder#stop ;
  
  let buffer = recorder#get_buffer in

  Printf.printf "Sound information :\n" ;
  Printf.printf " %f seconds\n" (Time.as_seconds buffer#get_duration) ;
  Printf.printf " %d samples / seconds\n" buffer#get_sample_rate ;
  Printf.printf " %d seconds\n" buffer#get_channel_count ;
  flush stdout ;  

  let choice =
    print_string "What do you want to do with captured sound (p = play, s = save)" ;
    flush stdout ;
    input_char stdin 
  in

  if choice = 's'
  then 
    let filename =
      print_string "Choose the file to create : " ;
      read_line ()
    in
    ignore (buffer#save_to_file filename)
  else begin 
    let sound = new sound ~buffer () in
    sound#play ;
    
    while sound#get_status = Playing
    do
      Printf.printf "\rPlaying... %.2f" (Time.as_seconds sound#get_playing_offset) ;
      flush stdout ;
      sleep (Time.milliseconds 100)
    done 
  end ;
  print_string "\nDone !\n"
