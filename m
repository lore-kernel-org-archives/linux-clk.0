Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3AAC43334
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 01:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbiFYBcy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 21:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbiFYBcy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 21:32:54 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3675645AF3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 18:32:51 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7C4A98442A;
        Sat, 25 Jun 2022 03:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656120767;
        bh=ub8RMPbP0uoe9EccENfCUfkDtaDT3OE/IkQwCT8/y0Q=;
        h=From:To:Cc:Subject:Date:From;
        b=NQmbyZQvnXSrWeD7NWQCuSUnDdXq0n0ftU6TNZIjE5JNBi7ZZa4khbpb38+Varfgy
         z6/N5eUFduqKvCuQdWfsb6yFBH3rtv9RTk17+H4qjV6hx5x7l9aOZeItwp3I04sizn
         39phPxqQt2Y+BcqIX/fErJ70j6FgS1ndockQboX6QlSlzpn+eguETEDtwmdl0uAw6N
         STLrPO18BdwYKfqdy0mhPizTt5evIemrhfhVHP9kHgnC9lUpYG2WMbg9zMUQAVaril
         wqwA6JVzqxqpI/xYfX44GsRE//d+R+UlJoF4YaiMitzH2Z+N1tq2Fvf5/V4aO1mAPQ
         6EOmgAHSRoZWw==
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
Subject: [PATCH v3 1/6] clk: Introduce devm_clk_hw_register_mux_parent_data()
Date:   Sat, 25 Jun 2022 03:32:30 +0200
Message-Id: <20220625013235.710346-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add an API for clock mux that uses parent_data for the parent instead of
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
 include/linux/clk-provider.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8c6ad6ea53e52..1f5dff4507812 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -964,6 +964,13 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 			      (parent_names), NULL, NULL, (flags), (reg),     \
 			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
 			      NULL, (lock))
+#define devm_clk_hw_register_mux_parent_data(dev, name, parent_data,	      \
+					     num_parents, flags, reg, shift,  \
+					     width, clk_mux_flags, lock)      \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      NULL, NULL, (parent_data), (flags), (reg),      \
+			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
+			      NULL, (lock))
 
 int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
 			 unsigned int val);
-- 
2.35.1

