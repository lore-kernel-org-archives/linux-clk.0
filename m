Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C202C10F12
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A7A82075B
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Znubu+SB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfDOKKz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:10:55 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36277 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbfDOKKz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 06:10:55 -0400
Received: by mail-wm1-f68.google.com with SMTP id h18so19630746wml.1;
        Mon, 15 Apr 2019 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cSD6PBow7v0W8TwFUmI5O2Pxk6CBw7ocNAAJAAXdWg8=;
        b=Znubu+SBnrloeNAT8sZMfuxqeFCVL60+47/i85ZzPS2cuhM8KEu6rEJmwddEvfM/hN
         8OMOgxgRo3C+7g+dQ9yMUA7FD3kUFXHByFUZmOD1FfqUpnaQYevYG6u+3orpJtLY7MDi
         fXKlHkpbpnv57up630V0jzQwAEm+nNyB+6hKhhhYfGlZ28qMJitYKjLQDvBIMXjs13VA
         sSuRsFrhSiVlJlmJIxdqNl9kOo0nwazv/ZkUTF3o/jkzKn9qJZItZMEGF41KR9bfzSYD
         SfSYhh6daMKDFH3gI22x6lXl8KGapgnYmxc0N9yrtXYfkZczK37KlYK0gSEqilvOYkwL
         5tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cSD6PBow7v0W8TwFUmI5O2Pxk6CBw7ocNAAJAAXdWg8=;
        b=YjH4Q3vv4uQquYWxbEx3AzCd1xQeDzihD4dMTd2udg3s9W/i2FKAxFrq0j/8NePRXP
         3hOLgqPrVtv5H+MiFL5VhPnkrwGskpD9kxtl2SwbKILkSAeiGsonFHBdOSRdULDsq5bV
         GEQeiym33Ox4iveRwVlixVRyI7kUflCPc8WTPTq4qw5elF0SROhUnftx1i7/rAmE3BDU
         nOKg89o9dGS9wWYQP+mUtKYLgDyf84NoRlC/7dfqszdQYTK/9bxFQEYc0JBxYsRjrNzu
         8bMknoDTVDT8q3rHso9WYcHhIYtQrZJYtI+SDKQEY5Rez6gXoglldglDWmr2sA19FqVj
         WdUg==
X-Gm-Message-State: APjAAAXVXGAab7MtrfechqsEKHmYO/rdJZt1PSZ3N/SZvxw3VoOFP2d1
        YW7LjGJKEmTvnxWjZUHgmx2urkmWn7Q=
X-Google-Smtp-Source: APXvYqzNxdl1PhIO1oOobESMBfrW0DrNzXt6hIBogeVrQpk/WjkC/3DOHfN+kDsMgbMux6PsbVAqxA==
X-Received: by 2002:a7b:cd95:: with SMTP id y21mr21860173wmj.29.1555323052152;
        Mon, 15 Apr 2019 03:10:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm11592214wrp.9.2019.04.15.03.10.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:10:51 -0700 (PDT)
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
Subject: [PATCH RFT V2 1/8] clk: divider: add explicit big endian support
Date:   Mon, 15 Apr 2019 12:10:39 +0200
Message-Id: <20190415101046.5872-2-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190415101046.5872-1-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian divider clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-divider.c    | 26 ++++++++++++++++++++++----
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index e5a17265cfaf..ff791a7a5e9e 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -25,6 +25,24 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
+static inline u32 clk_div_readl(struct clk_divider *divider)
+{
+	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+		return ioread32be(divider->reg);
+	else
+		return clk_readl(divider->reg);
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
+		val = clk_div_readl(divider->reg) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_round_rate(hw, rate, prate, divider->table,
@@ -420,11 +438,11 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = clk_div_mask(divider->width) << (divider->shift + 16);
 	} else {
-		val = clk_readl(divider->reg);
+		val = clk_div_readl(divider->reg);
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

