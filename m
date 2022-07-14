Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B0ECCA482
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 10:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbiGNKEP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 06:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237641AbiGNKD7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 06:03:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4EE2DD9
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t1so1953496lft.8
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YqQw+hyZrOSvmDZjue9kde/HY6butVNaHprEEy1Lvvs=;
        b=yEXH5JSEEmuCje6GpBhQX95NQ+K/ECEoI/mIj7PJDK0z6LI/cNmhK2cv8IbwV/B1Hb
         0kY7bQXObD1eo3eFGp8IlQP0PLkM+RBCy/CZF9Y/ZH/rUMzDJiWo+ydlel4xP4DeP8bE
         E31+weZEyXSuvDwYJuceOH9SdZ2CexRnL2yHf75zvq7o+tw5vtRkLTTcIu+/IV6tfpcp
         D+lhxMJJHuHT7qX5xMf+Z28+rinkd9iutST+nMoFP3+L9NTIMTpBsk6FesojRzHL6oEK
         UZ1wT226gGVO0E5dq6F4w15HTzCd5IxlRNGDA1q+VhXa6+TmUy4IaEj4+ldkTZp7sx9q
         NdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YqQw+hyZrOSvmDZjue9kde/HY6butVNaHprEEy1Lvvs=;
        b=yn6X6DjmgsbFCoKvlHfrng3XNZIPOopr8jYPoBCYBxA8GWA6mGhuyJCbgVBWsXNIqb
         KckIa2SDk+JWb+8ecm+P0oJiTN8MXQm3sD+VzMw6xeLSiBwjhgtH++hUdJkPR93PPNgO
         sWOfA5c3SGosW5mjjgkZBk7sSFUDTX4tZB7/s1qJHeJB6MwZTVcex5JQqtiS1EVKgTf2
         K9kXGP6dtE/3aqGOzMIJn9eRhm96OOLtl1n98XmcGzf/hO4gkpymr56FF2sMzUJaivvL
         Rd0tsJbVAv7SO/eQp6a9f4HyVnBCnQgZJU7gAmdB43K46V2vLsWLFo/HAXyFrNwRG77i
         skEA==
X-Gm-Message-State: AJIora84WEDDSTNArNZn6juEDUHLpZs02O5hR1hm7oXvRF+QArdT7pTg
        XpuVofMaYk+pRCQLt6fb2XIR6g==
X-Google-Smtp-Source: AGRyM1u3UowzkELPYriWql+Kw5rsqUcTow48EopecVCSSsFRtxVaO8JJtQpLsVro0WsrsPKJ1os02w==
X-Received: by 2002:ac2:5389:0:b0:48a:1070:775d with SMTP id g9-20020ac25389000000b0048a1070775dmr3179089lfh.266.1657793036327;
        Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 4/6] clk: qcom: cpu-8996: move ACD logic to clk_cpu_8996_pmux_determine_rate
Date:   Thu, 14 Jul 2022 13:03:49 +0300
Message-Id: <20220714100351.1834711-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rather than telling everybody that we are using PLL as a parent (and
using ACD clock instead) properly select ACD as a pmux parent clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 3dd6efdef82d..5c5adcb533ce 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -284,9 +284,6 @@ static int clk_cpu_8996_pmux_set_parent(struct clk_hw *hw, u8 index)
 	u32 val;
 
 	val = index;
-	/* We always want ACD when using the primary PLL */
-	if (val == PLL_INDEX)
-		val = ACD_INDEX;
 	val <<= cpuclk->shift;
 
 	return regmap_update_bits(clkr->regmap, cpuclk->reg, mask, val);
@@ -371,7 +368,7 @@ static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &pwrcl_pll.clkr.hw,
+	.pll = &pwrcl_pll_acd.clkr.hw,
 	.pll_div_2 = &pwrcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
@@ -388,7 +385,7 @@ static struct clk_cpu_8996_pmux perfcl_pmux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &perfcl_pll.clkr.hw,
+	.pll = &perfcl_pll_acd.clkr.hw,
 	.pll_div_2 = &perfcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
-- 
2.35.1

