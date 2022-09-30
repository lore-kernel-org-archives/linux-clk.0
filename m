Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B2DC32771
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiI3PjK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbiI3PjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:07 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CA21A0D2A;
        Fri, 30 Sep 2022 08:39:05 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 487A966022F5;
        Fri, 30 Sep 2022 16:39:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552344;
        bh=TeTqZRe946LnzMhhkMsk3vs7AoSkghH96CaHVKDKCpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AUsVwByxZ3ah/mys9gjyZrZR3vUTzlMNqSzc26Q+3yrAvVTE+n+wjZnFvN4E2xyxy
         nfyX4vliP6gl922/ZqrFi+fMRbhwjFbGV1H15HQ58uhOYlnFVWHBMXp6eG5LacKJ7m
         Syeiwv4B+79s07mEk4pyxPPhXnXGHTc4rCfeYQQRqisGOl6/U0pPInO3qKminhWWp4
         +b/lPMrkEyw7OG+vZZ92dBOZKxTCWgeGWOotWt/7e+qLqaOCSKkgDHHkh6SkvVzb7Z
         DXBkf3QK/PMfXQGrbgFWemZKSMaw80BWMWI8ycTMMgVp38rbJkIh2Qwmy4obFlDxcO
         pu1UpTT0WJaUA==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 0F22348015E; Fri, 30 Sep 2022 17:38:59 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv2 7/9] clk: rockchip: simplify rockchip_clk_add_lookup
Date:   Fri, 30 Sep 2022 17:38:55 +0200
Message-Id: <20220930153857.299396-8-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930153857.299396-1-sebastian.reichel@collabora.com>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

rockchip_clk_add_lookup is only called from within the file,
so it can be made static. The additional checks are removed
with the following reasoning:

1. The data structure is initialized by rockchip_clk_init(),
   which is called by all rockchip platforms before the clocks
   are registered. Not doing so would result in an incomplete
   clock tree at the moment, which is a fatal error. In other
   parts of the kernel these kind of checks are usually
   omitted, so this was done here. The alternative is adding
   a pr_err to inform the kernel programmer adding a new platform
   about his incorrect code. Apart from that we are also not
   checking if the clock id is within the array boundings.

2. While not used so far by any rockchip platform, 0 is a valid
   clock identifier. To align rockchip closer to other ARM
   platforms we will start using it with rk3588.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 14 ++++++--------
 drivers/clk/rockchip/clk.h |  2 --
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index bb8a844309bf..cb3ab749ddc7 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -196,6 +196,12 @@ static void rockchip_fractional_approximation(struct clk_hw *hw,
 	clk_fractional_divider_general_approximation(hw, rate, parent_rate, m, n);
 }
 
+static void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
+				    struct clk *clk, unsigned int id)
+{
+	ctx->clk_data.clks[id] = clk;
+}
+
 static struct clk *rockchip_clk_register_frac_branch(
 		struct rockchip_clk_provider *ctx, const char *name,
 		const char *const *parent_names, u8 num_parents,
@@ -397,14 +403,6 @@ void rockchip_clk_of_add_provider(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_of_add_provider);
 
-void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
-			     struct clk *clk, unsigned int id)
-{
-	if (ctx->clk_data.clks && id)
-		ctx->clk_data.clks[id] = clk;
-}
-EXPORT_SYMBOL_GPL(rockchip_clk_add_lookup);
-
 void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 				struct rockchip_pll_clock *list,
 				unsigned int nr_pll, int grf_lock_offset)
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 2bd1863a7418..4a84491faf39 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -892,8 +892,6 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
 void rockchip_clk_of_add_provider(struct device_node *np,
 				struct rockchip_clk_provider *ctx);
-void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
-			     struct clk *clk, unsigned int id);
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk);
-- 
2.35.1

