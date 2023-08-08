Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EC6C04A6A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 19:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbjHHTHo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjHHTHa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 15:07:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EA22E7E4
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:29:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso26130165e9.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512139; x=1692116939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZQ93ryTVkLJ674HaEi8fy9NL3vC9KyVwveDa7EddrM=;
        b=ZCCBTApzVd4JP2mN7T7VjfJi/2w+IHTI4xJY9u755LMkbEMbe5pGNdTAz8FJlYvbAF
         Dus1qQAKDZ8ezNh+uMuLOcN2yN+rPXCZTz+d5lksaAhR0Miz5IlHeJM8XoJ9wYcVOMB8
         VMl685lKTqbqg+7/gjaA65V3f6raE9GI2n4ekZLop9frh4KUjjL548NiXBttDCUDnFV+
         Lvr4UiYLNhg7XG+wAONCT2P29eRtnIk5klOb8v4nGoGhOsv8tNoCwRtmifsEU50Z715Z
         SsHc/IoU3HJP36KKkgJCc9hkhAh83f058OAYSP1xXDaj8OfNwYsIfhaGmmabDkgk4r7O
         qwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512139; x=1692116939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZQ93ryTVkLJ674HaEi8fy9NL3vC9KyVwveDa7EddrM=;
        b=Gpw3Th8II6EPlr+J8Y9D7DbDiTZ6OF6d2GAqvEhV5TzRLmKIJAvPo8tkcpYfWnrNXG
         cCCblIzNGVVdVELJH+qHaH0+LXtOZDhUCynMAw4UJT5T/bCKamjWh7u6BfIwhWyWSX+E
         q9DBi2MKaZD15foO9kpmKKCQLsw/y6gjS2ccEJlScOSpqNbLEO0F1rML8VGUGuiYsWpu
         Ku1UNzBTGZ6rfq00JLJFatIrMO43EH2l4zw+FOryO970Y1q3gmJL2ejdWb2OyGkHegxv
         q4sbevI7fMR3BUvRwSljbtSin1Pd4Bv1CP35kpzN+VkgBzQUBrq9BbGfLYXOU3bgz4lf
         FxGg==
X-Gm-Message-State: AOJu0Yy7A56GhkKiPMkH1boKoIHBIqyavDLC8c/4F4Em1mmvZihxAe7F
        h1sQ/6mGD1TYqcw6/uWwuKimo/rtVgj6HHE9Dug=
X-Google-Smtp-Source: AGHT+IG9eggqMlJftuNT+UYhqts3d5BpOBl7EQ49aL1HZWMDX+s3HZ44tnUlcpa8asB0W6Zw6ZbjPw==
X-Received: by 2002:a05:6512:10d2:b0:4fd:d538:b97b with SMTP id k18-20020a05651210d200b004fdd538b97bmr9355921lfg.29.1691495026441;
        Tue, 08 Aug 2023 04:43:46 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:40 +0200
Subject: [PATCH v3 09/10] interconnect: qcom: msm8996: Set AB/IB
 coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-9-dee684d6cdd2@linaro.org>
References: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1682;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Ylk54qLtCUKuTX9FA4QTRZGSUqgBkVW+4oTAnkFbFA=;
 b=G6C3tehG5i+wpYLksQeibNa9TcRRryQx2c1C+PbgLjLNinmWth7Kgiq6h+P+yrqSg+hvkS8hs
 P/WvsN11oQzB97MrKtKeOynWWxsSz6KKpBWsjH96NjyOnz66wttLu7H
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some buses and nodes need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 88683dfa468f..b73566c9b21f 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -448,6 +448,7 @@ static struct qcom_icc_node mas_mdp_p0 = {
 	.name = "mas_mdp_p0",
 	.id = MSM8996_MASTER_MDP_PORT0,
 	.buswidth = 32,
+	.ib_coeff = 25,
 	.mas_rpm_id = 8,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -463,6 +464,7 @@ static struct qcom_icc_node mas_mdp_p1 = {
 	.name = "mas_mdp_p1",
 	.id = MSM8996_MASTER_MDP_PORT1,
 	.buswidth = 32,
+	.ib_coeff = 25,
 	.mas_rpm_id = 61,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -1889,7 +1891,8 @@ static const struct qcom_icc_desc msm8996_bimc = {
 	.nodes = bimc_nodes,
 	.num_nodes = ARRAY_SIZE(bimc_nodes),
 	.bus_clk_desc = &bimc_clk,
-	.regmap_cfg = &msm8996_bimc_regmap_config
+	.regmap_cfg = &msm8996_bimc_regmap_config,
+	.ab_coeff = 154,
 };
 
 static struct qcom_icc_node * const cnoc_nodes[] = {
@@ -2004,7 +2007,8 @@ static const struct qcom_icc_desc msm8996_mnoc = {
 	.bus_clk_desc = &mmaxi_0_clk,
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
-	.regmap_cfg = &msm8996_mnoc_regmap_config
+	.regmap_cfg = &msm8996_mnoc_regmap_config,
+	.ab_coeff = 154,
 };
 
 static struct qcom_icc_node * const pnoc_nodes[] = {

-- 
2.41.0

