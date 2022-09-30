Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92102C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbiI3PjI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbiI3PjG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:06 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9B51A0D27;
        Fri, 30 Sep 2022 08:39:05 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F03F66022F2;
        Fri, 30 Sep 2022 16:39:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552343;
        bh=JyODDbAkozctO2YF4+4+8QrF0xaiP+MYadCgEeOgwr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LNN9Bw8zfN1Z1nVyImzPFt2HjpmKUTOya9+hQTQ/TPBVOkCjXhWrmJNDHbOZmTZJh
         Knyt1C4dVH1lIKpLZIdFmp59qYbx8XIIarx0vFK0DT1ZoELHglsGvFsx0NH5HdQ6Sd
         yPQkVr6yWdg4wXAxQ0AoRx4tOwggOYvmdMJJf7S+Oe/Q9cQa854TQk1LbT6dIz7Gck
         8UlTFZyJxbdeMDk3gwA7yU/Says8lRtZ/kXCrlnPQiuL7voD4gmd3Aore2Broyfb7U
         YDwVj/0o0y0YmH+ZblzWtiX/+R51ix472HjsAmJ+AX9zaOhDNBvp/VgoJNBEMk7fDG
         nmniz7OCUoBYA==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 0D40948014B; Fri, 30 Sep 2022 17:38:59 +0200 (CEST)
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
Subject: [PATCHv2 6/9] clk: rockchip: clk-cpu: add mux setting for cpu change frequency
Date:   Fri, 30 Sep 2022 17:38:54 +0200
Message-Id: <20220930153857.299396-7-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930153857.299396-1-sebastian.reichel@collabora.com>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

In order to improve the main frequency of CPU, the clock path of CPU is
simplified as follows:
                         |--\
                         |   \            |--\
 --apll--|\              |    \           |   \
         | |--apll_core--|     \          |    \
 --24M---|/              |mux1 |--[gate]--|mux2|---clk_core
                         |     /          |    /
 --gpll--|\              |    /    |------|   /
         | |--gpll_core--|   /     |      |--/
 --24M---|/              |--/      |
                                   |
 -------apll_directly--------------|

When the CPU requests high frequency, we want to use MUX2 select the
"apll_directly".
At low frequencies use MUX1 to select “apll_core" and then MUX2 to
select "apll_core_gate".

However, in this way, the CPU frequency conversion needs to be
in the following order:
1. MUX2 select to "apll_core_gate", MUX1 select "gpll_core"
2. Apll sets slow_mode, sets APLL parameters, locks APLL, and then APLL
sets normal_mode
3. MUX1 select "apll_core", MUX2 select "apll_directly"

So add pre_muxs and post_muxs to cover this special requirements.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
[rebase]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-cpu.c | 41 ++++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.h     |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 11aa2259b532..6ea7fba9f9e5 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -113,6 +113,42 @@ static void rockchip_cpuclk_set_dividers(struct rockchip_cpuclk *cpuclk,
 	}
 }
 
+static void rockchip_cpuclk_set_pre_muxs(struct rockchip_cpuclk *cpuclk,
+					 const struct rockchip_cpuclk_rate_table *rate)
+{
+	int i;
+
+	/* alternate parent is active now. set the pre_muxs */
+	for (i = 0; i < ARRAY_SIZE(rate->pre_muxs); i++) {
+		const struct rockchip_cpuclk_clksel *clksel = &rate->pre_muxs[i];
+
+		if (!clksel->reg)
+			break;
+
+		pr_debug("%s: setting reg 0x%x to 0x%x\n",
+			 __func__, clksel->reg, clksel->val);
+		writel(clksel->val, cpuclk->reg_base + clksel->reg);
+	}
+}
+
+static void rockchip_cpuclk_set_post_muxs(struct rockchip_cpuclk *cpuclk,
+					  const struct rockchip_cpuclk_rate_table *rate)
+{
+	int i;
+
+	/* alternate parent is active now. set the muxs */
+	for (i = 0; i < ARRAY_SIZE(rate->post_muxs); i++) {
+		const struct rockchip_cpuclk_clksel *clksel = &rate->post_muxs[i];
+
+		if (!clksel->reg)
+			break;
+
+		pr_debug("%s: setting reg 0x%x to 0x%x\n",
+			 __func__, clksel->reg, clksel->val);
+		writel(clksel->val, cpuclk->reg_base + clksel->reg);
+	}
+}
+
 static int rockchip_cpuclk_pre_rate_change(struct rockchip_cpuclk *cpuclk,
 					   struct clk_notifier_data *ndata)
 {
@@ -165,6 +201,9 @@ static int rockchip_cpuclk_pre_rate_change(struct rockchip_cpuclk *cpuclk,
 			       cpuclk->reg_base + reg_data->core_reg[i]);
 		}
 	}
+
+	rockchip_cpuclk_set_pre_muxs(cpuclk, rate);
+
 	/* select alternate parent */
 	if (reg_data->mux_core_reg)
 		writel(HIWORD_UPDATE(reg_data->mux_core_alt,
@@ -219,6 +258,8 @@ static int rockchip_cpuclk_post_rate_change(struct rockchip_cpuclk *cpuclk,
 				     reg_data->mux_core_shift),
 		       cpuclk->reg_base + reg_data->core_reg[0]);
 
+	rockchip_cpuclk_set_post_muxs(cpuclk, rate);
+
 	/* remove dividers */
 	for (i = 0; i < reg_data->num_cores; i++) {
 		writel(HIWORD_UPDATE(0, reg_data->div_core_mask[i],
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index bf7c8d082fde..2bd1863a7418 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -380,6 +380,8 @@ struct rockchip_cpuclk_clksel {
 struct rockchip_cpuclk_rate_table {
 	unsigned long prate;
 	struct rockchip_cpuclk_clksel divs[ROCKCHIP_CPUCLK_NUM_DIVIDERS];
+	struct rockchip_cpuclk_clksel pre_muxs[ROCKCHIP_CPUCLK_NUM_DIVIDERS];
+	struct rockchip_cpuclk_clksel post_muxs[ROCKCHIP_CPUCLK_NUM_DIVIDERS];
 };
 
 /**
-- 
2.35.1

