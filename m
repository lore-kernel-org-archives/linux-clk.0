Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12161 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbeAWJXS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Jan 2018 04:23:18 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v3 4/4] soc/tegra: pmc: apply MBIST work around fo Tegra210
Date: Tue, 23 Jan 2018 11:22:49 +0200
Message-ID: <1516699369-3513-5-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Apply the memory built-in self test work around when ungating certain
Tegra210 power domains.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ce62a47..c4eff4b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -153,6 +153,7 @@ struct tegra_pmc_soc {
 
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
+	bool needs_mbist_war;
 
 	const struct tegra_io_pad_soc *io_pads;
 	unsigned int num_io_pads;
@@ -431,6 +432,9 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
+	if (pg->pmc->soc->needs_mbist_war)
+		tegra210_clk_handle_mbist_war(pg->id);
+
 	if (disable_clocks)
 		tegra_powergate_disable_clocks(pg);
 
@@ -1815,6 +1819,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 	.cpu_powergates = tegra210_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
+	.needs_mbist_war = true,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
 	.regs = &tegra20_pmc_regs,
-- 
1.9.1

