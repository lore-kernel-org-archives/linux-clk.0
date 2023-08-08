Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA3DC04A6A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbjHHRtD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjHHRsd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:48:33 -0400
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715A0B0A18
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:21:34 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so56750175e9.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511358; x=1692116158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFfvkly3ynKYhnloBAB5Bwm8QGvgmXjPSUsPPXMqNoQ=;
        b=zbwSf62Qix4RNcyKShHwT8rL1UaCr6LuCfDGjyHJOs/g2847Gb8EQQLjTpV+J/4M3e
         o+yOOy7C0XyPdjLTs1nqkepDOt3fad7MT+rWaT6Ix3SKdzpvvQUAT30i9w2TNKOv6Nme
         CwO3T8IrlmmPQ1c8GTVyykLmK8sa2mMoG66gMkumZt7GGrXDOs8LPQI79D0yhFor++L0
         dfkrYwvua98deNkZrMEMUm7hhG68lru0x9yHAmTmPsPsnUcC5mHHICSo5w8wDt4rjE16
         lEnqtGK+EY6vHVxTK22Vt6MiWBLHqC0CavommB2YAPIFVe6q+12FuZ/BYqdYh0glf5qu
         of6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511358; x=1692116158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFfvkly3ynKYhnloBAB5Bwm8QGvgmXjPSUsPPXMqNoQ=;
        b=WdoYaGVzITxAaH2depDFVl8RBAaSPuhFw4kANau8q6geGadDACEXAbe1DWCmeVJWi+
         +TBKLIIZC8KYpzzpSaU2UYx+CTkrasTaAW5Rd+nb/vGonC3rAuMVN5UH6dVDg8m8+cV7
         Z5WEwEY38vsEsBoohFsSj8a6FMI9azWga40HDGGxmStWj3qzBmb8iLp33DAS5uHpmbIn
         XUwF/Fd6hpSS3kCE8f6JHuUAH2ku3EkkGglz+o+ZDpPocY+m30zTAC/JuwtZpivoN42r
         tRCh3bpSLyJtMUq8TUlk7hUf2wIP0Kt2cTYnoR0RrT6qwNucjUDxvss0rb5tDEiHiTQx
         Tw5A==
X-Gm-Message-State: AOJu0Yys4F4luXq5fsKVMJ++lwE/Zi7pc1s7zHFfuz/oxUJ7dbg1wr/Q
        uwHZ5RFKL/Ui+misFrZ09/gX5GBc4kbW4tjD5hI=
X-Google-Smtp-Source: AGHT+IEx9WFWo3clO7Eu0C3jX65Z+oYsA6+ETiWsFoS588U+BcX6IShcpjIAbekFHeKVH5GDiJCa5A==
X-Received: by 2002:adf:e6cb:0:b0:314:1249:d5d7 with SMTP id y11-20020adfe6cb000000b003141249d5d7mr8311246wrm.16.1691483264463;
        Tue, 08 Aug 2023 01:27:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 01/11] clk: samsung: exynos3250: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:28 +0200
Message-Id: <20230808082738.122804-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore this number of clocks
should not be in the bindings, because otherwise we should not change
it.

Define number of clocks per each clock controller inside the driver
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos3250.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 6cc65ccf867c..a02461667664 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -100,6 +100,11 @@
 #define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
 #define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_MAIN				(CLK_SCLK_MMC2 + 1)
+#define CLKS_NR_DMC				(CLK_DIV_DMCD + 1)
+#define CLKS_NR_ISP				(CLK_SCLK_MPWM_ISP + 1)
+
 static const unsigned long exynos3250_cmu_clk_regs[] __initconst = {
 	SRC_LEFTBUS,
 	DIV_LEFTBUS,
@@ -807,7 +812,7 @@ static const struct samsung_cmu_info cmu_info __initconst = {
 	.nr_fixed_factor_clks	= ARRAY_SIZE(fixed_factor_clks),
 	.cpu_clks		= exynos3250_cpu_clks,
 	.nr_cpu_clks		= ARRAY_SIZE(exynos3250_cpu_clks),
-	.nr_clk_ids		= CLK_NR_CLKS,
+	.nr_clk_ids		= CLKS_NR_MAIN,
 	.clk_regs		= exynos3250_cmu_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(exynos3250_cmu_clk_regs),
 };
@@ -923,7 +928,7 @@ static const struct samsung_cmu_info dmc_cmu_info __initconst = {
 	.nr_mux_clks		= ARRAY_SIZE(dmc_mux_clks),
 	.div_clks		= dmc_div_clks,
 	.nr_div_clks		= ARRAY_SIZE(dmc_div_clks),
-	.nr_clk_ids		= NR_CLKS_DMC,
+	.nr_clk_ids		= CLKS_NR_DMC,
 	.clk_regs		= exynos3250_cmu_dmc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(exynos3250_cmu_dmc_clk_regs),
 };
@@ -1067,7 +1072,7 @@ static const struct samsung_cmu_info isp_cmu_info __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(isp_div_clks),
 	.gate_clks	= isp_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(isp_gate_clks),
-	.nr_clk_ids	= NR_CLKS_ISP,
+	.nr_clk_ids	= CLKS_NR_ISP,
 };
 
 static int __init exynos3250_cmu_isp_probe(struct platform_device *pdev)
-- 
2.34.1

