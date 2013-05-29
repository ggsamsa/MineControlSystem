package body ch4_status is

   methane : methane_status := ch4_unsafe;

   function read_ch4_status return methane_status is
   begin
      return methane;
   end read_ch4_status;

   procedure write_ch4_status (to : methane_status) is
   begin
      methane := to;

   end write_ch4_status;

end ch4_status;
