Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] clk: renesas: r7s9210: Add support for early clocks
Date: Fri, 21 Sep 2018 10:20:52 -0500
Message-Id: <20180921152054.117774-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
ostm module clocks to be registers early in boot.

This series add early clock support to cpg-mssr

Here are some notes I took:

 * Switched to using
     of_iomap(cpg_np, 0)
   instead of
     platform_get_resource(pdev, IORESOURCE_MEM, 0)

*  All devm_xxx calls were replaced with the traditinal functions because
   'dev' is not available for early probe

*  some functions are still using dev_dbg and dev_err for messages, but
   in early init, dev is set to NULL so it doesn't crash, the messages
   just look like this:
      (NULL device *): Core clock extal at 24000000 Hz
      (NULL device *): clock (1, 35) is ostm1 at 66000000 Hz

*  np was added to priv
   np is saved because dev->of_node doesn't exist during early init and we
   need to avoid using 'dev' for any function that will run during early
   init

*  all .init functions (r8xxxx_cpg_mssr_init) for the SoCs do not use dev,
   except for r8a7791_cpg_mssr_init for the lines:
       struct device_node *np = dev->of_node;
       of_device_is_compatible(np, "renesas,r8a7793-cpg-mssr")
    But, so if early clock support was every needed for r8a7791 or r8a7793,
    that line will need to be changed.

* In r7s9210-cpg-mssr.c, I moved updating the clock ratio table to a
  separate function (r7s9210_update_table) because it looks cleaner.


Chris Brandt (2):
  clk: renesas: cpg-mssr: Add early clock support
  clk: renesas: r7s9210: Convert some clocks to early

 drivers/clk/renesas/r7s9210-cpg-mssr.c | 141 +++++++++++++++++++++------------
 drivers/clk/renesas/renesas-cpg-mssr.c | 106 ++++++++++++++++++++-----
 drivers/clk/renesas/renesas-cpg-mssr.h |   6 ++
 3 files changed, 181 insertions(+), 72 deletions(-)

-- 
2.16.1
