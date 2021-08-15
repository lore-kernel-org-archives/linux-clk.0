Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8514EC43214
	for <linux-clk@archiver.kernel.org>; Sun, 15 Aug 2021 10:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B469610CC
	for <linux-clk@archiver.kernel.org>; Sun, 15 Aug 2021 10:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237279AbhHOKay (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Aug 2021 06:30:54 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:23514 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237260AbhHOKax (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 15 Aug 2021 06:30:53 -0400
X-IronPort-AV: E=Sophos;i="5.84,322,1620658800"; 
   d="scan'208";a="90668544"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2021 19:30:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DFA6B4006CD0;
        Sun, 15 Aug 2021 19:30:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/4] clk: renesas: rzg2l: Add support to handle MUX clocks
Date:   Sun, 15 Aug 2021 11:30:11 +0100
Message-Id: <20210815103014.21208-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support to handle mux clocks in order to select a clock source
from multiple sources.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Updated commit header drivers: clk: renesas: rzg2l-cpg with
   clk: renesas: rzg2l
v1->v2:
  * Moved SEL_PLL_PACK macro to here
  * Fixed the commit message and extra blank line as pointed by Sergei
  * Added Geert's Rb tag
v1:
  * New patch.
---
 drivers/clk/renesas/rzg2l-cpg.c | 23 +++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h | 12 ++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3b3b2c3347f3..597efc2504eb 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -130,6 +130,26 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+static struct clk * __init
+rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
+			   void __iomem *base,
+			   struct rzg2l_cpg_priv *priv)
+{
+	const struct clk_hw *clk_hw;
+
+	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
+					  core->parent_names, core->num_parents,
+					  core->flag,
+					  base + GET_REG_OFFSET(core->conf),
+					  GET_SHIFT(core->conf),
+					  GET_WIDTH(core->conf),
+					  core->mux_flags, &priv->rmw_lock);
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
 struct pll_clk {
 	struct clk_hw hw;
 	unsigned int conf;
@@ -288,6 +308,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		clk = rzg2l_cpg_div_clk_register(core, priv->clks,
 						 priv->base, priv);
 		break;
+	case CLK_TYPE_MUX:
+		clk = rzg2l_cpg_mux_clk_register(core, priv->base, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 63695280ce8b..f538ffa3371c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -24,6 +24,9 @@
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 
+#define SEL_PLL_PACK(offset, bitpos, size) \
+		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+
 /**
  * Definitions of CPG Core Clocks
  *
@@ -43,6 +46,7 @@ struct cpg_core_clk {
 	const struct clk_div_table *dtable;
 	const char * const *parent_names;
 	int flag;
+	int mux_flags;
 	int num_parents;
 };
 
@@ -54,6 +58,9 @@ enum clk_types {
 
 	/* Clock with divider */
 	CLK_TYPE_DIV,
+
+	/* Clock with clock source selector */
+	CLK_TYPE_MUX,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -69,6 +76,11 @@ enum clk_types {
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, .flag = _flag)
+#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
+		_mux_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, .num_parents = _num_parents, \
+		 .flag = _flag, .mux_flags = _mux_flags)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.17.1

