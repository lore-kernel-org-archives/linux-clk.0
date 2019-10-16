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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C11FA372A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ABAF2168B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 12:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qk4PanY+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfJPM70 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 08:59:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39642 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405266AbfJPM70 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 08:59:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so27973058wrj.6;
        Wed, 16 Oct 2019 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=abGc2CSWjTlOkZ/qOD8jVoBxXH6yqwawEWK9EHJHevc=;
        b=qk4PanY+Zdp8HqSblcgOtxexMTnZ9eziJPAHTePPRv/ZCz2RLkCdgAyc/p6coscr/7
         3f1LRGqmyx07u02EP0X2nT76Z8/MKZ96GL86nbHzGSeVMme+6/54zFb27EgIsgCtPQ3B
         6O7mrsTo3w0pwvke9h3y6BDZ5UGsc1Pj+QJ2VQ7NgvdkPg4wd2+ubx95/6+KSwBk6OhV
         gs5GG/wiAgcOvM5GRakN1xOezl/SuMsW3wwZJSlNn+wPUkd72YdS7rYof6vOe62uzR5a
         LGT302bWsnWbLVCmaYceR/X35nlddv6ACILECSN7/PI82S5sw9NYj+y7IAmaR+6kOY3r
         P+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=abGc2CSWjTlOkZ/qOD8jVoBxXH6yqwawEWK9EHJHevc=;
        b=CdaCFNOHiSR2XZhBkhEOFQ8lBsHJsIHxB5Omo4rQ411QLwHkSvOMo7MRpyVZgJ795W
         QbYvgQS/3ZCiDuW6BPIfQEOnb8CdQsT2XnwhI7NsRatvrlC2K1VzT19uLuKZAZyqPxJB
         Pithzt3oVbYHdkrVsN4erhojK8ymt4OI5gy+eN0r3QHssHKcJRM5+v7o+/uUGZdPpiWf
         AVaMTR4r2XpICf6WETLH3kOF85GIPv3yWoZCqNf0OPPbCa7O1ZrDBkWUABrZHEy/2KF8
         ATXs7pXARIqWD+chtT2ThfT7/DsK+isXJjXBkUK5d0hK1hBI6CUDVDNX+vOptlo+PMY0
         YR2g==
X-Gm-Message-State: APjAAAV6UqUR7hs56c3l7IZDkDrjEOWF6Lr36+uLz46qmYh/AibARb3y
        oIsJ/G1GhxJYEulUYNKNVzA=
X-Google-Smtp-Source: APXvYqwK61+ZWts0PsXQ9pWHrCrawQg5bZT77gk8e1PC8UhIo+wMl/2EQpDF4mm2cguue2c2hRK7EA==
X-Received: by 2002:adf:dc42:: with SMTP id m2mr2753239wrj.314.1571230764008;
        Wed, 16 Oct 2019 05:59:24 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id e9sm8010855wme.3.2019.10.16.05.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 05:59:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
Date:   Wed, 16 Oct 2019 14:59:15 +0200
Message-Id: <20191016125919.1773898-2-thierry.reding@gmail.com>
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

Later SoC generations implement this clock as SOR1_OUT. For consistency,
the Tegra210 implementation was adapted to match the same name in commit
4d1dc4018573 ("dt-bindings: clock: tegra: Add sor1_out clock").

Clean up the remaining pieces by adopting the new name for the internal
identifiers and remove the old alias. Note that since both SOR1_SRC and
SOR1_OUT were referring to the same device tree clock ID, this does not
break device tree ABI.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-id.h               | 2 +-
 drivers/clk/tegra/clk-tegra210.c         | 2 +-
 include/dt-bindings/clock/tegra210-car.h | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index de466b4446da..ae02885c9475 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -238,7 +238,7 @@ enum clk_id {
 	tegra_clk_sor0,
 	tegra_clk_sor0_lvds,
 	tegra_clk_sor1,
-	tegra_clk_sor1_src,
+	tegra_clk_sor1_out,
 	tegra_clk_spdif,
 	tegra_clk_spdif_2x,
 	tegra_clk_spdif_in,
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index df172d5772d7..019287df6c12 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2353,7 +2353,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_sor0] = { .dt_id = TEGRA210_CLK_SOR0, .present = true },
 	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA210_CLK_SOR0_LVDS, .present = true },
 	[tegra_clk_sor1] = { .dt_id = TEGRA210_CLK_SOR1, .present = true },
-	[tegra_clk_sor1_src] = { .dt_id = TEGRA210_CLK_SOR1_SRC, .present = true },
+	[tegra_clk_sor1_out] = { .dt_id = TEGRA210_CLK_SOR1_OUT, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
 	[tegra_clk_pll_g_ref] = { .dt_id = TEGRA210_CLK_PLL_G_REF, .present = true, },
 	[tegra_clk_uartb_8] = { .dt_id = TEGRA210_CLK_UARTB, .present = true },
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 6b77e721f6b1..b43b9e84e62e 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -309,7 +309,6 @@
 #define TEGRA210_CLK_CLK_OUT_3 279
 #define TEGRA210_CLK_BLINK 280
 /* 281 */
-#define TEGRA210_CLK_SOR1_SRC 282
 #define TEGRA210_CLK_SOR1_OUT 282
 /* 283 */
 #define TEGRA210_CLK_XUSB_HOST_SRC 284
-- 
2.23.0

