package ch4_status is
   type methane_status is (ch4_safe, ch4_unsafe);
   function read_ch4_status return methane_status;
   procedure write_ch4_status (to : methane_status);
end ch4_status;
