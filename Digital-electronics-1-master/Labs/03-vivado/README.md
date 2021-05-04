# H1 Digital-electronics-1 
## 03-Vivado

![alt text](https://github.com/mrhyks/Digital-electronics-1/blob/main/Labs/03-vivado/tabulka.png "Tabulka zapojení přepínačů a led diod")

```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin
       f_o <= a_i when (sel_i = "00" ) else
              b_i when (sel_i = "01" ) else
              c_i when (sel_i = "10" ) else
              d_i;

end architecture Behavioral;

```

```vhdl
p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_d   <= "00" ; s_c <= "00" ; s_b <= "00" ; s_a <= "00" ; s_sel <= "00" ; wait for 100 ns;
        
        s_a   <= "01" ; wait for 100 ns;
        s_b   <= "01" ; wait for 100 ns;
        
        s_sel <= "01" ; wait for 100 ns;
        s_c   <= "01" ; wait for 100 ns;
        s_d   <= "01" ; wait for 100 ns;
        
        s_d   <= "10" ; s_c <= "10" ; s_b <= "10" ; s_a <= "10" ; wait for 100 ns;
        s_sel <= "11" ;
        
        s_d   <= "10" ; s_c <= "11" ; s_b <= "01" ; s_a <= "00" ; wait for 100 ns;
        s_sel <= "10" ;
        
        s_d   <= "11" ; s_c <= "01" ; s_b <= "10" ; s_a <= "11" ; wait for 100 ns;
        s_sel <= "01" ;
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

![alt text](https://github.com/mrhyks/Digital-electronics-1/blob/main/Labs/03-vivado/prubehy.png "Průběhy signálů multiplexoru")

Pro vytvoření nového projektu zapneme aplikaci Vivado a postupujeme následovně:
File->Projet->New->Next->Vyplníme Project name a location->Necháme zvolený RTL project->Target a Simulator language: VHDL->Create File->vyplníme File name->OK->Next->Next->Překlikneme na záložku Boards a zvolíme vhodnou desku->Next->Finish

Následujicí okna pouze odklikáme.

Je třeba přidat si test bench a to v okně:
Sources->Simulation Sources->Pravým tlačítkem myši->Add Source->Ponecháme Add or create simulation sources->Create Files->Vyplníme File name->OK->Finish

Následujicí okna opět odklikáme.

Pro přidání XDC souboru opět v okně:
Sources->Constrains->Pravým tlačítem myši->Add Source->Ponecháme Add or create constrains->Create File->Vyplníme File name->OK->Finish

Následujicí okna opět odklikáme.
V okně Sources otevřeme námi vytvořená .xdc soubor a vložíme zdrojový kód od výrobce.


Pro spuštení simulace uložíme provedené změny a pomocí okna:
Flow Navigator->Simulation->Run Simulation
