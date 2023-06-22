Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69D2C001DE
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jun 2023 11:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjFVL62 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjFVL54 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jun 2023 07:57:56 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618831996
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:54 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b47bfd4e45so63000661fa.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435072; x=1690027072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPujOzEdWd2GY4HdeqnnNvNNdoqp42lpZiZ5LAokMOw=;
        b=HeBuPRYREe6zUYplbWauXyEe3mGM3Qm9PJU5r3opg6+KycUj+ZKoP5un8DvTCVpere
         t8gqZ8vZFExYOncaejZszdpOOx4TqBDwVBckVeZNLJRODHT/IQep/MUhJmTILpfQHLfK
         4oIHr/2qEylM2u2bbXE3gyvSZ7MnMnm0BIhp5b1WH+UV/pwFx0K2bN4HuOfMU68rYtTV
         7zr1BKDYbtIEJ0bCVFRTsgl8PCq6mldpIZwY/qCTwxSHGtPD5mQRlphYCGrqTusbIxby
         UDlhKyIbN/G3n+vu4TLEEs3y6eBivZHww0Rks19v0r2hSkDBXRhz1biwh1+QfQv6R98k
         SnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435072; x=1690027072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPujOzEdWd2GY4HdeqnnNvNNdoqp42lpZiZ5LAokMOw=;
        b=XUonzwj4zOG21HqCPgphUFrka9n5HT+nellEmCGALxxutPfrHprGiTUm15OEpI3dZh
         TbqWoID8qhW63n0XZOJmpoZYJ30xCyJP+X/ZOEtT4y2FjgCyWOu8YCGIx/gyQ4DfPzkX
         vJLml7KJwxJM296fDTA6UnDBEDvAAOE+VbpSD0vdN50fnS26UGSd4E/IKU2RuZESqyFr
         6tucLvJZ5TVrScKihbBQ6wnUCP8bA0nZ8HvLakGYrMpfJMG/sVQ/W7BFRLn2VXYeMTuI
         gALMi4jfhAKWDq+k0OZ/gZNxbjbbrZQ6xgTaV3pWp+DL4BNh3Gi3/hnhqPgoURjLx1Tx
         XOkQ==
X-Gm-Message-State: AC+VfDy1mIOeiJdqt3Tlfw9f9xzQZPuM6PvLf8J6yFRAwA3nUKdVxAxh
        udFjcVyMe5rIkH1xzhgBAN5jkxOso/zV5s93lGQ=
X-Google-Smtp-Source: ACHHUZ4+YIViH/fKrGKR6TtKbJcvQEx7UuRmD/if8S7/gj5oxYEK+DM3iT0tGl1rOGPi5E+ZtXT5Yg==
X-Received: by 2002:a05:6512:10c5:b0:4f9:5c89:5b08 with SMTP id k5-20020a05651210c500b004f95c895b08mr3797275lfg.21.1687435072400;
        Thu, 22 Jun 2023 04:57:52 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 22 Jun 2023 13:57:43 +0200
Subject: [PATCH 3/9] clk: qcom: gcc-msm8998: Control MMSS and GPUSS GPLL0
 outputs properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v1-3-5b7a0d6e98b1@linaro.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=3280;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wORPp1SOzai0xux6F9EqW6IU4OmrOUhUsCj/CQktK9I=;
 b=3mR5/0vkTCm7oxEnW0JY7n49EAER0TAEA7du9t+GVJsy+6i3aZPJA8czEKOCs6nlId6KF6oM3
 JEdpkERivfkCdE70AGqlpC46WbXidxGXkd8XCLIuf1QLYsAeq1Muayo
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

