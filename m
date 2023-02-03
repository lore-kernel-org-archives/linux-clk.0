Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40F9C636D7
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjBCGJU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjBCGJH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:09:07 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB2073740
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:09:06 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id s17so3358629ois.10
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGIg7efke9/GL7H7bmsFZBD24JST84PhbzNPSEQBcS0=;
        b=Gx3JJFW5AmJIEM9E+xl833GmF3UeU0UV7IAeZXgwSRigqwr6QDvIOTnKo2EkuZ4JBm
         K6DrHnjSeSmJoCoIh6M/27+RN5mb5f6nZnwydy6yGgHr5+c2x/Z/vTkvNBHWsFSIKOpf
         yqBBFZG3BxR8P0ZWskEJmKvJzK5oBXAGVqV8OaVNtpBtmnKKLrgqMfFGVTYFO0jnuafZ
         L07xfeGNfL/12k31PvlMuOkPxYvmIGj5X/g8e3VKVSP9wwjzij/2lODHwYoa/INsTTxX
         7vYWKYSZi7zg3snrVindw0/0CaZt2VE9G4cWIdCmR/NSkvFIqDOxNLaAdXmaAok7Z3Yt
         po+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGIg7efke9/GL7H7bmsFZBD24JST84PhbzNPSEQBcS0=;
        b=oPs8bBeRasQM3tkPK0Kde0Aaq8b/iNWntiUrHnAc+7/DD0kXlU/xLBfkF3yW8aEr9H
         wQI5rP3PKkXOnrf7UMIQfhDprzZ685i/x5tDH1usiWjJc7r69gHEwycVSgkxnyAHRMR7
         1c5QpkPXWwS8Gwu95VA8P6D5E/71+z3z/v4NIGPyEl+CjdbO3jxUXcVTQ7ds6EDmA3rS
         HHqmHx1YqdpbQCWbLn00V0xos4vqZ2qz36BCfFuI2LbuiH8I22Itthj4V/3B8i2yCBOp
         hiNa2gTs1lFEAcU2LUYJOGbdRArGPHAN3dlBA5LgAbdsisIk+35Dn/D9W8dfETgyKvMC
         cEcQ==
X-Gm-Message-State: AO0yUKUt4UCWf/3aurQKC4WZfs8wJiRQqZHWrqGCOZ4oHfaMy2ctnUjQ
        8TSVZ0TLzIQmbHyoPqRVR8ocWA==
X-Google-Smtp-Source: AK7set9l6Dt74iN/9jGW0AVDX6iku7ADOWzwYFPSr3Jo+72AyEvOoSgqinrOWBW3zn3x3g4yc+CPKA==
X-Received: by 2002:a05:6808:6182:b0:378:2467:5cf0 with SMTP id dn2-20020a056808618200b0037824675cf0mr3949544oib.25.1675404545734;
        Thu, 02 Feb 2023 22:09:05 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id d2-20020a056830044200b0066ca61230casm757387otc.8.2023.02.02.22.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 22:09:05 -0800 (PST)
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
Subject: [PATCH 4/6] clk: samsung: Extract clocks registration to common function
Date:   Fri,  3 Feb 2023 00:09:22 -0600
Message-Id: <20230203060924.8257-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230203060924.8257-1-semen.protsenko@linaro.org>
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
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

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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
2.39.0

