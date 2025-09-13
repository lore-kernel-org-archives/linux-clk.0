Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10371280A56
	for <linux-clk@vger.kernel.org>; Sat, 13 Sep 2025 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798185; cv=none; b=QdE1VzA1lGx0ZZP/AQCiuVE30hCBiZsUNZ+PFqLFfl58Osc3ZNo4Sl+jBZ0OOU4w+PDxZNvMWrlsPQ5iNjSHAM5WuRZDRMIpdRCso/AbpC46Lq/wdAkCsJDVidctP8X1tmf1VD7Mzvqq3nzuzFi5aoCDXQrckE2CCqLdtwGRI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798185; c=relaxed/simple;
	bh=aCY6RxCHQrKIRW5QIMBN86rD5F6gGG9oJuEhO1S8+yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwmVyl1cHF9GhQUyjx7kEZJgznYEDXd7TUDwayxj5Swb0w3p8//xQs3hm5bhM0+EPX964n6bBF12q8XdKAVG8tQ07xa+Kk3t8j/es/RlU6E4pfpu9BkzohNNQRmmPjQFMTHr5byrH7/Lgb1VY222Hv+4NwtGSK/Ian2MMgFsEhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR+9TKTm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR+9TKTm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso25622545e9.0
        for <linux-clk@vger.kernel.org>; Sat, 13 Sep 2025 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798182; x=1758402982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/SeeyRvYxEIsfGVZybU2qc9C9N7ZeMuzRETBp2zbnM=;
        b=PR+9TKTmAs317hptaKAj9tbcjQVc26RuppF0H5MzfKyvw+lKcsrcx3ETL+itWkO4QW
         bJlIDiFe2/lVoRreVWnGG5q9xZ2vL4Lw2psriGhDltYZlwD9jgnV1jBnLfBu06pm56E8
         g3Sdv/7iTeRnZdp9mMFCCS5LA2rXy4/pTu/oTCTOtrW0Fa941iaNiXqudJ+uQuTEHQKI
         dsI1MDTQXENru8WR/or3cOMopUyHTFyB0YndlyUNnznuz69596WkTGoZ5AI14sIQ6vyg
         UQwN6VxC1qnWQr0lCJ5E3dtoH7LLI2EaKoQtEGoRJLbEUkx+Ya7rpALf685oWz7MmvZs
         0VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798182; x=1758402982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/SeeyRvYxEIsfGVZybU2qc9C9N7ZeMuzRETBp2zbnM=;
        b=jVzNRbuCnzGVI7uFdFm47qpnG8ukIF4IgiEvXW1SvvmQke8yGiiGbjsFvzgtLaw7mZ
         7XMuD51jKRymiLOBcO8soNLkZzFvJsZUmJqKUxjwzG6aucZreqBxXw8vgf3t3ScPMn7M
         ItE63xdl7laqKU0eruaM+iiO0oKqEPMdXqcGRosO5R7/ybYVVw4meMn8XD30xnxXhAyr
         DodXTh4ShwkLtqWI0twQ6Fbx88gh2+BQtcV8hRfcA7YNip1ixPAloJ2IecONViFrElGU
         VAj0+D/Lr6EHzeFFd+MNPgZwySwx90o9Qh11p/51KRze77KlMw1i7Kr3SA5TdA9ncxtL
         UeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbwlSdnaTdHidhCVgN9CSRGTejduGYn6DOLI9knaJNxDl+LZUz0yRJFws98ts9BJlGOwRocipI8is=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5TZv7xlCCdwZO4NoC7d8YleqnM5UV/kbFHRiQ4JQ0YKRH3x2
	mMEcYpAKlgAm3NCGCSNgUveiR0lj7t6OX8Za+9N6do9PDmfZqxcFKv6C
X-Gm-Gg: ASbGncvduKxPtaq3XGQkNiVb/dtLplpXeF5II8p3BHm+31yWoDXxaiHl0u5o3NlBLFO
	fMjw3e1yTJtrfr+97vOvun2N25mIISDpFMve/+DyT+VRv8JAW1bbuPngdwSJn+ECanSwaU7APML
	QsZ+1cH+13WNP6JTabSbfvsHeXWbwYjlDhmwV/Kia4v0MUXPM4o/LkCQq5TC6GUV/DcVUfo6d6l
	7aY23d397/l51pn7JbxHEERzKErYo2mRODoj3BSwakTq4l0wmwsQvWLlZMCG0ynL1h1J1Tz1XEU
	EnBsLmsEuOqAfVySr+pBz+ZUHg6lPKrH4AnmnreYg0c9/0CZiVhCtYZmf0DndAYhX8JgZ8e/ZJn
	ZQSURYCYfzSC/GweM5vovUuBxdZPOy0ib3qx3ODAaTg==
X-Google-Smtp-Source: AGHT+IENdqe6tFLJhgaKYNDsjgAqN3Bky9aI7BhYtkMmCPhOAUK8jcHMz4D/zkFC+NDqh4hUyO9H9A==
X-Received: by 2002:a05:600c:c3cf:b0:45b:8b95:7119 with SMTP id 5b1f17b1804b1-45dfd5c0dc5mr67761295e9.8.1757798182134;
        Sat, 13 Sep 2025 14:16:22 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac468sm65403145e9.0.2025.09.13.14.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:16:21 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:12:48 +0200
Subject: [PATCH v4 1/4] dt-bindings: clock: marvell,pxa1908: Add syscon
 compatible to apmu
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-genpd-v4-1-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3482;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=kOa/aUOGsrnkhFr1peiUiieuFcP0VPi+VrVXV4Tn/1U=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlH7yttDbZb+Le3+cKK2ZeWqipxNa3pOcUhyLc4dMmBw
 6FLfLrWd5SyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBEum4yMmxjT5Itvzxl/oap
 ZiuLk4I/dfmt0Jtq8vRR83GfC7/XPitkZNgSrH0n8uXkD+8eFLFU7dliJ1n0tk3zbnmpXdc1Ne5
 uVWYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add required syscon compatible and #power-domain-cells to the APMU
controller. This is required for the SoC's power domain controller as
the registers are shared.

Device tree bindings for said power domains are also added.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v3:
- Squash power binding patch
- Update trailers

v2:
- Drop simple-mfd
- Add #power-domain-cells
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 30 +++++++++++++++++-----
 MAINTAINERS                                        |  1 +
 include/dt-bindings/power/marvell,pxa1908-power.h  | 17 ++++++++++++
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 4e78933232b6b925811425f853bedf6e9f01a27d..6f3a8578fe2a6810911fec5879c07c9ddb34565a 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -19,11 +19,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa1908-apbc
-      - marvell,pxa1908-apbcp
-      - marvell,pxa1908-mpmu
-      - marvell,pxa1908-apmu
+    oneOf:
+      - enum:
+          - marvell,pxa1908-apbc
+          - marvell,pxa1908-apbcp
+          - marvell,pxa1908-mpmu
+      - items:
+          - const: marvell,pxa1908-apmu
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -31,6 +34,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#power-domain-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -38,11 +44,23 @@ required:
 
 additionalProperties: false
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: marvell,pxa1908-apmu
+
+then:
+  properties:
+    '#power-domain-cells': false
+
 examples:
   # APMU block:
   - |
     clock-controller@d4282800 {
-      compatible = "marvell,pxa1908-apmu";
+      compatible = "marvell,pxa1908-apmu", "syscon";
       reg = <0xd4282800 0x400>;
       #clock-cells = <1>;
+      #power-domain-cells = <1>;
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d321752ac44c91d2d7e74de28e08960..6f1d29c42c2eccf7fad489fd6a9b2c74fb24e4ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2872,6 +2872,7 @@ S:	Maintained
 F:	arch/arm64/boot/dts/marvell/mmp/
 F:	drivers/clk/mmp/clk-pxa1908*.c
 F:	include/dt-bindings/clock/marvell,pxa1908.h
+F:	include/dt-bindings/power/marvell,pxa1908-power.h
 
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
new file mode 100644
index 0000000000000000000000000000000000000000..19b088351af138823505a774ff27203429fe2d97
--- /dev/null
+++ b/include/dt-bindings/power/marvell,pxa1908-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Marvell PXA1908 power domains
+ *
+ * Copyright 2025, Duje Mihanović <duje@dujemihanovic.xyz>
+ */
+
+#ifndef __DTS_MARVELL_PXA1908_POWER_H
+#define __DTS_MARVELL_PXA1908_POWER_H
+
+#define PXA1908_POWER_DOMAIN_VPU	0
+#define PXA1908_POWER_DOMAIN_GPU	1
+#define PXA1908_POWER_DOMAIN_GPU2D	2
+#define PXA1908_POWER_DOMAIN_DSI	3
+#define PXA1908_POWER_DOMAIN_ISP	4
+
+#endif

-- 
2.51.0

