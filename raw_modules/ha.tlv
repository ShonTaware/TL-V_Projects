\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV half_adder(/_top, /_name, $_sum_out, $_carry_out, $_in1, $_in2)
   /_name
      
      
      $_sum_out = $in1 ^ $in2;
      $_carry_out = $in1 & $in2;
   

\TLV
   
   
   |adder1
      @1
         $reset = *reset;
         $a = $rand1 ;
         $b = $rand2 ;
         /test
            m4+half_adder(|adder1, /ha1, $sum1, $carry1, $b, $a)
            m4+half_adder(|adder1, /ha2, $sum2, $carry2, $a, $b)
            
            $s1 = $sum1;
            $s2 = $sum2;
            
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
