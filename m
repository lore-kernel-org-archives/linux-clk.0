Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC83D171E;
	Tue,  5 May 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965232; cv=none; b=JZ7Q8cuSOjifDO/KXiszaNuJcnDC1o5z6rOLN80kUpr2ClX+EpqG+xGGRkQ83GcKnyRUCGrdJqgZkvrpnWBbB7KKZqoYS1rB6+6ahtP+pCHGN0ZZ2UX+09KnUy9T4pSW8EXiVbVRCMWew4JWY+OWiPG/phbYjXq1sG9TkN7aq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965232; c=relaxed/simple;
	bh=Wb9iATfXW8/7d/+1AO6j/ytPYVfI1bbWli+zPTIAHOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nb8Tb9fQ6V7gvagnaYFc7Z8JbcVAy2iadg82SC7h/g4jg1FqSmhlL1wUOGYxMENTkDC9M0zVWEdXmmxYibwN1znrOvqJJNm0w/iqjpbgKEMoWtqqBKT1SlKw8OGWAM8ZwGgv0tHHa42O4qr9ma6lsQYK+/SLL9l4JDqvx2abTuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=rAccC1e+; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rAccC1e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965231; x=1809501231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wb9iATfXW8/7d/+1AO6j/ytPYVfI1bbWli+zPTIAHOo=;
  b=rAccC1e+o/hEX3gKm9K0yQSH0oR2DsgBHfGqXbq7vaRm3dGpjtBkTOvL
   seLomHMfiafMWrBIQb8DZA6yJqA0J3lUK6VxLzeQ5swV3vvp5YgbCZSp4
   rEyYMZ48fbTxB1keRtvbAwithwRuof6isVM5uVrO3GPiBAsFzG3gcL8X/
   6He8Ig+bdvTjXnREupo2p8vJ+kgJZdzck+2z+Az2QClF2tFpFSQFbte8M
   DFwpKphI0c9W9jJRQH1NKwBy24f8OSsxAiEGjvqy2MAn73NiiTK11LEKh
   vzdjlrPKu47lnKvM8mB6yK/ABxRvJXBEPi1cTGC6q/ShTVbwry9rBOYSg
   g==;
X-CSE-ConnectionGUID: KCFYOMZvRKygeX0nADignw==
X-CSE-MsgGUID: 2FbC94D9Si+NVQDEp7pSVw==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="56268024"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:13:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 5 May 2026 00:13:50 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:13:42 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v5 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Tue, 5 May 2026 12:43:23 +0530
Message-ID: <20260505071327.125787-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505071327.125787-1-manikandan.m@microchip.com>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
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

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v5:
- drop min/maxItems around clock
- use else clause
- cosmetic fixes

Changes in v4:
- Define and describe the clock in the top-level properties
---
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

