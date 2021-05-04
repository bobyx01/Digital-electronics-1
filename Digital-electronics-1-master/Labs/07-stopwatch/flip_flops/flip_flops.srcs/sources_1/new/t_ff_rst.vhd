library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff_rst is
    Port( 
    clk   : in std_logic;
    rst   : in std_logic;
    t     : in std_logic;
    q     : out std_logic;
    q_bar : out std_logic
    );
end t_ff_rst;

architecture Behavioral of t_ff_rst is
    signal s_q :std_logic;  
begin
    p_t_ff_rst : process (clk)
    begin 
        if rising_edge(clk) then
            if(rst = '1')then
                s_q <= '0';        
            else
                if(t='0' and s_q='0') then
                    s_q <= s_q;
                elsif(t='0' and s_q='1') then
                    s_q <= s_q;
                elsif(t='1' and s_q='0') then
                    s_q <= not s_q;
                elsif(t='1' and s_q='1') then
                    s_q <= not s_q;
                end if;
            end if;
        end if;    
    end process p_t_ff_rst;
    q     <= s_q;
    q_bar <= not s_q;
end Behavioral;
