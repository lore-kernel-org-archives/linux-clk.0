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
Subject: [PATCH v3 8/9] Documentation: devicetree: add vendor prefix for Pine64
Date: Mon,  3 Oct 2016 10:09:12 +0200
Message-Id: <20161003080913.24197-9-maxime.ripard@free-electrons.com>
In-Reply-To: <20161003080913.24197-1-maxime.ripard@free-electrons.com>
References: <20161003080913.24197-1-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

From: Andre Przywara <andre.przywara@arm.com>

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
[Maxime: Change title prefix to match the usual style]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7b6bda3b4189..3dd1d77c1c30 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -200,6 +200,7 @@ parade	Parade Technologies Inc.
 pericom	Pericom Technology Inc.
 phytec	PHYTEC Messtechnik GmbH
 picochip	Picochip Ltd
+pine64	Pine64
 plathome	Plat'Home Co., Ltd.
 plda	PLDA
 pixcir  PIXCIR MICROELECTRONICS Co., Ltd
-- 
2.9.3
