Return-Path: <ben@smart-cactus.org>
From: Ben Gamari <ben@smart-cactus.org>
To: Thomas Abraham <thomas.ab@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>,
	Lukasz Majewski <l.majewski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Kevin Hilman <khilman@linaro.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Anand Moon <linux.amoon@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	b.zolnierkie@samsung.com,
	Ben Gamari <ben@smart-cactus.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 10/12] cpufreq: arm-big-little: accept operating-points-v2 nodes
Date: Wed,  2 Dec 2015 22:19:25 +0100
Message-Id: <1449091167-20758-11-git-send-email-ben@smart-cactus.org>
In-Reply-To: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
References: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
List-ID: <linux-clk.vger.kernel.org>

The arm_big_little cpufreq driver can use operating points from
operating-points-v2 nodes without any trouble.

Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Ben Gamari <ben@smart-cactus.org>
---
 drivers/cpufreq/arm_big_little_dt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/arm_big_little_dt.c b/drivers/cpufreq/arm_big_little_dt.c
index 16ddeef..be7f632 100644
--- a/drivers/cpufreq/arm_big_little_dt.c
+++ b/drivers/cpufreq/arm_big_little_dt.c
@@ -35,12 +35,16 @@ static struct device_node *get_cpu_node_with_valid_op(int cpu)
 {
 	struct device_node *np = of_cpu_device_node_get(cpu);
 
-	if (!of_get_property(np, "operating-points", NULL)) {
-		of_node_put(np);
-		np = NULL;
+	if (of_get_property(np, "operating-points-v2", NULL)) {
+		return np;
 	}
 
-	return np;
+	if (of_get_property(np, "operating-points", NULL)) {
+		return np;
+	}
+
+	of_node_put(np);
+	return NULL;
 }
 
 static int dt_init_opp_table(struct device *cpu_dev)
-- 
2.6.2
