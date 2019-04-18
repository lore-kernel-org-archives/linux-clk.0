Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DEDC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E765214DA
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha7eC9dC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388751AbfDRLMV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56255 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388716AbfDRLMV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id o25so2290176wmf.5;
        Thu, 18 Apr 2019 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1+9nJK1Db2lO9Wy+wl5d5tDXTM6Ik02w576iY7MCnxU=;
        b=ha7eC9dC9yJ9uOyYhddr+sfovKYz+R1+Pml66seQaXCE7mLV/rsMJgccTUEnqDkGI2
         7XK8TmlfXSvYCzNz+f5bGZXSSYr7qGUcvuZuPbQ66rR1At1NkWLF4LWsXouPRDVyqKv5
         O1IrxOq6QOig6eExpNlSQd/Q4RB5znyCbqiL7uyuoWlW1bNjF9kvmCqhnPxZxhdC3nWu
         iWAMgBwYg9iP9i0POH5G9+RZoT0QpNoJ+fyy0/08vCHl6JR2Ws94b+d6ayAlWsAjOTJw
         /GHCT1hN1aVyJQJhslI/5SPB/YifrC3VvtQpjvEyYLlacODMOJYc2Nr5gHiH6bcrkdJa
         drhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1+9nJK1Db2lO9Wy+wl5d5tDXTM6Ik02w576iY7MCnxU=;
        b=bwdaXwi1ZWErjPyfmOMv7TlFvRrx2TJRGTeBYYew2PHJi9zMX8tkbShmNGIzov2pkz
         RcjpNqQxh7omZzITfXSnnvTLcCY+RoBr+WD+gxV+lgCm5gzt78T+5K9KlGBANiaXT6pN
         9OVQz15dmReFgcradjK5ebZjdyyyZgXXK4aKJI4KXQFsR4VSaMWW2onNPTE2uAbbuSRR
         Wz/yL8puDvRV5pFJ9OPFNdIfhnDXkLhKSPUcojQgfG2yoIrJo6SqbYSN/v/+6Ck/RjMa
         4eQbTsOqWyTtHhzmFvTAbC5sFnu7qwZ15Oww59dVGO7GKBmcHGvfeA6y7h9JJFKQivSj
         +e6w==
X-Gm-Message-State: APjAAAVBHvV4y9jRhJ17028gi1t78bZTIjn5VoZ6ZJY+1dUAWQfPCvMy
        k0MC4di14YtI7Hkq+5Cmr+8BbkeRfk4=
X-Google-Smtp-Source: APXvYqxJs+G3NOyqcEh489pdgO7urfXXmfd1Hav4NVN4L0GbWSK0G3CZBbUOhXitaAImb+p9xxUdVw==
X-Received: by 2002:a05:600c:2055:: with SMTP id p21mr2771224wmg.118.1555585938600;
        Thu, 18 Apr 2019 04:12:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:18 -0700 (PDT)
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
Subject: [PATCH RFT V3 3/8] clk: gate: add explicit big endian support
Date:   Thu, 18 Apr 2019 13:12:06 +0200
Message-Id: <20190418111211.10474-4-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian gated clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * drop unneeded else in clk_gate_readl
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-gate.c       | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index f05823cd9b21..6ced7b1f5585 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -23,6 +23,22 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
+static inline u32 clk_gate_readl(struct clk_gate *gate)
+{
+	if (gate->flags & CLK_GATE_BIG_ENDIAN)
+		return ioread32be(gate->reg);
+
+	return clk_readl(gate->reg);
+}
+
+static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
+{
+	if (gate->flags & CLK_GATE_BIG_ENDIAN)
+		iowrite32be(val, gate->reg);
+	else
+		clk_writel(val, gate->reg);
+}
+
 /*
  * It works on following logic:
  *
@@ -55,7 +71,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 		if (set)
 			reg |= BIT(gate->bit_idx);
 	} else {
-		reg = clk_readl(gate->reg);
+		reg = clk_gate_readl(gate);
 
 		if (set)
 			reg |= BIT(gate->bit_idx);
@@ -63,7 +79,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 			reg &= ~BIT(gate->bit_idx);
 	}
 
-	clk_writel(reg, gate->reg);
+	clk_gate_writel(gate, reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
@@ -88,7 +104,7 @@ int clk_gate_is_enabled(struct clk_hw *hw)
 	u32 reg;
 	struct clk_gate *gate = to_clk_gate(hw);
 
-	reg = clk_readl(gate->reg);
+	reg = clk_gate_readl(gate);
 
 	/* if a set bit disables this clk, flip it before masking */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8c07d810acf5..8576c2dbc639 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -348,6 +348,9 @@ void of_fixed_clk_setup(struct device_node *np);
  *	of this register, and mask of gate bits are in higher 16-bit of this
  *	register.  While setting the gate bits, higher 16-bit should also be
  *	updated to indicate changing gate bits.
+ * CLK_GATE_BIG_ENDIAN - by default little endian register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses big
+ *	endian.
  */
 struct clk_gate {
 	struct clk_hw hw;
@@ -361,6 +364,7 @@ struct clk_gate {
 
 #define CLK_GATE_SET_TO_DISABLE		BIT(0)
 #define CLK_GATE_HIWORD_MASK		BIT(1)
+#define CLK_GATE_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_gate_ops;
 struct clk *clk_register_gate(struct device *dev, const char *name,
-- 
2.13.2

