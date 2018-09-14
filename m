Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15257 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725198AbeIOEXq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Sep 2018 00:23:46 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 13/14] memory: tegra: enable Tegra210 EMC scaling driver
Date: Sat, 15 Sep 2018 00:48:14 +0300
Message-ID: <1536961695-27809-14-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536961695-27809-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536961695-27809-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/memory/tegra/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 6d74e49..456719a 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -15,3 +15,13 @@ config TEGRA124_EMC
 	  Tegra124 chips. The EMC controls the external DRAM on the board.
 	  This driver is required to change memory timings / clock rate for
 	  external memory.
+
+config TEGRA210_EMC
+	bool "NVIDIA Tegra210 External Memory Controller driver"
+	default y
+	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
+	help
+	  This driver is for the External Memory Controller (EMC) found on
+	  Tegra210 chips. The EMC controls the external DRAM on the board.
+	  This driver is required to change memory timings / clock rate for
+	  external memory.
-- 
1.9.1
