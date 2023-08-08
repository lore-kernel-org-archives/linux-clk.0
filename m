Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52E3C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 15:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjHHP5y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 11:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjHHP4U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 11:56:20 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220325B98
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:43:49 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so30928715e9.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509421; x=1692114221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZH8BihJHBp/DZtT1lzAgFgSWlR+gykQRY/CxVLX/NQ=;
        b=oz5i2XuKHlo+sUB4WGkQ1oNxKocfFJGy0bXRnTxKMRWUXcM4/CU9eUXHUKIVrBEZpt
         MQrnKjjLzaUC8a0FlRgoHxpPebpdfMNlTN/UhOkKM0KGxYFUZQe8qnmZmb5BRVablF3l
         K4Y/Am+Atqr5l7B4ZKrK7xuZpGYovdj1PVFxWc7aW8954Gj70pa2CZUzbbfQVG5d+awn
         fbI9IVGLgsiY/pAyGTQ3l4s3rk+gHhXL673xVFqR5Gd+9JJOl0uMh8q4fZtorJWByZma
         N1qhIE0Uq12J1f2LL4A+YJv7TGAyCzGhH2ZGg4DOkcgYNN998sEq3LEO9vmiNuQSIoP+
         amUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509421; x=1692114221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZH8BihJHBp/DZtT1lzAgFgSWlR+gykQRY/CxVLX/NQ=;
        b=fiq3drEme5yWmHieo4UpdOA4rVie63/tftzsHl1AqMeRaiVo04dRolVHHQa00n0yED
         RAK6GZgGTK1Y3t58notaP9cqvaHX7N0Ppy6y1o5G92e1QAu9HdUklRgk5FOVVUf62FM1
         PFtjbRdr5XSU+WX+4a/M28uAHXMqhk47cy9dhBXseKcohTHjnlbrdKydFepJ0P9tr00U
         V3MrCcWpyNmJouWKVk+JlBbTRKFoDCTlOCHWA4JN8cNLew5xvuUDxTyEX+plo8Hhb4IY
         vAYen/73OQTdEha90tzU0nkbw3VzkZ+FsNE+8GSGpjAJTSg0lKQctKd3czJY/F4zryPH
         jpUQ==
X-Gm-Message-State: AOJu0YzhGpJXLT9+9zNCTJ/ltux9DIpqwg0me4iqwKjbpAharU3mJwIU
        z1VzCIdVskVZHB6iHqvTgFw9M/QlCIMGwxmeaaY=
X-Google-Smtp-Source: AGHT+IHxIGUFAD12lJphQeKsQdF3PxwsoN29JQ5BiG4xlGacb03xttiIY8EXVTEebeJ/xuBM044S4Q==
X-Received: by 2002:adf:ce90:0:b0:314:3b02:a8a8 with SMTP id r16-20020adfce90000000b003143b02a8a8mr7447482wrn.55.1691483268603;
        Tue, 08 Aug 2023 01:27:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:47 -0700 (PDT)
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
Subject: [PATCH 03/11] clk: samsung: exynos5250: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:30 +0200
Message-Id: <20230808082738.122804-4-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos5250.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 92fb09922f28..8ebe6155d8b7 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -100,6 +100,9 @@
 #define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
 #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR					(CLK_MOUT_VPLLSRC + 1)
+
 /* list of PLLs to be registered */
 enum exynos5250_plls {
 	apll, mpll, cpll, epll, vpll, gpll, bpll,
@@ -797,7 +800,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		panic("%s: unable to determine soc\n", __func__);
 	}
 
-	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLKS_NR);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5250_fixed_rate_ext_clks,
-- 
2.34.1

