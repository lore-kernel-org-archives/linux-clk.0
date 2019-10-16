Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A96FA372A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F07921848
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRnSeQZq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405275AbfJPM7c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 08:59:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39657 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405266AbfJPM7b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 08:59:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so27973359wrj.6;
        Wed, 16 Oct 2019 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7oEiKY7MdVnoBelVYyBtyHkCbOpa9g+wnsDvm4D8PDQ=;
        b=jRnSeQZqOpLB2dU1pS/qwVK5+CAAfLSHsQiovIbt3PGDFe+yNcI3WJbRML8RUv0ZnT
         Sg0Dkup1bZbpkyW0Z11eTabzqfDdu/w33pWdSbpkxXBR3MbNXv/nWUn1RYwfvIfcS74K
         iYuYk9CZsYiguh8h6p4ZZ3k7HyBSli5M+T/VE6eQEYSJdJDqxfeZanF8gplPkE8KUkcr
         n4Fwsjbb3g5X+Rn+YRMoJxr5D5jRTNtPFoudDU4bC+C42ITP90lR79d05nguW/ews2d5
         6LZnZKL/ShesIes1jwnjemfgXzhhi9Eq26oiM/PKHYuuo2HNfLqtmXX6LiYpQihKiuZ8
         lghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7oEiKY7MdVnoBelVYyBtyHkCbOpa9g+wnsDvm4D8PDQ=;
        b=IzGJtGWL6069RKCsbVFUI/RN0vuU0aFsuenLTkrJqrCb7dcF+q2IS2Vyl52S6qnNIg
         Ope9MuL1q5wzkptFKhw9j1z3Y9+UkErO2P7R/iJSdG4acLeyp6hY8M4oEObX9dHW/0AV
         T3kTAZESyeTNzj5JfDaI3ESo3+TLphwGXoVQzA+rzYZFgOH7Ke65villhQqmb9SaTi/i
         tcytEmoYgjk8xlGwK8tYNsg2ZbkPVqaktcY5NRw4BgE0tTJAPUvLYi5npSEI4tmo8r9H
         BoSMr40RQ4N887rzCOoVzLvA4BcnI3hGv6noBNXddzmZTeAqsVSxGeZb66pThSw/Zf8E
         MRDQ==
X-Gm-Message-State: APjAAAVcQUA9o6gMD4kpYrsILj1dCtriIbQ0ftMoyL/ydmTBrTypM2yj
        ikuxlmbHMkQZkKJU9ZSLCxo=
X-Google-Smtp-Source: APXvYqwM7Z+V9qby+MdTWKEqUyNL6zK/Cjh7bYNPUtiWI453RabKfLBX7oQJb1BCM3R44d9XAWZprg==
X-Received: by 2002:adf:cd8e:: with SMTP id q14mr2506690wrj.86.1571230768586;
        Wed, 16 Oct 2019 05:59:28 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id u1sm384105wrp.56.2019.10.16.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 05:59:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] clk: tegra: Rename sor0_lvds to sor0_out
Date:   Wed, 16 Oct 2019 14:59:17 +0200
Message-Id: <20191016125919.1773898-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016125919.1773898-1-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This makes Tegra124 and Tegra210 consistent with subsequent Tegra
generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-id.h                      |  2 +-
 drivers/clk/tegra/clk-tegra124.c                | 12 ++++++------
 drivers/clk/tegra/clk-tegra210.c                |  2 +-
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 include/dt-bindings/clock/tegra210-car.h        |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index ae02885c9475..c4faebd32760 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -236,7 +236,7 @@ enum clk_id {
 	tegra_clk_soc_therm,
 	tegra_clk_soc_therm_8,
 	tegra_clk_sor0,
-	tegra_clk_sor0_lvds,
+	tegra_clk_sor0_out,
 	tegra_clk_sor1,
 	tegra_clk_sor1_out,
 	tegra_clk_spdif,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 2e41141af7b5..7d231529c3a5 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -847,7 +847,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_adx1] = { .dt_id = TEGRA124_CLK_ADX1, .present = true },
 	[tegra_clk_dpaux] = { .dt_id = TEGRA124_CLK_DPAUX, .present = true },
 	[tegra_clk_sor0] = { .dt_id = TEGRA124_CLK_SOR0, .present = true },
-	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA124_CLK_SOR0_LVDS, .present = true },
+	[tegra_clk_sor0_out] = { .dt_id = TEGRA124_CLK_SOR0_OUT, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA124_CLK_GPU, .present = true },
 	[tegra_clk_amx1] = { .dt_id = TEGRA124_CLK_AMX1, .present = true },
 	[tegra_clk_uartb] = { .dt_id = TEGRA124_CLK_UARTB, .present = true },
@@ -1011,14 +1011,14 @@ static const char *mux_pllp_pllm_plld_plla_pllc_plld2_clkm[] = {
 };
 #define mux_pllp_pllm_plld_plla_pllc_plld2_clkm_idx NULL
 
-static const char *mux_clkm_plldp_sor0lvds[] = {
-	"clk_m", "pll_dp", "sor0_lvds",
+static const char *mux_clkm_plldp_sor0out[] = {
+	"clk_m", "pll_dp", "sor0_out",
 };
-#define mux_clkm_plldp_sor0lvds_idx NULL
+#define mux_clkm_plldp_sor0out_idx NULL
 
 static struct tegra_periph_init_data tegra124_periph[] = {
-	MUX8_NOGATE_LOCK("sor0_lvds", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_lvds, &sor0_lock),
-	NODIV("sor0", mux_clkm_plldp_sor0lvds, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
+	MUX8_NOGATE_LOCK("sor0_out", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_out, &sor0_lock),
+	NODIV("sor0", mux_clkm_plldp_sor0out, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
 };
 
 static struct clk **clks;
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 019287df6c12..0f0f14781b43 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2351,7 +2351,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_dpaux] = { .dt_id = TEGRA210_CLK_DPAUX, .present = true },
 	[tegra_clk_dpaux1] = { .dt_id = TEGRA210_CLK_DPAUX1, .present = true },
 	[tegra_clk_sor0] = { .dt_id = TEGRA210_CLK_SOR0, .present = true },
-	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA210_CLK_SOR0_LVDS, .present = true },
+	[tegra_clk_sor0_out] = { .dt_id = TEGRA210_CLK_SOR0_OUT, .present = true },
 	[tegra_clk_sor1] = { .dt_id = TEGRA210_CLK_SOR1, .present = true },
 	[tegra_clk_sor1_out] = { .dt_id = TEGRA210_CLK_SOR1_OUT, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index 4331f1df6ebe..210ef790d0ae 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -337,7 +337,7 @@
 #define TEGRA124_CLK_CLK_OUT_3_MUX 308
 /* 309 */
 /* 310 */
-#define TEGRA124_CLK_SOR0_LVDS 311
+#define TEGRA124_CLK_SOR0_OUT 311
 #define TEGRA124_CLK_XUSB_SS_DIV2 312
 
 #define TEGRA124_CLK_PLL_M_UD 313
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index b43b9e84e62e..70308a568c6c 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -390,7 +390,7 @@
 #define TEGRA210_CLK_CLK_OUT_3_MUX 358
 #define TEGRA210_CLK_DSIA_MUX 359
 #define TEGRA210_CLK_DSIB_MUX 360
-#define TEGRA210_CLK_SOR0_LVDS 361
+#define TEGRA210_CLK_SOR0_OUT 361
 #define TEGRA210_CLK_XUSB_SS_DIV2 362
 
 #define TEGRA210_CLK_PLL_M_UD 363
-- 
2.23.0

