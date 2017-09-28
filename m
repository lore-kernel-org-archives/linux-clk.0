Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM IPROC ARM ARCHITECTURE),
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH v2 08/10] dt-bindings: Add Ubiquiti Networks vendor prefix
Date: Thu, 28 Sep 2017 16:15:00 -0700
Message-Id: <20170928231502.27069-9-f.fainelli@gmail.com>
In-Reply-To: <20170928231502.27069-1-f.fainelli@gmail.com>
References: <20170928231502.27069-1-f.fainelli@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Use the stock ticker: UBNT as the vendor prefix for Ubiquiti Networks.

Acked-by: Jon Mason <jon.mason@broadcom.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 1afd298eddd7..f08678fe96d9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -351,6 +351,7 @@ truly	Truly Semiconductors Limited
 tsd	Theobroma Systems Design und Consulting GmbH
 tyan	Tyan Computer Corporation
 ucrobotics	uCRobotics
+ubnt	Ubiquiti Networks
 udoo	Udoo
 uniwest	United Western Technologies Corp (UniWest)
 upisemi	uPI Semiconductor Corp.
-- 
2.14.1
