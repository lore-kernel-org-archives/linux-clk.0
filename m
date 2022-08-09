Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820CCC3F6B0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Aug 2022 11:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241422AbiHILeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242304AbiHILdn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Aug 2022 07:33:43 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D9E23BFF
        for <linux-clk@vger.kernel.org>; Tue,  9 Aug 2022 04:33:36 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id s11so14659519edd.13
        for <linux-clk@vger.kernel.org>; Tue, 09 Aug 2022 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=n6qNQi81m9yg/Cs+Cpwdc5df9do9WaGi0LszgwIrQWc=;
        b=iOiJlE9YdItZeFO9p33PyLYy9N69dakxqVEtOax8gFE3QUjCyNOYhc6a+LL/Btr8nP
         9pNGR9ajJsDJzm4nIpauii/ZXrUz2jAui4VgKkLBgv1PoWsIksv0AABWGca2OPnDmZUs
         J1cTWE6JStzmpfqL8aWpuIHVgCMQNoZxefebaMqxqTO8bYTlC5lTm2HL/hpXOtufFaxV
         hnYa6AFDYn9qU7hZoYd2LTIUECA6sQmm0wPOog2bksyjokufd+ufwvBSpbeNHcDAVbCF
         wnwGshNsoqlrYB3qZIbVz8Y/SYFXqu7DUB5xoZwx4tF1+th5CYclGFHObzybMLMjpoCo
         24XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=n6qNQi81m9yg/Cs+Cpwdc5df9do9WaGi0LszgwIrQWc=;
        b=V90VslPuiPOcc4FimPzTefZeR4ICotBaPrFKI6AzjJMSYxCwC76/ZfPtiJTvRJfSMi
         4cZ/IbTFIhOeAhNAyOEosVh8EK4u6extV9AAs7pNcjEH4uqYEC5RyQT6gTNQCdvOAIux
         zkBb5fLmHhebj+y6rAJAA4veOOScV43DYxC5dR+5j6/J1uRmAroc+Rwj0LQ1OkDarGQc
         OWicP4nzS1bT7TSmR6H4iIJCYw0GwE49mbofSqLe0AxCmM3sJ/cFfs+Lr0TIfbRHTDr3
         4Y8ieTg2H6A2AuuZzM/XFAL2lrEp3W6f0YfABuyo2WbBYdc+JnDsVNp9qcm3Q0krYRk+
         GrYg==
X-Gm-Message-State: ACgBeo2RVUrLD+44+zD7XxXoQjwbO+V3sXwlLEoGkS/gF2k/+5OrJ7yB
        yfqqLiMtvnoT4U2nS2FnzHVfog==
X-Google-Smtp-Source: AA6agR7DGOzsxNh0JKoD1OB6bEOw0vothcqIwnVEetS6QWrYfV8zli1LhpR6Q1xGgZrleGiSGFP3lQ==
X-Received: by 2002:a05:6402:1492:b0:43d:7b8c:486e with SMTP id e18-20020a056402149200b0043d7b8c486emr22174841edv.367.1660044815190;
        Tue, 09 Aug 2022 04:33:35 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j25-20020a1709066dd900b0073132fa9393sm1030664ejt.65.2022.08.09.04.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:33:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: dts: exynos: Add SysMMU nodes for Exynos850
Date:   Tue,  9 Aug 2022 14:33:23 +0300
Message-Id: <20220809113323.29965-10-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809113323.29965-1-semen.protsenko@linaro.org>
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add all SysMMU nodes to Exynos850 SoC device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Sorted sysmmu nodes by unit address

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
2.30.2

