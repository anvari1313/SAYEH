--------------------------------------------------------------------------------
-- Author:              SeyedMostafa Meshkati
--------------------------------------------------------------------------------
-- Create Date:         08-04-2017
-- Package Name:        alu_component
-- Module Name:         COMPARISION_COMPONENT
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity BIT_COMPARATOR_COMPONENT is
    port(
        INPUT1   : in std_logic;
        INPUT2   : in std_logic;
        E_IN     : in std_logic;
        L_IN     : in std_logic;
        G_IN     : in std_logic;
        EQUAL    : out std_logic;
        GREATER  : out std_logic;
        LOWER    : out std_logic
    );
end entity;

architecture BIT_COMPARATOR_ARCH of BIT_COMPARATOR_COMPONENT is
    signal e, g, l : std_logic;
begin
    e    <= INPUT1 xnor INPUT2;
    g    <= INPUT1 and (not INPUT2);
    l    <= (not INPUT1) and INPUT2;
    GREATER <= (g or G_IN) and (not (L_IN or E_IN));
    LOWER <= (l or L_IN) and (not (G_IN or E_IN));
    EQUAL <= (e or E_IN) and (not (G_IN or L_IN));
end architecture;