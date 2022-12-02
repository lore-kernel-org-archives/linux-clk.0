Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37E1C4708D
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 18:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbiLBS6v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 13:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbiLBS6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 13:58:48 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68269D2CC
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 10:58:46 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x6so6361052lji.10
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA5cLJUoGQO+gLaplXIgTCRJk4ThzDRj/ruKwPcYtJI=;
        b=ycl1OG8BV3pkiUa4F+UZXIXRpq7LLAFXpntXVc4de/nSICtnC2HIgO0vMzRtgMWajh
         zsyQNH+8XgngaoWfDBQf8hHiRkYCxS0DwRn3R9EPK0YYzIiKnkqVF2l183TieE6p/O5M
         KMub3BiPZeliqwJ06sHKi6/tykkzbKsZEIQPg+f4lGVgCgXkM1+2xSN2AftJyVtwWxrF
         gaaMR97GUwbtx9TygLMtxEFRB8O4tAdnDMlyNa4Rf5YK7bYVPkXrPuwRadLe60PDaLtf
         4vNZtEP1lH1zHmliSJa453AyM/jHuBL43qluNVkYcelVxXwhCrBiiM2KuFuzXpugzCZ+
         mOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA5cLJUoGQO+gLaplXIgTCRJk4ThzDRj/ruKwPcYtJI=;
        b=bPRI8lxnU7OTaq8ddtOYM50dlooNiqiuH4h7htOQilL441eX6RbCte1kIxnclePOb0
         XY2xLIcPT+hrIJG/mtSCAQG9d/fgCXk/KQO0uZIinUUT3aEHdfFiKYqfvJlAzlJo7fo6
         XyCGAQ2uw6e5rwOOAywT4HeRSDD3UbmdmwWglcfLE8TfpapdQ2x7dGHfWVzap4QbF8TA
         N0fNgHl3M7W2Di9Vulxf4OuJ1T3MvNugLACoKXwDTEBST4PNfk6qY15IXcl/bUbDlyR+
         2xfFTW65CY5iQK3STFBO13HOfDZ4T74E0vQf7W8hxF6nupqYufTVMjGZFIIs3gxjBANp
         fH9w==
X-Gm-Message-State: ANoB5pk9jj0vH3YEPkQ35r3amlipj2nebFFsaNdoUCQkFxoe/citsuhW
        qqB4KYjENtFG/CMXfWyymVRY6w==
X-Google-Smtp-Source: AA0mqf5HFZpVmKqH7+cKIdQj2ZlM4Ii6drnBw7VW1cMHYKfQzt+Eq+KXTeYaTu0pchnQcrDQnWgiPQ==
X-Received: by 2002:a05:651c:313:b0:279:b566:7489 with SMTP id a19-20020a05651c031300b00279b5667489mr6220621ljp.137.1670007525164;
        Fri, 02 Dec 2022 10:58:45 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 1/8] clk: qcom: rpmh: group clock definitions together
Date:   Fri,  2 Dec 2022 20:58:36 +0200
Message-Id: <20221202185843.721673-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparations to the further changes, group all RPMH clock definitions
to ease review. Group the clocks by their type to make similar/duplicate
clocks stand out.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 55 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1da45a6e2f29..f13c9bd610d0 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -342,19 +342,45 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 };
 
 /* Resource name must match resource id present in cmd-db */
+DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
 DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+
+DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+
+DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
+
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
+
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
 DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
+
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
+
+DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
+
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
+DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
+DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
+DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
+DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
@@ -398,11 +424,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
-DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
-DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
-
 static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -478,8 +499,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
-
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -500,12 +519,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
-DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
-DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
-
 static struct clk_hw *sm8350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -533,8 +546,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 	.num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
-
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -550,12 +561,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 	.num_clks = ARRAY_SIZE(sc8280xp_rpmh_clocks),
 };
 
-/* Resource name must match resource id present in cmd-db */
-DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
-
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
-
 static struct clk_hw *sm8450_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
@@ -600,10 +605,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 	.num_clks = ARRAY_SIZE(sc7280_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
-DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
-
 static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
@@ -620,8 +621,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-
 static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
@@ -644,8 +643,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
 	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
-
 static struct clk_hw *qdu1000_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
-- 
2.35.1

