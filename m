Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: mstp: Make INTC-SYS a critical clock
Date: Tue, 17 Jan 2017 13:46:30 +0100
Message-Id: <1484657190-12838-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

INTC-SYS is the module clock for the GIC.  Accessing the GIC while it is
disabled causes:

    Unhandled fault: asynchronous external abort (0x1211) at 0x00000000

Currently, the GIC-400 driver cannot enable its module clock for several
reasons:
  - It does not use a platform device, so Runtime PM is not an option,
  - gic_of_init() runs before any clocks are registered, so it cannot
    enable the clock explicitly,
  - gic_of_init() cannot return -EPROBE_DEFER, as IRQCHIP_DECLARE()
    doesn't support deferred probing.

Hence we have to keep on relying on the boot loader for enabling the
module clock.

To prevent the module clock from being disabled when the CCF core thinks
it is unused, and thus causing a system lock-up, add a check to the MSTP
clock driver and enable CLK_IS_CRITICAL. This will make sure the module
clock is never disabled.

This is a hard dependency for describing the INTC-SYS clock in DT on
R-Mobile APE6 and R-Car Gen2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "[PATCH/RFC 1/5] clk: renesas: mstp: Never disable
INTC-SYS".

v2:
  - Use the new CLK_ENABLE_HAND_OFF flag instead of adding a quirk to
    cpg_mstp_clock_endisable(),
  - drivers/clk/shmobile/ was renamed to drivers/clk/renesas/,
  - Migrate from CLK_ENABLE_HAND_OFF to CLK_IS_CRITICAL.
---
 drivers/clk/renesas/clk-mstp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 9375777776d99407..c0319b8acf3521a2 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -144,6 +144,11 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	init.name = name;
 	init.ops = &cpg_mstp_clock_ops;
 	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	/* INTC-SYS is the module clock of the GIC, and must not be disabled */
+	if (!strcmp(name, "intc-sys")) {
+		pr_debug("MSTP %s setting CLK_IS_CRITICAL\n", name);
+		init.flags |= CLK_IS_CRITICAL;
+	}
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-- 
1.9.1
