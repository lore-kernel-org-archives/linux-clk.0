Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6301C41513
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjHHROL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbjHHRNQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:13:16 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228226BD2B
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:05:37 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe5695b180so23531245e9.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510733; x=1692115533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MmEGhsWcyV2tJiWGbgG48WJpgMlPeUsMr9lr8DHG50=;
        b=c2JGRXwEzHBl84rj1VDI9swRoIe/vIubUbUHWjVzdw8RwEB/UOgmAfhdiug/YSA7C0
         Dwk4x5RjkHyJm3ajWOckud6iSF/cJ+jBNTuRvuxjDhiC9yGEYOLQKTkZVYI3i0IkAp3h
         qzkXx0v8l/OlkFq8QJoQjWV2pcUBUItWu22oC8SUdldKoULBafahuS0shIm1TlywWa9L
         w/UaGzk/saqG0yR4HpeBJ+NeO1FAOQsrHxmhnSbL8Rgkv5ez51L1AhGhKbYBfpHSKxlE
         pkR3f1GwzrhPcgRPzftYtN2JDR6AUdOdMmSAEBDlrLKUD7E3wm0UMkEdp5zGNsIRIfEC
         qpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510733; x=1692115533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MmEGhsWcyV2tJiWGbgG48WJpgMlPeUsMr9lr8DHG50=;
        b=TQezopx+hXtPbcwEG7A3wrXm0GA4rjqSuirU8ke7LtuPqHyp8QSuyV2jdGoUeJ7JnW
         ZfoiD0OuNKebbr7LeNzToDxHAyC4bBKqO+W9jq65ViOYLG6tqP+IufP4cV2rPsCYFSUt
         fKN5u2VPxDRYhDShkG8Z6oCrA5yLjGYJGxNaApAn168LVw/o6QQdB0K3XnL2JWvLkyF+
         68M+cjXWFolWPZ8U06k1PQOhwDcuu42W/ThSVCWXfYzckIKRVjxj1K3TJLPkLVdbY5Om
         LqsLAt0lsAxGU/yDgkYqatuyiXNGMWR5P5KUCZjqiQ0KMHTq1xihWB/1uNlGVz864E4V
         WAuQ==
X-Gm-Message-State: AOJu0YxWQLK6oQ2dxhqESjBHUjqoAI4QkceeS4O/4HPQkujozwP/bv6I
        i6Dm1izLxk4W2IUEGiM6mBeyHtaWVDhRY5kSAGU=
X-Google-Smtp-Source: AGHT+IHKz5Zsyb9uLFLG9UFYYyG8FqN+IRe8yffZvnZAPP1i84HeUdZsdHqQNw+tO7uYnme50hdlgw==
X-Received: by 2002:a5d:5253:0:b0:317:cff4:7357 with SMTP id k19-20020a5d5253000000b00317cff47357mr7262024wrc.20.1691483266358;
        Tue, 08 Aug 2023 01:27:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:45 -0700 (PDT)
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
Subject: [PATCH 02/11] clk: samsung: exynos4: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:29 +0200
Message-Id: <20230808082738.122804-3-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos4.c        | 5 ++++-
 drivers/clk/samsung/clk-exynos4412-isp.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 43207257a9cc..4ec41221e68f 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -135,6 +135,9 @@
 #define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
 #define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR					(CLK_DIV_CORE2 + 1)
+
 /* the exynos4 soc type */
 enum exynos4_soc {
 	EXYNOS4210,
@@ -1275,7 +1278,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
 
-	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLKS_NR);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos4_fixed_rate_ext_clks,
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 1470c15e95da..a70c2b06a61a 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -22,6 +22,9 @@
 #define E4X12_GATE_ISP0		0x0800
 #define E4X12_GATE_ISP1		0x0804
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_ISP		(CLK_ISP_DIV_MCUISP1 + 1)
+
 /*
  * Support for CMU save/restore across system suspends
  */
@@ -121,7 +124,7 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 	if (!exynos4x12_save_isp)
 		return -ENOMEM;
 
-	ctx = samsung_clk_init(dev, reg_base, CLK_NR_ISP_CLKS);
+	ctx = samsung_clk_init(dev, reg_base, CLKS_NR_ISP);
 
 	platform_set_drvdata(pdev, ctx);
 
-- 
2.34.1

