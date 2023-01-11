Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0C0C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235351AbjAKTUR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbjAKTUL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:11 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8AA17417
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:10 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id p25so10863950ljn.12
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCHat37cJtM2Qvwrjq9+VD2WQIcOHoBDwG3chmbNUpY=;
        b=tPO9MSdURuE4fUei6ZoMJGtGq3gyliM8iYBIKQ1ihvyZhI6D5ZlgG2l52rO5VBCxk6
         pgeVH41nEKMB4S1JBJhwH/ej0y49r+YdbHGfcL80vDlyOj66XSLE+0nmqmtS2QAzSKZr
         VKyoFBJUOLnntqbbleD/KByTOskfqL5A7EopVHqte2tY/zR+5KSi7tr/Q1TsbTyGUWLb
         GktVZnLfzVJmUVUqLmH974Rhhz+w6o+BrevZPSw1IiVRl5FkMwf7KW0ZuVKQ1C/OSIi6
         w+l16DdXIEe17QEWD/F3HyE2OI2K9kc69Vsge56J5p7rmI/yw5DvW6TO1Oz4+M/tqJkh
         rYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCHat37cJtM2Qvwrjq9+VD2WQIcOHoBDwG3chmbNUpY=;
        b=5X0DVHU9ibgaY7ie0R3gjT9F4SYfA78Z7DoBJltbVfWppaRdhDj1JC9zIkaLtljDB+
         lvrprkci6UhnRWO1pqKeVOZq0fXYYxsyYbkI9CP4q3HxKqK34vJ31tlQzb5wV+7mglSN
         AV6sHO2pRt+aWi+2DOZjSika2UmLuAE5A3lRvf6TR4kWQgN4i3sCvh3T1uGitsp++sG9
         RFW5Wwn4zcGPRw7KtzHFIx+WSY0vcESfTihrlPv523/JTKjIvN4QyWbbc2A32LDMRx8I
         VlDNBelGPuWMmBkfnLdmVu839WwYVov5kM5xkbZOrfbHNDyPnKeHHBxW+JaShQhqH88B
         NdzA==
X-Gm-Message-State: AFqh2krIwXGl4EUu3cRHfGEUBkZAgH+T6rUi3HVaMK0azeuppvtxdS00
        6CN1qOipPjZcF3tFR+QwticE3Q==
X-Google-Smtp-Source: AMrXdXuVq6ZYXBGVlknf+HG3E2OYi63zUUQl1n0GYUfNUxIx7udtCpt3y8sVoF3upfQnimbIThmVLw==
X-Received: by 2002:a2e:bf12:0:b0:27a:1098:6b82 with SMTP id c18-20020a2ebf12000000b0027a10986b82mr27369549ljr.42.1673464809905;
        Wed, 11 Jan 2023 11:20:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:09 -0800 (PST)
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
Subject: [PATCH 04/13] clk: qcom: cpu-8996: support using GPLL0 as SMUX input
Date:   Wed, 11 Jan 2023 22:19:55 +0300
Message-Id: <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

