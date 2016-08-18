Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com,
	k.kozlowski@samsung.com, kgene@kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	chanwoo@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] MAINTAINERS: Add myself as SAMSUNG SOC CLOCK DRIVERS
Date: Thu, 18 Aug 2016 21:47:19 +0900
Message-id: <1471524439-8115-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the myself to the entry of SAMSUNG SOC CLOCK DRIVERS to review
and test the patches as supporter. I will help them. I can access the all
datasheet of Exynos SoC and test it on Exynos-based board. I was implemented
the exynos4415/5433 clock driver as author and handled the exynos3250 clock
driver. Lastly, adding the missing information of the exynos clock drivers.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bb1d00098c..442d6f5c65be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10233,9 +10233,12 @@ F:	drivers/nfc/s3fwrn5
 SAMSUNG SOC CLOCK DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Tomasz Figa <tomasz.figa@gmail.com>
+M:	Chanwoo Choi <cw00.choi@samsung.com>
 S:	Supported
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 F:	drivers/clk/samsung/
+F:	include/dt-bindings/clock/exynos*.h
+F:	Documentation/devicetree/bindings/clock/exynos*.txt
 
 SAMSUNG SXGBE DRIVERS
 M:	Byungho An <bh74.an@samsung.com>
-- 
1.9.1
