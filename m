Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D0399346;
	Thu,  7 May 2026 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143724; cv=none; b=MWfinBHxLj8EdHNlFqGiuxRgQraUMpNhj2srBlfg90wm2fwwqIFv/FdhZXEUn65sdEJgdRGOyoiNK+HyZMjY3uN8y4DwFa3TFHuW/eRl9FZPa43I/D43XPpLBpPCpyreL+MT2RloE5q2p623/XlQsT1r7qfK1sAjaHDoA77TXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143724; c=relaxed/simple;
	bh=e6+r/QdPR9NJFj3rUyTNdm/XmRnAt3TKg+ioKiCz1vY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FIP11elcEjtzeyWL8SrpjOLN7DoLVz+VSGUT0YAg3OiTP1ZuKvcverYSuv+nTSIOFBQxbe5WcTBz0SjceEJnWYJAIDMMcUUZi/hS6v1FNGXuy2/EUwIwFWjw6XZPsX6RKmD/8v89lWOWYyxTUDtvmpBecYBBYFhpQ8ki9OPGLxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HoI2tHVc; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HoI2tHVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778143722; x=1809679722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e6+r/QdPR9NJFj3rUyTNdm/XmRnAt3TKg+ioKiCz1vY=;
  b=HoI2tHVco4/aP+4c/RlVNxB3R8FFAX+u4QpuMpba9okuEIS1B6B0Isyr
   z5wzx5WTf5DJfdckC/Q/NSl8Z46ZXDZ0eomYgkZ7ds1PIkKKfdG+01xgV
   jWjJV0xOjKRu49/CEVTRaCap8LYD0cT9hH+BLK2fXHTE6Zv9Pal3hzbg8
   qdEAqdFNZPmjDKh7luH2erbUEkIvsJSQjddces1/KvsT2cXyxXM8tXvle
   4q8fCtyLw423tlgRCysg6tgnkk4/mEQy9shuTm2Xf1Z9Pp/QRE4dva7xy
   QOV/Q2dUVnvqxFPrP2xeeG8efhFmTaDjnb9V/6d2uEvslivRnLk5iMPLm
   w==;
X-CSE-ConnectionGUID: 35bV4bnxS76SfUlFjmSmPw==
X-CSE-MsgGUID: 29N9x0CYRCm9JEu96lXXaA==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="56385248"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:48:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 7 May 2026 01:48:30 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 01:48:21 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <tytso@mit.edu>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <durai.manickamkr@microchip.com>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Thu, 7 May 2026 14:18:01 +0530
Message-ID: <20260507084805.481737-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507084805.481737-1-manikandan.m@microchip.com>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
HCI binding. The Microchip SAMA7D65 I3C controller is based on the
MIPI HCI specification but requires two clocks, so add a conditional
constraint when this compatible is present.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v5:
- drop min/maxItems around clock
- use else clause
- cosmetic fixes

Changes in v4:
- Define and describe the clock in the top-level properties

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 39bb1a1784c9..d488fb420945 100644
--- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -9,9 +9,6 @@ title: MIPI I3C HCI
 maintainers:
   - Nicolas Pitre <npitre@baylibre.com>
 
-allOf:
-  - $ref: /schemas/i3c/i3c.yaml#
-
 description: |
   MIPI I3C Host Controller Interface
 
@@ -28,9 +25,17 @@ description: |
 
 properties:
   compatible:
-    const: mipi-i3c-hci
+    enum:
+      - mipi-i3c-hci
+      - microchip,sama7d65-i3c-hci
   reg:
     maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral bus clock
+      - description: System Generic clock
+
   interrupts:
     maxItems: 1
 
@@ -39,6 +44,20 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: /schemas/i3c/i3c.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sama7d65-i3c-hci
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

