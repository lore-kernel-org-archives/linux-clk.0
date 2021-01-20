Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0B3C4332B
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B73FC23332
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733139AbhATKgg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbhATJce (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:32:34 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14B5C0617A3
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:56 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 190so2202769wmz.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CyzRhBdQWuy7NbbbUGcka0gVixtKRd5z8W/5jUM6uQ=;
        b=opSRLVAxhm/wlOnyPfNYTkIGkaz+7I8D0awfOj8/cW6MfioryWdd3b9OCHmD8IDARc
         rYPHmSk1kA/ZVs8KqvXHWlxSeSdVGutfnATOGa0jNWvqDNZ8t30f6AttQB/3bmNyCEN7
         LRNaIKi6cKwB2l0wsy5t6eICcFltJYoalBLpZdPd56sz8eivoyVOcTzdM7v+njz1cKCS
         TSQvv75X6S4tRMWB05+B4+hfI86Nk+kr1bsodzsrFXnNO+65uLsFfBh3NrGNZGOYUG2J
         eV15YaKJla80nYXEzkwI2Ho2UyCjIZ5tiniui4SXzo3qsIhGNwt4M2XbRRVeMMS+5gfx
         C1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CyzRhBdQWuy7NbbbUGcka0gVixtKRd5z8W/5jUM6uQ=;
        b=jJEhAxQfv1hgwu7669GdkyR5x7u45zUj+qAkF1i8S4IevfdcCj/5vyjjUTPcd7twTU
         o5lbEF0eblOwPxq065n2kuKnPhVNkyaCVNQLz3GiaSMiYC/t95Iytr4iK3XAgMAKyHCR
         7MbLuP+K7RKFO1zGhyDzTLrSPBBpp57RMMjNOrhdMMi54bpSGalcIe3+jpGfF4hENm9u
         +QqHdfRtlH9Pw9DK3A5at+hjWpH8vlRW6V8TUy3ADN9+lL3ncqHEPZmE9haRoGdEqOod
         2meVHHFywioXB7dClBPsNEMfUxvYjb1SJt/S5h+1KjelHW6DEuIBjQnTzqTVoFRUKUnb
         lvxQ==
X-Gm-Message-State: AOAM531NJcapWbDMV5x8KzSdAybvuub7kuQQNnm2IFrtue9eksXR3wMt
        sYU0Nwg2SR2AqVW3hpkoBqs40qBUrYpxEL/P
X-Google-Smtp-Source: ABdhPJzmWq3xuS8OdEo60LQmwNZROF/cZlYDhVqbDGwlETLLVTrl3eruNCzEnQ7eb8d+ti2f22fv+g==
X-Received: by 2002:a1c:e2d7:: with SMTP id z206mr3484728wmg.168.1611135055706;
        Wed, 20 Jan 2021 01:30:55 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:55 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/20] clk: imx: clk-imx31: Remove unused static const table 'uart_clks'
Date:   Wed, 20 Jan 2021 09:30:30 +0000
Message-Id: <20210120093040.1719407-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/imx/clk-imx31.c:54:28: warning: ‘uart_clks’ defined but not used [-Wunused-const-variable=]

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/imx/clk-imx31.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 7b13fb57d8428..c44e18c6f63f7 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -51,16 +51,6 @@ enum mx31_clks {
 static struct clk *clk[clk_max];
 static struct clk_onecell_data clk_data;
 
-static struct clk ** const uart_clks[] __initconst = {
-	&clk[ipg],
-	&clk[uart1_gate],
-	&clk[uart2_gate],
-	&clk[uart3_gate],
-	&clk[uart4_gate],
-	&clk[uart5_gate],
-	NULL
-};
-
 static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 {
 	clk[dummy] = imx_clk_fixed("dummy", 0);
-- 
2.25.1

