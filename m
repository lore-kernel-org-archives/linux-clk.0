Return-Path: <hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Irina Tirdea <irina.tirdea@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	netdev@vger.kernel.org,
	Johannes Stezenbach <js@sig21.net>,
	Carlo Caione <carlo@endlessm.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] clk-pmc-atom + r8169: Add ether_clk handling to fix suspend issues
Date: Mon, 27 Aug 2018 16:31:56 +0200
Message-Id: <20180827143200.8597-1-hdegoede@redhat.com>
List-ID: <linux-clk.vger.kernel.org>

Hi All,

This series has as goal to revert commit d31fd43c0f9a ("clk: x86: Do not gate
clocks enabled by the firmware"), because that commit causes almost all
Cherry Trail devices to not use the S0i3 powerstate when suspending, leading
to them quickly draining their battery when suspended.

This commit was added to fix issues with the r8169 NIC on some Bay Trail
devices, where the pmc_plt_clk_4 was used as clk for the r8169 chip.

This series fixes this properly, so that we can undo the trouble some
commit.

The first patch adds an "ether_clk" alias to the clk-pmc-atom driver so
that the r8169 can pass "ether_clk" as generic id to clk_get instead of
having to add x86 specific code to the r8169 driver.

The second patch makes the r8169 driver do a clk_get for "ether_clk"
(ignoring -ENOENT errors so this is optional) and if that succeeds then
it enables the clock.

The third patch effectively revert the troublesome commit.

This series has been tested on a HP Stream x360 - 11-p000nd, which uses
a Bay Trail SoC with a r8169 ethernet chip and I can confirm that the
pmc_plt_clk_4 gets properly enabled, so this series should not cause any
regressions wrt devices needing pmc_plt_clk_4 enabled (which is not the
case on the Stream x360).

To avoid regressions we need to have patches 1 and 2 merged before 3,
so it is probably best if this entire series gets merged through a single
tree. Given that clk-pmc-atom.c has not seen any changes for over a
year I suggest that all 3 patches are merged through the netdev tree,
with an ack from the clk maintainers. Assuming that is ok with the clk
maintainers of course.

Note there is a fourth patch in this series, this patch is necessary to
reach S0i3 state on Bay Trail devices wich have a r8169 ethernet chip,
since I do not have access to hardware where the r8169 actually needs
the pmc_plt_clk_4 I have not been able to test this, hence it is marked
as RFC for now.

Carlos can you test the 4th patch (when you have time) and let us know if
it works?

Regards,

Hans
