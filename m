Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAB3C6379D
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 14:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B4DB61244
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 14:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhGVNeB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jul 2021 09:34:01 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5527 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232326AbhGVNdh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jul 2021 09:33:37 -0400
X-IronPort-AV: E=Sophos;i="5.84,261,1620658800"; 
   d="scan'208";a="88414738"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jul 2021 23:14:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 454B7401224B;
        Thu, 22 Jul 2021 23:14:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add support to handle MUX clocks
Date:   Thu, 22 Jul 2021 15:13:35 +0100
Message-Id: <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support to handle mux clocks inorder to select a clock source
from multiple sources.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 ++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  9 +++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3b3b2c3347f3..491b10da5766 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -130,6 +130,27 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
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
+
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
 struct pll_clk {
 	struct clk_hw hw;
 	unsigned int conf;
@@ -288,6 +309,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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
index 63695280ce8b..148db5de253b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -43,6 +43,7 @@ struct cpg_core_clk {
 	const struct clk_div_table *dtable;
 	const char * const *parent_names;
 	int flag;
+	int mux_flags;
 	int num_parents;
 };
 
@@ -54,6 +55,9 @@ enum clk_types {
 
 	/* Clock with divider */
 	CLK_TYPE_DIV,
+
+	/* Clock with clock source selector */
+	CLK_TYPE_MUX,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -69,6 +73,11 @@ enum clk_types {
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

