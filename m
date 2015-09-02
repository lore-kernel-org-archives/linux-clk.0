Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Leo Yan <leo.yan@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] clk: Hi6220: separately build stub clock driver
Date: Wed,  2 Sep 2015 10:57:47 +0800
Message-Id: <1441162667-25532-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The previous code, kernel builds Hi6220's common clock driver and stub
clock driver together. Stub clock driver has introduced the dependency
with CONFIG_MAILBOX, so kernel will not build Hi6220's common clock
driver due ARM64's defconfig have not enabled CONFIG_MAILBOX by default.

So separately build stub clock driver and common clock driver for
Hi6220; and only let stub clock driver has the dependency with
CONFIG_MAILBOX.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/clk/hisilicon/Kconfig  | 8 +++++++-
 drivers/clk/hisilicon/Makefile | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index 2c16807..e434854 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -1,6 +1,12 @@
 config COMMON_CLK_HI6220
 	bool "Hi6220 Clock Driver"
-	depends on (ARCH_HISI || COMPILE_TEST) && MAILBOX
+	depends on ARCH_HISI || COMPILE_TEST
 	default ARCH_HISI
 	help
 	  Build the Hisilicon Hi6220 clock driver based on the common clock framework.
+
+config STUB_CLK_HI6220
+	bool "Hi6220 Stub Clock Driver"
+	depends on COMMON_CLK_HI6220 && MAILBOX
+	help
+	  Build the Hisilicon Hi6220 stub clock driver.
diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 4a1001a..74dba31 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -7,4 +7,5 @@ obj-y	+= clk.o clkgate-separated.o clkdivider-hi6220.o
 obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
 obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
 obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
-obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o clk-hi6220-stub.o
+obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
+obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
-- 
1.9.1

