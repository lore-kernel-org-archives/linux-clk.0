Return-Path: <tomeu.vizoso@gmail.com>
Return-Path: <tomeu.vizoso@gmail.com>
Sender: Tomeu Vizoso <tomeu.vizoso@gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?St=C3=A9phane=20Marchesin?= <stephane.marchesin@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexander Holler <holler@ahsoftware.de>,
	Grant Likely <grant.likely@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/21] clk: Probe clk providers on demand
Date: Mon, 25 May 2015 16:53:21 +0200
Message-Id: <1432565608-26036-18-git-send-email-tomeu.vizoso@collabora.com>
In-Reply-To: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

When looking up a clk through its DT node, ensure that the corresponding
device has been registered.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5b0f418..f9e8a8d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -18,6 +18,7 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/sched.h>
@@ -2985,6 +2986,8 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 	if (!clkspec)
 		return ERR_PTR(-EINVAL);
 
+	of_platform_device_ensure(clkspec->np);
+
 	/* Check if we have such a provider in our array */
 	mutex_lock(&of_clk_mutex);
 	list_for_each_entry(provider, &of_clk_providers, link) {
-- 
2.4.1
