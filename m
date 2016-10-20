Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v5 3/4] Documentation: devicetree: add vendor prefix for Pine64
Date: Thu, 20 Oct 2016 20:00:31 +0200
Message-Id: <73852fb92ac0aeec294dc9883cf235d9fa74a07b.1476986335.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.f18c0f482ef4459b5c8f6eb5828fcb6762440974.1476986335.git-series.maxime.ripard@free-electrons.com>
References: <cover.f18c0f482ef4459b5c8f6eb5828fcb6762440974.1476986335.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.f18c0f482ef4459b5c8f6eb5828fcb6762440974.1476986335.git-series.maxime.ripard@free-electrons.com>
References: <cover.f18c0f482ef4459b5c8f6eb5828fcb6762440974.1476986335.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

From: Andre Przywara <andre.przywara@arm.com>

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
[Maxime: Change title prefix to match the usual style]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f0a48ea78659..4eefd1c3ff16 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -208,7 +208,7 @@ parade	Parade Technologies Inc.
 pericom	Pericom Technology Inc.
 phytec	PHYTEC Messtechnik GmbH
 picochip	Picochip Ltd
-pixcir  PIXCIR MICROELECTRONICS Co., Ltd
+pine64	Pine64
 plathome	Plat'Home Co., Ltd.
 plda	PLDA
 powervr	PowerVR (deprecated, use img)
-- 
git-series 0.8.10
