Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Luc Verhaegen <libv@skynet.be>,
	Hans de Goede <hdegoede@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	David Herrmann <dh.herrmann@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 6/7] simplefb: Include clk.h
Date: Fri, 10 Jul 2015 16:03:28 -0700
Message-Id: <1436569409-27964-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This driver uses the consumer API, so include clk.h explicitly
instead of impliclty through the provider API.

Cc: Luc Verhaegen <libv@skynet.be>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: David Herrmann <dh.herrmann@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through clk-tree.

 drivers/video/fbdev/simplefb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 1085c0432158..52c5c7e63b52 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of_platform.h>
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

