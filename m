Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4862C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 13:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E04960041
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 13:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242132AbhJ0N2y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Oct 2021 09:28:54 -0400
Received: from gloria.sntech.de ([185.11.138.130]:46576 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242131AbhJ0N2v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Oct 2021 09:28:51 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mfiwf-0003TD-EJ; Wed, 27 Oct 2021 15:26:21 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org
Cc:     sboyd@kernel.org, kernel@esmil.dk, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, heiko@sntech.de
Subject: [PATCH 2/2] clk: rockchip: drop module parts from rk3399 and rk3568 drivers
Date:   Wed, 27 Oct 2021 15:26:16 +0200
Message-Id: <20211027132616.1039814-3-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027132616.1039814-1-heiko@sntech.de>
References: <20211027132616.1039814-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Both of these drivers were converted to real drivers and got a tristate
build option. But them being builtin_platform_drivers, they only ever
should be build-in - as the name suggests.

So adapt the Kconfig symbol and drop the MODULE_* parts from the drivers.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/Kconfig      | 4 ++--
 drivers/clk/rockchip/clk-rk3399.c | 4 ----
 drivers/clk/rockchip/clk-rk3568.c | 4 ----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 2dfd6a383393..3067bdb6e119 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -80,14 +80,14 @@ config CLK_RK3368
 	  Build the driver for RK3368 Clock Driver.
 
 config CLK_RK3399
-	tristate "Rockchip RK3399 clock controller support"
+	bool "Rockchip RK3399 clock controller support"
 	depends on ARM64 || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3399 Clock Driver.
 
 config CLK_RK3568
-	tristate "Rockchip RK3568 clock controller support"
+	bool "Rockchip RK3568 clock controller support"
 	depends on ARM64 || COMPILE_TEST
 	default y
 	help
diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 53ed5cca335b..306910a3a0d3 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1630,7 +1630,6 @@ static const struct of_device_id clk_rk3399_match_table[] = {
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, clk_rk3399_match_table);
 
 static int __init clk_rk3399_probe(struct platform_device *pdev)
 {
@@ -1657,6 +1656,3 @@ static struct platform_driver clk_rk3399_driver = {
 	},
 };
 builtin_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
-
-MODULE_DESCRIPTION("Rockchip RK3399 Clock Driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 75ca855e720d..69a9e8069a48 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1693,7 +1693,6 @@ static const struct of_device_id clk_rk3568_match_table[] = {
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, clk_rk3568_match_table);
 
 static int __init clk_rk3568_probe(struct platform_device *pdev)
 {
@@ -1720,6 +1719,3 @@ static struct platform_driver clk_rk3568_driver = {
 	},
 };
 builtin_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
-
-MODULE_DESCRIPTION("Rockchip RK3568 Clock Driver");
-MODULE_LICENSE("GPL");
-- 
2.30.2

