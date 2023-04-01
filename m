Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DA4C6FD1D
	for <linux-clk@archiver.kernel.org>; Sat,  1 Apr 2023 11:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjDALTs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Apr 2023 07:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjDALTr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Apr 2023 07:19:47 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0D71F7B3;
        Sat,  1 Apr 2023 04:19:45 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 67A8424DF03;
        Sat,  1 Apr 2023 19:19:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 1 Apr
 2023 19:19:44 +0800
Received: from ubuntu.localdomain (113.72.144.76) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 1 Apr
 2023 19:19:43 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 07/22] reset: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
Date:   Sat, 1 Apr 2023 19:19:19 +0800
Message-ID: <20230401111934.130844-8-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230401111934.130844-1-hal.feng@starfivetech.com>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Using ARCH_FOO symbol is preferred than SOC_FOO.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 2a52c990d4fe..6ae5aa46a6b2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -234,8 +234,8 @@ config RESET_SOCFPGA
 
 config RESET_STARFIVE_JH7100
 	bool "StarFive JH7100 Reset Driver"
-	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
 
-- 
2.38.1

