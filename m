Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Nadav Haklai <nadavh@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Omri Itach <omrii@marvell.com>,
	Shadi Ammouri <shadi@marvell.com>
Subject: [PATCH v2 08/11] dt-bindings: cp110: add sdio clock to cp-110 system controller
Date: Wed, 31 May 2017 15:41:52 +0200
Message-Id: <8c3f2dcae7622825722982c0ea45707586a73244.1496237893.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the documentation according to the change made in the
patch "clk: mvebu: cp110: add sdio clock to cp-110 system controller"

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index 139e46cc6786..e0b9ef5d3dde 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -34,6 +34,7 @@ The following clocks are available:
    - 0 2	EIP
    - 0 3	Core
    - 0 4	NAND core
+   - 0 5	SDIO core
  - Gatable clocks
    - 1 0	Audio
    - 1 1	Comm Unit
-- 
git-series 0.9.1
