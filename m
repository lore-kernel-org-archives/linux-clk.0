Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087CAC4167B
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 07:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbiLBHIU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 02:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiLBHIT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 02:08:19 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782F881382
        for <linux-clk@vger.kernel.org>; Thu,  1 Dec 2022 23:08:18 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id r8so4431609ljn.8
        for <linux-clk@vger.kernel.org>; Thu, 01 Dec 2022 23:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkHcQXrYVetwBz0HzmJulrgRpxbGrc7yz8CvYgvdPa8=;
        b=phIpf7i1xMxt1yI0oapJXupalHP8FBhkyZWs/Xx8cm9VNocoYkbz1VdthewpA8xs7P
         kXQc3YaAdzakUkwLJqFwZuZBDFB+sjXZGo7gfzdA58lCMUwkyUa3reYusT6F5S2dJWp8
         FNFmURAVdoMahc2tn/2+B8ngJpN29AxuAnH+Mq4uTPipm7egGiLlo6OEsBFXxlXSpUlB
         Rn2M99VyN/8COxZ4npT3/lKg2yZ5UF7zXJ9yPuyyyyMpS+KSfvLc+DoxBcIoBk2Yy59q
         j8+nG1wKs3XgKc+LlwqXNZvnDbzWk7/7cm5U/6ejoCsFuvLmybaPbo9qU19lLgbPqhrc
         Fx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkHcQXrYVetwBz0HzmJulrgRpxbGrc7yz8CvYgvdPa8=;
        b=EsR9tyFVlewNUkPWZG0vtTp2dygbg06As1LJ5st828NqifMDta4apF1jBuRoIfenzx
         R0MJY37kr36m0OCOErnjQa16qL0kkOXTyEJ6jtT6otYNhpa29WA0XAN8SmQtp9KAbLy9
         vC4s9ewV/L/7NRqnbRR3MUa1XVsIL+3dRP1Fe7GvfiHYb58odIEkFkhrwhKynlCIFOJ0
         qb0Cclz0wNKnX0t4gh61d32aa28XKOBXnqpQfcNhjchuQXWmZJ26qcQZi5+RsDAExg2Z
         hY8fJyn8oU9GJQY8jnBQEInsVewKNzd42nImuHrY4UOUychFA7aTGh5GKkQq++ni51JA
         DmVA==
X-Gm-Message-State: ANoB5pnFj2AMqoUZuJdK0wTG1X69Tt0DNuhGKt+F4EvYZfLbQj+6UN7S
        1/XzF0y2OQXYar9NP1yhUcRKvA==
X-Google-Smtp-Source: AA0mqf7btKVtEbOR3Z6N5alYhES9nXg3Pn3oBVg9ZPCZmLF66NT2O8DOC5bbyjvoKs8AZd5gc/rUZQ==
X-Received: by 2002:a2e:a5c6:0:b0:277:22c3:afbb with SMTP id n6-20020a2ea5c6000000b0027722c3afbbmr17113632ljp.204.1669964896651;
        Thu, 01 Dec 2022 23:08:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a2-20020a19ca02000000b004946a1e045fsm913097lfg.197.2022.12.01.23.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 23:08:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 1/4] clk: qcom: rpm: remove unused active-only clock names
Date:   Fri,  2 Dec 2022 09:08:11 +0200
Message-Id: <20221202070814.482470-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
References: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The RPM_FIXED and RPM_XO_BUFFER clocks do not have the active-only
counterparts. Drop corresponding unused arguments.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 747c473b0b5e..7fee957bc44f 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -57,19 +57,19 @@ static const struct clk_parent_data gcc_cxo[] = {
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, _active, offset)	      \
+#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, offset)		      \
 	static struct clk_rpm _platform##_##_name = {			      \
 		.rpm_clk_id = QCOM_RPM_CXO_BUFFERS,			      \
 		.xo_offset = (offset),					      \
 		.hw.init = &(struct clk_init_data){			      \
-			.ops = &clk_rpm_xo_ops,			      \
+			.ops = &clk_rpm_xo_ops,				      \
 			.name = #_name,					      \
 			.parent_data = gcc_cxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_cxo),		      \
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
+#define DEFINE_CLK_RPM_FIXED(_platform, _name, r_id, r)			      \
 	static struct clk_rpm _platform##_##_name = {			      \
 		.rpm_clk_id = (r_id),					      \
 		.rate = (r),						      \
@@ -412,7 +412,7 @@ DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
 DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
 DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
 DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
+DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, QCOM_RPM_PLL_4, 540672000);
 
 static struct clk_rpm *msm8660_clks[] = {
 	[RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
@@ -451,11 +451,11 @@ DEFINE_CLK_RPM(apq8064, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
 DEFINE_CLK_RPM(apq8064, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
 DEFINE_CLK_RPM(apq8064, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
 DEFINE_CLK_RPM(apq8064, qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, xo_d0_a_clk, 0);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, xo_d1_a_clk, 8);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, xo_a0_a_clk, 16);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, xo_a1_a_clk, 24);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, xo_a2_a_clk, 28);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, 0);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, 8);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, 16);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, 24);
+DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, 28);
 
 static struct clk_rpm *apq8064_clks[] = {
 	[RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
-- 
2.35.1

