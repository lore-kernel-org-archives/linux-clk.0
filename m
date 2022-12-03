Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90838C636F8
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiLCR6U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiLCR6O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:14 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EF113F2C
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:13 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id h10so8848311ljk.11
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICN95+Uyn/HXqpP/kMR7C1jrmHRbZpjkyHcmynVAenk=;
        b=zje6KP7N/juW+eXPzrv5JxsyksQQoGcWewtqElp0erOS1daRuwsr9mv9W2vyx7afe/
         JKHoN6KuxH6a0clHen3wW2+SjKt2Es0LYZFIGOtU7viZ6EuhLw68VUqj5H4Gj+1P5FnI
         YuUbV8mosWBYUj30bf479gtyn7xu/aISJxdXeXdmhKLo1ZARtlEBg0r0e8MqM7XgSn2M
         xalCvX6ZnqMAmGhcX5ioPTSbaYbOUYW2Xw8+QX6U7tH+mFbjskmf4uBwQPo0lQ32fMNa
         ZBdcgVXGeZKEp2JAzKgD8rx/P4+pJa1I3XHyRBp62aO8s5HCwfQA/ZDfVWnl/I8J9wzC
         ugOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICN95+Uyn/HXqpP/kMR7C1jrmHRbZpjkyHcmynVAenk=;
        b=hbGgqA6xtreMYsmtfZywPG9ajPdA9VW0bv1f6g6MAsWZFfRDqWjtXfve6jZoEtHirE
         A8jbgSxphzwOClAPSjpAk4I9hv9u6lC51ieY6lbTkxbsaNhDWgIlTozKRUW6jBnvQYWa
         //xAmum00/mFh2mwmvX0W9FPnUEzYJiAw/90nhEXiFiu6IIp+3yPsWtaaQCuFrqIASZC
         n65fhpuUHWe8/l+fy6nbCkjCiog3mRl0verw+SHJBJAHWRdKDhl4IaEr2QPAwOa8g+pH
         WKpEMAdALl6rK3nECoGOio1PKEoSTI3tZNIQkwsaUCDlJSsd9Koj451wULQe+0uU16cS
         TotA==
X-Gm-Message-State: ANoB5plVyBNBVU7fSaNu/NjiMv9rP7crnQesU+pB4XkvsQhlqRlRq+iX
        iHeivd8/MKDijZisPun+3i94/MTc/OuOX6Bc0EirrA==
X-Google-Smtp-Source: AA0mqf6mv77RjCb9OH0eDMEe+Dq0RQ1GCocVoPGbknAaPlr6/uPburYTw3kWtnPbBWDyiipmHQ56MQ==
X-Received: by 2002:a2e:7a0d:0:b0:279:f766:5021 with SMTP id v13-20020a2e7a0d000000b00279f7665021mr17475ljc.328.1670090291644;
        Sat, 03 Dec 2022 09:58:11 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 02/16] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
Date:   Sat,  3 Dec 2022 19:57:54 +0200
Message-Id: <20221203175808.859067-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
them to the qcs404_clks array. Add them to make these clocks usable to
platform devices.

Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
 include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 077875cf0d80..877ffda42ee9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -843,6 +843,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
+	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index c0ad624e930e..46309c9953b2 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -168,5 +168,7 @@
 #define RPM_SMD_MSS_CFG_AHB_CLK		122
 #define RPM_SMD_MSS_CFG_AHB_A_CLK		123
 #define RPM_SMD_BIMC_FREQ_LOG			124
+#define RPM_SMD_LN_BB_CLK_PIN			125
+#define RPM_SMD_LN_BB_A_CLK_PIN			126
 
 #endif
-- 
2.35.1

