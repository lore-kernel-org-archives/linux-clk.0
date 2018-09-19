Return-Path: <andy.tang@nxp.com>
From: andy.tang@nxp.com
To: mturquette@baylibre.com,
	oss@buserror.net
Cc: sboyd@kernel.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH 3/3] clk: qoriq: add t1023 soc support
Date: Wed, 19 Sep 2018 15:39:06 +0800
Message-Id: <20180919073906.34187-3-andy.tang@nxp.com>
In-Reply-To: <20180919073906.34187-2-andy.tang@nxp.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
 <20180919073906.34187-2-andy.tang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

From: Yuantian Tang <andy.tang@nxp.com>

Add t1023 clock compatible string to support t1023 soc.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
 drivers/clk/clk-qoriq.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 3a1812f..b43df2a 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1424,6 +1424,7 @@ static void __init clockgen_init(struct device_node *np)
 CLK_OF_DECLARE(qoriq_clockgen_ls1046a, "fsl,ls1046a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1088a, "fsl,ls1088a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls2080a, "fsl,ls2080a-clockgen", clockgen_init);
+CLK_OF_DECLARE(qoriq_clockgen_t1023, "fsl,t1023-clockgen", clockgen_init);
 
 /* Legacy nodes */
 CLK_OF_DECLARE(qoriq_sysclk_1, "fsl,qoriq-sysclk-1.0", sysclk_init);
-- 
1.7.1
