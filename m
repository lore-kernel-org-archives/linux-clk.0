Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 4/5] clk: hisilicon: add hisi_clk_unregister_* functions
Date: Wed, 15 Jun 2016 14:26:37 +0800
Message-ID: <1465971998-29619-5-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add hisi_clk_unregister_* functions.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/clk.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 2575329..4e1d1af 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -128,4 +128,25 @@ void hisi_clk_register_gate_sep(const struct hisi_gate_clock *,
 				int, struct hisi_clock_data *);
 void hi6220_clk_register_divider(const struct hi6220_divider_clock *,
 				int, struct hisi_clock_data *);
+
+#define hisi_clk_unregister(type) \
+static inline \
+void hisi_clk_unregister_##type(const struct hisi_##type##_clock *clks, \
+				int nums, struct hisi_clock_data *data) \
+{ \
+	struct clk **clocks = data->clk_data.clks; \
+	int i; \
+	for (i = 0; i < nums; i++) { \
+		int id = clks[i].id; \
+		if (clocks[id])  \
+			clk_unregister_##type(clocks[id]); \
+	} \
+}
+
+hisi_clk_unregister(fixed_rate)
+hisi_clk_unregister(fixed_factor)
+hisi_clk_unregister(mux)
+hisi_clk_unregister(divider)
+hisi_clk_unregister(gate)
+
 #endif	/* __HISI_CLK_H */
-- 
1.9.1
