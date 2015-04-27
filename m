Return-Path: <sudeep.holla@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] clk: scpi: add support for cpufreq virtual device
Date: Mon, 27 Apr 2015 12:40:45 +0100
Message-Id: <1430134846-24320-4-git-send-email-sudeep.holla@arm.com>
In-Reply-To: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

The clocks for the CPUs are provided by SCP and are managed by this
clock driver. So the cpufreq device needs to be added only after the
clock get registered and removed when this driver is unloaded.

This patch manages the cpufreq virtual device based on the clock
availability.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 70a2d57da32d..0c048f7d0c28 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -37,6 +37,7 @@ struct scpi_clk {
 #define to_scpi_clk(clk) container_of(clk, struct scpi_clk, hw)
 
 static struct scpi_ops *scpi_ops;
+static struct platform_device *cpufreq_dev;
 
 static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
@@ -270,11 +271,23 @@ static int scpi_clk_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, clk_data);
 
+	if (clk_ops_init == scpi_dvfs_ops_init) {
+		/* Add virtual cpufreq device depending SCPI clock */
+		cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
+							      -1, NULL, 0);
+		if (!cpufreq_dev)
+			pr_warn("unable to register cpufreq device");
+	}
 	return 0;
 }
 
 static int scpi_clk_remove(struct platform_device *pdev)
 {
+	if (cpufreq_dev) {
+		platform_device_unregister(cpufreq_dev);
+		cpufreq_dev = NULL;
+	}
+
 	of_clk_del_provider(pdev->dev.of_node);
 	platform_set_drvdata(pdev, NULL);
 	return 0;
-- 
1.9.1
