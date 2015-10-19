Return-Path: <k.kozlowski@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/3] clk: samsung: exynos4: Add SSS gate clock
Date: Mon, 19 Oct 2015 14:00:32 +0900
Message-id: <1445230834-32689-2-git-send-email-k.kozlowski@samsung.com>
In-reply-to: <1445230834-32689-1-git-send-email-k.kozlowski@samsung.com>
References: <1445230834-32689-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Add a gate clock for controlling all clocks of Security Sub System
(SSS).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c   | 1 +
 include/dt-bindings/clock/exynos4.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 7f370d3e0983..ac03e4fe2871 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1024,6 +1024,7 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 			0, 0),
 	GATE(CLK_AC97, "ac97", "aclk100", GATE_IP_PERIL, 27,
 			0, 0),
+	GATE(CLK_SSS, "sss", "aclk133", GATE_IP_DMC, 4, 0, 0),
 	GATE(CLK_PPMUDMC0, "ppmudmc0", "aclk133", GATE_IP_DMC, 8, 0, 0),
 	GATE(CLK_PPMUDMC1, "ppmudmc1", "aclk133", GATE_IP_DMC, 9, 0, 0),
 	GATE(CLK_PPMUCPU, "ppmucpu", "aclk133", GATE_IP_DMC, 10, 0, 0),
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index c4b1676ea674..c40111f36d5e 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -93,6 +93,7 @@
 #define CLK_SCLK_FIMG2D		177
 
 /* gate clocks */
+#define CLK_SSS			255
 #define CLK_FIMC0		256
 #define CLK_FIMC1		257
 #define CLK_FIMC2		258
-- 
1.9.1
