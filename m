Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134183E715E
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742514; cv=none; b=PJL3McTUS2XJYki+HrnulBN6BE/g5h7mHjWgiK662fkExwv+BK2maGtkyRteDhCd2aE7RX1zTOm4paC7Gwccv6XrIOBG/h2kuYyORl9RLQml1E0gcBt7wWOepVsu2N4DVDNYtoZxhTW1WM4ZgK6ehHKgs3uYCnvzxtWzMZGTk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742514; c=relaxed/simple;
	bh=PVilgbHHs7aR8Qkx3HORWWvrIUgpzson356NM/5tNnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oe4VKl1PF4TRj1Hn2UQjG8czA9wHMTTIA53TPqQLZT9VQ42cIR0iO58cBFfGph5Q7QdD23ahyOs3xPpuKw9pBoie170qi8GZK0r8W16dd9rdJsGu6mSVoY2iA35tM444F6tz5fK8bRsM1Jk+w7wOJ3ZSInjjoOGJlWYJmAb6VHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4fuQCF+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4fuQCF+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-384422b05b5so166148a91.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786742512; x=1787347312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+WACWGGRxnr7upWs/bzK9T7rZ+TwizKBmDY48I3U9o=;
        b=L4fuQCF+GUE0ZtJ9+srFqL316vSwFGdL+DfrTi1AVFevoL5sBXd+ic4gojRies/F1a
         Q0TPsjBVpSZj9llx5Craxbwf8hEh6+yvEFUtqao3/zlkd+0Gx26eRQ7zTHVPsdbXis9f
         YKFsWGzvzYiOTL9y8Y6GOeIdmQu3eiGRLnODcRUJCueXdWLZzki1KlHtCvCim47GXWbh
         H5lSqHc0x63mV/sVg1ujL2q3nIVB2ki0lZfoUbyM/qZytrUj60k6u8WUz+Ov3MTL6ORn
         n6oQUBil+rZ5VkkSq5pO2UdGwdKzX7/Hj0BBVqy62qm8G4ubAcDCXfH/3tTNM/5q4JWK
         QTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742512; x=1787347312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+WACWGGRxnr7upWs/bzK9T7rZ+TwizKBmDY48I3U9o=;
        b=ZeseejbeDcr7l0yEkAduYR03hei11jI9//CM2d5jTdih17H9TEjuExXHIRK8Y3sM2+
         SWG3fnHSCzK64evae/4PjLWH038vTf88+FtBFn+FwkbAHi6fdYj4CxAcHSFaTj0RGKY3
         eDSqfSAXITy+fIhthSFpZkJSk3sY1ftdUIWJ8+lJVYr6YArE/AdUd0MeMDdnhqyVN8PA
         LcYNAUmhwIrRfaC+WDWxLIcWd8DKwI6khgNXmbBjEz6ZMxWFXAn4+5UP43l0nnjGRi5o
         k1sPrFTeJhZuJ7Zuuwrl5Ave1KceDkRUBkAMHTXRXnO0Xkqik9DD49JTS2zaEoG6BTWG
         XQWQ==
X-Gm-Message-State: AOJu0YwBowz2wpMtlQNbzsxj6IPVo/+iNPUL0jwrKvShqXIbeCLCbDn4
	5VICFcBnNGf3RiXEQ/CAGFrLvSI+ZWOvmNytr3011PG5ELmvc4vArDXE
X-Gm-Gg: AR+sD13HUCpD8vumX4nopfUT9G0ibEO0zDf9SJ2xy05TKDrUpn+sdHJeXPZzK63co5s
	a+c0NkYnpCAHiJELQ6fQiC+gP23oqlbsngpwn87lTseKk4FFRVm6pQ+wwIYI1oiSG3T8F3NbC6/
	OkxOCB5nte3+t0oBqCdgbzKXAjtWGSXk0fFVR9f7r5QEBfOTnXALs4sDAg1z6Ei2uol+yAFoFec
	AquP85vWBHWe1J7aKIICjpvbw0ecid+kEiGyrb01z1EVjzJFrzN2CAYmZRZoBc/kkEa0QdrZpJW
	D8S+18ccqf305nQFOWQI1x+n+7xrr76buALUrPeeDPT24sjDqMPGB4RlveQ+tKsHpE/1wvnjqpz
	REg4trrYqY/Hp1yV+LbNhZfa3rNQ1V87S5ZRfnpduipg3pq0o8lsgTChp7Gd/cYpwvc30k5Kwzb
	TYS4cV20Wv3MJhCsL/OLcV0Fi/WbHzf/Ol08WIxpkgNFUM5m7HkRe0RhSqwNTVM4YGLufvaVeIK
	g==
X-Received: by 2002:a17:90b:2d8e:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-3933bd2c8bdmr6895808a91.1.1786742512207;
        Fri, 14 Aug 2026 14:21:52 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504f:ca49:504a:79dd:fd2b:ca2d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm16678893c88.6.2026.08.14.14.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 14:21:51 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 15 Aug 2026 02:50:57 +0530
Subject: [PATCH v2 2/2] dt-bindings: clock: ti,dra7-atl: convert to
 dt-schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-ti-dra7-atl-v2-2-db64c147c2e2@gmail.com>
References: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
In-Reply-To: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786742472; l=5776;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=PVilgbHHs7aR8Qkx3HORWWvrIUgpzson356NM/5tNnY=;
 b=pgbT+SoflQx2pYJlN5Eq+wwiTUtYrprrXthMZ+Wmi4yObdI0CvdjckhrFyhWYWZb31tWNVhfc
 BTUMwhK2LCWAP8awTDZUuu11NCh9O0vbw1bbN1DL48mH1Fn5jL9o0pT
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the IP driver portion of the DRA7 ATL (Audio Tracking Logic)
binding from the freeform text binding to dt-schema. Together with
ti,dra7-atl-clock.yaml this fully replaces dra7-atl.txt.

ti,hwmods is marked deprecated as modern DTS uses ti,sysc target-module
wrappers and the property is absent from current dra7-l4.dtsi.

bws/aws maximum set to 15 per the 16 mux sources in
dt-bindings/clock/ti-dra7-atl.h.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/dra7-atl.txt      |  56 ------------
 .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  | 100 +++++++++++++++++++++
 2 files changed, 100 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
deleted file mode 100644
index e3c05844ae86..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Device Tree Clock bindings for ATL (Audio Tracking Logic) of DRA7 SoC.
-
-The ATL IP is used to generate clock to be used to synchronize baseband and
-audio codec. A single ATL IP provides four ATL clock instances sharing the same
-functional clock but can be configured to provide different clocks.
-ATL can maintain a clock averages to some desired frequency based on the bws/aws
-signals - can compensate the drift between the two ws signal.
-
-In order to provide the support for ATL and its output clocks (which can be used
-internally within the SoC or external components) two sets of bindings is needed:
-
-
-Binding for the IP driver:
-This binding is used to configure the IP driver which is going to handle the
-configuration of the IP for the ATL clock instances.
-
-Required properties:
-- compatible : shall be "ti,dra7-atl"
-- reg : base address for the ATL IP
-- ti,provided-clocks : List of phandles to the clocks associated with the ATL
-- clocks : link phandles to functional clock of ATL
-- clock-names : Shall be set to "fck"
-- ti,hwmods : Shall be set to "atl"
-
-Optional properties:
-Configuration of ATL instances:
-- atl{0/1/2/3} {
-	- bws : Baseband word select signal selection
-	- aws : Audio word select signal selection
-};
-
-For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
-file.
-
-Examples:
-
-/* binding for the IP */
-atl: atl@4843c000 {
-	compatible = "ti,dra7-atl";
-	reg = <0x4843c000 0x3ff>;
-	ti,hwmods = "atl";
-	ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
-				<&atl_clkin2_ck>, <&atl_clkin3_ck>;
-	clocks = <&atl_gfclk_mux>;
-	clock-names = "fck";
-};
-
-#include <dt-bindings/clock/ti-dra7-atl.h>
-
-&atl {
-
-	atl2 {
-		bws = <DRA7_ATL_WS_MCASP2_FSX>;
-		aws = <DRA7_ATL_WS_MCASP3_FSX>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
new file mode 100644
index 000000000000..f4bb233be83d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dra7-atl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DRA7 ATL (Audio Tracking Logic) Clock Controller
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description:
+  The ATL IP is used to generate clock to be used to synchronize baseband and
+  audio codec. A single ATL IP provides four ATL clock instances sharing the
+  same functional clock but can be configured to provide different clocks.
+  ATL can maintain a clock averages to some desired frequency based on the
+  bws/aws signals - can compensate the drift between the two ws signal.
+
+  See also Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
+
+properties:
+  compatible:
+    const: ti,dra7-atl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: fck
+
+  ti,provided-clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandles to the clocks associated with the ATL.
+    minItems: 4
+    maxItems: 4
+    items:
+      maxItems: 1
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the hwmod associated with the ATL.
+    deprecated: true
+    const: atl
+
+patternProperties:
+  "^atl[0-3]$":
+    type: object
+    additionalProperties: false
+    description:
+      Configuration of ATL instances.
+
+    properties:
+      bws:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Baseband word select signal selection.
+        maximum: 15
+
+      aws:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Audio word select signal selection.
+        maximum: 15
+
+    required:
+      - bws
+      - aws
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ti,provided-clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ti-dra7-atl.h>
+
+    atl@4843c000 {
+        compatible = "ti,dra7-atl";
+        reg = <0x4843c000 0x3ff>;
+        clocks = <&atl_gfclk_mux>;
+        clock-names = "fck";
+        ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
+                             <&atl_clkin2_ck>, <&atl_clkin3_ck>;
+
+        atl2 {
+            bws = <DRA7_ATL_WS_MCASP2_FSX>;
+            aws = <DRA7_ATL_WS_MCASP3_FSX>;
+        };
+    };

-- 
2.55.0

