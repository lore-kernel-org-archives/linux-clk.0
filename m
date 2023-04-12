Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5614CC77B6E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 14:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjDLOxV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 10:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjDLOxR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 10:53:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCC31994
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 07:53:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z26so14949819lfj.11
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 07:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681311194; x=1683903194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UAk5E190wNgEBpxEtcgbtHjnL3P3IqX8QW8cfsP/YM=;
        b=K0ZinGz0TVWTKppVbCaFL0TrOFM6eJ9G0ii4oxQ2NwLz5SHqZCik0NxSgXadZnpMi2
         3K3lq9EOgaWnxUdrl93GLhGVdlneb7KHQKl7l8sw9XTOZVrzSjYbZ0TkQR19H21bZn/k
         QmzKz7Omy9dIYkl69iAMg9Urw4/5fnAcKCLn7kxdUDDHChRh6F3hRb718tzFicULZXfj
         j4oQZ5NwJI5ROLHIyx2vZtTTC9+iKetvIvIwnN9TJz1/wdPsBWfNDhLT+uDTxxLrPswu
         vRugK0D1ZHBUt68LKT7swEnaplNSD/KvdG0sg8mGTkO8ujdYtcZyTJ3WfJZCdAiXI7wh
         te1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681311194; x=1683903194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UAk5E190wNgEBpxEtcgbtHjnL3P3IqX8QW8cfsP/YM=;
        b=VgT47Unv2/jGhcr8nsEP7r3duYrFKbtlsWa3jskpWC9i3sbQAlCr55xEVmcFt/n+qG
         CjH9AY6H/0uE47XeHfvtWAolyZ/qVqe7DbwY6qDG3iRu1IuLSghSnyoInUKS5abrrsq/
         9tEbUwwhalUHDZnr4bxNXO0yN0NFPOiFZsOwT0q2Zx3mYyFwVwFGdWatzbV0c8lEb918
         Zp7plHqam/mvpP2FvpCsXyjEHIxlUGOggelVsKjhwiE2YLpCmeqv8Cn9egJUiytjoOa3
         dOfkIplnSpcOiZzgm4Ga8r044Lg2jYld+UCweNih+jy+5NsqXeStjMBfBHV4Hx0bfWxf
         7SPw==
X-Gm-Message-State: AAQBX9e+1On/KEEPMdaNb7Qd/L1YlRsSp+heUsawwiOGKZXtxxp08NyS
        FgYqv8WivhjsnQEbzmozYjXv3w==
X-Google-Smtp-Source: AKy350bOzesaNrpocZI7s+N4fZGw0Ob6oOvECDQ22CCsAizyz+FwTRO+qC7oqwMygtCuFugoU++9Jg==
X-Received: by 2002:ac2:5fc8:0:b0:4e8:3d24:de6f with SMTP id q8-20020ac25fc8000000b004e83d24de6fmr4925749lfg.14.1681311194072;
        Wed, 12 Apr 2023 07:53:14 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004e95f1c9e7dsm3015367lfl.78.2023.04.12.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:53:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 12 Apr 2023 16:53:05 +0200
Subject: [PATCH 1/3] clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-qcm_dispcc-v1-1-bf2989a75ae4@linaro.org>
References: <20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org>
In-Reply-To: <20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681311191; l=1283;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZPPztK/ocj1ol1xQUHYQtAl+y1B8bJFYFayKaHP8l6g=;
 b=OyLOma9Xj210KuSJleD8Uh6LGCGzZ/Fnkz5r0uMAFN6a/Jv1rf4k524QCcHwwx2PbE76RmR+5qLv
 VVa4Ax1MA7QazGJWXAfLfpI70g3Ri6Umo0x1m/0NYa7LVQaFhl2b
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

BI_TCXO_AO was previously shoved in under the name of its non-AO
sibling in parent_map_2. Resolve it.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index cbb5f1ec6a54..0f516c72e624 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -24,6 +24,7 @@
 
 enum {
 	P_BI_TCXO,
+	P_BI_TCXO_AO,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
@@ -83,7 +84,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
-	{ P_BI_TCXO, 0 },
+	{ P_BI_TCXO_AO, 0 },
 	{ P_GPLL0_OUT_MAIN, 4 },
 };
 
@@ -154,7 +155,7 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
 	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
 	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }

-- 
2.40.0

