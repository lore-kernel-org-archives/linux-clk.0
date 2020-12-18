Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11C8C2D0E4
	for <linux-clk@archiver.kernel.org>; Fri, 18 Dec 2020 17:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65CF723B6C
	for <linux-clk@archiver.kernel.org>; Fri, 18 Dec 2020 17:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgLRRiU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:38:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:35662 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730410AbgLRRiT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 18 Dec 2020 12:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=MYzs9HdZf1z8X0
        +WtacPHW/SiQSQbqLwBKoeknbWpHI=; b=hykiViAxqC2NNKDPZ6Tc6ZN276SUww
        u4MdqPAzQsNJysHHEWG5l2RZbgp/GxlRg4nvX1p3jOp8RrHkTlYWg2jbzQvG6Ker
        M6TQgdPs8YdZeHi7W7RPuVyD1sfPp93ARunCplVJM5l1n1uX+FMLMM5pNL5U/4S3
        Yx5sLbUQ7hcqE=
Received: (qmail 3906722 invoked from network); 18 Dec 2020 18:37:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2020 18:37:36 +0100
X-UD-Smtp-Session: l3s3148p1@0t1skMC2aJggAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] clk: renesas: r8a779a0: Add RWDT clocks
Date:   Fri, 18 Dec 2020 18:37:27 +0100
Message-Id: <20201218173731.12839-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

And introduce critical clocks, too, because RWDT is one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index aa5389b04d74..bf9fdcdd7d85 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -188,6 +188,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),
+	DEF_MOD("rwdt",		907,	R8A779A0_CLK_R),
 };
 
 static spinlock_t cpg_lock;
@@ -261,6 +262,10 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 					 __clk_get_name(parent), 0, mult, div);
 }
 
+static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(907),	/* RWDT */
+};
+
 /*
  * CPG Clock Data
  */
@@ -311,6 +316,10 @@ const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
 	.num_mod_clks = ARRAY_SIZE(r8a779a0_mod_clks),
 	.num_hw_mod_clks = 15 * 32,
 
+	/* Critical Module Clocks */
+	.crit_mod_clks		= r8a779a0_crit_mod_clks,
+	.num_crit_mod_clks	= ARRAY_SIZE(r8a779a0_crit_mod_clks),
+
 	/* Callbacks */
 	.init = r8a779a0_cpg_mssr_init,
 	.cpg_clk_register = rcar_r8a779a0_cpg_clk_register,
-- 
2.29.2

