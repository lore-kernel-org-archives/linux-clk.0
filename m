Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AC9C4321E
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 15:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiJRPO3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJRPO1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 11:14:27 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064BA25CC;
        Tue, 18 Oct 2022 08:14:20 -0700 (PDT)
Received: from jupiter.universe (dyndsl-095-033-155-016.ewe-ip-backbone.de [95.33.155.16])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F9356602387;
        Tue, 18 Oct 2022 16:14:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666106059;
        bh=UTRAMSXiL/feVOn1tFuEFRGIiDussK9ewGhSwjaEbg0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YyIcklqgOywtELGF4fxV73lnO1TBIbgPAYb0UQiTTjzJRF9bCVWJ5vx61xYL66pcV
         CDTyOZ9g3IB4DTiioMkA9icw8WoLQ5W0xMthDbTrbbSApkLDLfY2w5kMdiG8l2tIZF
         Mvmp7+W05iaktd8QGCvKCxBYPBhZbVcnUNHcTkARGxQmaTDxL2WWhjEPZyWCbOygDc
         hQ8nVKhAiLIYeteHaEFmtvVwTDqxu7ccLQxWfa5T3cUbbXlGvohxbBiiF7sopo5Yfs
         OiBK/vnOR/Zet/kCi4R/M6pfL19UBC0jmugOIE7Ku1qs3O56mdMY2OnF6dpvvCaStY
         qSPp4GZYCmmhQ==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 284B74801B8; Tue, 18 Oct 2022 17:14:16 +0200 (CEST)
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
Subject: [PATCHv3 4/9] clk: rockchip: add register offset of the cores select parent
Date:   Tue, 18 Oct 2022 17:14:02 +0200
Message-Id: <20221018151407.63395-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018151407.63395-1-sebastian.reichel@collabora.com>
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
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
index ee01739e4a7c..43a37a43b6f3 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -389,6 +389,8 @@ struct rockchip_cpuclk_rate_table {
  * @div_core_shift[]:	cores divider offset used to divide the pll value
  * @div_core_mask[]:	cores divider mask
  * @num_cores:	number of cpu cores
+ * @mux_core_reg:       register offset of the cores select parent
+ * @mux_core_alt:       mux value to select alternate parent
  * @mux_core_main:	mux value to select main parent of core
  * @mux_core_shift:	offset of the core multiplexer
  * @mux_core_mask:	core multiplexer mask
@@ -398,6 +400,7 @@ struct rockchip_cpuclk_reg_data {
 	u8	div_core_shift[ROCKCHIP_CPUCLK_MAX_CORES];
 	u32	div_core_mask[ROCKCHIP_CPUCLK_MAX_CORES];
 	int	num_cores;
+	int	mux_core_reg;
 	u8	mux_core_alt;
 	u8	mux_core_main;
 	u8	mux_core_shift;
-- 
2.35.1

