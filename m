Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41FCC43219
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbiI3PjF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbiI3PjE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464701A0D27;
        Fri, 30 Sep 2022 08:39:03 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AC4C766022EC;
        Fri, 30 Sep 2022 16:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552341;
        bh=tTOCToDJjcLzI14JLadsZVSZ4cSn/2Or8RPivrlFg50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f/T4rWphrI8HGgt3h/xmA5vTKuzz/GP0MdUh90D1Zj37OVxHDS/fFcmI3E1054M5+
         2PgQeR/7imzglDbkxEG7GuuwrLLHTLfIAcVOhYcxvXPQSjGDXN9EIT3mDfaATEBCR7
         ab168NUzBP9xpTjE/hvA/OB/ku2bqKVHDfC6iYPHJrflkGeahdAMSuR7qpZaQfWYhL
         fBtbwbvt4w5J/KBU4MX+Quuh85ovqBKy2qWzxMefI9JiYU2OR/4SeG+r1T7CiLT+i6
         rlYWUcSY4iOod2f8h3mFNTLZ/OeoX8fk/NiI1ifwvUKSJqArm2+u5lDu6OlhUzr15Z
         k98B1wenupHFQ==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 095CF480149; Fri, 30 Sep 2022 17:38:59 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 4/9] clk: rockchip: add register offset of the cores select parent
Date:   Fri, 30 Sep 2022 17:38:52 +0200
Message-Id: <20220930153857.299396-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930153857.299396-1-sebastian.reichel@collabora.com>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

The cores select parent register is special on RK3588.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-cpu.c | 28 ++++++++++++++++++++--------
 drivers/clk/rockchip/clk.h     |  3 +++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 47288197c9d7..11aa2259b532 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -166,10 +166,16 @@ static int rockchip_cpuclk_pre_rate_change(struct rockchip_cpuclk *cpuclk,
 		}
 	}
 	/* select alternate parent */
-	writel(HIWORD_UPDATE(reg_data->mux_core_alt,
-			     reg_data->mux_core_mask,
-			     reg_data->mux_core_shift),
-	       cpuclk->reg_base + reg_data->core_reg[0]);
+	if (reg_data->mux_core_reg)
+		writel(HIWORD_UPDATE(reg_data->mux_core_alt,
+				     reg_data->mux_core_mask,
+				     reg_data->mux_core_shift),
+		       cpuclk->reg_base + reg_data->mux_core_reg);
+	else
+		writel(HIWORD_UPDATE(reg_data->mux_core_alt,
+				     reg_data->mux_core_mask,
+				     reg_data->mux_core_shift),
+		       cpuclk->reg_base + reg_data->core_reg[0]);
 
 	spin_unlock_irqrestore(cpuclk->lock, flags);
 	return 0;
@@ -202,10 +208,16 @@ static int rockchip_cpuclk_post_rate_change(struct rockchip_cpuclk *cpuclk,
 	 * primary parent by the extra dividers that were needed for the alt.
 	 */
 
-	writel(HIWORD_UPDATE(reg_data->mux_core_main,
-			     reg_data->mux_core_mask,
-			     reg_data->mux_core_shift),
-	       cpuclk->reg_base + reg_data->core_reg[0]);
+	if (reg_data->mux_core_reg)
+		writel(HIWORD_UPDATE(reg_data->mux_core_main,
+				     reg_data->mux_core_mask,
+				     reg_data->mux_core_shift),
+		       cpuclk->reg_base + reg_data->mux_core_reg);
+	else
+		writel(HIWORD_UPDATE(reg_data->mux_core_main,
+				     reg_data->mux_core_mask,
+				     reg_data->mux_core_shift),
+		       cpuclk->reg_base + reg_data->core_reg[0]);
 
 	/* remove dividers */
 	for (i = 0; i < reg_data->num_cores; i++) {
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 7aa45cc70287..6aece7f07a7d 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -370,6 +370,8 @@ struct rockchip_cpuclk_rate_table {
  * @div_core_shift[]:	cores divider offset used to divide the pll value
  * @div_core_mask[]:	cores divider mask
  * @num_cores:	number of cpu cores
+ * @mux_core_reg:       register offset of the cores select parent
+ * @mux_core_alt:       mux value to select alternate parent
  * @mux_core_main:	mux value to select main parent of core
  * @mux_core_shift:	offset of the core multiplexer
  * @mux_core_mask:	core multiplexer mask
@@ -379,6 +381,7 @@ struct rockchip_cpuclk_reg_data {
 	u8	div_core_shift[ROCKCHIP_CPUCLK_MAX_CORES];
 	u32	div_core_mask[ROCKCHIP_CPUCLK_MAX_CORES];
 	int	num_cores;
+	int	mux_core_reg;
 	u8	mux_core_alt;
 	u8	mux_core_main;
 	u8	mux_core_shift;
-- 
2.35.1

