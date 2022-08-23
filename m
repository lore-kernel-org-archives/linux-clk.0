Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC398C32774
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 07:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbiHWHaQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240978AbiHWHaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 03:30:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B021D61D9D
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:30:12 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id l21so12704619ljj.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=31EpOHbl+nrYiysahic+51blRSoZd90XSQRkgmuZH8Q=;
        b=L3txLJbzNASJ23txY0RNdj71aCCiDk/ZgPs0vd6IuBr9Jv6qjFsL+DguB2evwx37e7
         qo4/+MYuYGWPNLgSL57Rm2eeWZ0HZ679AAcpgNEiFasaUq9yWOO1vzzYHiv66AA+BpOR
         q3iJj0TRj0U6/9X3QnNeitZxTTQebAAcJncBbhkUsEraYO3eM+aSY59qlihVBwx5nzOk
         94AX7APlauoQ9znqABTxQg9Mzq4dUkgFtJPUmGf9CWyI/yxlEgcUxsz7IB/MJMoz6HFj
         /mKsPjjmnBKxWQr7rHvftyc/piBxizSgIumInoNChwp9dy3mD42mvjbK8o5G6lpeATl2
         UL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=31EpOHbl+nrYiysahic+51blRSoZd90XSQRkgmuZH8Q=;
        b=n3nQ+c+9u+m4R+7mUi26v2AgEdG1mh7fQ3WVjErCmj6CNJFd4rSS2inG5RVG/XxrYa
         G2lh+arkJM4W/Ndhz5u4IUEmMzb5vPNJ+t5/6PyQwV7b8yMQBb5Zb+2AKRwZFLeDWCgR
         3/R8yKkP6D2WonZHG2M0fDEtggP1vx9Zp5wxtrG673RLpK5/qb0efC1B69CtffxM+Tn3
         3d8KDKo3vPQtp7UUMb2s2vlOJpLrK4aRTwMKsdih4EbocR3KqQkJjykCgSnVFRMhecX3
         bu89MYCy4tduRR1kSvbfwbn+P1VuU+tXINYYG/1zpWEbp+y4Buh11ai/L/UeyUzrN19x
         37og==
X-Gm-Message-State: ACgBeo0mWMsgxoYZL/SRDttsBK9C+vKr6lQY+TeN8k+36zIFGklsZXqn
        YwmayBMhwbabJMLtaJNf372YNLLIGiiWA119
X-Google-Smtp-Source: AA6agR7UsstB+zMX2Ji4pK97oKYfHBo72sTQaY6/pQpWOeEaDcMW0YiVsuF5zXcBH40oxBMg2GQp0A==
X-Received: by 2002:a2e:a593:0:b0:25f:e6ac:c28e with SMTP id m19-20020a2ea593000000b0025fe6acc28emr7003949ljp.485.1661239811099;
        Tue, 23 Aug 2022 00:30:11 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0048a7ef09b22sm2361230lfr.274.2022.08.23.00.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:30:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos: Add SysMMU nodes for Exynos850
Date:   Tue, 23 Aug 2022 10:30:06 +0300
Message-Id: <20220823073006.358764-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Sam Protsenko <semen.protsenko@linaro.org>

Add all SysMMU nodes to Exynos850 SoC device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20220809113323.29965-10-semen.protsenko@linaro.org
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8e78b50416d8..c61441f3a89a 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -503,6 +503,51 @@ i2c_6: i2c@13890000 {
 			status = "disabled";
 		};
 
+		sysmmu_mfcmscl: sysmmu@12c50000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12c50000 0x9000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_mfcmscl CLK_GOUT_MFCMSCL_SYSMMU_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpu: sysmmu@130c0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x130c0000 0x9000>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SMMU_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_is0: sysmmu@14550000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14550000 0x9000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_is CLK_GOUT_IS_SYSMMU_IS0_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_is1: sysmmu@14570000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14570000 0x9000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_is CLK_GOUT_IS_SYSMMU_IS1_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_aud: sysmmu@14850000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14850000 0x9000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_aud CLK_GOUT_AUD_SYSMMU_CLK>;
+			#iommu-cells = <0>;
+		};
+
 		sysreg_peri: syscon@10020000 {
 			compatible = "samsung,exynos850-sysreg", "syscon";
 			reg = <0x10020000 0x10000>;
-- 
2.34.1

