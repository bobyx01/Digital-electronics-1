----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 16:18:15
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_t_ff_rst is
--  Port ( );
end tb_t_ff_rst;

architecture Behavioral of tb_t_ff_rst is
     -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;

    signal s_rst : std_logic;
    signal s_t : std_logic;
    signal s_q : std_logic;
    signal s_q_bar : std_logic;
begin
    uut_jk_ff_rst: entity work.t_ff_rst
    port map(
        clk => s_clk_100MHz,
        rst => s_rst,
        t => s_t,
        q => s_q,
        q_bar => s_q_bar
    );
   p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    p_reset_gen : process
    begin
        s_rst <= '0';
        
        wait for 28 ns;
        s_rst <= '1';
        
        wait for 14ns;
        s_rst <= '0';  
        
        wait for 37 ns;
        s_rst <= '1';
        
        wait for 33 ns;
        s_rst <= '0';
        
        wait for 300ns;
        s_rst <= '1';
        wait;     
    end process p_reset_gen;
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_t <= '0';
        wait for 40 ns;
        s_t <= '1';
        wait for 7 ns;
        s_t <= '0';
        wait for 20 ns;
        s_t <= '1';
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus; 

end Behavioral;
