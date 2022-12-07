Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78639C352A1
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiLGAPU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiLGAPJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:09 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9DD4B996
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:08 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id f16so7440421ljc.8
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTP1NRUDSX5225KiuwC45k5TpOV1gR8oKoLR/7vo90U=;
        b=bk8ugj5Qz1qy7mPNsviDC9NeuDALHIfUZ4+BOWgW8h/V8X/Oh5S1EnIuHjiPoejhmQ
         3/s8mhsxIgXl/qqELDxOkNcrCPjypt7j0tPKu4CHKZJsXzhMLgQWwz+i4u9dgi0MDPOD
         /M/ejo9tiCJ5jifgJxy6ovTj2swbjuiRfyjmwEd6jRrkddM0VvIOXIYMJhM+/XRFe/MB
         EYmYS5pcVLBTtNaMLoB8GYM0i/LEALyri1lpST4K8ibdmdCd5uMYTs2TrZLa9T9BMKqF
         cx3aSzPOC/SjatCRy34w5AaPW5Lo8sxVt5odyiqDRBhDNtV0nMA49Scq3Jeh4IlgOXzF
         SXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTP1NRUDSX5225KiuwC45k5TpOV1gR8oKoLR/7vo90U=;
        b=4VPKgHUT+kdgcfz86E3K/4ZjlnJFlwYDxL56tmACMsDwKCInChuk1HvqjnACX5oCiZ
         6lbYCbIVskKkJqbHUirNgWfpGUAxk/pc8xfjesMuFJTvLomSzzSsgQvq9FI8JHA5IvG3
         hOZzv5bWDausioeHCWMzHzPGMkEZgNtAq6jlgGeoZT+9N0K00s8LUp4dQcClai1ApSdC
         tMqbrQ0vH1hyeSOwLQMn7hPS1o+S06m2xtvYTaCMWSmGbS6c7xKfA4As+Tb1ERfTIkXm
         tLk9ZxUgCRMpSmgHjQOmA9Qpwa7GJ7jEmw4FJSxESd3YivrtBW4NWrEw+2SkIDY0Jp+s
         aBDg==
X-Gm-Message-State: ANoB5pnl/Z4BgE1Q18c8IIzA2qfkf5ysn3tGj8GLBIf6/SS0qbZ2USq6
        Jsrg18MQV9pP3pui/eMWDS1Nhw==
X-Google-Smtp-Source: AA0mqf5MPTZMBxcqEuA9orGguuJaYXrYvUA9n+hONYvIOQ3ePqTAmH/3cl/MfEEcO66GP5vazpnvRg==
X-Received: by 2002:a2e:6e03:0:b0:279:97a4:35da with SMTP id j3-20020a2e6e03000000b0027997a435damr16112855ljc.363.1670372107810;
        Tue, 06 Dec 2022 16:15:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 05/18] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
Date:   Wed,  7 Dec 2022 02:14:50 +0200
Message-Id: <20221207001503.93790-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The qcm2290's ln_bb_clk2 is identical to the freshly added msm8998's
ln_bb_clk2 one. Use the latter and drop the SoC-specific version.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a0bf58785921..7dffc30ddb61 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1169,7 +1169,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 };
 
 /* QCM2290 */
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
@@ -1184,8 +1183,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
-	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
 	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
-- 
2.35.1

