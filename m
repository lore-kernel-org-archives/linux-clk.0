Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1976C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 12 Nov 2022 21:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbiKLVuk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Nov 2022 16:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiKLVuk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Nov 2022 16:50:40 -0500
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Nov 2022 13:50:39 PST
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9876F9FD0
        for <linux-clk@vger.kernel.org>; Sat, 12 Nov 2022 13:50:39 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id tyHJoEBHyu8pltyHKom6SK; Sat, 12 Nov 2022 22:43:07 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 12 Nov 2022 22:43:07 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] clk: Remove a useless include
Date:   Sat, 12 Nov 2022 22:43:03 +0100
Message-Id: <12dd5cb49efa7714f8e0389e4c7b3bc829e8a90e.1668289299.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

<linux/rational.h> is not needed for these drivers. Remove the
corresponding #include.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/clk-versaclock5.c | 1 -
 drivers/clk/meson/clk-pll.c   | 1 -
 drivers/clk/rockchip/clk.c    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 88689415aff9..e9737969170e 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/rational.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9e55617bc3b4..4b96e1590224 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -32,7 +32,6 @@
 #include <linux/io.h>
 #include <linux/math64.h>
 #include <linux/module.h>
-#include <linux/rational.h>
 
 #include "clk-regmap.h"
 #include "clk-pll.h"
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index e63d4f20b479..398c427b8e81 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -21,7 +21,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/reboot.h>
-#include <linux/rational.h>
 
 #include "../clk-fractional-divider.h"
 #include "clk.h"
-- 
2.34.1

