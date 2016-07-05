Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 6/8] clk: core: Avoid double initialization of clocks
Date: Tue,  5 Jul 2016 18:23:32 +0200
Message-Id: <1467735814-23518-9-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Some clock providers can be initialized via of_clk_init() and also via
platform device probe.

Avoid double initialization of them by setting the OF_POPULATED flag.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/clk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 820a939fb6bb..f0403b87f468 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3451,6 +3451,10 @@ void __init of_clk_init(const struct of_device_id *matches)
 					&clk_provider_list, node) {
 			if (force || parent_ready(clk_provider->np)) {
 
+				/* Don't populate platform devices */
+				of_node_set_flag(clk_provider->np,
+						 OF_POPULATED);
+
 				clk_provider->clk_init_cb(clk_provider->np);
 				of_clk_set_defaults(clk_provider->np, true);
 
-- 
2.8.1
