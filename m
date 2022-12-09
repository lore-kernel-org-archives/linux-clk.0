Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31E6C2D0CD
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiLIQtY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbiLIQtO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:14 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167CE950CC
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:49:11 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id s10so5521865ljg.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=sPIA4PZrEA4+/AZi8OhGB7FkqjCUVTMx38u7lLor9JM+01A7iFtfzrk7aTvTRBOSR/
         AP/t0bXAq1RC3yMY+nXvMe08RQzUZSyx7Js7s5kWvuttgThsAtzVAJtgSToMdWvRj3f9
         Hfqx/6uD7RNW+CXhV+cWML4BQJ7Gnwrn74Q64VtWGmhpGlfC2WtWHgm5BaAgbPPR37II
         z40sDGktQvWvmrN30wJxjBOy/zl3+OUsmzgT9TzQahsBFTNa+39sH3jGP2iYEBO3ThnJ
         5RNj3pSVovdVWgNhJoYYkeiC9sWBVZ2VwiAY/kBh6+9XPc4AwKhRdFQ1ihp6oPJtcoxM
         SP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=DwuakgYd9BQ4MMigKrcD0EubD5BEIVyf2glST5KvR21ZLpifLKdkAZ7i409M/RJdBi
         WveXZIhT3/sPS2dQ4/DwnYyFTFpRIFkXTXUAajCHOS8pt1XsOQDuim/PJ8JUk/YNOSxG
         R6AJY90/S9vA4Af82ORA3oKaugTn26Y/a50BkZoeRSNtGja7TK9+8yPTUMw9b9A7bTSa
         QPgJcyZi8TCDvNPa1Jc+P0WCaHqgiaMMGz8jgboE8NuzxB9i4lLi3g4v6OsPeSDgqX9s
         +6SJm2HLXtNt6igfgXz28AIoz2bitpeYIZR4N96PIrQBSa8pKHynTyk2YqLcLzu/V3eG
         3hJQ==
X-Gm-Message-State: ANoB5pnXJ/Gb8KzW6STcx/9AV+2bSHyoSIfjLutXRp5SuaS24ZrjukHL
        1WAOsE6L5lMUv1h9UTLpHPJ8Wg==
X-Google-Smtp-Source: AA0mqf6VXmHaOp2Bhe05WKSAS35c5WNDIxAby7v39iZWlGjp28ghOJTzm0wS4v/6LspcZaE7KVxyjw==
X-Received: by 2002:a05:651c:381:b0:277:3c85:3cd5 with SMTP id e1-20020a05651c038100b002773c853cd5mr1674314ljp.22.1670604550664;
        Fri, 09 Dec 2022 08:49:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:10 -0800 (PST)
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
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 17/19] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
Date:   Fri,  9 Dec 2022 18:48:53 +0200
Message-Id: <20221209164855.128798-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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

