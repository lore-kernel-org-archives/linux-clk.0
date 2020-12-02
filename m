Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A81C64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 10:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AFF122202
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 10:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgLBKgF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 05:36:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:39792 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbgLBKgF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 05:36:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3FFA0AB7F;
        Wed,  2 Dec 2020 10:35:23 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: bcm: dvp: Add MODULE_DEVICE_TABLE()
Date:   Wed,  2 Dec 2020 11:35:18 +0100
Message-Id: <20201202103518.21889-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MODULE_DEVICE_TABLE() so as to be able to use the driver as a
module. More precisely, for the driver to be loaded automatically at
boot.

Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/clk/bcm/clk-bcm2711-dvp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
index 8333e20dc9d2..69e2f85f7029 100644
--- a/drivers/clk/bcm/clk-bcm2711-dvp.c
+++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
@@ -108,6 +108,7 @@ static const struct of_device_id clk_dvp_dt_ids[] = {
 	{ .compatible = "brcm,brcm2711-dvp", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, clk_dvp_dt_ids);
 
 static struct platform_driver clk_dvp_driver = {
 	.probe	= clk_dvp_probe,
-- 
2.29.2

