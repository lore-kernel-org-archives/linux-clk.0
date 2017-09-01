Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: tegra: Add sor1_out clock
Date: Fri,  1 Sep 2017 16:53:40 +0200
Message-Id: <20170901145343.19890-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The sor1_src clock implemented on Tegra210 is modelled the wrong way
around, which causes some issues with HDMI and DP support. This clock
implementation is provided by BPMP on Tegra186, which models this in
a more correct way. Since this introduces incompatibilities between
the two SoC generations which we want to avoid, the Tegra210 will be
fixed in subsequent patches.

This change adds sor1_out as an alias for sor1_src.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/clock/tegra210-car.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 46689cd3750b..43c4a8407333 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -309,6 +309,7 @@
 #define TEGRA210_CLK_BLINK 280
 /* 281 */
 #define TEGRA210_CLK_SOR1_SRC 282
+#define TEGRA210_CLK_SOR1_OUT 282
 /* 283 */
 #define TEGRA210_CLK_XUSB_HOST_SRC 284
 #define TEGRA210_CLK_XUSB_FALCON_SRC 285
-- 
2.13.3
