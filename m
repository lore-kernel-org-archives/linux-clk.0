Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DE3EC6B0
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143792; cv=none; b=VRclDI/sWElBKXGNyt+9CNYcjApmIuK6FiDIlEFFfWXY6IFBjASacNOAtl62u2sslWgQsV0FGoQhwGPXgF6/zoFKUNr5zW/TnztnJEioRHCFTRm2LySqDFR6HgwtLN613hjuTr8397CfJrTiCS/Fn2avsoMShbylVyNmsNKhNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143792; c=relaxed/simple;
	bh=Vln5pVRWGcKJ94GRT0+RUkj+Q2YrC+MhJ0jq5oTVKyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fu+Gjg5qy6hWyC3jhvNuQPZ9pcQDhsGFUWTs7yhrgZU5kpZ6khCs/eHawK0/pSPsRu2w474TGTiK46v0CsQGeVbSJ6thcaY/ppVx+J0+Dc3lUHqilO/PiY+eBMauc7pBUnKv/tXj1JbdJbM02WUO+uHDOFoeCPqVIu6TsaKc6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gG2jUrr8; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gG2jUrr8"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1691831a12.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143790; x=1785748590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=gG2jUrr8K4/PnwBHTa5/aKr4n6nf7l6HKbbIDeflKQX5rbU4TXQbPHEXfpYzQP3pEl
         7ASY0A07+6cirrr9SM9A0kcG94K1ujfPGGfq1+6h46Vb+6ImhMvAp8ckqMAkI7cexxbe
         /oFrida8mpt+022+eJB8Ans+hVhp8Uon1rO58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143790; x=1785748590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=VKHngF/7CZcVzUzMQoEs7nqip/7Z3cWaBUQIldwhoeXeqJtNnpnSySmV58vCPVX1RY
         eLPNC9ha5R9TeWhlsmtxh/By3BzKM/AAAFy4guaQ5VsxZuZXoJ3gc6XUtVNnGOROeZHZ
         cX99qcarZ8fsXSZ/AYGUpuTlKWAO05XKz39JK8Kr5rVwokMJqx27sdupgm/SHrjC60wR
         +FRoIu7gqL/tYExSmnGGwbmGcUs+ldHk4HsFFlOrDhYVgZgjNu4H+OGO37eNC4l8ihTp
         jMJYqEVC8d9hJJubxWxN4TKYDJrfilVFYe3bnU9EG1wK+QnHpOCcwlHpJvJISa1X24yA
         wz5w==
X-Forwarded-Encrypted: i=1; AHgh+RrNKXT3kUytQx3g0MReSpixxk6a7LESJd/YABNOZm8cW2GO4cqciCn9o2aT+9sQPBKMU4gh9AYrtnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5FBpiEtQazOkwL/C19uwBiA4y4HhCjo2YLlo8PInQOASMOAG
	XzDriYjH4o66pQOYKStzjI98AZjkYpk/O8qsKO1P24qz8cA7MoEC0tWrdpxNnJ2MHg==
X-Gm-Gg: AR+sD12acK3QTJ7/D/BqArPIRQ/l5ZHV2HaA0DGDKTrsN85ICKunYqgHsbIncmtviK8
	HyGvs+zLoVLwsHoJ2mOEO/9cDgTcAfgAFTJ88tvu+XunZbxnqYqD3o9uzShFAdQxShQkCqoG0SF
	6L0PoCKBuQfFOw318rMYCGpjTRQAT5zrtSasGZts+c/hdDKQdFxtJ/TVxJgrzh968igBM6KayTu
	EqrWTvM5dev36TJtTAo7sys/ys74p9R+BDq3XumnAUY/bsTnUtAXO7OP7XYrEve7aC/NfPwxqDR
	foZHkc0Fay5c+a5pXRYPTbTKhhp1wPqZpIIDvkFMtdwj1HIBSYX5XtUtVaqlZpMZ31yOpAp6CxC
	EdkSFCPkIswYa6hoiVJD/DRwadU3VhX65bsn91CRk2Q2qTS4OS7qd43meFgprG0EjViVLMEOrhz
	6fYnvepbdV1mLoF1fkvgMGKMEFdGdR8afth8Wm6eApIlqap8J96ay9YYhJSA==
X-Received: by 2002:a05:6a21:1644:b0:3bf:8de9:c64e with SMTP id adf61e73a8af0-3c67eecb1fbmr6693314637.2.1785143790405;
        Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Mon, 27 Jul 2026 17:15:50 +0800
Message-ID: <20260727091555.1023910-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 70 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03db1ee9e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 MFG TOP controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MFG TOP glue layer controls various signals going to the MFG (GPU)
+  block on the MT8173.
+
+properties:
+  compatible:
+    const: mediatek,mt8173-mfgtop
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mem
+      - const: core
+      - const: clk26m
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/mt8173-clk.h>
+        #include <dt-bindings/power/mt8173-power.h>
+
+        clock-controller@13fff000 {
+            compatible = "mediatek,mt8173-mfgtop";
+            reg = <0x13fff000 0x1000>;
+            clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MFG_SEL>,
+                     <&clk26m>;
+            clock-names = "sys", "mem", "core", "clk26m";
+            power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+        };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..89e982f771db 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -243,6 +243,13 @@
 #define CLK_IMG_FD			7
 #define CLK_IMG_NR_CLK			8
 
+/* MFG_SYS */
+
+#define CLK_MFG_AXI			0
+#define CLK_MFG_MEM			1
+#define CLK_MFG_G3D			2
+#define CLK_MFG_26M			3
+
 /* MM_SYS */
 
 #define CLK_MM_SMI_COMMON		1
-- 
2.55.0.229.g6434b31f56-goog

