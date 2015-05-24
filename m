Return-Path: <bintian.wang@huawei.com>
From: Bintian Wang <bintian.wang@huawei.com>
To: <mturquette@linaro.org>, <sboyd@codeaurora.org>, <zhangfei.gao@linaro.org>,
        <xuwei5@hisilicon.com>, <xuejiancheng@huawei.com>,
        <tomeu.vizoso@collabora.com>, <sledge.yanwei@huawei.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arnd@arndb.de>, <will.deacon@arm.com>, <robh+dt@kernel.org>,
        <khilman@linaro.org>, <mark.rutland@arm.com>,
        <catalin.marinas@arm.com>, <haojian.zhuang@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <olof@lixom.net>,
        <yanhaifeng@gmail.com>, <linux@arm.linux.org.uk>,
        <guodong.xu@linaro.org>, <jorge.ramirez-ortiz@linaro.org>,
        <tyler.baker@linaro.org>, <khilman@kernel.org>
CC: <xuyiping@hisilicon.com>, <wangbinghui@hisilicon.com>,
        <zhenwei.wang@hisilicon.com>, <victor.lixin@hisilicon.com>,
        <puck.chen@hisilicon.com>, <dan.zhao@hisilicon.com>,
        <huxinwei@huawei.com>, <bintian.wang@huawei.com>,
        <z.liuxinliang@huawei.com>, <heyunlei@huawei.com>,
        <kong.kongxinwei@hisilicon.com>, <wangbintian@gmail.com>,
        <w.f@huawei.com>, <liguozhu@hisilicon.com>
Subject: [PATCH v8 4/7] clk: hisilicon: Remove __init for marking function prototypes
Date: Sun, 24 May 2015 12:11:09 +0800
Message-ID: <1432440671-25235-1-git-send-email-bintian.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

__init markings on function prototypes are useless, so remove
them.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
---
 drivers/clk/hisilicon/clk.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 31083ff..6b6f994 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -95,17 +95,17 @@ struct clk *hisi_register_clkgate_sep(struct device *, const char *,
 				void __iomem *, u8,
 				u8, spinlock_t *);
 
-struct hisi_clock_data __init *hisi_clk_init(struct device_node *, int);
-void __init hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *,
-					int, struct hisi_clock_data *);
-void __init hisi_clk_register_fixed_factor(struct hisi_fixed_factor_clock *,
-					int, struct hisi_clock_data *);
-void __init hisi_clk_register_mux(struct hisi_mux_clock *, int,
+struct hisi_clock_data *hisi_clk_init(struct device_node *, int);
+void hisi_clk_register_fixed_rate(struct hisi_fixed_rate_clock *,
+				int, struct hisi_clock_data *);
+void hisi_clk_register_fixed_factor(struct hisi_fixed_factor_clock *,
+				int, struct hisi_clock_data *);
+void hisi_clk_register_mux(struct hisi_mux_clock *, int,
 				struct hisi_clock_data *);
-void __init hisi_clk_register_divider(struct hisi_divider_clock *,
+void hisi_clk_register_divider(struct hisi_divider_clock *,
+				int, struct hisi_clock_data *);
+void hisi_clk_register_gate(struct hisi_gate_clock *,
+				int, struct hisi_clock_data *);
+void hisi_clk_register_gate_sep(struct hisi_gate_clock *,
 				int, struct hisi_clock_data *);
-void __init hisi_clk_register_gate(struct hisi_gate_clock *,
-					int, struct hisi_clock_data *);
-void __init hisi_clk_register_gate_sep(struct hisi_gate_clock *,
-					int, struct hisi_clock_data *);
 #endif	/* __HISI_CLK_H */
-- 
1.9.1
