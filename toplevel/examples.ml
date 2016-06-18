(** Overview *)
let x = 10+10;
let y = x * 3;
let c = String.make x 'a';
let sin1 = sin 1.;
let rec fact n => if (n == 0) { 1. } else { float n *. fact (n - 1)};
Printf.printf "fact 20 = %f\n" (fact 20);
"abc" < "def";

(** Graphics: PingPong *)
open Graphics_js;
let c = 3;
let x0 = 0;
let x1 = size_x ();
let y0 = 0;
let y1 = size_y ();

let draw_ball x y => {
 set_color foreground;
 fill_circle x y c; };


let state = ref (Lwt.task ());

let wait () => { fst(!state) };

let rec pong_aux x y dx dy => {
 draw_ball x y;
 let new_x = x + dx;
 let new_y = y + dy;
 let new_dx =
  if (new_x - c <= x0 || new_x + c >= x1) { (- dx) } else { dx };
 let new_dy =
  if (new_y - c <= y0 || new_y + c >= y1) { (- dy) } else { dy };
 Lwt.bind (wait ()) (fun () => pong_aux new_x new_y new_dx new_dy) };

let rec start () => {
  let t = Lwt.task ();
  let (_,w) = !state;
  state := t;
  clear_graph();
  Lwt.wakeup w ();
  Lwt.bind (Lwt_js.sleep (1./.60.)) start };

let pong x y dx dy => { pong_aux x y dx dy };

pong 111 87 2 3;
pong 28  57 5 3;
start ();
