Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580BCC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 18 Nov 2022 01:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240936AbiKRBoO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 20:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbiKRBoN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 20:44:13 -0500
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D891473B98;
        Thu, 17 Nov 2022 17:44:12 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8B7A824E047;
        Fri, 18 Nov 2022 09:06:39 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:39 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:38 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 14/14] clk: starfive: jh71x0: Don't register aux devices if JH7110 reset is disabled
Date:   Fri, 18 Nov 2022 09:06:27 +0800
Message-ID: <20221118010627.70576-15-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118010627.70576-1-hal.feng@starfivetech.com>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The JH7110 clock drivers will not register redundant auxiliary
devices if the JH7110 reset auxiliary driver is disabled.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh71x0.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index dda19c6937cb..4e69f56b00cc 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -333,7 +333,7 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
 }
 EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
 
-#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
+#if IS_ENABLED(CONFIG_RESET_STARFIVE_JH7110)
 
 static void jh7110_reset_unregister_adev(void *_adev)
 {
@@ -384,4 +384,13 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 }
 EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
 
+#else /* !CONFIG_RESET_STARFIVE_JH7110 */
+
+int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
+				     const char *adev_name,
+				     u32 adev_id)
+{
+	return 0;
+}
+
 #endif
-- 
2.38.1

