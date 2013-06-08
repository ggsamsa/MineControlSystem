with pump_controller;
with logger;
with operator_console;

package body hlw_handler is

   w : water_mark;


   function read_water_mark return water_mark is
   begin
      return w;
   end read_water_mark;


   procedure write_water_mark (to : water_mark) is
   begin
   	w := to;
   end write_water_mark;


   procedure set ( wm : water_mark ) is
   begin
      if wm = high then
         operator_console.info(operator_console.WATER_HIGH);
         pump_controller.set_pump(pump_controller.on);
      else
         operator_console.info(operator_console.WATER_LOW);
         pump_controller.set_pump(pump_controller.off);
      end if;
   exception
      when pump_controller.PUMP_NOT_SAFE => null;
   end set;

   task body thread is
   begin
      loop
         set (w);
         delay 20.0;
      end loop;
   end thread;
end hlw_handler;
