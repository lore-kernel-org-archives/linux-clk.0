Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v9 3/3] clk: qcom: Always add factor clock for xo clocks
Date: Wed,  2 Nov 2016 17:56:58 +0200
Message-Id: <20161102155658.32203-4-georgi.djakov@linaro.org>
In-Reply-To: <20161102155658.32203-1-georgi.djakov@linaro.org>
References: <20161102155658.32203-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Currently the RPM/RPM-SMD clock drivers do not register the xo clocks,
so we should always add factor clock. When we later add xo clocks support
into the drivers, we should update this function to skip registration.
By doing so we avoid any DT dependencies.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/common.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index fffcbaf0fba7..27566a0098ca 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -153,15 +153,12 @@ int qcom_cc_register_board_clk(struct device *dev, const char *path,
 			       const char *name, unsigned long rate)
 {
 	bool add_factor = true;
-	struct device_node *node;
-
-	/* The RPM clock driver will add the factor clock if present */
-	if (IS_ENABLED(CONFIG_QCOM_RPMCC)) {
-		node = of_find_compatible_node(NULL, NULL, "qcom,rpmcc");
-		if (of_device_is_available(node))
-			add_factor = false;
-		of_node_put(node);
-	}
+
+	/*
+	 * TODO: The RPM clock driver currently does not support the xo clock.
+	 * When xo is added to the RPM clock driver, we should change this
+	 * function to skip registration of xo factor clocks.
+	 */
 
 	return _qcom_cc_register_board_clk(dev, path, name, rate, add_factor);
 }
