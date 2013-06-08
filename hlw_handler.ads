package hlw_handler is
   type water_mark is (high, low);

   procedure set (wm : water_mark);

   function read_water_mark return water_mark;

   procedure write_water_mark (to : water_mark);

   task thread;

end hlw_handler;
