Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@linaro.org, sboyd@codeaurora.org
Cc: dianders@chromium.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Alex Elder <elder@linaro.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Max Filippov <jcmvbkbc@gmail.com>, kernel@pengutronix.de,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Chao Xie <chao.xie@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Andrew Bresticker <abrestic@chromium.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Georgi Djakov <georgi.djakov@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Barry Song <baohua@kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Viresh Kumar <viresh.linux@gmail.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
	emilio@elopez.com.ar, Peter De Schrijver <pdeschrijver@nvidia.com>,
	Tero Kristo <t-kristo@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v3 2/2] clk: prevent orphan clocks from being used
Date: Wed, 22 Apr 2015 22:53:06 +0200
Message-Id: <1429735986-18592-3-git-send-email-heiko@sntech.de>
In-Reply-To: <1429735986-18592-1-git-send-email-heiko@sntech.de>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Orphan clocks or children of orphan clocks don't have rate information at
all and can produce strange results if they're allowed to be used and the
parent becomes available later on.

So using the newly introduced orphan status bit defer
__of_clk_get_from_provider calls for orphan clocks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alex Elder <elder@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: kernel@pengutronix.de
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Chao Xie <chao.xie@marvell.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Barry Song <baohua@kernel.org>
Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Viresh Kumar <viresh.linux@gmail.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: emilio@elopez.com.ar
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Michal Simek <michal.simek@xilinx.com>
---
 drivers/clk/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 341904f..27d2d4b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2226,6 +2226,14 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 }
 EXPORT_SYMBOL_GPL(clk_is_match);
 
+static bool clk_is_orphan(const struct clk *clk)
+{
+	if (!clk)
+		return false;
+
+	return clk->core->orphan;
+}
+
 /**
  * __clk_init - initialize the data structures in a struct clk
  * @dev:	device initializing this clk, placeholder for now
@@ -2968,6 +2976,11 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 		if (provider->node == clkspec->np)
 			clk = provider->get(clkspec, provider->data);
 		if (!IS_ERR(clk)) {
+			if (clk_is_orphan(clk)) {
+				clk = ERR_PTR(-EPROBE_DEFER);
+				break;
+			}
+
 			clk = __clk_create_clk(__clk_get_hw(clk), dev_id,
 					       con_id);
 
-- 
2.1.4

