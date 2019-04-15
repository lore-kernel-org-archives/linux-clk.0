Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A9EC282DA
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1672920684
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlQeaea1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfDOKLC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:11:02 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36297 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfDOKLC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 06:11:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id h18so19631417wml.1;
        Mon, 15 Apr 2019 03:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GrboAZF3BnjJNJvt9JLXUkPnL7d9/yHPsH0HVH2JN4Y=;
        b=XlQeaea1fDY3FHmAXvyH27UaBMFNPOXHyoCRGBshG0SHeWTFfslSQE8WAxpWcXgJs2
         PdsSiorJe2WTrLDAC69mefgxeAhBOyglj5gR6wLQzENFv9gmWxQQeATXdlSIUYtgwHcS
         x00R0q6jtOop5hQ2AAFufqZLDQf9MOgYgC7CHL2+8C/zNPBeJVH84mL87+CwDct0AQWT
         PJzp5Vcv4IT0nIg+XvNP5hSzSjkQb/D/yViyBn/rLi5uC5tNUZ1CHIsHc94+LQeiNrBF
         5v7MBqUvQE1AJkvV1E2NWjGn6HxKgMvAJkPSR2G7ydyUeBEooyvfoMDwuYT1jFeUqw2h
         4kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GrboAZF3BnjJNJvt9JLXUkPnL7d9/yHPsH0HVH2JN4Y=;
        b=gpA67QoNpt4xszVW8F4Ks0jQEk4UfjDWbTuuGPMiw2eoSqBIj33hh8b3PI/ZpeKnaq
         tkhesV0lLvfr8qLLhigpS0maa7dn+8KsNlITSIEaU63y0jqXLFgWWnTyoM6sjehD5qwl
         Tzzi3syBZ/60bytqagRr4/nzhuWM9demOhaP1HVP0OpXJi+pkcyhfxHoZ9Lcsfwb81Bo
         Jywu07400s3V8AWrdExT9jzBZX5xOuNARN/l3jpGyP1rURBTB4AfFF9L3voXIBmlE43R
         kFBctE+r+QbolRH86SzpqrKlTjGf4HlcAV+vPeTSOX6tbfCW7Fj8IZLJMw7dE1Gsk41N
         9cxw==
X-Gm-Message-State: APjAAAWUcWVHkncJtLbKwl5u7/YkbbqhPph8npC6Zbg/L/UHEdFBihfS
        qIhgzRMjzQaES3icWv9znAzAaDH0C8A=
X-Google-Smtp-Source: APXvYqx4YIrnaKjtFxaqoF6x/Hk55DKfuyQGcZX+zQoPcFihiNiCA3oA8O89/p25+iSx3jZReIhnvA==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr21175746wma.57.1555323060365;
        Mon, 15 Apr 2019 03:11:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm11592214wrp.9.2019.04.15.03.10.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:10:59 -0700 (PDT)
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
Subject: [PATCH RFT V2 5/8] clk: mux: add explicit big endian support
Date:   Mon, 15 Apr 2019 12:10:43 +0200
Message-Id: <20190415101046.5872-6-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190415101046.5872-1-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian mux clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-mux.c        | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 2ad2df2e8909..47f6f4f55f08 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -23,6 +23,22 @@
  * parent - parent is adjustable through clk_set_parent
  */
 
+static inline u32 clk_mux_readl(struct clk_mux *mux)
+{
+	if (mux->flags & CLK_MUX_BIG_ENDIAN)
+		return ioread32be(mux->reg);
+	else
+		return clk_readl(mux->reg);
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

