Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C3DC46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbjAKTUa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbjAKTUR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:17 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E09217417
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:16 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s25so17073946lji.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgOPg4fRkjBDBW6pz+cWiQpA7do2fsqbbXH7WC6lHjc=;
        b=cwZEd+eBfq/KpCAiIka/wvrjkoMhDC89Tobet/+yPkly/a3sls3XCmKpJbt1zVC5iw
         V/IMLg+b9jg/gW7iuSY9hUI1L7agK5np0SX4AZA6+6/8QEVT6w3o3WsJXwfMDm3eydbT
         1qUURG+emIVF+5nFDgrs2MZHCzkIFR5BFwVaZ2ux7D1NT2YPj8eHMvhGZtG+JNNJFw6g
         MN5mwe20kWD+BES/A/mxVw81wtJvKo5xU4UzYD9ynKrXNzCxtvmUsN+uxqTejtQC/nOn
         sJRcQ1GUpOLzlaYLnIiyA01YBCswtnpfoMgiApB3KF1mBOnw0f+WW4Hp+JkS2dQ74XXW
         Cjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgOPg4fRkjBDBW6pz+cWiQpA7do2fsqbbXH7WC6lHjc=;
        b=rVeIh/CWQyqUGFWzSpb7GG2yGaaUFEDgdPttnfAaEiY00MqngH2/Qxyj8bHFpxiAko
         MME0JJ/22P6FrmrNOnsf2aDeZqxmUi9+wkB/oZmAceJxsjTPg39k08NH9lpDxZZNwhP2
         +mVWOH0hmLTv9MMtUJi3AFAFNRxAaChpxezsvXjIQwA3aL9WBLs8SD4spOGlCo00UcAh
         R0x2UvIJHgR+SBb4IcQ8+EKc1XubsZDoPDvHQlyAhBeNKjrXZn0LaeXw89nWnTZT+jXy
         ZQK+GsFyd/1vzRByfOi3QNb3e2wwiHBdMpdkaPqVs3wrod321NPYvE6PDb8w/e3AaG0i
         K4/Q==
X-Gm-Message-State: AFqh2kpeT3ejGuXcIB2fPCLCiTvuJk9ISYctTZiF9bz3SekBH81g8QbR
        fc7/b+ctdA40GqmjHDbrV/0YUg==
X-Google-Smtp-Source: AMrXdXsqI7//J3y2dndxtyH9xmMfJt37ZWO8g2D1vCKufmvFRkL4wobFnV+6U0qBUT1rbjlsVtSnLQ==
X-Received: by 2002:a2e:91c2:0:b0:27b:4ba8:e202 with SMTP id u2-20020a2e91c2000000b0027b4ba8e202mr27977077ljg.33.1673464815714;
        Wed, 11 Jan 2023 11:20:15 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 12/13] clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
Date:   Wed, 11 Jan 2023 22:20:03 +0300
Message-Id: <20230111192004.2509750-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing register writes to CPU clocks setup procedure. This makes it
follow the setup procedure used in msm-3.18 kernel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index b53cddc4bca3..78a18b95c48b 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -76,10 +76,16 @@ enum _pmux_input {
 #define PWRCL_REG_OFFSET 0x0
 #define PERFCL_REG_OFFSET 0x80000
 #define MUX_OFFSET	0x40
+#define CLK_CTL_OFFSET 0x44
+#define CLK_CTL_AUTO_CLK_SEL BIT(8)
 #define ALT_PLL_OFFSET	0x100
 #define SSSCTL_OFFSET 0x160
+#define PSCTL_OFFSET 0x164
 
 #define PMUX_MASK	0x3
+#define MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK GENMASK(5, 4)
+#define MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL \
+	FIELD_PREP(MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK, 0x03)
 
 static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
 	[PLL_OFF_L_VAL] = 0x04,
@@ -439,6 +445,14 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Ensure write goes through before PLLs are reconfigured */
 	udelay(5);
 
+	/* Set the auto clock sel always-on source to GPLL0/2 (300MHz) */
+	regmap_update_bits(regmap, PWRCL_REG_OFFSET + MUX_OFFSET,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+	regmap_update_bits(regmap, PERFCL_REG_OFFSET + MUX_OFFSET,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+
 	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
@@ -447,11 +461,24 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Wait for PLL(s) to lock */
         udelay(50);
 
+	/* Enable auto clock selection for both clusters */
+	regmap_update_bits(regmap, PWRCL_REG_OFFSET + CLK_CTL_OFFSET,
+			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
+	regmap_update_bits(regmap, PERFCL_REG_OFFSET + CLK_CTL_OFFSET,
+			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
+
+	/* Ensure write goes through before muxes are switched */
+	udelay(5);
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
+	/* Pulse swallower and soft-start settings */
+	regmap_write(regmap, PWRCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
+	regmap_write(regmap, PERFCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
+
 	/* Switch clusters to use the ACD leg */
-	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
-	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x32);
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x32);
 
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
-- 
2.30.2

