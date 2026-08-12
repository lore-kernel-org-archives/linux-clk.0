Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFED34D4F9
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561919; cv=none; b=aQdHnO12mWysfDXS0ctCj4gORC0HPAT5Az6Ry3Yw13ozT0Se6hCCa3AoHqL5+LOXmu24JRESfEMTzB7QssU5ONpz7kXIbm4W7GC91uauEaRFSj2u17QNWK86H0rsfDVq/VflJNuzRP1Ij2bfK4bAyfF3RaFedCWQoo/TTDD2u3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561919; c=relaxed/simple;
	bh=kLXwjiY0hk/bsIhaPf9r0kAxsBg3pdBby5bPIV/S2SI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNYw3B5AsQojiqqf28yHHGJPO+kgNFpdxlJtmFz0TJorJysxdrxlGZTaGG3WiKCrK8JJsVm40fb9HG+h+lO/BZto5Q7f3QqtoHiFxrnKU6qmHItG+0teUnz7RroFhfAVCS9K9zF++nM0GmOmG40qVCXN9ZlIjxVV2LHi9SkY0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsOppiIj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsOppiIj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d03fcd26a6so2049965ad.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786561917; x=1787166717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJiMUkJNIcismpRf1bpQrDARo7GdrnubqNl+IT0MRWo=;
        b=DsOppiIjA3BN+VYLgosmph2W9Ta87Hy53KGU33aCQhMIy8XXrdis2gK5HX2PPHUSe+
         mARJ4uyms/ELkcP3Whh4Rm40vKnLD+DXS7kpY13g9JjGUCN9iOTv/F5Zuo8cZggEB7HE
         NB9z8yP960hbAu1hApMXp8/d9vkqqDW7ZGFzAv6Kly2aJlhzuweFmf9OR86S86gBwlOF
         zjGcFKeoRa9LEZcvXHoyy284qQZiOshQn4jfS7I1SLhZazpzzQAtUAFySTGboBj/6u+R
         YI22aO4/1ZjSRzqVIholR9SokATT+DqL339Yoyko1SS0xRZ0ND7Oy1ze8qNAd/eEPmYx
         fMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561917; x=1787166717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJiMUkJNIcismpRf1bpQrDARo7GdrnubqNl+IT0MRWo=;
        b=XvyuUelcUkGMuKS0l4vDtsPcRwU/1QLLf07C7lm8Wp1B2ZwCD2N0WGgcLXkY6Jgywc
         qmaKzISU4rp+BXGtdaTYwplpwJedmvDlljth7sO3COWexlcn6vuYk769fPiXPGMy5K27
         QVfYY+Nxhq2Sc3+s2g/nWAWZMl25a68exkf/eIlQtGTjgY5FJOOErMbGlpj6RJv9mwxA
         qLKvadH1LJ5jNTLpV2W+7bsCS3xXL2rADZYdIbs8kMpd+JcbaVbiSvlb4OjAD1LRoLnt
         vzUet2i35HieGFrfGmBASR8X99SqLP6DZ+W5F74T2GQJviKehlzT+7mLXhx58cH982N6
         boyw==
X-Gm-Message-State: AOJu0Yx8IkcrH/pUL4gdEw6GacOqm3mpXenKD7FMY+bpO1qA0wvq/P0k
	cMk0wNs/H0mbCOHAR9t8ww6pRNfco+ZM0itnmfSicn2CiwQsWfAWvWhV
X-Gm-Gg: AR+sD10o1zNv6OZtSsZfcfkhhJuKxHrUVnRxLpQ2tHW4MqcJsfTFf6eBdx0HEcXRdar
	Ij8udFy8lD+WYAFOUjb/QN4lehSV+eGj7NSgZCm7LvISlLySexPYkVYeoX2M4OaZhU8Nyx0csPc
	KpFqnqmhkFm77oc/K+aF8fxQ1ag5hlVyPw+uplgpTPvjdfKWuLuwnCHlovbR+z1L1tUQ/qWKd+w
	MarRVB25cZMRZNmbRMSgH67Rl7+ZU3IwOBrq6KcJxdoW7w9ppO1AjwocxEoVrSwe/bnazlsiPKA
	36k0nrIplSyq3bUvgwU7zsMwsogyBDVS4OR4+Gh4mBSfSuvP8kROpIeNMrBnbhCiyjkbh+a+v9B
	xh4aWw07Y0L6bC6HpCUlaYZyax8YNgPVzfkb+acMQjeuNuTrzpCs24l1WS5XpmezUykAhAgvnP0
	4os7YCaGrUo+g+CdWfNgm67IoOS2CUvno+XiO7Eh0Aezl+PF+xewWKI4pniCFZ/PchPCrMy1Y=
X-Received: by 2002:a17:903:2c50:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d37d19f10fmr2313385ad.0.1786561917109;
        Wed, 12 Aug 2026 12:11:57 -0700 (PDT)
Received: from [10.170.23.252] ([2409:40c2:5017:a6a2:eb70:cb11:a19e:bd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31da7bf64b5sm9496947eec.10.2026.08.12.12.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 12:11:56 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 00:41:18 +0530
Subject: [PATCH 2/2] dt-bindings: clock: ti,dra7-atl: convert to dt-schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-dra7-atl-v1-2-27b691f4cdcf@gmail.com>
References: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
In-Reply-To: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786561882; l=5691;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=kLXwjiY0hk/bsIhaPf9r0kAxsBg3pdBby5bPIV/S2SI=;
 b=0QTQcbNyTIX5a17UtIxWKdJFrDi0DszS/S6rRcvyljo3dUNRMj5133lIF3mQkE6updTaQHEmM
 WS9mfbNxj/0AEEQGmVOHFf27AK3Navr0TKm3tzPiogtUMhWHvm1j3uj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the IP driver portion of the DRA7 ATL (Audio Tracking Logic)
binding from the freeform text binding to dt-schema. Together with
ti,dra7-atl-clock.yaml this fully replaces dra7-atl.txt.

ti,hwmods is marked deprecated as modern DTS uses ti,sysc target-module
wrappers and the property is absent from current dra7-l4.dtsi.

bws/aws maximum set to 15 per the 16 mux sources in
dt-bindings/clock/ti-dra7-atl.h.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/dra7-atl.txt      | 56 -------------
 .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 56 deletions(-)

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
index 000000000000..5460432219a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
@@ -0,0 +1,98 @@
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
+    minItems: 4
+    maxItems: 4
+    description:
+      List of phandles to the clocks associated with the ATL.
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

