Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C616CDB482
	for <linux-clk@archiver.kernel.org>; Mon, 16 Oct 2023 08:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjJPIoH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Oct 2023 04:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjJPIoG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Oct 2023 04:44:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00989B
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso6387051a12.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445843; x=1698050643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6dRIr7OBjT8dKVceu+0z45PUl9k0elfoXVmV3iWMc0=;
        b=EgrnO3QIC49K8jiVpylqVIiAcQ3jhzjaVlV6Cpb7S/taAsMordc8/uHMCwLAEf3znJ
         YQAygBiFgB2KF9/C02bQttoTePOuzU+1DKbl/AkkOcxlJhh5SsScNrl8cxxrSKhw9ycJ
         1OfKWAkwRqgc/+eLVwOJ2liEm64Uk/p1tn9EpIkKFV9Rnmob0NuVOnyKTpl4p8a8F7Q6
         IsOApc7WedDjk/HcYDOBEXWo/ewdMfJaC99KzBRBoQ58Op3jKXI24WtUyYhFKFRCMd1O
         EevAaIiCIHTMeZkQTsasNSh4MSKi2O72k67BtEQM2VVKwnCHe7AJYVNsZYcprhtQbxdU
         XABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445843; x=1698050643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6dRIr7OBjT8dKVceu+0z45PUl9k0elfoXVmV3iWMc0=;
        b=wpzPD/z3z6CQ6i4gAxU44d1RUdST17XoP+EkJrCw2vf4vL4iaJPlk801SbEyAvPSBl
         S/KhpclcCMLmRnJpi+aHFa8de6L8noW57CYiLjj/KoQ0SNCCLRAO2Atb+B9S6iqvrnjR
         NpJJvUj1yt4QunA1007tvS3h0RvajYFcP92b/Pm67IJx4TEQYGVIHt4YZDZ43eePv4Ni
         UTIG992z58vFWDYVaxwSP3Ee3mD0YoVngX5Y3TFPJpAufC4Q1wets2sReC7IxcXI6kXC
         cU3YQhaX8D2Gb4KvqT3Onc09V2yin02dI5eziW9ekErSHQ9abqhXvPU7pdjDpk/+cxpK
         akNg==
X-Gm-Message-State: AOJu0YwHhvc92u2WdT94rPS26WmURLS58YyjwrJh2VabQwV7DhZUXD1X
        6/d4RYRfUBrN88divGJYzy4Sjg==
X-Google-Smtp-Source: AGHT+IE7QxRS5JEN3oMPpnmVmDGJPtO59JOddu2/BNlZxz2blgyWTl7CmodjcX7f1Qg4p9uzjihOcg==
X-Received: by 2002:a50:c351:0:b0:53e:1434:25c2 with SMTP id q17-20020a50c351000000b0053e143425c2mr8735683edb.6.1697445843394;
        Mon, 16 Oct 2023 01:44:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (i68975BB5.versanet.de. [104.151.91.181])
        by smtp.gmail.com with ESMTPSA id l18-20020a056402029200b0053443c8fd90sm15021814edv.24.2023.10.16.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:44:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 1/2] clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
Date:   Mon, 16 Oct 2023 11:43:55 +0300
Message-ID: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
function to configure the PLL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8550.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 775e0b931923..420dcb27b47d 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -39,8 +39,7 @@ static const struct pll_vco lucid_ole_vco[] = {
 };
 
 static const struct alpha_pll_config gpu_cc_pll0_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x4444000d,
+	.l = 0x0d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -71,8 +70,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 };
 
 static const struct alpha_pll_config gpu_cc_pll1_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x44440016,
+	.l = 0x16,
 	.alpha = 0xeaaa,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -574,8 +572,8 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
 	/*
 	 * Keep clocks always enabled:
-- 
2.42.0

