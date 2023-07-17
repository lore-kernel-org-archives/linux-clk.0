Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C0EC001B0
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 15:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbjGQPTg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjGQPT0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 11:19:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255C81707
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fba03becc6so7243773e87.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607161; x=1692199161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMKrJ+Fk4SISACAyctqyw3SjO2t5kFSsy8Yfv02loX8=;
        b=RqxDhYpfvoCzAEVPA/XfFz4Yj2XoYRbXw/ikb6oRAJHAyu97uTgSQM+m3cnHotVkO8
         qkfIVfY88p8BmuR4kk3RSnzmLcST8kGoob5ONg+DEirIzzvIYiR+CISYz4FlQY8Nx8wN
         3XBeuAVwuiwkfH6QXZWCxvLi/60axTtaz16ocDpHicCCES9GxuBsdgraVrR6R0BzANTR
         QuRRA6Ym7XQyiTjCLG1u1p1MgtDC/XLY9w2X5xISHCohx12qDUyN6//sQoHBinCcQ+W2
         9Jec7/j8sJ0uH0UQK/IXhlwjiTNJcGmC9yY+H7baPIJazLWOTcna7nk5XI9q9+AcPu51
         yOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607161; x=1692199161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMKrJ+Fk4SISACAyctqyw3SjO2t5kFSsy8Yfv02loX8=;
        b=NoQcNYaxuwZv51KUsivYWv48849kWZJzEz6Nf9vJMzaTqHNTp+zP3AnU384IonI/qg
         WN/+oS0cOsVVHisEOzJmt4d/019FesMfU0XdedANAHyw5QBlUhe7EF06EgNDFDGUuz+1
         UCcSbeUAFSBOP8t4kjR0o4UEgn+fcUMEiGl03cuNDqRpyCAA2Re2/mV9tkdv6zradYcT
         AZevKQntoGg4bfd8wKZuLHS7aHuJShAvhrgh6zjs3ELjdiV7tZ0mDFWyz3/HGUqP2M+l
         K8vhm41+FiZ/EEoP927TkTAD/eGd5iKc6MDy28uPnb9Gfqq0YdJq7xN5Snji3EPDataj
         15lQ==
X-Gm-Message-State: ABy/qLbMVIuM1/QYZgAWgAAnVTAOFBQoWa+avK0F4IIWGirBNZ1ie10Y
        4Mp2BTkHqRDHwnhgIB/wZ61TcA==
X-Google-Smtp-Source: APBJJlG++7NuAEQxDu49Vn+Nykws1uHCn32O1LQmGz0BZxsDEHHKL2HPyVsUmA6eonFtGzvvpmV7aA==
X-Received: by 2002:a19:650f:0:b0:4fb:8938:48ab with SMTP id z15-20020a19650f000000b004fb893848abmr3518295lfb.16.1689607161341;
        Mon, 17 Jul 2023 08:19:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:20 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:14 +0200
Subject: [PATCH 07/15] clk: qcom: gpucc-sm6115: Add runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-7-27784d27a4f4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=1880;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o/nBQFsy6m0Ejq8unCaPVPl+lPMZHWnHPCCx0UDdlsM=;
 b=6zENJRt1rnQwS88lMzbUfG17CjAcgwstRaXd3IyR0lKxmh6OaPAnukiieoNDlxIsTo7z2zi1s
 xIgjDV6A7OEDC2l4rappuf9sWVqtBlURpfgAH5TdeStkzgLuFos71Pu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPU_CC block on SM6115 is powered by the VDD_CX rail. We need to
ensure that it's enabled to prevent unwanted power collapse.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6115.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index ac048f7973d0..6fb84492d292 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -442,10 +443,21 @@ MODULE_DEVICE_TABLE(of, gpu_cc_sm6115_match_table);
 static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
@@ -465,7 +477,10 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1078);
 	qcom_branch_set_clk_en(regmap, 0x1060);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gpu_cc_sm6115_driver = {

-- 
2.41.0

