Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F53C46467
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238119AbjACO42 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238046AbjACOzr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:47 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C622612608
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:38 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id q2so32081600ljp.6
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ecG01MseYDGzxuYzsAOlgatMWjsrGPZZ+HmBBVoTDM=;
        b=H1h+9lzpC+AeRXC+ftcpfCGaFs+iH+C4LM2HZgJMl0R+fJQ85vqi/CrvSa9WqyCf13
         gONL5lQ6OoYifbMI6nIamb0Ug7Ve9mPL8R6QwIyL1Jo9SKKh1APB8QVG9Xx9jDYZRI/q
         ZlRwDR/3bhrPiCgidlyQu7RyIq5Fq3GY9eE9TQDjJfLBWH/xU25MpnbvQIoLu852WFFK
         C/LLaSJ9ZteAB9I9CZuZYt2wu+G2rJIG0rrNW1i1HnOWcyTE5Joc6E70aPaIGtR7St4n
         rt2ZwhHtLV8Fn/Woq/rS5g3DiJf9H+qmeWp9uq06D2lpqAJOJ0J4nw+V9UatuaN8jl9T
         qZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ecG01MseYDGzxuYzsAOlgatMWjsrGPZZ+HmBBVoTDM=;
        b=dEjmpPVo5rTWFN7iqG95ja817fkbm0QrmS7sPhTVi3kc+MjKm9HDI954oWgL+YIRw2
         mKio7HFdSQ4wO7p/KG69HI3r5TOUCLTR9TOURV1BjyZAioH8REIjNHEjsBVm5fGM7VKf
         TCX1Md966FRG46jaaWQAt7BmoMJdMHnEqZXri3Ftq86M+d3SM9VQXU1gHDB66GM5ASCq
         uRHlepoJ6NJWXnevrJ7F790L7ZJFDAVmFK41QXpHxIC4Fz9LmUEGGaPJ52aELsMLOKXt
         tp+SA/R0StAOkCj0LgRmeKCo7fx9MtKcZn2Q5TmYaVEyMyZ17bk2yISb5pqo5tWojEzH
         4hXw==
X-Gm-Message-State: AFqh2koOA0x/DEB+6tl7+4RWy2H3D17sL50QWxyf0/Elsu6gE4c67Q1Z
        +/yFlf0mJhO0C0dCYOYCMTVkHw==
X-Google-Smtp-Source: AMrXdXtgeLOw7R4XDMjsTCZvYGAaoiffPqHVYpyrr8md29sczIZIiqvuqxV9KMa+G1+fc/LB+HJnkw==
X-Received: by 2002:a2e:780f:0:b0:27f:bd6b:9dbb with SMTP id t15-20020a2e780f000000b0027fbd6b9dbbmr8502279ljc.23.1672757737160;
        Tue, 03 Jan 2023 06:55:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 20/21] clk: qcom: lpasscc-sc7280: switch to devm_pm_runtime_enable
Date:   Tue,  3 Jan 2023 16:55:14 +0200
Message-Id: <20230103145515.1164020-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using the devm_pm_runtime_enable() instead of hand-coding
corresponding action to call pm_runtime_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/lpasscc-sc7280.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sc7280.c b/drivers/clk/qcom/lpasscc-sc7280.c
index 5c1e17bd0d76..48432010ce24 100644
--- a/drivers/clk/qcom/lpasscc-sc7280.c
+++ b/drivers/clk/qcom/lpasscc-sc7280.c
@@ -107,10 +107,13 @@ static int lpass_cc_sc7280_probe(struct platform_device *pdev)
 	const struct qcom_cc_desc *desc;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = pm_clk_create(&pdev->dev);
 	if (ret)
-		goto disable_pm_runtime;
+		return ret;
 
 	ret = pm_clk_add(&pdev->dev, "iface");
 	if (ret < 0) {
@@ -137,9 +140,6 @@ static int lpass_cc_sc7280_probe(struct platform_device *pdev)
 destroy_pm_clk:
 	pm_clk_destroy(&pdev->dev);
 
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
 	return ret;
 }
 
-- 
2.39.0

