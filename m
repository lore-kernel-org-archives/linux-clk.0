Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F33783AC
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784312050; cv=none; b=K4EiDI0sfY3DrbBnXGaXXW06SLgDI2aQ+6NbDIclor/gPk2HDty1INnU06Ka2T6DgiT+LLBscUfelFW88+KkneYABApQucpLfbEzV3c06kCddx7CQ80AvwkXKbB64QouZljHXm+0TyUytGiWKvkCXBmfS1Q59iRz9f10wM0kmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784312050; c=relaxed/simple;
	bh=BvrWutf46V7GF8UMCePKeTmByVz5+e8XZmZw/vPd65Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qfOrepZ3ae1gOa9SNo8bQdLA10HDZgjkCb6ZVsHYtQh/ih1FHpUO4FE33yx5qc0WVZSVUzja+QFajz5Dth4sgWtOpSo07kyCL4rotbsOOD5Ear9tXYgzpOtbMh/joqQ3ekTS398pxvmXTrv4ZWqEg6ioDBiRzEaoseH1mo1CSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/gDmloh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/gDmloh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cad85b7b5aso10702325ad.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784312048; x=1784916848; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ne/ftA2xlJxQKz2vL4nuVk6v4kA0+IzBpOxppG0Objc=;
        b=i/gDmlohGsk5GHITeurBf9h5qnYMiwBFa1XDLJzg5y/1cc+PiY6hX0fmyCSrLP5+9k
         eh5/W9hmM9Io6VTLkIKWtRKpnNE5tDYnSe6vgKsrhrBXkJgQRZ9/T5cQ8wn/r67kzp4G
         j7xqpSS4pzAqbVup5roLMFqzBfHJGcLtv7HVP8NE+MPeNrhPMmYMgXY7NDe2KkAMzMIY
         iXGHJf3xiWEkydoqcid3uTmeae57R/Gclsqsmxqa1gUfgKH/DM/47erkQtSa8Ggd0cCW
         FXJWngIDYZSiHBNNnAlAcW4IUcl3CS7fpxQBHk7Tqxh+tySf4eC/k/iODmch4JmYB+pg
         Xc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784312048; x=1784916848;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ne/ftA2xlJxQKz2vL4nuVk6v4kA0+IzBpOxppG0Objc=;
        b=FfpiZzg9vsEjIZVv2CmFSXk5zVxBVNOOqiP8A2I58mxCqxK8/hym/uS/ca6yv08+kL
         R240MMTYnE4Ar0/Xp5Ji0A9qH3GXQTqmUPKzftPdZ6kXjSxnyqzpSARJ1atizfRdyjtA
         heotlTghxateJy0INixYlSxWAxS9T2wCjB+QhXX5k4BZHe8hH4ha2j1zqWF9XMufYjkb
         VZ/dV+6pwhkeSPaCnCvf9mhtM0Huh/oTLcO78jbB9lnGBcx6ZJXUmJiubKKFNJfQRkMM
         LgSU3zte7n6Cc8Ru0TNqyP4kfbnS3FMoBk3miIbrjQQprK/z+I/t9ArjJJ3TkMX0oT0O
         N9lA==
X-Gm-Message-State: AOJu0Yx3PCnA8UcbWQlfaQZSotu6XNz1jTZhK8FIfcVjgVM036XBXCUW
	diumoPG//wq0nrOA8Mg31CRO+x5LlBKCdcdRp8+hzKE9igyzUN21eyd6
X-Gm-Gg: AfdE7clMU/vrDPStygQsvgWc0YvbRqiMQI7FONmXzgjYD0yj3I2x+yn7gdJUYPJUi4N
	g70P4ucaBOaikfSo55CpZoW6TdYAnwZb+dngJCT4gycq+dLVTwbKH4nBuILAPrarWNlj+Gy5ET1
	ju7C/gbgbH+1Q+3UkPZ6K/IT5uBozW688nVgracSeMMaWQ/3E9ZzjTu/pJS/cKCY2Uw1sJ79Lmg
	uuMqAf/c+qAUo8b8nqGR/4D5ggsZxLsHYYpA/ZvIicccRrZWa13JSFLoO1glU0J7IlUMdIk/uEo
	UKilqrRQ2axNadVjYBkIxDTqPKHQFTb2TFXpaZXpS5c4iReEYxxH+YHhnRS9sBdr5Sah4Q1My7M
	Bo5PK8s3gWHawZooQj7BsV4d5HnnGvW9CvYDOR33uy7+tqA3mhERnMJMJRwz8+UEuAkuctFOOAq
	m9almzG9QStZc38g==
X-Received: by 2002:a17:902:e541:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2cf349ba5f2mr31420215ad.3.1784312048158;
        Fri, 17 Jul 2026 11:14:08 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5425:b99:7cf7:c083:fd30:1cea])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb69bsm6719029c88.11.2026.07.17.11.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:14:07 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 23:43:37 +0530
Subject: [PATCH] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBuwoYy6SrQQm2pINDQiCO+et
 HyL/19IHIUTjNULkW9JEnxBU1dgd+M3RlmKgRRppWnAS3A1p3NoXbAHdr1RZEm3rBWU6Iy8yvM
 PpznnD/LpFexgAAAA
X-Change-ID: 20260629-ti-fapll-clock-57a02c264e60
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784312036; l=4428;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BvrWutf46V7GF8UMCePKeTmByVz5+e8XZmZw/vPd65Q=;
 b=3oBlTRL9LpK42P2YqbG7RbkmmV/efbb/bJZKWcwearbdAlzWjeGQhm2uJZhTqjfr8mpVD9Fkb
 5QcsiwtL8W0BC/qYhbIQ7H+/mMcxcqbxCQBFnk07b7yq+qguH5YejJK
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM816 FAPLL clock binding from plain text
to YAML DT schema.

The text documented #clock-cells to be set as 0, while the example and
existing dt and driver require it to be 1. The schema now strictly
enforces #clock-cells = <1>.

Properties clock-indices and clock-output-names are documented in the
binding and added as required as driver strictly requires it and existing
dt already use this property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/fapll.txt         | 31 ----------
 .../bindings/clock/ti/ti,dm816-fapll-clock.yaml    | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/fapll.txt b/Documentation/devicetree/bindings/clock/ti/fapll.txt
deleted file mode 100644
index 88986ef39ddd..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/fapll.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Binding for Texas Instruments FAPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped FAPLL with usually two selectable input clocks
-(reference clock and bypass clock), and one or more child
-syntesizers.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,dm816-fapll-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of parent clocks (clk-ref and clk-bypass)
-- reg : address and length of the register set for controlling the FAPLL.
-
-Examples:
-	main_fapll: main_fapll {
-		#clock-cells = <1>;
-		compatible = "ti,dm816-fapll-clock";
-		reg = <0x400 0x40>;
-		clocks = <&sys_clkin_ck &sys_clkin_ck>;
-		clock-indices = <1>, <2>, <3>, <4>, <5>,
-				<6>, <7>;
-		clock-output-names = "main_pll_clk1",
-				     "main_pll_clk2",
-				     "main_pll_clk3",
-				     "main_pll_clk4",
-				     "main_pll_clk5",
-				     "main_pll_clk6",
-				     "main_pll_clk7";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
new file mode 100644
index 000000000000..9b6b824faa30
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm816-fapll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments FAPLL clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Tero Kristo <kristo@kernel.org>
+
+description:
+  This binding uses the common clock binding. It assumes a register-mapped
+  FAPLL with usually two selectable input clocks (reference clock and bypass
+  clock), and one or more child synthesizers.
+
+properties:
+  compatible:
+    const: ti,dm816-fapll-clock
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: phandle for parent clock clk-ref
+      - description: phandle for parent clock clk-bypass
+
+  clock-indices:
+    description:
+      Maps child synthesizers to physical indices 1-7. Index 0 is physically
+      reserved for the Master PLL.
+    minItems: 1
+    maxItems: 7
+    items:
+      minimum: 1
+      maximum: 7
+
+  clock-output-names:
+    description:
+      Names of the child synthesizer outputs. The length of this array must
+      match clock-indices.
+    minItems: 1
+    maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - clock-indices
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@400 {
+        #clock-cells = <1>;
+        compatible = "ti,dm816-fapll-clock";
+        reg = <0x400 0x40>;
+        clocks = <&sys_clkin_ck &sys_clkin_ck>;
+        clock-indices = <1>, <2>, <3>, <4>, <5>, <6>, <7>;
+        clock-output-names = "main_pll_clk1", "main_pll_clk2", "main_pll_clk3",
+                             "main_pll_clk4", "main_pll_clk5", "main_pll_clk6",
+                             "main_pll_clk7";
+
+    };

---
base-commit: 0716f9b9338a86dd27796e00ed0fd560c653323a
change-id: 20260629-ti-fapll-clock-57a02c264e60

Best regards,
-- 
Bhargav

