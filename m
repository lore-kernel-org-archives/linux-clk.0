Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F91DC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889D861181
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbhJOOz6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240676AbhJOOz5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 10:55:57 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 65874C061765;
        Fri, 15 Oct 2021 07:53:51 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc9963.dip0.t-ipconnect.de [87.188.153.99])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 61AD148E45F;
        Fri, 15 Oct 2021 14:53:50 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 5/9] clk: cs2000-cp: Make aux output function controllable
Date:   Fri, 15 Oct 2021 16:53:22 +0200
Message-Id: <20211015145326.1018458-6-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015145326.1018458-1-daniel@zonque.org>
References: <20211015145326.1018458-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The aux output pin can be configured to output either of the two clock
inputs, the generated clock or the pll lock status. Allow access to
this feature through a new optional device-tree property.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 92bc4aca0f95..db7290621cef 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -39,6 +39,8 @@
 /* DEVICE_CFG1 */
 #define RSEL(x)		(((x) & 0x3) << 3)
 #define RSEL_MASK	RSEL(0x3)
+#define AUXOUTSRC(x)	(((x) & 0x3) << 1)
+#define AUXOUTSRC_MASK	AUXOUTSRC(0x3)
 #define ENDEV1		(0x1)
 
 /* DEVICE_CFG2 */
@@ -421,12 +423,19 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	struct clk_init_data init;
 	const char *name = np->name;
 	static const char *parent_names[CLK_MAX];
+	u32 aux_out = 0;
 	int ch = 0; /* it uses ch0 only at this point */
 	int rate;
 	int ret;
 
 	of_property_read_string(np, "clock-output-names", &name);
 
+	of_property_read_u32(np, "cirrus,aux-output-source", &aux_out);
+	ret = cs2000_bset(priv, DEVICE_CFG1,
+			  AUXOUTSRC_MASK, AUXOUTSRC(aux_out));
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * set default rate as 1/1.
 	 * otherwise .set_rate which setup ratio
-- 
2.31.1

