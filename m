Return-Path: <SRS0=ceW6=AO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0BBC433E4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 08:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ED09206DF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 08:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXKO0um9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGCIoh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jul 2020 04:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgGCIoh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jul 2020 04:44:37 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0811CC08C5C1
        for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2020 01:44:37 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r12so31739050wrj.13
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2020 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=heZQEJKtev2CQI/n8g2TDagbZY/W2wQcpaekNIFJuUs=;
        b=oXKO0um9JGJucUuqoRrg1eckGzmk9EiJkX406TycN89Cj+gQhG6pZ9pP008sY7A8t1
         v/qojMVeotxZeuYJEQFstqjC/OvSmt407kNmr/da5QgTyD3rwmTmrd8FADbEhoe+/UOY
         dNHBuUKODs3pLDUGY4Vp48ZfVPLPkQVSEGj6IGPlHb5kP8hVqA2fNh+jP/YqMHejb3XL
         bbzwrD9gO9OA7BEIB3xVQbzFNRZKurenj8rcroOt8WqBQQQ9/X4C0mkygLptNJDpbEf8
         A+MQ4EfNe/kiwYm53RMxJwc7C0+gsPJpuZkU7xTVvp1L9qneb/DYktjEsEG6sAMlijzN
         Y9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=heZQEJKtev2CQI/n8g2TDagbZY/W2wQcpaekNIFJuUs=;
        b=C93jAHhnFMFKCSECO5p7KNrchq8IlxfpKR5GvYO5jORNArvCFGJn38IrFryP2IlJO2
         dWmmrowRuon5g7yLiOAC2CZTtcMHDUU/ZO+NMH8KGO3Yup/kQHU4289PFFCUMc4PfFVZ
         /U+7Rf3qu2WX25UwIjGS57MzCtcm8hYocc7h0zNoCeP6yrj1N/VepNRuMT4PJl06CLNv
         TRXzDMX8R2FvZxXVtQSbiY62v7PnfEAFbLWCcFpZxUd6hW656Wvg38bAH7N1jrsykN9Q
         6o8mB+apcB8Y+29VFnGz1yo1T6N0OPakbdACb/sXOv2vA/nvGam+DXz72HY5gggR7xCA
         HatQ==
X-Gm-Message-State: AOAM530yjwIKAwZKwC+inLTnkn81d5EE7WALvb7tyMs1MFF8yEKAc34h
        dhmQ5uE/xIJAdfI0Nz2NoapYsQ==
X-Google-Smtp-Source: ABdhPJxUXl2heKO9gxro45V92Au16BctO9pymyBSwFNBucpMC8BSlU0pNeEX8JvgNI2nQJV2Hp9g3g==
X-Received: by 2002:adf:9524:: with SMTP id 33mr34155726wrs.156.1593765875740;
        Fri, 03 Jul 2020 01:44:35 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b18sm4213116wrs.46.2020.07.03.01.44.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jul 2020 01:44:35 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 4/5] arch: arm64: dts: msm8996: Rename speedbin node
Date:   Fri,  3 Jul 2020 10:49:44 +0200
Message-Id: <1593766185-16346-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The speedbin value blown in the efuse is used to determine is used to
determine the voltage and frequency value for different IPs, including
GPU, CPUs... So it's really not a gpu specific information.

This patch simply renames 'gpu_speed_bin' node to 'speedbin'.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286..2811b8c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -424,7 +424,7 @@
 				bits = <1 4>;
 			};
 
-			gpu_speed_bin: gpu_speed_bin@133 {
+			speedbin_efuse: speedbin@133 {
 				reg = <0x133 0x1>;
 				bits = <5 3>;
 			};
@@ -642,7 +642,7 @@
 			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
-			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cells = <&speedbin_efuse>;
 			nvmem-cell-names = "speed_bin";
 
 			qcom,gpu-quirk-two-pass-use-wfi;
-- 
2.7.4

