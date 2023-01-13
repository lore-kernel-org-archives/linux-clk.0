Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DF2C54EBD
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 12:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241200AbjAMMNA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 07:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbjAMML5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 07:11:57 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6898F6403
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:45 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so32813621lfb.13
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRgpyNZCiNK2oXTfGshioMNKAIlSBJK8yHdZdNBFUDg=;
        b=aoSjh2COawFwiwBbo0LtMpdLFZPDkhiPLt2JAas3Daz8GvO+W1UNtM6feIifCHJL0R
         L6cjZlV6SqdbEgMxkgD6mxUtIzrAPm4Z1wkCkHY5ZAreTAkEgt11fZTPyiRL35CDvpbG
         8Eaxj4Vl/858uxh1f1ydEQghiZiwYsWy5HPoSaAS/wr2EUV+uJ8gmhnXx9lD/cvO2OXK
         WQU7mBkS6yIry0IIDtwLD4HF1g6CZH7yexnijOZdZ8Frr+4KqlW9/Wi9UkImPqerViaS
         rg4wzc/bwLEpKu9A2HD60cim3jGcElqKJcbBkRFkDAuXZziLDARNrGIpTplkIAP+zhuD
         J/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRgpyNZCiNK2oXTfGshioMNKAIlSBJK8yHdZdNBFUDg=;
        b=ErUDD22iJAhtWrhdtSzlbH2Gdk1XajZZ4hQtqaPEOBBT3UDjekkuyei/DP3inYb2NJ
         6LXEqaa73xjqc9/KFxP/kYfjHDGeMYuSmVDshE5RFGId+ZJh/fPxnH+UCxVQg6Vo9eS/
         3Hukm+b1idzUMQXGV4KlXnqk4S8V2dUEDtaT9PX45xHmW2e10/REaGC2uKaU+Bn147VY
         r79j9iBroaMnankfNNBzdSbN6cR39DUJb/XAuvVmdxUM1shIc7WJ5oDm9ats0HtMEPhZ
         Qht/Y70PanDSZ1rWEt4hRlXJLHB032YsXVesKyoHwqefIeNQ+RcB0U9MRAEjQNiwnMaK
         yHwA==
X-Gm-Message-State: AFqh2koP1tGbo0Q1SdWXz+tTvqpqr+W+63DVN74IEQhb9p6C5n6vlPOJ
        Kr5Ka1RlYDxgBisXH9FpnR3FAw==
X-Google-Smtp-Source: AMrXdXvxxlLoW2b+XCQojEFe220iqcZDT2wD+GZzrCLDY5PHn/tOBN8mO9AgiQK07M0g8zEkKH5SIg==
X-Received: by 2002:a05:6512:ac8:b0:4b5:b06d:4300 with SMTP id n8-20020a0565120ac800b004b5b06d4300mr25095169lfu.29.1673611604983;
        Fri, 13 Jan 2023 04:06:44 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:44 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v3 04/14] clk: qcom: cpu-8996: fix the init clock rate
Date:   Fri, 13 Jan 2023 14:05:34 +0200
Message-Id: <20230113120544.59320-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Current multiplier (60) results in CPU getting the rate which is
unlisted in the CPU frequency tables (60 * 19.2 = 1152 MHz). This
results in warnings from the cpufreq during startup.

Change PLL programming (l = 54) to init CPU clocks to start with the
frequency of 54 * 19.2 = 1036.8 MHz which is supported by both power and
performance clusters from all speed bins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ed8cb558e1aa..d51965fda56d 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 /* PLLs */
 
 static const struct alpha_pll_config hfpll_config = {
-	.l = 60,
+	.l = 54,
 	.config_ctl_val = 0x200d4828,
 	.config_ctl_hi_val = 0x006,
 	.test_ctl_val = 0x1c000000,
-- 
2.39.0

