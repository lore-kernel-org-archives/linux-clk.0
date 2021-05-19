Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA985C433B4
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 20:16:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D3C66135A
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 20:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhESUR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 16:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbhESURZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 16:17:25 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9D07EC06175F;
        Wed, 19 May 2021 13:16:05 -0700 (PDT)
Received: from hq-00021.Speedport_W_724V_01011603_07_002 (p200300d83f181d7939130a2764e31627.dip0.t-ipconnect.de [IPv6:2003:d8:3f18:1d79:3913:a27:64e3:1627])
        by mail.bugwerft.de (Postfix) with ESMTPSA id E24234E4070;
        Wed, 19 May 2021 20:16:00 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 3/3] clk: cs2000-cp: Make aux output function controllable
Date:   Wed, 19 May 2021 22:15:51 +0200
Message-Id: <20210519201551.690654-4-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519201551.690654-1-daniel@zonque.org>
References: <20210519201551.690654-1-daniel@zonque.org>
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

