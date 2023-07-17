Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3601C001DF
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjGQPUP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjGQPTq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 11:19:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D130173A
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso7375646e87.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607167; x=1692199167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2B8xuxpSnWhbwKMqhSwKujiuUg9pN0gk3aNyNEAwhE=;
        b=eatRw8c4boyIvPhRaLxD5x7GbLwPJJdKgtqcudBmKAdJt+3WsAZKB38G0s6JoxepuQ
         1fiUEMRMTEFV1vib41dJVQP0cD0paZULlKEpDLB92OHcSDPBbuXp6WyAcETmaCcOagsP
         owYnk+Dx9Miu+jMEr8902UgaPz5k73GYoZ7pG9P2XWtQ/uS1Z38lCs3ouAqp9BRpyPry
         3WArdvrA+wp9YrmQztsJFI973HztM90xTT9sVX5/1Vq8OCI4OTiV3gEJQ7H95spvY+ZY
         J0eNkvk4CvPPt4bwmw5o8Z1zy94t/zZe6iK4luYmY4UISQ8nD3X2eV1lqjxuzewQm2ry
         ayxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607167; x=1692199167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2B8xuxpSnWhbwKMqhSwKujiuUg9pN0gk3aNyNEAwhE=;
        b=N57qEf5aRZHL1KUN4q70hEgShR12nfvOtkZGvaEgXbq3dZwq0X3mvAGGcZa2W9OAMG
         nSxlo1N38AnC9gtY4iO0mT97/Xpf63ijYARJWGwB8YNgnZUKaAHvfA5ybgmFXzSf8PKM
         zMlSsVcOzry/NCicsTNHcmqq76vvrWbxD30EQS6stbnG5IGJyzmboQGUOiLPaxKxvonK
         J8cD9rj52SJqRoLbFbpkerDzuSty41kwh+FFFCrfyjmC0vE80W2XFYBeu2MiFQLc8kLz
         OBh+5rOfY0iZjhH5GbQEu5dLLHVOt8WJ12dmZYPKqP1oAdFMp2t9fG1pFq8TMLE2e0A6
         x8Yg==
X-Gm-Message-State: ABy/qLbaZuBSMGw4UZ0vCFnA1Ke+FblV7gzMix7I4eBt1tgD9eEwIWlc
        LJeslDM5d/OFVFZ2ChRm8jqus89IegeJSAzY9JI1Zg==
X-Google-Smtp-Source: APBJJlHB3Bu3FGOXz02ywSPZuf438emMgo46bOSYRj1mEklm8d1Vtr4u/9AvxT1lJdyyybspIOgeGg==
X-Received: by 2002:ac2:5f7a:0:b0:4f8:6ea5:104b with SMTP id c26-20020ac25f7a000000b004f86ea5104bmr6981516lfc.30.1689607166903;
        Mon, 17 Jul 2023 08:19:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:18 +0200
Subject: [PATCH 11/15] clk: qcom: gcc-qcm2290: Add runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-11-27784d27a4f4@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=1980;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SEE5Vf2kJq6CXu3dBwAauLybj1NpUkl0+Tc5/vKK29A=;
 b=xpHotqpRsd1M6m6fXXG+MlRWzVc91b4BPgGLqLB6PoDcJtO6t4WTluXgb8iW4mKZN3lEG/wW6
 53LYl6aqR+mDtzTQEBZpmTgapcF2rbKk+1paoIbTctCdLj3Ur5Ddb2j
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GCC block on QCM2290 is mostly powered by the VDD_CX rail. We need
to ensure that it's enabled to prevent unwanted power collapse.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-qcm2290.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 1a8acc2de921..573cb550d678 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
@@ -2882,14 +2883,26 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	regmap = qcom_cc_map(pdev, &gcc_qcm2290_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
+	if (ret) {
+		pm_runtime_put(&pdev->dev);
 		return ret;
+	}
 
 	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
 	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
@@ -2912,7 +2925,10 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x36004);
 	qcom_branch_set_clk_en(regmap, 0x2b06c);
 
-	return qcom_cc_really_probe(pdev, &gcc_qcm2290_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gcc_qcm2290_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gcc_qcm2290_driver = {

-- 
2.41.0

