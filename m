Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DA2C46467
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 15:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiJRPOc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiJRPO3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 11:14:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8276412;
        Tue, 18 Oct 2022 08:14:28 -0700 (PDT)
Received: from jupiter.universe (dyndsl-095-033-155-016.ewe-ip-backbone.de [95.33.155.16])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 50F7C660238F;
        Tue, 18 Oct 2022 16:14:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666106061;
        bh=jJHEnIe1D+ZEFrgDtEJI+Axf/gJufH7/BD8/v9RQkxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jPi8h5i012heT8El+U+24kQJ3xEvrzDGrAX2gUOTWMGvi2+3Wu72I1+TdZapbLyV/
         SQ9ik08U75bdwtU0TB6iUt14gO3fR1EwRhrl0B98pc759uADpJFduqMrzDYMLzxCR2
         xwB70L2oHW1YL+RtnIzuY/jWtDFeL4UPwFoxyYLEuV0Y+uQb3cd6HXzM+o6Y6bGX0n
         O6wfHdN7IxkaKF2MEPIUyxPl1zlBe8aZiSiN6iUmSqp35gaJCfmsN937RqtzI7augH
         WsTsXmVh1tSmqYxlQPeSiAy+CaeqNAoJE4vxK/zyfsoRsi9ZOw5LHxDkln/uwiJdHA
         bU2SXW1hi28mw==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 2C8C34801BE; Tue, 18 Oct 2022 17:14:16 +0200 (CEST)
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
Subject: [PATCHv3 6/9] clk: rockchip: clk-cpu: add mux setting for cpu change frequency
Date:   Tue, 18 Oct 2022 17:14:04 +0200
Message-Id: <20221018151407.63395-7-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018151407.63395-1-sebastian.reichel@collabora.com>
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
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
index 6eb31d36c4cd..24d3e56d3f71 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -399,6 +399,8 @@ struct rockchip_cpuclk_clksel {
 struct rockchip_cpuclk_rate_table {
 	unsigned long prate;
 	struct rockchip_cpuclk_clksel divs[ROCKCHIP_CPUCLK_NUM_DIVIDERS];
+	struct rockchip_cpuclk_clksel pre_muxs[ROCKCHIP_CPUCLK_NUM_DIVIDERS];
+	struct rockchip_cpuclk_clksel post_muxs[ROCKCHIP_CPUCLK_NUM_DIVIDERS];
 };
 
 /**
-- 
2.35.1

