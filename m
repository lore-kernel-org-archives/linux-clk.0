Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jiancheng Xue <xuejiancheng@huawei.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
	<linux@arm.linux.org.uk>, <khilman@linaro.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <xuwei5@hisilicon.com>,
	<haojian.zhuang@linaro.org>, <zhangfei.gao@linaro.org>,
	<bintian.wang@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
	<yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
	<ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
	<zhangzhenxing@hisilicon.com>, <xuejiancheng@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v3 3/7] ARM: hisi: add dt_machine definition for Hi3519
Date: Fri, 11 Dec 2015 15:45:17 +0800
Message-ID: <1449819921-18464-4-git-send-email-xuejiancheng@huawei.com>
In-Reply-To: <1449819921-18464-1-git-send-email-xuejiancheng@huawei.com>
References: <1449819921-18464-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

add dt_machine definition for hi3519.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 arch/arm/mach-hisi/hisilicon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-hisi/hisilicon.c b/arch/arm/mach-hisi/hisilicon.c
index 8cc6215..010d8a2 100644
--- a/arch/arm/mach-hisi/hisilicon.c
+++ b/arch/arm/mach-hisi/hisilicon.c
@@ -81,3 +81,12 @@ static const char *const hip01_compat[] __initconst = {
 DT_MACHINE_START(HIP01, "Hisilicon HIP01 (Flattened Device Tree)")
 	.dt_compat      = hip01_compat,
 MACHINE_END
+
+static const char *const hi3519_compat[] __initconst = {
+	"hisilicon,hi3519",
+	NULL,
+};
+
+DT_MACHINE_START(HI3519_DT, "Hisilicon Hi3519")
+	.dt_compat	= hi3519_compat,
+MACHINE_END
-- 
1.9.1

