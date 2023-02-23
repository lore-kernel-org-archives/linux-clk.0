Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C7EC6FA99
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 04:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbjBWETh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbjBWETb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 23:19:31 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD930279A6
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 20:19:27 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso560187oti.8
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 20:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMdF+1I4PCMXLZZRD3x13GdIrMhcdKCjf2+JDjwnizc=;
        b=ndTkWGPr3Y+CPRSwKSkA/QZe6+6s+EnLjZUkusPJbkE2EWNPUEL7Uhe7aHzSvcsjp+
         Z10BW/nCs/A6B72D8X078eXknOCSrgEVXfejrIfWjT8VY99caVHvbNz1DFaB1M1mQR6f
         XI+H/4EYJh5hxqpwZ2E4f/kVcDek5/jo1gBAmOIGyA22CbJRKWUNm6PFkTdLaqdbRRC/
         6GYBqVJgRp1wnWmtgNF/rBNid1W1xQaO6b7q3JGYn+5WhymBDHCb+y7Aw0jpDrTwQur6
         K6fuQlZd0WuExAKyVZgRHwnvfQVGZ5HSBkslydzW/JH7g9PM44Bo+OjC1nu/In1Bu7AX
         VOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMdF+1I4PCMXLZZRD3x13GdIrMhcdKCjf2+JDjwnizc=;
        b=yy6cm+WEbBvnDsMlQ3byy46Ty+idjK/07Un63Db/HXLx2M8yyx6j1pFCRQxV0zJDuk
         z5zrhKko3jMPCY7UMv6vxk+rQ8j6EGk7B3GPwHIMOsICA1bP7Q7ZZr0sCxWOveRROH37
         MNIuCkDhaMe3TI7tEoXCUF77M2X/dXMhI/h+hwFsELcGQeY4koM8g40rB57Wiaewpc3L
         dMaVcTndsPxyNfujurHLpawIMnrQBcbXyBydHi0aMDEW/Z5U+oGncQ0ZbB5QUVWO+zs1
         hBYt7hPU0z9ByTbM/tVAciVlfaNi/D5wCYWQkMKa8JPQ6W8VXcVgI32I4O89thDG5a8L
         PGEg==
X-Gm-Message-State: AO0yUKUARE7l83ljSfY+PwNfpmufz/QKBgpqkWUWNAt5yPGygaW0Kzuv
        TJ1K2kOEBwTjzKdQyF3eKw6rkw==
X-Google-Smtp-Source: AK7set94rUEN/rrluHA8smSKckx8KOMifk0fepvtT+J5lV6xhZXQB+bdA8IY00Hr6iVUZ94BrEFe2A==
X-Received: by 2002:a05:6830:3485:b0:693:cce9:48b1 with SMTP id c5-20020a056830348500b00693cce948b1mr1765624otu.17.1677125967130;
        Wed, 22 Feb 2023 20:19:27 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id v24-20020a05683024b800b0068be5ad8044sm1924602ots.4.2023.02.22.20.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:19:26 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] clk: samsung: Extract clocks registration to common function
Date:   Wed, 22 Feb 2023 22:19:36 -0600
Message-Id: <20230223041938.22732-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223041938.22732-1-semen.protsenko@linaro.org>
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It might be useful to have a separate clocks registration function, so
it can be called from different users. Extract that common code from
samsung_cmu_register_one() to samsung_cmu_register_clocks(). Also make
that new function global as it's going to be used in other modules
further.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Rebased on top of latest soc/for-next tree
  - Added Marek's Acked-by tag

Changes in v2:
  - Rebased on top of latest soc/for-next tree

 drivers/clk/samsung/clk.c | 46 ++++++++++++++++++++++++---------------
 drivers/clk/samsung/clk.h |  2 ++
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 912dfbe5ac20..b6701905f254 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -335,6 +335,33 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 }
 #endif
 
+/**
+ * samsung_cmu_register_clocks() - Register all clocks provided in CMU object
+ * @ctx: Clock provider object
+ * @cmu: CMU object with clocks to register
+ */
+void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
+					const struct samsung_cmu_info *cmu)
+{
+	if (cmu->pll_clks)
+		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
+	if (cmu->mux_clks)
+		samsung_clk_register_mux(ctx, cmu->mux_clks, cmu->nr_mux_clks);
+	if (cmu->div_clks)
+		samsung_clk_register_div(ctx, cmu->div_clks, cmu->nr_div_clks);
+	if (cmu->gate_clks)
+		samsung_clk_register_gate(ctx, cmu->gate_clks,
+					  cmu->nr_gate_clks);
+	if (cmu->fixed_clks)
+		samsung_clk_register_fixed_rate(ctx, cmu->fixed_clks,
+						cmu->nr_fixed_clks);
+	if (cmu->fixed_factor_clks)
+		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
+						  cmu->nr_fixed_factor_clks);
+	if (cmu->cpu_clks)
+		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
+}
+
 /*
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
@@ -353,29 +380,12 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	}
 
 	ctx = samsung_clk_init(NULL, reg_base, cmu->nr_clk_ids);
+	samsung_cmu_register_clocks(ctx, cmu);
 
-	if (cmu->pll_clks)
-		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
-	if (cmu->mux_clks)
-		samsung_clk_register_mux(ctx, cmu->mux_clks,
-			cmu->nr_mux_clks);
-	if (cmu->div_clks)
-		samsung_clk_register_div(ctx, cmu->div_clks, cmu->nr_div_clks);
-	if (cmu->gate_clks)
-		samsung_clk_register_gate(ctx, cmu->gate_clks,
-			cmu->nr_gate_clks);
-	if (cmu->fixed_clks)
-		samsung_clk_register_fixed_rate(ctx, cmu->fixed_clks,
-			cmu->nr_fixed_clks);
-	if (cmu->fixed_factor_clks)
-		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
-			cmu->nr_fixed_factor_clks);
 	if (cmu->clk_regs)
 		samsung_clk_extended_sleep_init(reg_base,
 			cmu->clk_regs, cmu->nr_clk_regs,
 			cmu->suspend_regs, cmu->nr_suspend_regs);
-	if (cmu->cpu_clks)
-		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 
 	samsung_clk_of_add_provider(np, ctx);
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 3fd6c0868921..ab9c3d7a25b3 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -377,6 +377,8 @@ void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
+void samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
+				 const struct samsung_cmu_info *cmu);
 struct samsung_clk_provider *samsung_cmu_register_one(
 			struct device_node *,
 			const struct samsung_cmu_info *);
-- 
2.39.1

