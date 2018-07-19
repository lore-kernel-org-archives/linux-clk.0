Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1838 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbeGSPG1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jul 2018 11:06:27 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 1/2] clk: tegra: Fix const for clk_out parents
Date: Thu, 19 Jul 2018 17:22:54 +0300
Message-ID: <1532010175-28364-2-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1532010175-28364-1-git-send-email-pdeschrijver@nvidia.com>
References: <1532010175-28364-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-pmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index a35579a..90a353a 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -36,7 +36,7 @@
 struct pmc_clk_init_data {
 	char *mux_name;
 	char *gate_name;
-	const char **parents;
+	const char * const *parents;
 	int num_parents;
 	int mux_id;
 	int gate_id;
@@ -60,15 +60,15 @@ struct pmc_clk_init_data {
 
 static DEFINE_SPINLOCK(clk_out_lock);
 
-static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
+static const char * const clk_out1_parents[] = { "clk_m", "clk_m_div2",
 	"clk_m_div4", "extern1",
 };
 
-static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
+static const char * const clk_out2_parents[] = { "clk_m", "clk_m_div2",
 	"clk_m_div4", "extern2",
 };
 
-static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
+static const char * const clk_out3_parents[] = { "clk_m", "clk_m_div2",
 	"clk_m_div4", "extern3",
 };
 
-- 
1.9.1

