Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B09C4708E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 07:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiLBHIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 02:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiLBHIU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 02:08:20 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6905F67
        for <linux-clk@vger.kernel.org>; Thu,  1 Dec 2022 23:08:19 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p8so6046622lfu.11
        for <linux-clk@vger.kernel.org>; Thu, 01 Dec 2022 23:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g11/BP5biGhWbXegQox2m9yAhJ7XOiAKlEj7CfFwIhQ=;
        b=ThFyopHUkY6Wl7pO6hb4Y5SpiOB8Ph1hmwWEaTzkidrrEg/tUkI65OKNQkb8+SKqLP
         v0CasAEVYs+5bRLJqWpR/+Ed1aieLgMSa61kGfKtYPo1C7OG3nBK+o4flFSqB55k3qI5
         Q3bgjSVpxSMzACRsfgjWFsNEzDQhObFndP2hCyOZFWFOkpJZ2F3fbQ7+f6JdvvF4DPi6
         Y4N5WLv41t9Qser23zLBbD1BI60ofTQ5Ma9BqogNfmtJs2C4E3uz4YwN+K8rmN7bHsmI
         h7FksPvB34A1FWja0j1UFPWYDFONLXtpt+epvBlX1ZotxqDlhP0s1Fxflk0l5sSx1yf9
         EoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g11/BP5biGhWbXegQox2m9yAhJ7XOiAKlEj7CfFwIhQ=;
        b=oMcEKFOcWFsg1Uqnfr4cLq0u+LPVGtWSyHrRd82nFdEBrvAG4Cduq5Baw86DaUNaOc
         0OzJ8eO/78IHL2QBMiQHThJhw9pYc9uAIxZ/Uj7tOUCab58Zd/FCgbTIe7OVuMTwwec2
         vXBsSGnEID+CRTqg1k2c4RMtjQaY7GQXiNHrySLB6LeILrMlOx50qoSH9OfMljmO/WkD
         rVGaemu+bdwpBO8HTORKMpRArfdsLiRXF58VrsCBG6goxRcK3yKCgyUVXf7udpE6XxGR
         a2slmu6x3Q97V07OAy1iHVlLfquM074TtZU2uqYuAG/hnCL+215QImo2jEA2I8xviTsu
         Ggyw==
X-Gm-Message-State: ANoB5pkiCtPXlVpW4VCP7gOaK0mONoo419clAYi5PQHqRTi7lYHhs50O
        QCZCQ2zT1Uvhf/a7Xbn7YcHEGg==
X-Google-Smtp-Source: AA0mqf7dHEgqDRct1thATl4L5RVGmneilXtrEbq+FnqL/qsDqyVnpxZ8lP6Zl5lDxMGBZ048juVENw==
X-Received: by 2002:a05:6512:3d10:b0:4b4:1177:a64c with SMTP id d16-20020a0565123d1000b004b41177a64cmr26579493lfv.647.1669964898238;
        Thu, 01 Dec 2022 23:08:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a2-20020a19ca02000000b004946a1e045fsm913097lfg.197.2022.12.01.23.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 23:08:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 3/4] clk: qcom: rpm: drop the _clk suffix completely
Date:   Fri,  2 Dec 2022 09:08:13 +0200
Message-Id: <20221202070814.482470-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
References: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop the _clk suffix from other clocks too. This does not produce any
user-visible changes, just syntax sugar.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index ca96f4bf7b2d..74a94e858920 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -58,24 +58,24 @@ static const struct clk_parent_data gcc_cxo[] = {
 	}
 
 #define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, offset)		      \
-	static struct clk_rpm _platform##_##_name = {			      \
+	static struct clk_rpm _platform##_##_name##_clk = {		      \
 		.rpm_clk_id = QCOM_RPM_CXO_BUFFERS,			      \
 		.xo_offset = (offset),					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_rpm_xo_ops,				      \
-			.name = #_name,					      \
+			.name = #_name "_clk",				      \
 			.parent_data = gcc_cxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_cxo),		      \
 		},							      \
 	}
 
 #define DEFINE_CLK_RPM_FIXED(_platform, _name, r_id, r)			      \
-	static struct clk_rpm _platform##_##_name = {			      \
+	static struct clk_rpm _platform##_##_name##_clk = {		      \
 		.rpm_clk_id = (r_id),					      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_rpm_fixed_ops,			      \
-			.name = #_name,					      \
+			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
 		},							      \
@@ -412,7 +412,7 @@ DEFINE_CLK_RPM(msm8660, cfpb, QCOM_RPM_CFPB_CLK);
 DEFINE_CLK_RPM(msm8660, mmfpb, QCOM_RPM_MMFPB_CLK);
 DEFINE_CLK_RPM(msm8660, smi, QCOM_RPM_SMI_CLK);
 DEFINE_CLK_RPM(msm8660, ebi1, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, QCOM_RPM_PLL_4, 540672000);
+DEFINE_CLK_RPM_FIXED(msm8660, pll4, QCOM_RPM_PLL_4, 540672000);
 
 static struct clk_rpm *msm8660_clks[] = {
 	[RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
@@ -451,11 +451,11 @@ DEFINE_CLK_RPM(apq8064, mmfpb, QCOM_RPM_MMFPB_CLK);
 DEFINE_CLK_RPM(apq8064, sfab, QCOM_RPM_SYS_FABRIC_CLK);
 DEFINE_CLK_RPM(apq8064, sfpb, QCOM_RPM_SFPB_CLK);
 DEFINE_CLK_RPM(apq8064, qdss, QCOM_RPM_QDSS_CLK);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, 0);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, 8);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, 16);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, 24);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, 28);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0, 0);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1, 8);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0, 16);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1, 24);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2, 28);
 
 static struct clk_rpm *apq8064_clks[] = {
 	[RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
-- 
2.35.1

