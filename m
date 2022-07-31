Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E9AC00140
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jul 2022 17:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbiGaRsM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 31 Jul 2022 13:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237159AbiGaRsL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 31 Jul 2022 13:48:11 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E21BE0F6
        for <linux-clk@vger.kernel.org>; Sun, 31 Jul 2022 10:48:10 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id t2so8582512ply.2
        for <linux-clk@vger.kernel.org>; Sun, 31 Jul 2022 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/EX9ef1Nq9yX6Pu4anXNYfBGTc5U9cZkWJG7nY5yiiQ=;
        b=PfmwiK0X4uI/9VLair3AH3u4JWe12FZK/TVa+K00CrbMUy/N4lQ5LaSzKyda7GYgGl
         qtdGToX1OP9CMOqQ8hdgSO3mKMXf5gliKs6vM+9QDU7tvlSkE1AQT4jJidZHyaNSC/AS
         OkfyO0sEju+OJSj+hJEtKSSElzJkMF7uLQ76Mf03BkCs/fXhDfOzCCsbmpQh2eKvj+yj
         TPPm4zMRhK2pPwza1Jx+PYxqF6mPXk8glTKmRZAC+bcWMxqN3laVBCvJE9U8RYc+r+1v
         sbvzzfhRz1Gj70vZeTR00UI/jpHEQn8TLx83cOJjt2i6zIOqkqhpzSrR7HhKmdbQHJUC
         jfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/EX9ef1Nq9yX6Pu4anXNYfBGTc5U9cZkWJG7nY5yiiQ=;
        b=0AEW+eSwh2lb4Z3o5uq5ZEcKgA2pisyLnSyAmb+ieUJK8u10oPOLrSX8G2MRxFbEC9
         XFgGSSBqwBzp1SyQlY42chj+mIE+y3/7Syo5At/1spfD53Paz7woemBf1rrxcAO2+EGU
         mYBgfx7utfOCyVzgRDkRZiP8V/8ze3FtkL+02Va/Oa7C4PQz3DccYv6TlHO+XP0naL3N
         g+qfILdZKNGP6tz/yF5tZEVihpp+nnqJwrSbWHBSKGqF+JLs49s3AqdNCoLxvDPOmdU2
         4mn9Dby5jjjyLVXRYBUQ139je5sO8XAYiyZixBWj0kWIcteUgyB3i2fLNPI3d9zaxrWk
         oL1Q==
X-Gm-Message-State: ACgBeo2csv06EHz9KNToTYyPIne/4SrfAoCBNBNHePXljAC9gMBFv3Jb
        Dq+TiI+deEPTkAYMYpkA1eslTQ==
X-Google-Smtp-Source: AA6agR5G7x+22NIOm3gvRh0fd0O3cFoZRqUEanRRX/sEiYwyMWtrMyS/SVslrrkFpFqpnM/FshB6BQ==
X-Received: by 2002:a17:902:6ac5:b0:16d:1664:39c9 with SMTP id i5-20020a1709026ac500b0016d166439c9mr13078665plt.104.1659289689678;
        Sun, 31 Jul 2022 10:48:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:c5e8:48d3:6a8c:6418])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b0016d3935eff0sm7812062plh.176.2022.07.31.10.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 10:48:09 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH v2 08/20] clk: rockchip: Add MUXTBL variant
Date:   Sun, 31 Jul 2022 23:17:14 +0530
Message-Id: <20220731174726.72631-9-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731174726.72631-1-jagan@edgeble.ai>
References: <20220731174726.72631-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

A clock branch consisting of a mux with non-standard
select values.
The parent in Mux table is sorted by priority.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- none

 drivers/clk/rockchip/clk.c | 27 +++++++++++++++++++++------
 drivers/clk/rockchip/clk.h | 17 +++++++++++++++++
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index bb8a844309bf..e63d4f20b479 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -40,6 +40,7 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 		const char *const *parent_names, u8 num_parents,
 		void __iomem *base,
 		int muxdiv_offset, u8 mux_shift, u8 mux_width, u8 mux_flags,
+		u32 *mux_table,
 		int div_offset, u8 div_shift, u8 div_width, u8 div_flags,
 		struct clk_div_table *div_table, int gate_offset,
 		u8 gate_shift, u8 gate_flags, unsigned long flags,
@@ -62,6 +63,7 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 		mux->shift = mux_shift;
 		mux->mask = BIT(mux_width) - 1;
 		mux->flags = mux_flags;
+		mux->table = mux_table;
 		mux->lock = lock;
 		mux_ops = (mux_flags & CLK_MUX_READ_ONLY) ? &clk_mux_ro_ops
 							: &clk_mux_ops;
@@ -270,6 +272,8 @@ static struct clk *rockchip_clk_register_frac_branch(
 		frac_mux->shift = child->mux_shift;
 		frac_mux->mask = BIT(child->mux_width) - 1;
 		frac_mux->flags = child->mux_flags;
+		if (child->mux_table)
+			frac_mux->table = child->mux_table;
 		frac_mux->lock = lock;
 		frac_mux->hw.init = &init;
 
@@ -444,11 +448,21 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 		/* catch simple muxes */
 		switch (list->branch_type) {
 		case branch_mux:
-			clk = clk_register_mux(NULL, list->name,
-				list->parent_names, list->num_parents,
-				flags, ctx->reg_base + list->muxdiv_offset,
-				list->mux_shift, list->mux_width,
-				list->mux_flags, &ctx->lock);
+			if (list->mux_table)
+				clk = clk_register_mux_table(NULL, list->name,
+					list->parent_names, list->num_parents,
+					flags,
+					ctx->reg_base + list->muxdiv_offset,
+					list->mux_shift, list->mux_width,
+					list->mux_flags, list->mux_table,
+					&ctx->lock);
+			else
+				clk = clk_register_mux(NULL, list->name,
+					list->parent_names, list->num_parents,
+					flags,
+					ctx->reg_base + list->muxdiv_offset,
+					list->mux_shift, list->mux_width,
+					list->mux_flags, &ctx->lock);
 			break;
 		case branch_muxgrf:
 			clk = rockchip_clk_register_muxgrf(list->name,
@@ -506,7 +520,8 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				ctx->reg_base, list->muxdiv_offset,
 				list->mux_shift,
 				list->mux_width, list->mux_flags,
-				list->div_offset, list->div_shift, list->div_width,
+				list->mux_table, list->div_offset,
+				list->div_shift, list->div_width,
 				list->div_flags, list->div_table,
 				list->gate_offset, list->gate_shift,
 				list->gate_flags, flags, &ctx->lock);
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 7aa45cc70287..93937fb1d368 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -448,6 +448,7 @@ struct rockchip_clk_branch {
 	u8				mux_shift;
 	u8				mux_width;
 	u8				mux_flags;
+	u32				*mux_table;
 	int				div_offset;
 	u8				div_shift;
 	u8				div_width;
@@ -680,6 +681,22 @@ struct rockchip_clk_branch {
 		.gate_offset	= -1,				\
 	}
 
+#define MUXTBL(_id, cname, pnames, f, o, s, w, mf, mt)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_mux,			\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.muxdiv_offset	= o,				\
+		.mux_shift	= s,				\
+		.mux_width	= w,				\
+		.mux_flags	= mf,				\
+		.gate_offset	= -1,				\
+		.mux_table	= mt,				\
+	}
+
 #define MUXGRF(_id, cname, pnames, f, o, s, w, mf)		\
 	{							\
 		.id		= _id,				\
-- 
2.25.1

