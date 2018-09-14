Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12068 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbeIODXf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Sep 2018 23:23:35 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 07/14] memory: tegra: scaled LA register for Tegra210
Date: Sat, 15 Sep 2018 00:48:08 +0300
Message-ID: <1536961695-27809-8-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536961695-27809-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536961695-27809-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/memory/tegra/tegra210.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index aa9dcf0..b4dd533 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -53,6 +53,13 @@
 #define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
 #define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec
 
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0AB			0x694
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0B			0x698
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0C			0x6a0
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0BB			0x69c
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0CB			0x6a4
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0A			0x690
+
 static const unsigned long tegra210_mc_emem_regs[] = {
 	 MC_EMEM_ADR_CFG,
 	 MC_EMEM_ARB_CFG,
@@ -93,6 +100,15 @@
 	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7,
 };
 
+static const unsigned long tegra210_scaled_la_regs[] = {
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0AB,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0B,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0C,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0BB,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0CB,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0A,
+};
+
 static const struct tegra_mc_client tegra210_mc_clients[] = {
 	{
 		.id = 0x00,
@@ -1157,4 +1173,7 @@
 	.smmu = &tegra210_smmu_soc,
 	.emem_regs = tegra210_mc_emem_regs,
 	.num_emem_regs = ARRAY_SIZE(tegra210_mc_emem_regs),
+	.scaled_la_regs = tegra210_scaled_la_regs,
+	.num_scaled_la_regs = ARRAY_SIZE(tegra210_scaled_la_regs),
+	.has_scaled_la = true,
 };
-- 
1.9.1
