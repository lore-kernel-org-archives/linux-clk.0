Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53BEC48BCD
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 08:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0E276128A
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 08:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbhFIIDx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jun 2021 04:03:53 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50751 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237471AbhFIIDl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jun 2021 04:03:41 -0400
Received: (Authenticated sender: clement.leger@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6005260014;
        Wed,  9 Jun 2021 08:01:45 +0000 (UTC)
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: at91: fix count of periph clocks passed to pmc_data_allocate
Date:   Wed,  9 Jun 2021 10:01:44 +0200
Message-Id: <20210609080145.44226-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When allocating clk_hw structure, only the periph32 clocks are considered.
Since sama5d2_periphck are also added to the phws there is currently an
out of bound write. Fix this by adding the count of periphck to periph32ck.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/clk/at91/sama5d2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 3d1f78176c3e..663b73a032ee 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -170,7 +170,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 
 	sama5d2_pmc = pmc_data_allocate(PMC_AUDIOPLLCK + 1,
 					nck(sama5d2_systemck),
-					nck(sama5d2_periph32ck),
+					nck(sama5d2_periphck) + nck(sama5d2_periph32ck),
 					nck(sama5d2_gck), 3);
 	if (!sama5d2_pmc)
 		return;
-- 
2.32.0

