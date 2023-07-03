Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90923C3063F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 18:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjGCSUU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 14:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjGCSUR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 14:20:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FC9E6A
        for <linux-clk@vger.kernel.org>; Mon,  3 Jul 2023 11:20:15 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6adef5c22so73346331fa.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Jul 2023 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408413; x=1691000413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nV+W23ixU/gsOOwjBJ3HxinzG6QROQL9vhOLjLD7/c=;
        b=hBPfrZheoomPOR+k1h07sXx3Y/6OjceP3l2BrMg2f8BhDAOnz9JGggba3WBM/AVPMe
         r7GPJ5j7UyAIyeT7ZMIS103fKWaqWNPx2ILu9XqTf8Kx3uFxo/ZHV0Uf1PbB/N1feMo6
         5IIx9cn+JA7yeeijtQX88W8geHebsVNs9YNfoFE6yuX3drB08iGMroOP69/NWHS52OrY
         UclsqeO3ZEN/aS/uV1a2NUk3DepG6U3YijgHcjWubIRHEEWWvPXFK9tUU6LGyx66vK1e
         bsygjdC8yIWpJjL5bZDgarum040OP2LLekzRln5+vzez73etfBkLzl8Bl3QoMNByt6Kn
         /Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408413; x=1691000413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nV+W23ixU/gsOOwjBJ3HxinzG6QROQL9vhOLjLD7/c=;
        b=SLAeiNc9n47BBQyUKTbG0TZF210H5coakzVQTHJNBa/LUizVCI08daR3WD660IfbFF
         WwE3Od30Fnry0IWcvmm6u4mbWpLZzSGW9gLQSoBywhdue+JChbZ3ehvzM8aekRx5Y/3U
         9K5Qke9FkMAvw+HOYIuOX8/n/fidDYvlex6OqQtxBHbwfpJjOIn4i2ogZ0jRScMb+25a
         MwT9+j5iRjyyOFhER5HdDYjSDQPxmMH+ndZvoZ8NJ2pf0DqgyWql3ejZA+vJc92skKHM
         sDshfi5oUgFwPevHTYcXV+LcltWXJijE1t8jlqDrrkV0LqtNNyLlTlXtfJVHEZ3re15H
         JArA==
X-Gm-Message-State: ABy/qLYEpj9hKY8yH8toZTvSfJGmjMLOrWBujyY5xxJ7cXk9P5+f3kEP
        xek3GR3h3Apoj/SMJUy2brlbE5Rx5G2jbn4p7SxG3w==
X-Google-Smtp-Source: APBJJlGrLSA6uun2H5C7lzAMO2VxYu0WZk/tJL9rMjsBoujWnevzEjOM4VTdVpgPfs1y8SfG+lyQkQ==
X-Received: by 2002:a2e:7a11:0:b0:2b6:a19e:5153 with SMTP id v17-20020a2e7a11000000b002b6a19e5153mr8108582ljc.15.1688408413644;
        Mon, 03 Jul 2023 11:20:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id s9-20020a2e9c09000000b002b6995f38a2sm4946224lji.100.2023.07.03.11.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:20:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 20:20:07 +0200
Subject: [PATCH v2 3/8] clk: qcom: gcc-msm8998: Control MMSS and GPUSS
 GPLL0 outputs properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v2-3-6222fbc2916b@linaro.org>
References: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408407; l=3382;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=t/yKGa//yIWyr0eUqgxiqgLvRVjuxq7khyy0L6VwrLU=;
 b=HoYPHPJnk0lOO6Hc8Rh3ktspFtE9vgXAD7FBr8jeDugiD0WzNx4S2Efdic/bsr7zNcNSzrJlq
 8303bTIwgimC7yIxEYNL+pS65ffRsKVhKNMvMBOepk9qQakiP4IW4Fr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Up until now, we've been relying on some non-descript hardware magic
to pinkypromise turn the clocks on for us. While new SoCs shine with
that feature, MSM8998 can not always be fully trusted.

Register the MMSS and GPUSS GPLL0 legs with the CCF to allow for manual
enable voting.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index be024f8093c5..cccb19cae481 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -25,6 +25,9 @@
 #include "reset.h"
 #include "gdsc.h"
 
+#define GCC_MMSS_MISC	0x0902C
+#define GCC_GPU_MISC	0x71028
+
 static struct pll_vco fabia_vco[] = {
 	{ 250000000, 2000000000, 0 },
 	{ 125000000, 1000000000, 1 },
@@ -1367,6 +1370,22 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_mmss_gpll0_div_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mmss_gpll0_div_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpll0_out_main.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_mmss_gpll0_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -1395,6 +1414,38 @@ static struct clk_branch gcc_mss_gpll0_div_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_gpu_gpll0_div_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_div_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpll0_out_main.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpll0_out_main.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_ahb_clk = {
 	.halt_reg = 0x17004,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3080,6 +3131,9 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[AGGRE2_SNOC_NORTH_AXI] = &aggre2_snoc_north_axi_clk.clkr,
 	[SSC_XO] = &ssc_xo_clk.clkr,
 	[SSC_CNOC_AHBS_CLK] = &ssc_cnoc_ahbs_clk.clkr,
+	[GCC_MMSS_GPLL0_DIV_CLK] = &gcc_mmss_gpll0_div_clk.clkr,
+	[GCC_GPU_GPLL0_DIV_CLK] = &gcc_gpu_gpll0_div_clk.clkr,
+	[GCC_GPU_GPLL0_CLK] = &gcc_gpu_gpll0_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
@@ -3235,6 +3289,10 @@ static int gcc_msm8998_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Disable the GPLL0 active input to MMSS and GPU via MISC registers */
+	regmap_write(regmap, GCC_MMSS_MISC, 0x10003);
+	regmap_write(regmap, GCC_GPU_MISC, 0x10003);
+
 	return qcom_cc_really_probe(pdev, &gcc_msm8998_desc, regmap);
 }
 

-- 
2.41.0

