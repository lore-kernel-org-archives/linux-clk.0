Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDA2C433DB
	for <linux-clk@archiver.kernel.org>; Sat,  9 Jan 2021 13:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 723C723A1C
	for <linux-clk@archiver.kernel.org>; Sat,  9 Jan 2021 13:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbhAINzw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 9 Jan 2021 08:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbhAINzw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 9 Jan 2021 08:55:52 -0500
X-Greylist: delayed 515 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Jan 2021 05:54:56 PST
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E53C06179F
        for <linux-clk@vger.kernel.org>; Sat,  9 Jan 2021 05:54:56 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3D3713EEBA;
        Sat,  9 Jan 2021 14:46:20 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
Date:   Sat,  9 Jan 2021 14:46:09 +0100
Message-Id: <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock enables the GPLL0 output to the multimedia subsystem
clock controller.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gcc-msm8998.c               | 17 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 9d7016bcd680..d51c556851ca 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -1341,6 +1341,22 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_mmss_gpll0_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mmss_gpll0_clk",
+			.parent_names = (const char *[]){
+				"gpll0_out_main",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_mss_gpll0_div_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -2944,6 +2960,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_MSS_GPLL0_DIV_CLK_SRC] = &gcc_mss_gpll0_div_clk_src.clkr,
 	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
 	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
+	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 6a73a174f049..47ca17df780b 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -184,6 +184,7 @@
 #define GCC_MSS_MNOC_BIMC_AXI_CLK				175
 #define GCC_BIMC_GFX_CLK					176
 #define UFS_UNIPRO_CORE_CLK_SRC					177
+#define GCC_MMSS_GPLL0_CLK					178
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
-- 
2.29.2

