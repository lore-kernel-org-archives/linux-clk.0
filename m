Return-Path: <jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
CC: Dmitry Osipenko <digetx@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra: Mark APB clock as critical
Date: Mon, 23 Oct 2017 12:12:52 +0100
Message-ID: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
Return-Path: jonathanh@nvidia.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Commit a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
fixed the parent clock for APBDMA, but the consequence of this that
after probing the APBDMA device, the APB Clock (or PCLK) is now
disabled. Disabling the APB clock causes accesses to any other device
on the APB to hang and prevent Tegra from booting.

Currently, the APB clock is registered with the flag "CLK_IGNORE_UNUSED"
to prevent the clock being disabled if unused on boot. However, even
if it is used, it still needs to be always kept enabled and so update
the flag for the APB clock to be "CLK_IS_CRITICAL".

Fixes: a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")

Suggested-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-super-gen4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index 4f6fd307cb70..10047107c1dc 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -166,7 +166,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
 				   &sysrate_lock);
 	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
-				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
+				CLK_IS_CRITICAL, clk_base + SYSTEM_CLK_RATE,
 				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
 	*dt_clk = clk;
 }
-- 
2.7.4
