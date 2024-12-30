library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library unisim;
use unisim.vcomponents.all; 

entity simple_counter_tb is
end entity;

architecture Behavioral of simple_counter_tb is

  -- Signals for the counter
  signal clk : std_logic := '0';
  signal reset : std_logic := '1';
  signal count : std_logic_vector(3 downto 0);

  -- Clock generation
  constant clk_period : time := 20 ns; 
begin

  -- Clock process
  process
  begin
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    clk <= '0';
  end process;

  -- Reset pulse
  process
  begin
    wait for 10 ns; 
    reset <= '0';
    wait for 10 ns; 
    reset <= '1';
    wait; 
  end process;

  -- Instantiate the counter
  dut: entity work.simple_counter port map (
    clk => clk,
    reset => reset,
    count => count
  );

  -- Assertions (Optional)
  assert rising_edge(clk) report "Clock rising edge" severity note;
  assert reset = '0' report "Reset active" severity note;

  -- Check for expected count values (Optional)
  process
  begin
    wait for 4 * clk_period; -- Wait for 4 clock cycles
    assert count = "0001" report "Count incorrect after 1 cycle" severity error;
    wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "0010" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "0011" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "0100" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "0101" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "0110" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "0111" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1000" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1001" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1010" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1011" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1100" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1101" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1110" report "Count incorrect after 2 cycles" severity error;
     wait for 4 * clk_period; -- Wait for another 4 clock cycles
    assert count = "1111" report "Count incorrect after 2 cycles" severity error;
    
    wait; 
  end process;

end architecture;
