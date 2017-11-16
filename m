Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16687 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758351AbdKPO3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Nov 2017 09:29:12 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 4/4] soc/tegra: pmc: apply MBIST work around fo Tegra210
Date: Thu, 16 Nov 2017 16:29:02 +0200
Message-ID: <1510842542-16451-5-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
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
index 0453ff6..4c0582d 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -142,6 +142,7 @@ struct tegra_pmc_soc {
 
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
+	bool needs_mbist_war;
 
 	const struct tegra_io_pad_soc *io_pads;
 	unsigned int num_io_pads;
@@ -411,6 +412,9 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
+	if (pg->pmc->soc->needs_mbist_war)
+		tegra210_handle_mbist_war(pg->id);
+
 	if (disable_clocks)
 		tegra_powergate_disable_clocks(pg);
 
@@ -1712,6 +1716,7 @@ static int tegra_pmc_resume(struct device *dev)
 	.cpu_powergates = tegra210_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
+	.needs_mbist_war = true,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
 };
-- 
1.9.1

