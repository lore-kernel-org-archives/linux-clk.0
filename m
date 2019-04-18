Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA2FC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBFD12183F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h60nmFi5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388530AbfDRLMW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:22 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36136 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388375AbfDRLMW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:22 -0400
Received: by mail-wm1-f68.google.com with SMTP id h18so2435401wml.1;
        Thu, 18 Apr 2019 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a8sDOmAMJdu2EjIPFYny65MP6zKmI8GdE/EZa2fTsNo=;
        b=h60nmFi5x2mIN/rBCI88YsQNzZAQChgujE7vqDW4RpmUC5hruX4p3eUa4w4aaRI8eX
         X7CmxifbK2cNxi9jSYxLOHFTmnyX2+z84gYa30T133er5WFF6Y4nvO4Y6ACx7TCbnTGB
         5ox7B4sBdmOSI07NYDtofhhHIyiTpZR+RBsjPycDIHPmRV2Bu5iuh5hL+fARNNpBzrUM
         s1bF/fHrSMSq2weBWdaZLHNU9AdUqZ7Cl+qtc2/7bIcAWcARbttYgmTrCRMSVzindJwT
         gQPfdSQS7hKUHBC8DYhwzNmJT0XLtwcQaz8Fn7cCE6kQVRDUOk8nRVyiKalt9K13tHtT
         zHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a8sDOmAMJdu2EjIPFYny65MP6zKmI8GdE/EZa2fTsNo=;
        b=bd7plsKOpEBmR1zCQw3BPdnrVv/YcOJUExzFtyL5vusNYDPgzFRJbkxPW8DraIx/r6
         oi02szsb9oA1sEiXTnJl8bMZ8XvusE2NB/O+hBeq6J3ieBj4KDz5L9Zh0F1hsKAGqPxr
         vao6OZhNNja4U3cR3HAAWC6JASTtT3D9zgPkbzoDBzzOGKxDtU9/S+FCIw3R/Qcg/glx
         cl9G2lmJNRin734k5p0bBkJ3PB8gjn80QuaYEikzmmn0bE3j92mU0Orx7A0LEWko2vle
         Xr8QC5IOJrOvp81uYOpjCOr6+xdOJOG0Do7TU7G1rk/tgf8zUO6RUy0BOPvldSBRPzls
         iF0A==
X-Gm-Message-State: APjAAAUt4IwEzDfhULPaCFugGgXBzrrCJyrlgd/1kH1avwD07mUEITuu
        7yPGUDd6H/xpteqnbbvucx0YO8jsNOA=
X-Google-Smtp-Source: APXvYqxyQgWCnYZxnIVZG7lXRdM+1OaUMj/QeKDR9GD2ugSYxk4ihhxM90/Ax0/RONbbDMhql3/YrA==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr2649663wmk.108.1555585940115;
        Thu, 18 Apr 2019 04:12:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:19 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH RFT V3 4/8] clk: multiplier: add explicit big endian support
Date:   Thu, 18 Apr 2019 13:12:07 +0200
Message-Id: <20190418111211.10474-5-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian multiplier clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * drop unneeded else in clk_mult_readl
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-multiplier.c | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
index 3c86f859c199..77327df9bf32 100644
--- a/drivers/clk/clk-multiplier.c
+++ b/drivers/clk/clk-multiplier.c
@@ -11,6 +11,22 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
+static inline u32 clk_mult_readl(struct clk_multiplier *mult)
+{
+	if (mult->flags & CLK_MULTIPLIER_BIG_ENDIAN)
+		return ioread32be(mult->reg);
+
+	return clk_readl(mult->reg);
+}
+
+static inline void clk_mult_writel(struct clk_multiplier *mult, u32 val)
+{
+	if (mult->flags & CLK_MULTIPLIER_BIG_ENDIAN)
+		iowrite32be(val, mult->reg);
+	else
+		clk_writel(val, mult->reg);
+}
+
 static unsigned long __get_mult(struct clk_multiplier *mult,
 				unsigned long rate,
 				unsigned long parent_rate)
@@ -27,7 +43,7 @@ static unsigned long clk_multiplier_recalc_rate(struct clk_hw *hw,
 	struct clk_multiplier *mult = to_clk_multiplier(hw);
 	unsigned long val;
 
-	val = clk_readl(mult->reg) >> mult->shift;
+	val = clk_mult_readl(mult) >> mult->shift;
 	val &= GENMASK(mult->width - 1, 0);
 
 	if (!val && mult->flags & CLK_MULTIPLIER_ZERO_BYPASS)
@@ -118,10 +134,10 @@ static int clk_multiplier_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		__acquire(mult->lock);
 
-	val = clk_readl(mult->reg);
+	val = clk_mult_readl(mult);
 	val &= ~GENMASK(mult->width + mult->shift - 1, mult->shift);
 	val |= factor << mult->shift;
-	clk_writel(val, mult->reg);
+	clk_mult_writel(mult, val);
 
 	if (mult->lock)
 		spin_unlock_irqrestore(mult->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8576c2dbc639..9df78e3fb62b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -667,6 +667,9 @@ void clk_hw_unregister_fractional_divider(struct clk_hw *hw);
  *	leaving the parent rate unmodified.
  * CLK_MULTIPLIER_ROUND_CLOSEST - Makes the best calculated divider to be
  *	rounded to the closest integer instead of the down one.
+ * CLK_MULTIPLIER_BIG_ENDIAN - By default little endian register accesses are
+ *	used for the multiplier register.  Setting this flag makes the register
+ *	accesses big endian.
  */
 struct clk_multiplier {
 	struct clk_hw	hw;
@@ -681,6 +684,7 @@ struct clk_multiplier {
 
 #define CLK_MULTIPLIER_ZERO_BYPASS		BIT(0)
 #define CLK_MULTIPLIER_ROUND_CLOSEST	BIT(1)
+#define CLK_MULTIPLIER_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_multiplier_ops;
 
-- 
2.13.2

