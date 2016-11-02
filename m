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
Subject: [PATCH v6 3/4] Documentation: devicetree: add vendor prefix for Pine64
Date: Wed,  2 Nov 2016 22:50:37 +0100
Message-Id: <5581b9159345f51977dd12226065f55e0085b9d5.1478123413.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.6088b64645bde9b847d2fede5ecb15a0e204a9dd.1478123413.git-series.maxime.ripard@free-electrons.com>
References: <cover.6088b64645bde9b847d2fede5ecb15a0e204a9dd.1478123413.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.6088b64645bde9b847d2fede5ecb15a0e204a9dd.1478123413.git-series.maxime.ripard@free-electrons.com>
References: <cover.6088b64645bde9b847d2fede5ecb15a0e204a9dd.1478123413.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

From: Andre Przywara <andre.przywara@arm.com>

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
[Maxime: Change title prefix to match the usual style]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f0a48ea78659..6edd2fe46275 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -208,6 +208,7 @@ parade	Parade Technologies Inc.
 pericom	Pericom Technology Inc.
 phytec	PHYTEC Messtechnik GmbH
 picochip	Picochip Ltd
+pine64	Pine64
 pixcir  PIXCIR MICROELECTRONICS Co., Ltd
 plathome	Plat'Home Co., Ltd.
 plda	PLDA
-- 
git-series 0.8.11
