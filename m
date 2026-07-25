Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FEF3F39CB
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785005288; cv=none; b=kbqguA7nRTwlibpBXXeYWf/dMW3B+xRgbapFRqSCbiW3atjwdU+9DJ45Wi6WmXHznqw1Ab5TtOECkB2nZ2z1RRxaKPv2fqX/qAmL1qPjAMYv7VfirFZvjIt32Nbl2s+dOK02orPW/r/bplDjdC/kJ07LAv2HOTOeML1CtM+tds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785005288; c=relaxed/simple;
	bh=Xt3kGZtAAdd+HzHAVAMZgGdEC9llEbMYpKzHMhd/MkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cAdjHBEBVavqxU+J8d1sICjW8xpIsVyTynBqcdG0tJWMOrRdHzF8abeulb4O5DXW70ZK9X4ymCtOcI1X6X0h2Im8C/AIdIo40oXGlddEVAarsXMZpsG43YSHBU8Li2otY/Ukl0y4XxO+drY6KNkde7n60OeNFwE7UMcrw8lfJW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPtLj2E5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPtLj2E5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a3e5ca66eso148055b3a.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 11:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785005286; x=1785610086; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZ0jpJTuTc9mIF747vkGOggfpm0DkF4Pd0GiKsVCCcQ=;
        b=bPtLj2E56JLZHhv59qBNEl+qnx8s4ZEQcmE5GuZECHOakYCZ+MNpXr/HRtvvjgpIPG
         UbLcEEYqzuqaKIP7N1wB1h9EeOwZfIO4xI6nObz3gak2RbM78uVeDINVNBrjtoynd2yf
         WIO5H4ROGgMZ1Hcdk4oK1kSKgFBxzcyTkLjzzLnu+kBIRFqRBz666rC4hWODxSsoU6IG
         oSvwxVy3Q8xiwRAlyHrfaCHTE9d9xp9HHQczz9XJqIn5IZfchqz8k2QGfsusOeT0lQQ4
         xBoJcjoYqB7euXoiw8xMwSKk9QdcXZFBqTOBAQvCQfT584V4bme6RkX30zVSlFna0NEk
         Ie4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785005286; x=1785610086;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KZ0jpJTuTc9mIF747vkGOggfpm0DkF4Pd0GiKsVCCcQ=;
        b=HNSMD2spMwDqP0wA08y8e6Y2fTDBk+kYiO8XoYUBHYCoPfj7kiZqEV+0nSqVu1SJGK
         EfZgRPu6RbDDFH9tEds1F1O/kxm/s1EhfV1ezBJ5ChXH+1MpI8KXFOEWomIZswU7H3b8
         9V+GHi+aAtRMpGTSMfnY5t5Kv0HV0xfJZhIY5xYpxObwYMPNxWw05pbL7nRmIJ+6aZcT
         gQAb54waZI4st5ITe389BZSa3BV2philj9ET381CpkTHsjqhyy8qIB79vl2WkiPyS10h
         GJzS8FF5XQQBPupaWhsJzVF5xi87coT4NGtiFwtOCyyu6lkVTgjF3xLCsnF+lIWY2ooG
         q2CA==
X-Gm-Message-State: AOJu0YzR7nWVk8EhVShrjR/y3TVutksBZ49UEGQkMAarGXpC0awTBYVt
	KhvsXK3LR5kjZ+GklMse1hYln7RWjDVVJXJKJc3Mzjyb5EbVf5b98fbk
X-Gm-Gg: AR+sD12tYW1gdCSdx3EpbgTeyq9uGnDcYgv58s0KYT76GFQ0PndL2mfWVXk71hPMROr
	LEAt35RKctVFPj+H1e/AqMtTJ7H1wEqaCIZ0OCproLhF+AhLpDaKKa8bbIpgcXmkUH5qoCmfnMu
	QOQf7x1sVO5a0WU8wtZ1cyYtxGkHJeAzInvpSPX2jjk9oVdKasEzoRkwCZew9Wk8x2iaio6xkfg
	T+kGdjH5BcRSUQblNms8rrpL4aOa7fifCsDpM08aax1Nrh2IRKqm2raxZygQ2E1AtjRSeG4+pvJ
	Z2g0DDDis6cDJ/vkwb+ANpLdWiftjxBEOrw1V21CjbvBeaMLUxdUYZ7tq+D2qWFjfNqdqL+viYT
	Hh8PMVDRLZoiPGtBJ2dTgR4yPvFKeotAd2+ckyLRpQ7A5ZGi+DplfFPU62w30VOGi8eswoIhNqo
	ha+CkHWI18MtaFSGs=
X-Received: by 2002:a17:902:d491:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2cfde7901b2mr25140865ad.2.1785005285581;
        Sat, 25 Jul 2026 11:48:05 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5424:789e:7bf2:671d:d7ae:b910])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e261fsm14812770eec.6.2026.07.25.11.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:48:05 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 26 Jul 2026 00:17:47 +0530
Subject: [PATCH] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-ti-adpll-v1-1-86f6fc936507@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNT3ZJM3cSUgpwc3ZSUtBQLk1ST1DRDCyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQBiOHEObAAAAA==
X-Change-ID: 20260725-ti-adpll-ddfd84e4ef18
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785005275; l=5339;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Xt3kGZtAAdd+HzHAVAMZgGdEC9llEbMYpKzHMhd/MkQ=;
 b=ITeD0cUQVPuY+i/l0gXqbHWzlAktaK4dPooTrjuuFr7CrtQcCu/fKDflhr5pSju008mJsF/bw
 OwBDu8gaUfYC7iYRv8otfvge7B9agH9VWpZgGAQHrLoQW7fvZWItrqK
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
format. Add 'clock-output-names' as required which was missing in
legacy binding, as the driver (clk-adpll.c) mandates it and fails
probing if it is missing.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/adpll.txt         |  39 --------
 .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 108 +++++++++++++++++++++
 2 files changed, 108 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/adpll.txt b/Documentation/devicetree/bindings/clock/ti/adpll.txt
deleted file mode 100644
index 3122360adcf3..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/adpll.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Binding for Texas Instruments ADPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped ADPLL with two to three selectable input clocks
-and three to four children.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of "ti,dm814-adpll-s-clock" or
-  "ti,dm814-adpll-lj-clock" depending on the type of the ADPLL
-- #clock-cells : from common clock binding; shall be set to 1.
-- clocks : link phandles of parent clocks clkinp and clkinpulow, note
-  that the adpll-s-clock also has an optional clkinphif
-- reg : address and length of the register set for controlling the ADPLL.
-
-Examples:
-	adpll_mpu_ck: adpll@40 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-s-clock";
-		reg = <0x40 0x40>;
-		clocks = <&devosc_ck &devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow", "clkinphif";
-		clock-output-names = "481c5040.adpll.dcoclkldo",
-				     "481c5040.adpll.clkout",
-				     "481c5040.adpll.clkoutx2",
-				     "481c5040.adpll.clkouthif";
-	};
-
-	adpll_dsp_ck: adpll@80 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-lj-clock";
-		reg = <0x80 0x30>;
-		clocks = <&devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow";
-		clock-output-names = "481c5080.adpll.dcoclkldo",
-				     "481c5080.adpll.clkout",
-				     "481c5080.adpll.clkoutldo";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
new file mode 100644
index 000000000000..7f551dfca030
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DM814x ADPLL Clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  The ADPLL is a register-mapped clock generator found on TI DM814x SoCs. It
+  provides multiple output clocks from two or three selectable input clocks and
+  three to four children.
+
+properties:
+  compatible:
+    enum:
+      - ti,dm814-adpll-s-clock
+      - ti,dm814-adpll-lj-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
+  clock-output-names:
+    minItems: 3
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-output-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,dm814-adpll-s-clock
+then:
+  properties:
+    clocks:
+      minItems: 3
+    clock-names:
+      items:
+        - const: clkinp
+        - const: clkinpulow
+        - const: clkinphif
+    clock-output-names:
+      items:
+        - description: dcoclkldo
+        - description: clkout
+        - description: clkoutx2
+        - description: clkouthif
+else:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      items:
+        - const: clkinp
+        - const: clkinpulow
+    clock-output-names:
+      items:
+        - description: dcoclkldo
+        - description: clkout
+        - description: clkoutldo
+
+additionalProperties: false
+
+examples:
+  - |
+    adpll@40 {
+        compatible = "ti,dm814-adpll-s-clock";
+        reg = <0x40 0x40>;
+        #clock-cells = <1>;
+        clocks = <&devosc_ck &devosc_ck &devosc_ck>;
+        clock-names = "clkinp", "clkinpulow", "clkinphif";
+        clock-output-names = "481c5040.adpll.dcoclkldo",
+                             "481c5040.adpll.clkout",
+                             "481c5040.adpll.clkoutx2",
+                             "481c5040.adpll.clkouthif";
+    };
+
+  - |
+    adpll@80 {
+        compatible = "ti,dm814-adpll-lj-clock";
+        reg = <0x80 0x30>;
+        #clock-cells = <1>;
+        clocks = <&devosc_ck &devosc_ck>;
+        clock-names = "clkinp", "clkinpulow";
+        clock-output-names = "481c5080.adpll.dcoclkldo",
+                             "481c5080.adpll.clkout",
+                             "481c5080.adpll.clkoutldo";
+    };

---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-ti-adpll-ddfd84e4ef18

Best regards,
-- 
Bhargav

