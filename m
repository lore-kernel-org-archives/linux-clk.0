Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94A2C10F12
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 995C62075B
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="unVegUez"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfDOKLA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:11:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40436 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfDOKLA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 06:11:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id z24so19740462wmi.5;
        Mon, 15 Apr 2019 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OdocwXwJ3rh4kwfXC02eb0oWwurnzLR9MAj+DB02QVg=;
        b=unVegUezf3xp5NAJ3uaaFz2qj1jvI7tB9oNDrgZUIg3ywpAxWLOr1z8t3mHOXUqUB3
         ni6AtLJTn3FK/ozoiLTJSQ0MTx9xY3NgwZb4LpZ+HssMdoKX/IUzPcyg++RFKz02069V
         JV6IVqMrSGl87D3L0dW4Bx832kjL7/RJGvEqNDxO+Zsi41aFBdzqEe8kTw2ZNaBhv0X3
         RCD9UMLh/II2owi+ncMQFtPW9465GQVwF7DNgNK+3gKo+ygzx57N/+7SpXCvR3wvT/m6
         nCGNPIEp39TdRYKfA3nPvCRuIds7NI7VBDu3Ae/yXYsgJQnrBAPCMqqJos+eHoYKA9Ui
         EpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OdocwXwJ3rh4kwfXC02eb0oWwurnzLR9MAj+DB02QVg=;
        b=pNp+v6Pk7+UAL2bmS0/K26xRQozHch7FcFq1Pio/yLoj+DoX9+RKkfSnmEonnjLqtW
         ErkBjpWvtjYcLd80g2lksqm7UzcHHyCjLgWvrZK8Y5E91XN3b90RVOhyeiVu3CJl7zC8
         tggAQhQodwzn31R3z2JXsQSDprmIFqIOLJgV5otV+9cRvY20rCBwhnXXhkn0xDuURFbK
         +x9kNvFomPX1Ls9V1cK4jOr1SdWUffZq2QZsbJyIgWerN/jTJSL+mJEu9L8c1w18irSQ
         RJuyvAGICDHkBX0nTe3mHo5BdTk+rLQMdUsmGUpPEKXwmdnxoT7Bxz3+ufffzXOl+6m9
         ViQQ==
X-Gm-Message-State: APjAAAUEaiDAad1J8HBYbAV0Tyv/kcdBMAPZ9cqF/9z+ieAH2kLfPKfF
        YJiLaFwkSZa5wVnXwFqMRyU8khX+KeE=
X-Google-Smtp-Source: APXvYqxQ8qfQOyCV+Mgmqtj6HKEKkrAY4bniNY5tMWURoN0nFwuxCZuqpTFJI+y9FSrpJlXQV9gxpw==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr19829090wmg.56.1555323058192;
        Mon, 15 Apr 2019 03:10:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm11592214wrp.9.2019.04.15.03.10.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:10:57 -0700 (PDT)
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
Subject: [PATCH RFT V2 4/8] clk: multiplier: add explicit big endian support
Date:   Mon, 15 Apr 2019 12:10:42 +0200
Message-Id: <20190415101046.5872-5-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190415101046.5872-1-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian multiplier clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V1 -> V2:
 * newly added patch

 drivers/clk/clk-multiplier.c | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
index 3c86f859c199..fb032f7dd407 100644
--- a/drivers/clk/clk-multiplier.c
+++ b/drivers/clk/clk-multiplier.c
@@ -11,6 +11,22 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
+static inline u32 clk_mult_readl(struct clk_multiplier *mult)
+{
+	if (mult->flags & CLK_MULTIPLIER_BIG_ENDIAN)
+		return ioread32be(mult->reg);
+	else
+		return clk_readl(mult->reg);
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

