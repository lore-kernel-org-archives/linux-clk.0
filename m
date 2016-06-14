Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34330 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751140AbcFNMAs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2016 08:00:48 -0400
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Rhyland Klein <rklein@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: tegra: Disable spread spectrum on pll_d2
Date: Tue, 14 Jun 2016 14:00:42 +0200
Message-Id: <20160614120044.30734-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Enabling spread spectrum on pll_d2 can lead to issues with display
modes. HDMI monitors, for example, would report "Signal Error" and
some modes driven over DisplayPort would generate fuzzy horizontal
bands.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 6bd1235d09b1..cd141a364c9d 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1914,8 +1914,9 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.sdm_din_mask = PLLA_SDM_DIN_MASK,
 	.sdm_ctrl_reg = PLLD2_MISC1,
 	.sdm_ctrl_en_mask = PLLD2_SDM_EN_MASK,
-	.ssc_ctrl_reg = PLLD2_MISC1,
-	.ssc_ctrl_en_mask = PLLD2_SSC_EN_MASK,
+	/* disable spread-spectrum for pll_d2 */
+	.ssc_ctrl_reg = 0,
+	.ssc_ctrl_en_mask = 0,
 	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllss_nmp,
-- 
2.8.3

