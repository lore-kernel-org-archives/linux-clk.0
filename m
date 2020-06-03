Return-Path: <SRS0=Wk/U=7Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CB7C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 11:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E1A320678
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 11:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7v8uJkJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgFCLTb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jun 2020 07:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFCLTa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jun 2020 07:19:30 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5707BC08C5C0;
        Wed,  3 Jun 2020 04:19:30 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so1772581ejd.0;
        Wed, 03 Jun 2020 04:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jb3MHoDug5g39jQ0cE92JC3amngg0VjixJlgvY2BE6Y=;
        b=X7v8uJkJ2/+anXEIFK4o/2QW+FAEzHO+uZcE07ONYJ89ZmXZ+gnWtZr2YpOgaPL07J
         YxscfnhWKk7OkwnLHf5L0sbpal8WCxoBswwEPOjFyx7am9FlDfvLG5B0OqON9XwAIDNU
         dNKYdSrudRV3/ZBk2g5oaNGDk1kRlV3HUNxJIxeB7rO/zbwFpa15Upola3uccz69VMyX
         mGfOwSue0WfTCtxRMKmwWJ66nVh73F2nmq5v2QZMhoQ8j5F1Q1Pi7BosY4JSW82YJWG2
         0fhiZKOhZWa2TXLmOtghYr/Sj+Dex8A6fAUz8FD27bqbAc31q5HJaL7d0oPwxRI2Jj1+
         vOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jb3MHoDug5g39jQ0cE92JC3amngg0VjixJlgvY2BE6Y=;
        b=elN2G+3zNVMTzRb2uaww3chbCjDNVsVoxGb1F80ep3CnB1pWI+wloZZGlI8w0kPMXb
         1nfYKxZtGRhK6ugPL+WiNIuvxiQtYKLnCLYcw6qRPXnzYra8QGiXWUSx435jPclYGkJN
         VijndLJa5o+JhU3a9l31OBgODvwwSflam6GgpyqF9Pvg9t8iHG0NOeCe7jkms5n7ovbH
         fRc5G5QQTFDFF/eUilzyasXqhBpgwyQs/NnRVIqscwUCeA8djksPLkzap9siwz967JkL
         7krYWLAw/c3mlMF/kErbUxskZDpJ1Yg7Of6+qrZEN6ojNQKj1OcMcYcIRZzkawqvV0u4
         kxlQ==
X-Gm-Message-State: AOAM532fLs0vKbvcunqc6rlKiTLzmnii3ou+2qFVeSCZ+swkH5VSq+XX
        QGPjMzApV2CfBvilZhSPDZo+tgRk
X-Google-Smtp-Source: ABdhPJwJzBvoyfz+CNz6ZZQ6lAEr5UTHCmHRwWQPPy9U/aSY05TC+wv4Ib+9Zs9A8ZX4lsaMR4RjHg==
X-Received: by 2002:a17:906:9397:: with SMTP id l23mr25136175ejx.79.1591183169124;
        Wed, 03 Jun 2020 04:19:29 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id a24sm939019ejc.109.2020.06.03.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 04:19:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] clk: tegra: Capitalization fixes
Date:   Wed,  3 Jun 2020 13:19:22 +0200
Message-Id: <20200603111923.3545261-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

HW, XUSB and PLL are abbreviations and should be all-uppercase.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0b212cf2e794..583d2ac61e9e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1663,7 +1663,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	udelay(1);
 
-	/* Enable hw control of xusb brick pll */
+	/* Enable HW control of XUSB brick PLL */
 	val = pll_readl_misc(pll);
 	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
 	pll_writel_misc(val, pll);
@@ -1686,7 +1686,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	val |= XUSBIO_PLL_CFG0_SEQ_ENABLE;
 	pll_writel(val, XUSBIO_PLL_CFG0, pll);
 
-	/* Enable hw control of SATA pll */
+	/* Enable HW control of SATA PLL */
 	val = pll_readl(SATA_PLL_CFG0, pll);
 	val &= ~SATA_PLL_CFG0_PADPLL_RESET_SWCTL;
 	val |= SATA_PLL_CFG0_PADPLL_USE_LOCKDET;
-- 
2.24.1

