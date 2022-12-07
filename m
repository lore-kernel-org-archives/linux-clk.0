Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91DEC63708
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiLGAPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLGAPX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:23 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FB94D5D2
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x28so8894593lfn.6
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=hha66+YrIT+NNWetdlmEzIlvNnTNOw3EIForQte8ngYrIaHreP2jbpudZZpPb50KBH
         UtctOHhm9ZVJHKeGFUKTuumX0dTLzxg2rvu+PqcnvewKaYIdfJGCuLOhoXcubyyX5KuD
         TJpWy7qcogEaWxFmY9n9G4nGdpJ/DeanY2WPFRgUj3G70kY8s3SUODsPHt7tXlNeZLnZ
         uqvzrEw6YessZFCSHvggHhr/y2dluyKq/MtOQAHLBFKjYKOqnDdiQ0ypPEjq6tx7D9yQ
         yfbaHCXZnVImNPEOic2wsfJq8HNVcWNkx7+GwfKSldKmnObQEIjWyEVxLiLipWj3j3si
         xPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=yVmQ8PSsNvsI397mQM6+yxzdhgoKP6+u1KlGwyPR2srDytDA4+5C3Z2B8dNmGxhZTJ
         lsS+40XQX+HJxqKtuxvzZ6IXbTaoXXjVNTIJ/6iMT5AJ7ZI7YIFKA6ioFNzgtGlyW+Qo
         u5YG7K0lrH0QyKdS8m/rAgKEvR3Xt/r1qhES1C+FUBy60/2Xg+h0o/8HPEw6tzWNQ2Dq
         dUid1tYjzYK+bVJII/sqBxwdM5Hj79Jv6wJw7BoqH7rw7zNxiTuaBNk5zQtxpvGjltYz
         wle53cmhwLh487fk37nX1qsoWOeVDSZd41c1EoVTTtnI27Hpo9tdEzGffXYFQ1ZgbZzv
         GD+Q==
X-Gm-Message-State: ANoB5plahhL1KnmfPh+l84xkPfqQh9Cv646yf+E22pSkwyXTrLdlscaI
        mRTISLZasKUUAsaiP2qVGoYo+2mGdJ2r5AxO/0qAaghM
X-Google-Smtp-Source: AA0mqf5jKsA/iZiytih+WownDKusrN8A+ihka+Q7GpDv+a8nFaYLI/XbdHeDPmK0010tuEnmSWsqTg==
X-Received: by 2002:a05:6512:3690:b0:4b5:6683:e491 with SMTP id d16-20020a056512369000b004b56683e491mr5251068lfs.313.1670372116189;
        Tue, 06 Dec 2022 16:15:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 16/18] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
Date:   Wed,  7 Dec 2022 02:15:01 +0200
Message-Id: <20221207001503.93790-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rename the qcm2290_rf_clk3 clocks adding 38m4 prefix to distinguish it
from the common (19.2 MHz) rf_clk3. The system (and userspace) name of
these clocks remains intact.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8963ade901ea..4db92d2d91b8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -133,6 +133,12 @@
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_platform, _prefix, _name, r_id, r) \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix,	      \
+		_name, _name##_a,					      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
+		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, r_id, r)	      \
 		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r);      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
@@ -480,7 +486,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(qcm2290, 38m4_, rf_clk3, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
@@ -1170,8 +1176,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
 	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
-	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
-	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
+	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
 	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
 	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-- 
2.35.1

