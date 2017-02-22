Return-Path: <alexander.stein@systec-electronic.com>
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/3] LS1021A: QSPI clock divider suport
Date: Wed, 22 Feb 2017 16:03:46 +0100
Message-Id: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

first of all this is a set which is not supposed to be merged. I'll describe
later why. Therefore I also skipped any device tree binding documentation.
I'm trying to add QSPI clock divider support for LS1021A. This is a single
register with 4 bits specifying a divider in the set of 8, 12, 16, 20, 23, 32,
64 and 256.
As a prove of concept I've added 3 patches adding this feature.
1st patch:
Adding a clk_register_divider_table providing those divider set.

2nd patch:
DT node for this driver.

3rd patch:
DT node for QSPI periphery using this clock divider.

The biggest flaws in the current implementation:
* I don't like the idea of adding a driver for a specific register for a specific
  platform. Although LS1043 has the same register (even at same offset) but
  LS2080 has different valid values (e.g. 0 and 1 are reserved), different
  dividers and a different parent clock. I would like to provide this dividers
  in DT itself, but apparently there is no simple driver around
  clk_register_divider_table, no?
* The bigger problem is that the SCFG periphery containing this register is
  connected in big endian, even this is a little endian ARM CPU.
  The values in clk-ls1021a.c for divider offset is actually wrong, but works
  because this is read big endian.
  The problem is that clk_readl (used e.g. by clk-divider) and clk_writel
  assume to access by little endian, unless platform is PPC.
  I suspect adding endian awareness for those functions affects lots of
  users and seems non-trivial.

Any comments about the approach using clk_register_divider_table? How about a
specific driver providing a simple clock divider table in DT? And finally
any suggestions how to add endian awareness for clk_readl/clk_writel?

Best regards,
Alexander

Alexander Stein (3):
  clk: ls1021a: new platform clock driver
  ARM: dts: ls1021a: Add node for scfg-qspi-cfg
  ARM: dts: ls1021a: Add QSPI node

 arch/arm/boot/dts/ls1021a.dtsi | 24 +++++++++++++++++
 drivers/clk/Makefile           |  1 +
 drivers/clk/clk-ls1021a.c      | 58 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 drivers/clk/clk-ls1021a.c

-- 
2.10.2
