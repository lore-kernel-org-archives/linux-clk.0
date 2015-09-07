Return-Path: <tomeu.vizoso@gmail.com>
Return-Path: <tomeu.vizoso@gmail.com>
Sender: Tomeu Vizoso <tomeu.vizoso@gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 15/22] clk: Probe clk providers on demand
Date: Mon,  7 Sep 2015 14:23:40 +0200
Message-Id: <1441628627-5143-16-git-send-email-tomeu.vizoso@collabora.com>
In-Reply-To: <1441628627-5143-1-git-send-email-tomeu.vizoso@collabora.com>
References: <1441628627-5143-1-git-send-email-tomeu.vizoso@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

When looking up a clock through its OF node, probe it if it hasn't
already.

The goal is to reduce deferred probes to a minimum, as it makes it very
cumbersome to find out why a device failed to probe, and can introduce
very big delays in when a critical device is probed.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 43e2c3ad6c31..e5fe02a11c36 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -19,6 +19,7 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/sched.h>
@@ -3004,6 +3005,8 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 	if (!clkspec)
 		return ERR_PTR(-EINVAL);
 
+	of_device_probe(clkspec->np);
+
 	/* Check if we have such a provider in our array */
 	mutex_lock(&of_clk_mutex);
 	list_for_each_entry(provider, &of_clk_providers, link) {
-- 
2.4.3
