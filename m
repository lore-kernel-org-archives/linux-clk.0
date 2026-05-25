Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577E3E5EFD;
	Mon, 25 May 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701133; cv=none; b=rT9lH923mwSZvySJ6uw7SWPOFadwV5jpEvcr/dRnk+FTA+rprMj5iGwaXKvj9M5LSN1LDAh230XC2ZaAxKJjvyWFbeLMhzpDJxU+Cs5UsIm3EIAl78dF5itBG5OrUftFD49bFAcygemQDfNTJlPTGqvmuVP+4FNHTqWtx4opfK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701133; c=relaxed/simple;
	bh=ZmyfIH5KhFAjKsOYICrfyLRCXsbn+1dxlewuuX1LfIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2CuP5Wu+uasIMzmPmX2K7Tt5gkXdb8YP9nxvMWoIJrONXi8ebex78mgOOFJKOAQ2wu1jZpFtztZlttRPfztihjQKUG75B72Iiu69cgbOs5afOTA6S+HUTlDK0B73U/9LPicRdQVE7Vcj2Qqm5W8bTNgZ6O6SaOXsJyPOvmdIiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=prAeJLbW; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="prAeJLbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701132; x=1811237132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZmyfIH5KhFAjKsOYICrfyLRCXsbn+1dxlewuuX1LfIQ=;
  b=prAeJLbWPBcYw2kmWtovWzISTLhI+f2QSkl1K/sSW46f1mUeNXQUTuy5
   BjwVywisZxB+neSmfmE/mupf7ellro/0j1Tm4k761qgQOY/gf7YThDYgC
   sexrhzrhQcDG2e4Q5p8C+ZbkjoGLd5PE2A0ZAtYdvGO/+LpJ9ckhpHC32
   0Bk1Wj421UmpGjofOl3RrW+wx/81t2tnbzx7Jq87E0jhFU1skRr5bKj8r
   MoyWo/Nt1DrLtopDYxz7uTQNA/Sb3SSBtGZRnQ+E+LLobT8+y/QLFKkYp
   hEPrnuMpZKEF/S89Yhl7CXXAX1YAhEvdzNKCa2cXU3IbHlvjAqpF+IP5L
   Q==;
X-CSE-ConnectionGUID: ErrMcRDBRb2Cm5bGCRCQQQ==
X-CSE-MsgGUID: J4LVG0OBTUegvkqNrxcbUg==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="289388357"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:24:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 25 May 2026 02:24:29 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:20 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v7 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Mon, 25 May 2026 14:54:01 +0530
Message-ID: <20260525092405.1514213-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v5:
- drop min/maxItems around clock entries
- use if/then/else clause instead of separate allOf entry
- cosmetic fixes for indentation and formatting

Changes in v4:
- Define and describe the clock property in the top-level properties
  section rather than inside the if/then conditional

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

