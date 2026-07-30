Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4A3CE4B9
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400232; cv=none; b=gxklzLMd+mwvLRM5MEyF6gizNkhksNqdgUEdO/klo3lNDXP14j4C74tQYpc4ZNpYvnAAW6nOY1p31MkZRlpCw43htfFWoLRPgWsnqRap7UAkisyotgaI+MMbnn3nN7xGeb+9p3F9PShIRS1OZCOd4aL5Lx0RkAizkJs8ngZg9Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400232; c=relaxed/simple;
	bh=T6H1+jLR73lq9fJAwpW8tYIqxPmRLZOdyWbz2kizNXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GD7WJJJvHpa9/AgIRo/OT+3n87IdLQ1J27FmtJtZ30VdO7ufp7bgI6tsOZa2oZgJQIV6VUPY1NO5D4BvsKGA4Wez8IfO4g3nmS72LFNw7VStQ728BtXMjZvv42mBcsekEk4DVBtR2htqshhOUHNPTb+4zo2gtnS5hK3jeTdzWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUHGeG/Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUHGeG/Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so8614215e9.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785400228; x=1786005028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NamuILDbN24NT7HoXCJwp+4/ZlAqP3PaYd9uoEAoB8=;
        b=aUHGeG/QfKRbqUnCVLRq0bgG9Qt6R+Pme6fwoFeMywNJLrLc7HJeWRz56xonroQnNf
         z4KJvyAcegvNZIAsMImmMqk18Dp5bK1+E3bqXCwVo8A2I8wLq6bGEMG6cJYgl/EifeZN
         p8vVKIo0fqw9j0dkvjuoFi46oOEgghiKwnTL0isfExJawCTquu6WvjycAXcIzBiRgM/A
         OtkyMYJAO/ClRwUkpW7qujPUJA3PlbbEw1AM7oIXzZAp8gTkmjL1qDhZOLZef2UqzZIX
         LhWPIXIKZUEOGxmjq9XsdMsZI/ausBAWMU9wnCZ2jKD2VBFdOhAKbwnr3G9c9Bs8q4N1
         ahgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400228; x=1786005028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NamuILDbN24NT7HoXCJwp+4/ZlAqP3PaYd9uoEAoB8=;
        b=IIgBEj88p72rgZIVCSuxy7Xv4Md6jakpoO5k5YqJNNr7cSKTAV+DU66iL7Tn2u/vDr
         hmLdxuGCDiNvK8nkNV44Kijvg+Fs2Lvgif3GvLGiB//rJzMcaRrp0hJSvGYdQGA3OMOV
         8HhyThAYIqC+SBkXbHjpikWBwlbSGujEk509dC4kyB2jaKIAjKM/AB6hM6sp+ixewEjW
         jQsX5dXXVlGQzivcQaglCz9LtXnOxSWzE9pRUBBhNC/18XII0IZ2ake1562DMLgAKesc
         M2FbEX3CpRo8uNzw5cwlFgmqXk5QineMYrfyoL0JJjiAaZ/iLgCe4tU6i9Ui/Z59pTXX
         dYXA==
X-Forwarded-Encrypted: i=1; AHgh+RqLD9Tq1e+Sw0i8czzFhtyj9Pd8GM6QxfWR/MnP2qcVtxAelswFwdwMgi7t9DVN7KNGnVUg6PQuARY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymovlzrlN7B8DjOFKlCiEbUth0kUFArcCreRYqs1I5ScS9i7NP
	msFOZceK2X9HdZxzX4/bTYTiUV66pI1nEhlDkSPxHMls0yzBkwgCdyA2
X-Gm-Gg: AR+sD10vstcKcQGWAiNrOY3+5fRXBrOJhWlMSmXmKSByEL7reEI76HtQeWP9ZIxQ07J
	vffxx3lTx4scYd5uecSj32pJROWU67fM54xM3nurhrsmMBEV9zewr21CbNSd+YyDuRBRWtJCt6w
	PnZBC3WCVnCUew4jwWG1ZhKiyzze+YZQMovoDEUJ5gOjyOvT7NMccoMvSG8mI6a5lsIKxCAUrYV
	jDNyY6PduW4RRNv67/nY9jIWXYFG49KUzlT7Kt9B/PZ0PZqRnn3pIutvTHlKU4+qHv4xS2+m6nQ
	7FqgZVIiiyBwTFisX1tYvnf3ovp9OQKg2NnBdxwwkC9Zvi9T7xMZLybn5d44iJRsjdlu2uKpfqa
	LhtmruimzDVVt/MWH68ZvBIck9b4G4ri1bFURdxwf9tQxRZhlqH+D/ojvbcrj4Z6kWIfCjk2YL5
	0HoJ8ZiFU4X/b6oEcLvQlLCdcccnQ5SX08UWC+iUclfNoJzlqeCWOXf8puhoKlwiqFzb/mRMT5e
	t0dYIWM6ibrm6VK8NmMcS6wYgzAACuvBg==
X-Received: by 2002:a05:600c:628c:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-49800e6d1b7mr20262755e9.5.1785400227968;
        Thu, 30 Jul 2026 01:30:27 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([82.77.79.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49800f1a7f7sm48924335e9.5.2026.07.30.01.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:30:26 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: clock: ti: Convert APLL clock to DT schema
Date: Thu, 30 Jul 2026 11:30:19 +0300
Message-ID: <20260730083019.29998-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments APLL clock bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/clock/ti/apll.txt     | 43 ---------
 .../bindings/clock/ti/ti,apll-clock.yaml      | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/apll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/apll.txt b/Documentation/devicetree/bindings/clock/ti/apll.txt
deleted file mode 100644
index bbd505c11..000000000
--- a/Documentation/devicetree/bindings/clock/ti/apll.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Binding for Texas Instruments APLL clock.
-
-This binding uses the common clock binding[1].  It assumes a
-register-mapped APLL with usually two selectable input clocks
-(reference clock and bypass clock), with analog phase locked
-loop logic for multiplying the input clock to a desired output
-clock. This clock also typically supports different operation
-modes (locked, low power stop etc.) APLL mostly behaves like
-a subtype of a DPLL [2], although a simplified one at that.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/ti/dpll.txt
-
-Required properties:
-- compatible : shall be "ti,dra7-apll-clock" or "ti,omap2-apll-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of parent clocks (clk-ref and clk-bypass)
-- reg : address and length of the register set for controlling the APLL.
-  It contains the information of registers in the following order:
-	"control" - contains the control register offset
-	"idlest" - contains the idlest register offset
-	"autoidle" - contains the autoidle register offset (OMAP2 only)
-- ti,clock-frequency : static clock frequency for the clock (OMAP2 only)
-- ti,idlest-shift : bit-shift for the idlest field (OMAP2 only)
-- ti,bit-shift : bit-shift for enable and autoidle fields (OMAP2 only)
-
-Examples:
-	apll_pcie_ck: apll_pcie_ck {
-		#clock-cells = <0>;
-		clocks = <&apll_pcie_in_clk_mux>, <&dpll_pcie_ref_ck>;
-		reg = <0x021c>, <0x0220>;
-		compatible = "ti,dra7-apll-clock";
-	};
-
-	apll96_ck: apll96_ck {
-		#clock-cells = <0>;
-		compatible = "ti,omap2-apll-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <2>;
-		ti,idlest-shift = <8>;
-		ti,clock-frequency = <96000000>;
-		reg = <0x0500>, <0x0530>, <0x0520>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml
new file mode 100644
index 000000000..e14a76254
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,apll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments APLL clock
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+allOf:
+  - $ref: /schemas/clock/clock.yaml#
+
+description:
+  This binding assumes a register-mapped APLL with usually two selectable
+  input clocks (reference clock and bypass clock), with analog phase locked
+  loop logic for multiplying the input clock to a desired output clock.
+  This clock also typically supports different operation modes (locked, low
+  power stop etc.) APLL mostly behaves like a subtype of a DPLL, although
+  a simplified one at that.
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-apll-clock
+      - ti,omap2-apll-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+    description: Link phandles of parent clocks (clk-ref and clk-bypass)
+
+  reg:
+    minItems: 2
+    maxItems: 3
+    description: |
+      Address and length of the register set for controlling the APLL.
+      It contains the information of registers in the following order:
+      "control" - contains the control register offset
+      "idlest" - contains the idlest register offset
+      "autoidle" - contains the autoidle register offset (OMAP2 only)
+
+  ti,clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: static clock frequency for the clock (OMAP2 only)
+
+  ti,idlest-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: bit-shift for the idlest field (OMAP2 only)
+
+  ti,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: bit-shift for enable and autoidle fields (OMAP2 only)
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock@21c {
+            #clock-cells = <0>;
+            compatible = "ti,dra7-apll-clock";
+            clocks = <&apll_pcie_in_clk_mux>, <&dpll_pcie_ref_ck>;
+            reg = <0x021c>, <0x0220>;
+        };
+
+        clock@500 {
+            #clock-cells = <0>;
+            compatible = "ti,omap2-apll-clock";
+            clocks = <&sys_ck>;
+            ti,bit-shift = <2>;
+            ti,idlest-shift = <8>;
+            ti,clock-frequency = <96000000>;
+            reg = <0x0500>, <0x0530>, <0x0520>;
+        };
+    };
-- 
2.54.0

