Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>
Subject: [PATCH 1/3] Documentation: dt-bindings: Add DT bindings for Cygnus audio clock
Date: Wed, 18 Nov 2015 10:08:07 -0800
Message-ID: <1447870089-2382-2-git-send-email-rjui@broadcom.com>
In-Reply-To: <1447870089-2382-1-git-send-email-rjui@broadcom.com>
References: <1447870089-2382-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

From: Simran Rai <ssimran@broadcom.com>

This patch adds audio clock device tree binding documentation to an
existing Cygnus clock DT bindings document.

Signed-off-by: Simran Rai <ssimran@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Lori Hikichi <lhikichi@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
index ede65a5..20e3c00 100644
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
@@ -92,6 +92,7 @@ PLL and leaf clock compatible strings for Cygnus are:
     "brcm,cygnus-lcpll0"
     "brcm,cygnus-mipipll"
     "brcm,cygnus-asiu-clk"
+    "brcm,cygnus-audiopll"
 
 The following table defines the set of PLL/clock index and ID for Cygnus.
 These clock IDs are defined in:
@@ -131,6 +132,11 @@ These clock IDs are defined in:
     ch4_unused mipipll          5       BCM_CYGNUS_MIPIPLL_CH4_UNUSED
     ch5_unused mipipll          6       BCM_CYGNUS_MIPIPLL_CH5_UNUSED
 
+    audiopll   crystal          0       BCM_CYGNUS_AUDIOPLL
+    ch0_audio  audiopll         1       BCM_CYGNUS_AUDIOPLL_CH0
+    ch1_audio  audiopll         2       BCM_CYGNUS_AUDIOPLL_CH1
+    ch2_audio  audiopll         3       BCM_CYGNUS_AUDIOPLL_CH2
+
 Northstar and Northstar Plus
 ------
 PLL and leaf clock compatible strings for Northstar and Northstar Plus are:
-- 
1.9.1
