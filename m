Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68676C10F14
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C9FA214DA
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoZ60qYe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388548AbfDRLMY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38829 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388375AbfDRLMX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id w15so2420432wmc.3;
        Thu, 18 Apr 2019 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LWVDRq3wPJtqLVuL8GILzgU6+gx9+RFydNdVEdr68+U=;
        b=SoZ60qYeBe4qwv1VMxxgH13aew4p66WqDIfl03PxZ+J05obKjr+9jLEObRmpDBLHsb
         hNFYIf+9KO4WhjJcqRO4Y04q4jlwIT6vJY3gCrG4eVyBHJklVx+n7EFoxwtd6q1yJz1o
         38IWgk+eGK5VHghpm8QaRDsX+3gLjT625J92LgcIWSiM8pSm9A5XiSRNM7if6AOpaICc
         yp7X00DDoDip2BkA9kna2VA+JYJ4vTUaEw8llyqNz2SVo3/hGGP4tZqV5y0wJxKd3O/H
         PvXEih0Y2UvVlxriEUWcDBm3oW5ShknpkVwruitBQEGvG3xZlSfhRsG2x5Fa4+3C6g3f
         IpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LWVDRq3wPJtqLVuL8GILzgU6+gx9+RFydNdVEdr68+U=;
        b=h0rwn0Sys2WeJUPQo+HUApqLs60mwtYcWUOlWN5KGOE7r9agpbsJU2xyd13TXDBcuD
         q5xh1nrGBofPrjXFTSv95senLLJwZ49nZ6lrE8i97TdxrkFyaIpsCZ5/qCgfB6k3XoJD
         5H6FYTHiO6Bb/rat+UYziYMR66KppQGEqsk22CS9ApemthnfzReZMPmUx7XeCnxz1fG3
         O8HxFXkrIPzTpBxS8b4bix14NuUcLFq+XiFMVCOYVCI/IdS2Cn8TJZ5jyaCQzAlyrmGh
         vwC6R7uofsA3kTtGpBEHrJxHiHhAzTll0rRabfVV9ScR4OESsa9lj7cfjuY+MujxljsK
         OemQ==
X-Gm-Message-State: APjAAAWcONOpM9mJXAalntV3+Z1AAKuLhA3yK/CuyBaGU67JT+WWUVvs
        yFx7nefACzyuZGUc73ZFdg9yDRlwLRM=
X-Google-Smtp-Source: APXvYqwKd5imwQ9tx9WLxEfWpd7Dn8I3vL36mwTDaErx27W2X8tFwiWgG4+QiGXq0JcOtMzgpkFrXQ==
X-Received: by 2002:a1c:e1c5:: with SMTP id y188mr2663908wmg.39.1555585941683;
        Thu, 18 Apr 2019 04:12:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:21 -0700 (PDT)
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
Subject: [PATCH RFT V3 5/8] clk: mux: add explicit big endian support
Date:   Thu, 18 Apr 2019 13:12:08 +0200
Message-Id: <20190418111211.10474-6-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian mux clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * drop unneeded else in clk_mux_readl
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-mux.c        | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 2ad2df2e8909..61ad331b7ff4 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -23,6 +23,22 @@
  * parent - parent is adjustable through clk_set_parent
  */
 
+static inline u32 clk_mux_readl(struct clk_mux *mux)
+{
+	if (mux->flags & CLK_MUX_BIG_ENDIAN)
+		return ioread32be(mux->reg);
+
+	return clk_readl(mux->reg);
+}
+
+static inline void clk_mux_writel(struct clk_mux *mux, u32 val)
+{
+	if (mux->flags & CLK_MUX_BIG_ENDIAN)
+		iowrite32be(val, mux->reg);
+	else
+		clk_writel(val, mux->reg);
+}
+
 int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int flags,
 			 unsigned int val)
 {
@@ -73,7 +89,7 @@ static u8 clk_mux_get_parent(struct clk_hw *hw)
 	struct clk_mux *mux = to_clk_mux(hw);
 	u32 val;
 
-	val = clk_readl(mux->reg) >> mux->shift;
+	val = clk_mux_readl(mux) >> mux->shift;
 	val &= mux->mask;
 
 	return clk_mux_val_to_index(hw, mux->table, mux->flags, val);
@@ -94,12 +110,12 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	if (mux->flags & CLK_MUX_HIWORD_MASK) {
 		reg = mux->mask << (mux->shift + 16);
 	} else {
-		reg = clk_readl(mux->reg);
+		reg = clk_mux_readl(mux);
 		reg &= ~(mux->mask << mux->shift);
 	}
 	val = val << mux->shift;
 	reg |= val;
-	clk_writel(reg, mux->reg);
+	clk_mux_writel(mux, reg);
 
 	if (mux->lock)
 		spin_unlock_irqrestore(mux->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9df78e3fb62b..f82cda41e1a8 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -510,6 +510,9 @@ void clk_hw_unregister_divider(struct clk_hw *hw);
  * 	.get_parent clk_op.
  * CLK_MUX_ROUND_CLOSEST - Use the parent rate that is closest to the desired
  *	frequency.
+ * CLK_MUX_BIG_ENDIAN - By default little endian register accesses are used for
+ *	the mux register.  Setting this flag makes the register accesses big
+ *	endian.
  */
 struct clk_mux {
 	struct clk_hw	hw;
@@ -528,6 +531,7 @@ struct clk_mux {
 #define CLK_MUX_HIWORD_MASK		BIT(2)
 #define CLK_MUX_READ_ONLY		BIT(3) /* mux can't be changed */
 #define CLK_MUX_ROUND_CLOSEST		BIT(4)
+#define CLK_MUX_BIG_ENDIAN		BIT(5)
 
 extern const struct clk_ops clk_mux_ops;
 extern const struct clk_ops clk_mux_ro_ops;
-- 
2.13.2

