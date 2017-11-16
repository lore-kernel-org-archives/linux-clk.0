Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18438 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759924AbdKPPaF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Nov 2017 10:30:05 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 2/4] clk: tegra: add fence_delay for clock registers
Date: Thu, 16 Nov 2017 17:29:53 +0200
Message-ID: <1510846195-28555-3-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1510846195-28555-1-git-send-email-pdeschrijver@nvidia.com>
References: <1510846195-28555-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

To ensure writes to clock registers have properly propagated through the
clock control logic and state machines, we need to ensure the writes have
been posted in the registers and wait for 1us after that.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 872f118..d5badbe 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
 u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
 
+/* Combined read fence with delay */
+#define fence_udelay(delay, reg)	\
+	do {				\
+		readl(reg);		\
+		udelay(delay);		\
+	} while(0)
+
 #endif /* TEGRA_CLK_H */
-- 
1.9.1

