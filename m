Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F8BC74A4B
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 21:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjCHVgK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 16:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjCHVfz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 16:35:55 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA279CBE2
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 13:35:47 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d36so19959101lfv.8
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 13:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwZMH96UXfkc0AccFCgdHWqtpm71+Gjc4i/Nm8NSEJg=;
        b=hXBEuXzGMdj72xSPbg/KZ0ZJ0aETajx9yHPyiwgOFt0X1hTP8zQd5MS0i2U5vFEwfH
         pPPAGpWf1GoL2gATieKsJ/f6RnWuWoSB05oiMl2XdIjnLSw6NFqKdb/tFR83zRtjPZry
         ayu0Y7ftEnndA1gN+kBzO+r9ThFsGWL2XiC7ylY3GhYup3b1CPA3SQTZujAX2+mwZzoJ
         vHhxLYUqJ+5kfO2DLCFPXLATsD+E1ZWoIETRgQ4w29wc4j8U9VkgshFBgs6nXYKiE/+1
         z++PKMsRMGHzzrYxFm0ZsYGBw1wElZt3rdh7FG7mb+zk7LYiOhFskqmSkbKpdzShS5gO
         Hs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwZMH96UXfkc0AccFCgdHWqtpm71+Gjc4i/Nm8NSEJg=;
        b=VjoPCbvFl3tl/zpdUpQJZBvq4dU+Dg1oHzkaAvHp6N5O+3XClXM4UqC1q4sBmN7i8+
         oHASaS4nPamVdU1y5DHUDpoU2gygQV+FFnHkzC+Rwj40k/d2hNqoa8JMlepRmD1vanI9
         fXiTk2y8ddH41ITB9G/gkc/BEYpKbEmLeWXbvfFJuzv20svIhPFJ2rq3FQCqPoVSykB+
         +fhu/U7Umo5UBBsC7ewvYjJJ4haNpOtDgXDfWMp+J02ZE3fYzVlecbTJonYLCmoVZgYn
         l0vf1VnkknlRNJuRfdoX1ujjm+Is4gy7yfzLACuTzTGqlQb5tA6206j0A+qq9DQMEUWC
         AncQ==
X-Gm-Message-State: AO0yUKWJaqEcgLKVY568wb1/2nM2zFwKcQRPg7ODELWcmL9VYQ/bdmUZ
        f6BSxGQZpVTiHz4AcgoBZjGdBA==
X-Google-Smtp-Source: AK7set8FAqtCPNeuGOFm27ULXeGksmc+9BuHiRhwbhDwx2j5p8KAmARp3lWBZD4m8ceHjrAfxOSShg==
X-Received: by 2002:a19:f00f:0:b0:4c0:91d0:e7ab with SMTP id p15-20020a19f00f000000b004c091d0e7abmr4595915lfc.28.1678311345559;
        Wed, 08 Mar 2023 13:35:45 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:45 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:22 +0100
Subject: [PATCH RFT v2 06/14] clk: qcom: smd-rpm: Make BI_TCXO_AO critical
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-6-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=1209;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TISC+Oc8V9fBm+Q+IBeIefGIjS6ebEWVyUTx7mIEAsw=;
 b=R+M8Tbyxgn5h+HC/KiEpepKUFCu2bNNp8TswNI/3zNht3TSAvrONTg5dU73dvGjmFn/8guhHpguL
 RBE7PiI7AhPCKKU6oJK30w2Zvsq0AjO1z03dGN3IB4jXAx9VGi8i
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should never let go of the active-only XO vote, as otherwise the
RPM may decide that there are no online users and it can be shut down,
resulting in a total, uncontrolled system collapse.

Guarantee this through adding the CLK_IS_CRITICAL flag.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fec6ae4a8989..9dc779360ada 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -450,7 +450,8 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.is_prepared	= clk_smd_rpm_is_enabled,
 };
 
-DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000, 0);
+/* Disabling BI_TCXO_AO could gate the root clock source of the entire system. */
+DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000, CLK_IS_CRITICAL);
 DEFINE_CLK_SMD_RPM_BRANCH(qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
 DEFINE_CLK_SMD_RPM_QDSS(qdss, QCOM_SMD_RPM_MISC_CLK, 1);
 DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1, 0);

-- 
2.39.2

