Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F44C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 01:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiFYBcz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 21:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbiFYBcy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 21:32:54 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3671645ADD
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 18:32:51 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0618C8443D;
        Sat, 25 Jun 2022 03:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656120768;
        bh=/Lmnm5lRcfGq9n+LBIdQFgoVZJj9KEGIix0DNQk4fas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Eh1e7waHN+BQZufeY9Xh9DuA/GHyHZkaesi2awKAeVShWFEPGR0tPtXOE4Oz7U9zQ
         iIpwoEl+xLyCpk2ACPPcEc5ROEKKvuuatCI3fqVyi0PUSZb0Phf0R0kR0h3IO26YSh
         DKrbNu/x+8qnzSUOfnRgFepWIQBXmDa/m4u9ux7TitE0zxjKMfYk4CPYJJCvt9Terb
         mok+77iZ7thAMqx35GHSPPxO8Rew4FohVmu+7ICVpXM40H8xFe0G0m9U7LHudIWzxG
         nwBquQ7no+qz2BAoDiK7XUmzzylmljgK2lge/dm1mFOqt06Y8hEJMIfzPzyzmB0LHh
         /1ZbQNG603XYQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v3 2/6] clk: Introduce devm_clk_hw_register_gate_parent_data()
Date:   Sat, 25 Jun 2022 03:32:31 +0200
Message-Id: <20220625013235.710346-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625013235.710346-1-marex@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add an API for clock gate that uses parent_data for the parent instead of
a string parent_name.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
---
V3: New patch
---
 include/linux/clk-provider.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1f5dff4507812..4d9212b0f571f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -570,6 +570,25 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+
+/**
+ * devm_clk_hw_register_gate - register a gate clock with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
+					      reg, bit_idx, clk_gate_flags,   \
+					      lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
+				    (parent_data), (flags), (reg), (bit_idx), \
+				    (clk_gate_flags), (lock))
+
 void clk_unregister_gate(struct clk *clk);
 void clk_hw_unregister_gate(struct clk_hw *hw);
 int clk_gate_is_enabled(struct clk_hw *hw);
-- 
2.35.1

