Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Punit Agrawal <punit.agrawal@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 4/8] clk: scpi: add support for cpufreq virtual device
Date: Thu, 23 Jul 2015 12:10:24 +0100
Message-Id: <1437649828-14540-5-git-send-email-sudeep.holla@arm.com>
In-Reply-To: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com>
References: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The clocks for the CPUs are provided by SCP and are managed by this
clock driver. So the cpufreq device needs to be added only after the
clock get registered and removed when this driver is unloaded.

This patch manages the cpufreq virtual device based on the clock
availability.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 3ce4b34a4128..b76db39ca671 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -34,6 +34,8 @@ struct scpi_clk {
 
 #define to_scpi_clk(clk) container_of(clk, struct scpi_clk, hw)
 
+static struct platform_device *cpufreq_dev;
+
 static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
 {
@@ -263,6 +265,11 @@ static int scpi_clocks_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *child, *np = dev->of_node;
 
+	if (cpufreq_dev) {
+		platform_device_unregister(cpufreq_dev);
+		cpufreq_dev = NULL;
+	}
+
 	for_each_available_child_of_node(np, child)
 		of_clk_del_provider(np);
 	return 0;
@@ -288,6 +295,12 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 			return ret;
 		}
 	}
+	/* Add the virtual cpufreq device */
+	cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
+						      -1, NULL, 0);
+	if (!cpufreq_dev)
+		pr_warn("unable to register cpufreq device");
+
 	return 0;
 }
 
-- 
1.9.1

