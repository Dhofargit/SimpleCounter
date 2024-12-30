library ieee;
use ieee.std_logic_1164.all;

entity simple_counter is
  port (
    clk : in std_logic;
    reset : in std_logic;
    count : out std_logic_vector(3 downto 0)
  );
end entity;

architecture Behavioral of simple_counter is
begin
  process (clk, reset)
  begin
    if reset = '1' then
      count <= "0000";
    elsif rising_edge(clk) then
      count <= std_logic_vector(unsigned(count) + 1);
    end if;
  end process;
end architecture;
