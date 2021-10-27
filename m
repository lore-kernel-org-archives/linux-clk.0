Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D9AC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 13:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A626610C8
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 13:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhJ0N2v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Oct 2021 09:28:51 -0400
Received: from gloria.sntech.de ([185.11.138.130]:46574 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242133AbhJ0N2u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Oct 2021 09:28:50 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mfiwf-0003TD-5O; Wed, 27 Oct 2021 15:26:21 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org
Cc:     sboyd@kernel.org, kernel@esmil.dk, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, heiko@sntech.de
Subject: [PATCH 1/2] Revert "clk: rockchip: use module_platform_driver_probe"
Date:   Wed, 27 Oct 2021 15:26:15 +0200
Message-Id: <20211027132616.1039814-2-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027132616.1039814-1-heiko@sntech.de>
References: <20211027132616.1039814-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This reverts commit 1da80da028fe5accb866c0d6899a292ed86bef45.

Reading recent discussions [0] [1], I realized this change introduces
a number of problems:

- only converting to module_platform_driver creates the issue
  with the existing __init and __initdata attributes.

  When the driver would've been built as a module, all the missing
  clock-definitions (all are initdata) should've turned up as error
  in testing suggesting that the change wasn't at all

- a clock driver is a very core component of soc bringup and making
  this able to be built as a module solely for enabling the soc vendor
  to add out of tree changes for Android implementations is not in our
  interest and also everything except a ramdisk won't probe without a
  clock controller.

  This is especially true when the changes aren't really tested and
  are merely added to move the mainline driver "out of the way".

[0] https://lwn.net/Articles/872209/
[1] https://lore.kernel.org/all/163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com/

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3399.c | 2 +-
 drivers/clk/rockchip/clk-rk3568.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 7924598747b6..53ed5cca335b 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1656,7 +1656,7 @@ static struct platform_driver clk_rk3399_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-module_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
+builtin_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
 
 MODULE_DESCRIPTION("Rockchip RK3399 Clock Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 939e7079c334..75ca855e720d 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1719,7 +1719,7 @@ static struct platform_driver clk_rk3568_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-module_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
+builtin_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
 
 MODULE_DESCRIPTION("Rockchip RK3568 Clock Driver");
 MODULE_LICENSE("GPL");
-- 
2.30.2

