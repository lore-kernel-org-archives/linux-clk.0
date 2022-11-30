Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43A0C352A1
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 13:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbiK3NKI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 08:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiK3NKI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 08:10:08 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D0A6CA32
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:10:07 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so26806066lfb.13
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gzH+UjDtpSN2TBOm25RZHMYv/xwDs6O2i9cPC2mgCU=;
        b=eY+/7qTN/ke0IJIRhLaQdTHqKlwokLfTeNURGyoiYWAUKm/VbRcFcQ2iqtm6t3krpm
         emlfdziAbzOacTaUtTt8Otvv4E9kr496/H9v+5MwNHeOSgSaruqP3wqH1gIJqJRw4Uzx
         l6oKdntjVOMabZ0KIQJvz6t0Hv9H2/6krIbmwNkHttv7Cw5+NFHTN5hIWfQ0J6MDGHtj
         7ZCrfzZmGxmMHJVB69L/kx+77y84dE8u4ONrv/5UquC5eyZ6xUjZJOO9QN/aYgLDCZiJ
         a8C5kb5LtmOz9tglDH9xW3Rp/5YU4V/GHybjvsw6OYD4z8KIDKdRDecw6J/o1d5rhVOs
         M9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gzH+UjDtpSN2TBOm25RZHMYv/xwDs6O2i9cPC2mgCU=;
        b=OqqHq5iXrhZAODe7fhxRhp6+sFKKl0NLrs1uOeR/ENc6Ao0X+UaotHHrUD3dNL2i3J
         R3HznGwRxwWadv49MvNtcsCQaEvNZha49//2Bg92nloxtckPn3tzFsY8vbLXrZ8E/Ih3
         1keITVIdOFXLhuOZCufoyohGNsOSv+IZqtD9iWNuJG+Iyalg81RhuZjuaEZ/sussJhei
         nN5R/lBfEHrkp9c30uwrMlNA1kLRjspGt1DmNVkoAUf04oRufCuwjx3kjsYy90CD2zOH
         YEf48Lno8USPR8NBKYGsoGlxIFljfo40vUiLgMrWo5bZ2XmhIzZKxg/YdqJFjX0x7Dhk
         nu8A==
X-Gm-Message-State: ANoB5plYb3lemuwJZSLRsTjjRghc1ehFYG56ZZoIGYLTTsz0zKzc6htN
        rJsJTEyV9rFXxXtlV3IX4lJfAw==
X-Google-Smtp-Source: AA0mqf6/YD18aEE6rU8aUaZ4jctPLvx59/ZMaHo7Gsj1aDHJSrJpxqG/7rk5arlZC9ab/P2Dzxe2tg==
X-Received: by 2002:ac2:5964:0:b0:4b4:b5d3:650f with SMTP id h4-20020ac25964000000b004b4b5d3650fmr22593861lfp.649.1669813805526;
        Wed, 30 Nov 2022 05:10:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 2/8] clk: qcom: rpmh: reuse common duplicate clocks
Date:   Wed, 30 Nov 2022 15:09:55 +0200
Message-Id: <20221130131001.20912-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After the grouping it is obvious that some of the clock definitions are
pure duplicates. Rename them to use a single common name for the clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index f13c9bd610d0..c4852bbd00bf 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -350,9 +350,7 @@ DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
 DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
-DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
 DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
 DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
 
@@ -362,7 +360,6 @@ DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
 DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
 DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
 
@@ -370,14 +367,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 
 DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
-DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
 DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
@@ -427,12 +421,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
+	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
 	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
-	[RPMH_IPA_CLK]		= &sdx55_ipa.hw,
+	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
@@ -549,8 +543,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK3]       = &sc8280xp_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]     = &sc8280xp_ln_bb_clk3_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
 	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
 	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
 	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
@@ -624,8 +618,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
-	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
+	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
 	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
 	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
-- 
2.35.1

