Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D8DC10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E10FA21850
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0dp+VAQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388640AbfDRLMS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37566 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388401AbfDRLMS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id v14so2433792wmf.2;
        Thu, 18 Apr 2019 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KT4IxCbsdb20vxjXV3Yb4q905/4eUjLcCpAjIqK4bV0=;
        b=Y0dp+VAQWLfpErhF5KeNWFfcBtdaMQvfr9DnX6fKs/x/daooxvyFFobx/p0lK4b1su
         sL3/oMGDNvEAQDpMWWoSMgYLEAs8HzpjSQH8Oa4cHmI9qOUN1VRi9QqSScgfCArJud6+
         OjuhRAikaH4eI+ba1oTlYRBm68ubvsAJEYgHe+0u7Ob7hB3F1ipgC3nGw1GsHjsQ8sCM
         eQdfS55oeRT/OxLSmob0RZUskqtAMwiFDQiR2ONAhTLL2ZPBWr4jKLLytpon1nX4K90s
         3geEjI7yvYIxF8SiuwTIg0Vszc/6KJzlKwPCd6EIjh9XCkSn37wVEFOaSdky5ipCyvyp
         amrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KT4IxCbsdb20vxjXV3Yb4q905/4eUjLcCpAjIqK4bV0=;
        b=MnIZJPPMPy8RqCjQ8ta6A6n3AZ/0QjCSpNLubdkcH1gQxEOBIz3PrRcIrt+/N0e2tY
         JbR2Q6gsBEp9Z99wJHbDdNRpGrt2gUIa0mYL60n03N/Odeo1kumod2oYGh0qp/8+GgH9
         xrLo66UkrSyoPKpjDfA0jkVftPf45ePaHZA7+WVs8R7wLYRhWCXk1ULVrbBdZEVPejzu
         9FNEce47QSuaaze+ViFk/eZvIrFouwYbeYwgcPj+4TgTDF92avJr0NIt4IgcMl1le0qr
         DwQjf/wf5ItALnm1bFlkxhWKZBH1sWvs4FyFx1vbfLWAvw0W8CLlGmhEJjtX4dVyWIXn
         9j/w==
X-Gm-Message-State: APjAAAXeMHGLcTl/rigalVwVotQ3g/JTp+CrcSW8gCd9s+KYeXM2tKWx
        mlL6OqTtzSDr5FXPhYR2yEZeV2VA8mI=
X-Google-Smtp-Source: APXvYqxs6Cf3sKJNDaD7WXuqSj31uua0iWy7oJoeMqG8rWXkMXo9aCMr9fbPBHKpXW7mg3Uayp8TLg==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr2760179wmb.90.1555585935442;
        Thu, 18 Apr 2019 04:12:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:14 -0700 (PDT)
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
Subject: [PATCH RFT V3 1/8] clk: divider: add explicit big endian support
Date:   Thu, 18 Apr 2019 13:12:04 +0200
Message-Id: <20190418111211.10474-2-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian divider clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * fix passed arguments to clk_div_readl found by kbuild
 * drop unneeded else in clk_div_readl
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-divider.c    | 26 ++++++++++++++++++++++----
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index e5a17265cfaf..25c7404e376c 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -25,6 +25,24 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
+static inline u32 clk_div_readl(struct clk_divider *divider)
+{
+	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+		return ioread32be(divider->reg);
+
+	return clk_readl(divider->reg);
+}
+
+static inline void clk_div_writel(struct clk_divider *divider, u32 val)
+{
+	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+		iowrite32be(val, divider->reg);
+	else
+		clk_writel(val, divider->reg);
+}
+
+#define div_mask(width)	((1 << (width)) - 1)
+
 static unsigned int _get_table_maxdiv(const struct clk_div_table *table,
 				      u8 width)
 {
@@ -135,7 +153,7 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	unsigned int val;
 
-	val = clk_readl(divider->reg) >> divider->shift;
+	val = clk_div_readl(divider) >> divider->shift;
 	val &= clk_div_mask(divider->width);
 
 	return divider_recalc_rate(hw, parent_rate, val, divider->table,
@@ -370,7 +388,7 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
 		u32 val;
 
-		val = clk_readl(divider->reg) >> divider->shift;
+		val = clk_div_readl(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_round_rate(hw, rate, prate, divider->table,
@@ -420,11 +438,11 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = clk_div_mask(divider->width) << (divider->shift + 16);
 	} else {
-		val = clk_readl(divider->reg);
+		val = clk_div_readl(divider);
 		val &= ~(clk_div_mask(divider->width) << divider->shift);
 	}
 	val |= (u32)value << divider->shift;
-	clk_writel(val, divider->reg);
+	clk_div_writel(divider, val);
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index db21437c77e2..7117b8cc0c0c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -416,6 +416,9 @@ struct clk_div_table {
  * CLK_DIVIDER_MAX_AT_ZERO - For dividers which are like CLK_DIVIDER_ONE_BASED
  *	except when the value read from the register is zero, the divisor is
  *	2^width of the field.
+ * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses are used
+ *	for the divider register.  Setting this flag makes the register accesses
+ *	big endian.
  */
 struct clk_divider {
 	struct clk_hw	hw;
@@ -437,6 +440,7 @@ struct clk_divider {
 #define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
 #define CLK_DIVIDER_READ_ONLY		BIT(5)
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
+#define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
-- 
2.13.2

