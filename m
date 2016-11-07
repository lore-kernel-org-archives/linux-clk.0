Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59968 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbcKGLZc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2016 06:25:32 -0500
From: Ritesh Harjani <riteshh@codeaurora.org>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, shawn.lin@rock-chips.com,
        sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        david.brown@linaro.org, andy.gross@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        kdorfman@codeaurora.org, david.griego@linaro.org,
        stummala@codeaurora.org, venkatg@codeaurora.org,
        rnayak@codeaurora.org, pramod.gurav@linaro.org
Subject: [PATCH v6 01/14] clk: Add clk_hw_get_clk() helper API to be used by clk providers
Date: Mon,  7 Nov 2016 16:54:24 +0530
Message-Id: <1478517877-23733-2-git-send-email-riteshh@codeaurora.org>
In-Reply-To: <1478517877-23733-1-git-send-email-riteshh@codeaurora.org>
References: <1478517877-23733-1-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Rajendra Nayak <rnayak@codeaurora.org>

Add a helper API that will allow clk providers to turn their clk_hw
structures into struct clk pointer.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0fb39fe..52ef035 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -186,6 +186,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+struct clk *clk_hw_get_clk(const struct clk_hw *hw)
+{
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_clk);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index af59638..37022a9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -729,6 +729,7 @@ struct clk_hw *clk_hw_register_gpio_mux(struct device *dev, const char *name,
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+struct clk *clk_hw_get_clk(const struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
a Linux Foundation Collaborative Project.

