Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35561 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbcFWKwg (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2016 06:52:36 -0400
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Rhyland Klein <rklein@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: tegra: Make sor_safe the parent of dpaux and dpaux1
Date: Thu, 23 Jun 2016 12:52:30 +0200
Message-Id: <20160623105231.24383-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

It turns out that sor_safe, rather than pll_p, is the parent of the
dpaux and dpaux1 clocks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index aab32af77aa2..fe295b4102ca 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2466,11 +2466,11 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					1, 2);
 	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
 
-	clk = tegra_clk_register_periph_fixed("dpaux", "pll_p", 0, clk_base,
+	clk = tegra_clk_register_periph_fixed("dpaux", "sor_safe", 0, clk_base,
 					      1, 17, 181);
 	clks[TEGRA210_CLK_DPAUX] = clk;
 
-	clk = tegra_clk_register_periph_fixed("dpaux1", "pll_p", 0, clk_base,
+	clk = tegra_clk_register_periph_fixed("dpaux1", "sor_safe", 0, clk_base,
 					      1, 17, 207);
 	clks[TEGRA210_CLK_DPAUX1] = clk;
 
-- 
2.8.3

