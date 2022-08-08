Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDE3C3F6B0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Aug 2022 18:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237137AbiHHSQD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Aug 2022 14:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243537AbiHHSQC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Aug 2022 14:16:02 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BFCB7DC
        for <linux-clk@vger.kernel.org>; Mon,  8 Aug 2022 11:16:00 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s11-20020a1cf20b000000b003a52a0945e8so3046091wmc.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Aug 2022 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=LxdWIrp6h2qjt0XVQVzdJXERuzfBADuhugCm++L0IwA=;
        b=N86YZZzuDnayOOaNi0efsePGXbiSOgAKze9kj85wpmPnFsUWscz6Lt4mKGpZ+r9z4Q
         r/p/F+B9TunZGM7AYbeUGvs29EYQCJleei5hT9/XacRD6Knr9jY5PkbaKy3OP0LdyRsU
         Pn+NZynHTpnAeV7gkSaxUGdZpthYL5Y0BNlgtWXVxZx3svBLFoSABI3DMbXE58c0v3tB
         +8wriagIXcoGQn/Grf3Vu4ga65fFlwxbji/Yo4/jFKGRA/XuCDmZMtb/7CyW5QfeV4Vg
         4auHyMeFrvYg2j9VFuKZgJB8Ha3Y+DZq1ZsJT1NE9OWhF6r+SF3DQhrFQL4Z2UdP81AV
         xpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=LxdWIrp6h2qjt0XVQVzdJXERuzfBADuhugCm++L0IwA=;
        b=fWfXChZ6fyJ0D0O/k7ZvDOgKpHzIxqURthBOao4I856z2pwLlPP7y5nRvzML7l/vG5
         wrVs9zyDQ8j1XdA7k3cD73LciCIewg7rQnUfPCmqNOoe523Oss00Sd9590fcZbGKqXhR
         NkhyEwVqeu8LiaP6weHfWrkqhHEeHNIfnfzerCPGcJXpQ23sBNlgTIu9sulZFR7DrM2M
         7z7GMDVnR3QgDLjPF8rEXS2WGIlRdFMyJvDXUJMUM2C7AhSK0qC6CE/8r9oM8hYWTT1F
         /7Sl14lfk5vCeEPf1ftCFs/Xs2prqWQp3cD6aXxGG9CuuuGiWtaDB9d46qiVkM5kx3k6
         SOnA==
X-Gm-Message-State: ACgBeo1mMn0btwYWsH9qYaC7Vd6cHXqBJmPoaDkLpqhw80pI0OVY/7nJ
        20f8ljKOGIzfvamFnk/ORYG2Fw==
X-Google-Smtp-Source: AA6agR7762jwygrYknaBhp5g+DOZxc8wyUU/dys/HAGUHbSlGQMGaOy9oH6+cmlbhZmUTQG4Hw7sWg==
X-Received: by 2002:a05:600c:1c19:b0:3a5:51aa:d041 with SMTP id j25-20020a05600c1c1900b003a551aad041mr444559wms.172.1659982560243;
        Mon, 08 Aug 2022 11:16:00 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c5-20020adfe705000000b0021f1522c93bsm14273227wrm.45.2022.08.08.11.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:15:59 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: Add bindings for Exynos850 CMU_IS
Date:   Mon,  8 Aug 2022 21:15:59 +0300
Message-Id: <20220808181559.10438-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CMU_IS generates CSIS, IPP, ITP, VRA and GDC clocks for BLK_IS. Add
clock indices and bindings documentation for CMU_IS domain.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 25 ++++++++++++
 include/dt-bindings/clock/exynos850.h         | 40 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 523fdfaae891..c9f78ae7a9fa 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -38,6 +38,7 @@ properties:
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
+      - samsung,exynos850-cmu-is
       - samsung,exynos850-cmu-peri
 
   clocks:
@@ -191,6 +192,30 @@ allOf:
             - const: dout_hsi_mmc_card
             - const: dout_hsi_usb20drd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-is
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_IS bus clock (from CMU_TOP)
+            - description: Image Texture Processing core clock (from CMU_TOP)
+            - description: Visual Recognition Accelerator clock (from CMU_TOP)
+            - description: Geometric Distortion Correction clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_is_bus
+            - const: dout_is_itp
+            - const: dout_is_vra
+            - const: dout_is_gdc
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 3dc55d4e5b9e..f8bf26f118c1 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -61,7 +61,19 @@
 #define CLK_MOUT_AUD			49
 #define CLK_GOUT_AUD			50
 #define CLK_DOUT_AUD			51
-#define TOP_NR_CLK			52
+#define CLK_MOUT_IS_BUS			52
+#define CLK_MOUT_IS_ITP			53
+#define CLK_MOUT_IS_VRA			54
+#define CLK_MOUT_IS_GDC			55
+#define CLK_GOUT_IS_BUS			56
+#define CLK_GOUT_IS_ITP			57
+#define CLK_GOUT_IS_VRA			58
+#define CLK_GOUT_IS_GDC			59
+#define CLK_DOUT_IS_BUS			60
+#define CLK_DOUT_IS_ITP			61
+#define CLK_DOUT_IS_VRA			62
+#define CLK_DOUT_IS_GDC			63
+#define TOP_NR_CLK			64
 
 /* CMU_APM */
 #define CLK_RCO_I3C_PMIC		1
@@ -187,6 +199,32 @@
 #define CLK_GOUT_SYSREG_HSI_PCLK	13
 #define HSI_NR_CLK			14
 
+/* CMU_IS */
+#define CLK_MOUT_IS_BUS_USER		1
+#define CLK_MOUT_IS_ITP_USER		2
+#define CLK_MOUT_IS_VRA_USER		3
+#define CLK_MOUT_IS_GDC_USER		4
+#define CLK_DOUT_IS_BUSP		5
+#define CLK_GOUT_IS_CMU_IS_PCLK		6
+#define CLK_GOUT_IS_CSIS0_ACLK		7
+#define CLK_GOUT_IS_CSIS1_ACLK		8
+#define CLK_GOUT_IS_CSIS2_ACLK		9
+#define CLK_GOUT_IS_TZPC_PCLK		10
+#define CLK_GOUT_IS_CSIS_DMA_CLK	11
+#define CLK_GOUT_IS_GDC_CLK		12
+#define CLK_GOUT_IS_IPP_CLK		13
+#define CLK_GOUT_IS_ITP_CLK		14
+#define CLK_GOUT_IS_MCSC_CLK		15
+#define CLK_GOUT_IS_VRA_CLK		16
+#define CLK_GOUT_IS_PPMU_IS0_ACLK	17
+#define CLK_GOUT_IS_PPMU_IS0_PCLK	18
+#define CLK_GOUT_IS_PPMU_IS1_ACLK	19
+#define CLK_GOUT_IS_PPMU_IS1_PCLK	20
+#define CLK_GOUT_IS_SYSMMU_IS0_CLK	21
+#define CLK_GOUT_IS_SYSMMU_IS1_CLK	22
+#define CLK_GOUT_IS_SYSREG_PCLK		23
+#define IS_NR_CLK			24
+
 /* CMU_PERI */
 #define CLK_MOUT_PERI_BUS_USER		1
 #define CLK_MOUT_PERI_UART_USER		2
-- 
2.30.2

