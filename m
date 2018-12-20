Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E9CC43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 08:54:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B21E21741
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 08:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru header.b="NM25XlIw";
	dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru header.b="NM25XlIw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbeLTIyr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 03:54:47 -0500
Received: from fallback15.mail.ru ([94.100.179.50]:47276 "EHLO
        fallback15.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbeLTIyq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Dec 2018 03:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=ooYZ1B7W2a4ovmkNuiO5CwR0TxAudjQNbsxD0QTgyPI=;
        b=NM25XlIwVBwKlwm4idV5OeR/Ln4Z2+eCqMxQ9dd+YAZbausovgDpca3hprDa+ShU8R6jtMzgild9dbTXSGnYcMoWI/X62e7Bq/hpPczjx5UF5ZAAB8h5dsNyWzjUeAay2AoKeY0AMXlczSYIPK21+NuzljEyJpvMH8Q19al9dC0=;
Received: from [10.161.64.40] (port=36254 helo=smtp32.i.mail.ru)
        by fallback15.m.smailru.net with esmtp (envelope-from <shc_work@mail.ru>)
        id 1gZu6N-0001on-JP; Thu, 20 Dec 2018 11:54:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=ooYZ1B7W2a4ovmkNuiO5CwR0TxAudjQNbsxD0QTgyPI=;
        b=NM25XlIwVBwKlwm4idV5OeR/Ln4Z2+eCqMxQ9dd+YAZbausovgDpca3hprDa+ShU8R6jtMzgild9dbTXSGnYcMoWI/X62e7Bq/hpPczjx5UF5ZAAB8h5dsNyWzjUeAay2AoKeY0AMXlczSYIPK21+NuzljEyJpvMH8Q19al9dC0=;
Received: by smtp32.i.mail.ru with esmtpa (envelope-from <shc_work@mail.ru>)
        id 1gZu6K-0002bS-Hz; Thu, 20 Dec 2018 11:54:40 +0300
From:   Alexander Shiyan <shc_work@mail.ru>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] clk: clps711x: Remove board support
Date:   Thu, 20 Dec 2018 11:54:33 +0300
Message-Id: <20181220085433.20334-1-shc_work@mail.ru>
X-Mailer: git-send-email 2.13.0
X-77F55803: CF41D5CA8C6D3C0C7F9F52485CB584D75945EECDF71DA5B37DBBC195D3F4FC2C7C780E75A55AEA6049E34F6AE044F2FADDDE7B70B5F5C79F
X-7FA49CB5: 0D63561A33F958A5039243E9787F2CEF76AA775A4E8CB69DF93498156F4636ED8941B15DA834481FA18204E546F3947C062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B8C7ADC89C2F0B2A5A471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249CD9A2A404A1390E33AA81AA40904B5D9CF19DD082D7633A0E7DDDDC251EA7DABD81D268191BDAD3D78DA827A17800CE7E30F873561A58086CD04E86FAF290E2D40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE7C3515D608D4D9D342B5824380A63D68A75ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57285124B2A10EEC6C00306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 8261CADE3D3FA0B4C2F1292954F703E9BB2C92B2984A419001A8FA16A42CFEAB42E901357F55D1266B3B2BD4812BFD4DC77752E0C033A69E93554C27080790AB3B25A7FBAAF806F0AE208404248635DF
X-Mras: OK
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDCF8B716E8E824F8BEF5EAF8AC377DA418A39547B9C8AD7068481D5B74BBEA6065
X-7FA49CB5: 0D63561A33F958A5F38ECD57700C52C82675AC5A14C5CE8EA9538AC256E1F3048941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F05F538519369F3743B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: A5480F10D64C9005ECC5D0D0AB7E92B50D67D2A7E77ED553F5EAF8AC377DA418BE4EBEF89FC7D6FA3786569BE0651809D50E20E2BC48EF5AFF3C6AF3E48A3A73EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: OK
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since board support for the CLPS711X platform was removed,
remove the board support from the clk-clps711x driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/clk/clk-clps711x.c | 61 +++++++++-------------------------------------
 1 file changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/clk-clps711x.c b/drivers/clk/clk-clps711x.c
index 2c04396402ab..c36c47bdba02 100644
--- a/drivers/clk/clk-clps711x.c
+++ b/drivers/clk/clk-clps711x.c
@@ -44,21 +44,21 @@ struct clps711x_clk {
 	struct clk_hw_onecell_data	clk_data;
 };
 
-static struct clps711x_clk * __init _clps711x_clk_init(void __iomem *base,
-						       u32 fref)
+static void __init clps711x_clk_init_dt(struct device_node *np)
 {
-	u32 tmp, f_cpu, f_pll, f_bus, f_tim, f_pwm, f_spi;
+	u32 tmp, f_cpu, f_pll, f_bus, f_tim, f_pwm, f_spi, fref = 0;
 	struct clps711x_clk *clps711x_clk;
-	unsigned i;
+	void __iomem *base;
+
+	WARN_ON(of_property_read_u32(np, "startup-frequency", &fref));
 
-	if (!base)
-		return ERR_PTR(-ENOMEM);
+	base = of_iomap(np, 0);
+	BUG_ON(!base);
 
 	clps711x_clk = kzalloc(struct_size(clps711x_clk, clk_data.hws,
 					   CLPS711X_CLK_MAX),
 			       GFP_KERNEL);
-	if (!clps711x_clk)
-		return ERR_PTR(-ENOMEM);
+	BUG_ON(!clps711x_clk);
 
 	spin_lock_init(&clps711x_clk->lock);
 
@@ -137,52 +137,13 @@ static struct clps711x_clk * __init _clps711x_clk_init(void __iomem *base,
 		clk_hw_register_fixed_factor(NULL, "uart", "bus", 0, 1, 10);
 	clps711x_clk->clk_data.hws[CLPS711X_CLK_TICK] =
 		clk_hw_register_fixed_rate(NULL, "tick", NULL, 0, 64);
-	for (i = 0; i < CLPS711X_CLK_MAX; i++)
-		if (IS_ERR(clps711x_clk->clk_data.hws[i]))
+	for (tmp = 0; tmp < CLPS711X_CLK_MAX; tmp++)
+		if (IS_ERR(clps711x_clk->clk_data.hws[tmp]))
 			pr_err("clk %i: register failed with %ld\n",
-			       i, PTR_ERR(clps711x_clk->clk_data.hws[i]));
-
-	return clps711x_clk;
-}
-
-void __init clps711x_clk_init(void __iomem *base)
-{
-	struct clps711x_clk *clps711x_clk;
-
-	clps711x_clk = _clps711x_clk_init(base, 73728000);
-
-	BUG_ON(IS_ERR(clps711x_clk));
-
-	/* Clocksource */
-	clk_hw_register_clkdev(clps711x_clk->clk_data.hws[CLPS711X_CLK_TIMER1],
-			    NULL, "clps711x-timer.0");
-	clk_hw_register_clkdev(clps711x_clk->clk_data.hws[CLPS711X_CLK_TIMER2],
-			    NULL, "clps711x-timer.1");
-
-	/* Drivers */
-	clk_hw_register_clkdev(clps711x_clk->clk_data.hws[CLPS711X_CLK_PWM],
-			    NULL, "clps711x-pwm");
-	clk_hw_register_clkdev(clps711x_clk->clk_data.hws[CLPS711X_CLK_UART],
-			    NULL, "clps711x-uart.0");
-	clk_hw_register_clkdev(clps711x_clk->clk_data.hws[CLPS711X_CLK_UART],
-			    NULL, "clps711x-uart.1");
-}
-
-#ifdef CONFIG_OF
-static void __init clps711x_clk_init_dt(struct device_node *np)
-{
-	void __iomem *base = of_iomap(np, 0);
-	struct clps711x_clk *clps711x_clk;
-	u32 fref = 0;
-
-	WARN_ON(of_property_read_u32(np, "startup-frequency", &fref));
-
-	clps711x_clk = _clps711x_clk_init(base, fref);
-	BUG_ON(IS_ERR(clps711x_clk));
+			       tmp, PTR_ERR(clps711x_clk->clk_data.hws[tmp]));
 
 	clps711x_clk->clk_data.num = CLPS711X_CLK_MAX;
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
 			       &clps711x_clk->clk_data);
 }
 CLK_OF_DECLARE(clps711x, "cirrus,ep7209-clk", clps711x_clk_init_dt);
-#endif
-- 
2.13.0

