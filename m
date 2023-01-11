Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FFEC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbjAKUF0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238692AbjAKUFD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:03 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897E443D97
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:34 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id y25so25191112lfa.9
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCHat37cJtM2Qvwrjq9+VD2WQIcOHoBDwG3chmbNUpY=;
        b=YvhlSLlldXA1ktk13wJ/O4Gp1RC+o6+9JqJAspbyguImj2C138rOw33Rn6+RfNQiEG
         BB/hZkVvjEzo/2yafBAhi8TIOek1sw2+aggntqRUlChQfN8q+b37+vU62S+CahLI8vNl
         1J2mDFiS7DSGkUdjtRXBIEUZ2cp6dCZCMKfSqXYXxUq+S6wvgWxpC6+AF1Obm3orLg60
         LvSUVXMlf05x/qVUUCWD1HdDSE6Tx3daWo2XpgGAl2ODOZ2t7LBy5No1NAZaq7ag7fjk
         YsIlgJpnNerVEOAqAddzxbqGMXrWRR05w/U2BKKs8NxIA88ESUkzDACOkKK5BeaFnW0b
         4tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCHat37cJtM2Qvwrjq9+VD2WQIcOHoBDwG3chmbNUpY=;
        b=iQyD9/qqbzS/5cZ0VV6qGA8YuYZKCodk4FXfEwFedInh2l7AmeqJvoDSQyA0PLMjif
         ypDyuF+FMK31NAVpLlhVVQ1YFn5D9YmMkDCEiwemnxaDzceIc/UGWGdkzoZgwDGoCJB/
         s8wEC9vEbOct20WJvJ3E5aTH+c4FPEjzdRIYdRo0OxuaivQU1gQA8hYsKNu5Z+kTjLXv
         Zo3BSgk/gGgMx57L89SAtzm1QUEwcT2M3HdAnywrRXEnep15kVlpOfDLpDLEX7DvE7QV
         qAjAaHNeUsdqEP1k/e6qZhUVt5uFURGDCn/M+If38k3GFUGVefnT8iC+vraO+q5znOqw
         8/VQ==
X-Gm-Message-State: AFqh2kpEqM6IQI4shlfyzlhBufsvsDuinFdHVpCQczfDIMNU1F2kAYTy
        cdy5duUef4Jo+80HuItIYRBA+g==
X-Google-Smtp-Source: AMrXdXu58ILgQPiKFsmXUedyxiC7SkBuhOkzFHpC7cly8MPvCBn2S8/B6TUEQ9MaLjuaaNWbZGsSGQ==
X-Received: by 2002:ac2:4bd1:0:b0:4a4:6af4:43b7 with SMTP id o17-20020ac24bd1000000b004a46af443b7mr20048900lfq.69.1673467292658;
        Wed, 11 Jan 2023 12:01:32 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:32 -0800 (PST)
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
Subject: [PATCH v2 05/14] clk: qcom: cpu-8996: support using GPLL0 as SMUX input
Date:   Wed, 11 Jan 2023 23:01:19 +0300
Message-Id: <20230111200128.2593359-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In some cases the driver might need using GPLL0 to drive CPU clocks.
Bring it in through the sys_apcs_aux clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index d51965fda56d..0e0c00d44c6f 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -12,6 +12,8 @@
  *                              +-------+
  *               XO             |       |
  *           +------------------>0      |
+ *               SYS_APCS_AUX   |       |
+ *           +------------------>3      |
  *                              |       |
  *                    PLL/2     | SMUX  +----+
  *                      +------->1      |    |
@@ -310,20 +312,29 @@ static const struct clk_ops clk_cpu_8996_pmux_ops = {
 	.determine_rate = clk_cpu_8996_pmux_determine_rate,
 };
 
+static const struct parent_map smux_parent_map[] = {
+	{ .cfg = 0, }, /* xo */
+	{ .cfg = 1, }, /* pll */
+	{ .cfg = 3, }, /* sys_apcs_aux */
+};
+
 static const struct clk_parent_data pwrcl_smux_parents[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &pwrcl_pll_postdiv.hw },
+	{ .fw_name = "sys_apcs_aux" },
 };
 
 static const struct clk_parent_data perfcl_smux_parents[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &perfcl_pll_postdiv.hw },
+	{ .fw_name = "sys_apcs_aux" },
 };
 
 static struct clk_regmap_mux pwrcl_smux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
+	.parent_map = smux_parent_map,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_smux",
 		.parent_data = pwrcl_smux_parents,
@@ -337,6 +348,7 @@ static struct clk_regmap_mux perfcl_smux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
+	.parent_map = smux_parent_map,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_smux",
 		.parent_data = perfcl_smux_parents,
-- 
2.30.2

