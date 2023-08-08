Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3E3C04E69
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 16:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbjHHQ64 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbjHHQ6A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 12:58:00 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980C92139
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:43:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-522ab557632so7746222a12.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509379; x=1692114179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/ysiPNWLR7wpbVD7YtHSC9xvbZhsi6ZL4lXHxj1M6c=;
        b=IOwLj1mneFAFmJb1bLcT7ug6y77kpUrCnbqRDEGHrgd+gyXFFmyzrJ98AgXGMz1+jI
         LRODVj2+/9ORKh6sq8ucJOt7XtWAbfcuuMdlUclpL1iEiu55Drxvv2LYLomA6DpclJ59
         CtWE8zTv05rUBxxHL2HDc/cNNRJ4jBv6FP8SGDzD3niJrZkOx6QqkfxM16aHBud0TwT7
         j77o/r827lYINM2tnJBiyoXGut0O/XqD5lI6oFVqW5UBD0mwiQMTW3VW7DG1Z9KNRdWb
         8o7S/pz9ttflbfRzarES2ev16qoWDWxjg5YrXw2yACXy+dholq7ycJzUGbu+YPgH78KH
         h3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509379; x=1692114179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/ysiPNWLR7wpbVD7YtHSC9xvbZhsi6ZL4lXHxj1M6c=;
        b=G8m92k/OJevRX4iR8fNw2mBWramUG/NxcdqlEaJjJpa5tvAZFwWcTQM7jCdRNasIPO
         mKUp5KD5+9jjzk/6axZXYiMzcH7m/m3vs0YaWrc8A4Blchbz6PTRv9KYuh15xhbqvw8h
         ZNxjDyUaJZkOzOaBRGq9l2HxPg4laeSh1AoIAnO5wxGHvtXWTMJLfMJWRMbKzsqdVKZV
         x3wIWK8X2J+tKcD26f5MyXqNk0MimQSGctSu2soaGOfsPP8Z9A+073zDwJ+I6MyzQ1zs
         5MQ7Pumzbn5m0tASu8bQ0PtAhi+CKcf4lKK+YPkmMtuyILChqp3ssdRHzFBCFMM5XN4h
         TNgg==
X-Gm-Message-State: AOJu0YyuIVBsi9bfAWMHx+DjSghCCXnnESeKi4L8k+B7iIqSvT/QFcF2
        2XyQHj9fn783BJB/FSiNj6K6XvwAb7VI+oOptBU=
X-Google-Smtp-Source: AGHT+IFQ1+reGKbu7+VQxeellkzInKFEL4NfkTVROJIeIltY/tZlYlFyqdoEIWGGNtTNFwjonuVnVw==
X-Received: by 2002:a05:6512:2347:b0:4f9:5580:1894 with SMTP id p7-20020a056512234700b004f955801894mr8212298lfu.15.1691483274184;
        Tue, 08 Aug 2023 01:27:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:53 -0700 (PDT)
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
Subject: [PATCH 06/11] clk: samsung: exynos5420: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:33 +0200
Message-Id: <20230808082738.122804-7-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos5420.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 1e0cbf762408..199843f12ae5 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -139,6 +139,9 @@
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR			(CLK_DOUT_PCLK_DREX1 + 1)
+
 /* Exynos5x SoC type */
 enum exynos5x_soc {
 	EXYNOS5420,
@@ -1587,7 +1590,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 
 	exynos5x_soc = soc;
 
-	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLKS_NR);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5x_fixed_rate_ext_clks,
-- 
2.34.1

