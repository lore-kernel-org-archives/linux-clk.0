Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A62C352A1
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiLCR62 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiLCR6W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDCADFEB
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:20 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p36so7865881lfa.12
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWtijZ3bB8HPZphF3fxWjCuNW000uqjuhFuH+RAwtAM=;
        b=jRGmfYHCHBNX4T4EF+weaUe6hL0iIL6spZR71wL3sew651zZB9HtIlXfBs59huyvOh
         96ljmvWdSRkayswBHrhrFahR9ivpHTGYAS/QQejueAfkLZE/GriPtli4u0CN0gcfeglk
         O+Jlivu3CEhAzM8KFm2I7qgpjJZaX9GSQEyAI9NuFUFtHvkqSXypEVBFbMLRzrNObyra
         675BQZA7jm2SCGf0m+wt12ubfNt+JblNA6fiD6B5yygzQY/h31TLnSA7/urOKb99Brqb
         CJmliZsrdLnGZxsLFt8Ey/PUbdWknrOeDNuo3qG9MEC4xQPwZzaK3D5ixvCS6CmrJxEI
         43Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWtijZ3bB8HPZphF3fxWjCuNW000uqjuhFuH+RAwtAM=;
        b=LTEbuzfdXsPjMioXuwmdQeCvhvMlWorXKNjL/+jgIs7sfjdOTY73X0yR5bwgIZDUbo
         lXvGjqlwUrWIPRZjw5k77/yGoNA6Yd3mNGOz8enD7Q9KGYt3nZ4q+mm6WVxZW92I1Y1J
         9KD+4UovGAlr7TAtYsBEcQocNdOZjRFlCxLwhJ28CAklZwKZ7OIlS6GpvFxvAvQBo1c+
         BRqEoDJh54l8eRfaQiyks5+l43tQ6M+FThRbFBQ9NJqwk/+CXFFKTO2WFAwRSNsYj/0H
         lJlF44HxhqxJ6TU1Cy+9PQIih3Ym8hhCfwxoNmMLulrMJ3vNpMacyTPTPXnYKmv3M5nY
         tthw==
X-Gm-Message-State: ANoB5pkSTgkgp6lcNYqcZbcmNiTWNqn9nnQwtgHRs7EqGHVcHV/c80kr
        //hJfWhG/F9CXZBXpBGHn6Ym9w==
X-Google-Smtp-Source: AA0mqf4/hk/ZNJpB9HJ01XjfPkh1xtkLlG1P0Ts3gvVfws8zyLXpVPQtma8S084Okr2CP686ga7oBQ==
X-Received: by 2002:a05:6512:131b:b0:4b5:1ae4:f234 with SMTP id x27-20020a056512131b00b004b51ae4f234mr10315980lfu.391.1670090299178;
        Sat, 03 Dec 2022 09:58:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 11/16] clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
Date:   Sat,  3 Dec 2022 19:58:03 +0200
Message-Id: <20221203175808.859067-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the duplication between the names of the normal and active-only
XO_BUFFER and XO_BUFFER_PINCTRL clocks by using preprocessor logic to
add _a suffix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 54 +++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index cb47d69889fb..9f33dbd60e96 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -112,17 +112,17 @@
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
 		QCOM_RPM_SMD_KEY_STATE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a,      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name,		      \
 					     r_id, r)			      \
-		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active,	      \
+		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,		      \
 					     r_id, r);			      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
-		_active##_pin,						      \
+		_name##_a##_pin,					      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
 
@@ -456,28 +456,28 @@ DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 
 DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, 3, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, 6, 19200000);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, 7, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, 11, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 12, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, 13, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-- 
2.35.1

