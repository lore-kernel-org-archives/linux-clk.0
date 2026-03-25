Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455AF3947B6
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425511; cv=none; b=p4uXPQW+z75bJTOAFrec+TB2xpybvsu3KqD9+YVz2bqnQHk6qaR91QvxdGxAny00Cvz7Z0MOZ+5VjTzYWpUs6IcEmJcqEaF1k7wHACHZqYK41LQ8nXShD5tGlVU1zY0zt1UjHXErtV6Q6F/UzmgKs6EOjjdVucAowAmjuZZqkyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425511; c=relaxed/simple;
	bh=RlpyggZ6shR5FmYl+Tx6RPFjW5NGILkc2LzUfQogGiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6AbKH3ON06DdOwphvCzdsmcZR9TH01GSLNmsFoZXYig5fxnKiOcgDMm4R+tZNy5+I+JwNO9ZZgmV1ksAzz7yNIXTkdDtN5lH7pD22gY3+bxPw51whkRAWA7ZLVpld+QT087M+IKDbOH+sMiKKsGamKQ7m8bpLNpYLx6BnRJyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSHM7HWW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSHM7HWW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ab46931cf1so5166275ad.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425507; x=1775030307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToMAIYfDdLF98AYL+fgRMtnkblofR9bxvds0Kk+i8wY=;
        b=NSHM7HWWcHCb0YPLq4vqtxkm4EqxsIVEoaZswiCCutS0KJIA3lJcUOzT0HvqgNMJnC
         DUeSzYQmek0/qWLmWKEvZg0eVy7qIVpJIxyODS+8umFF08Mxs94SBQ1ayeTMEzA0NFeC
         SQ7ZEevCE0P/BjA6Krvi3eeb7VsGY2sUrJRY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425507; x=1775030307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ToMAIYfDdLF98AYL+fgRMtnkblofR9bxvds0Kk+i8wY=;
        b=ilr3F94S5cqxc0pAA+ykB+Lnv42IFM3oY9E9VogSV0PefIWPoZpB2e/ek2gOIKU0ic
         Si1J7CjXsoy7J+uPtk1RiPslof+RzM7IEvCxS/F6r8SqN/NxFS2+LFnBOO1eWPvceWNl
         ShFKB1KlfG6RqeGhTxFp6QdkGA2o1+KvzRkhmxCUjJ/d/iGuGTMILSvypLVer652oJUz
         5UfTi9AOeQL182WIadylmHVAZysyiP2J+l8wPioB2zhf8xjEhiLGlWd5vqcSvAt++qhU
         Fc7xxNNHZ1whTPACjjYbYHGjIK2ns4cQM1HFEgeQ6pbegdJiLF45Q5+EE1CEs5h2zzhB
         vrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6exI+yPwrIp7bIZaDTRYi54GFVhb76vdIK/oWDm2EopdCsBeOqu9PvCO2ebjCv8ILJGZIKkwtifE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlOZL+qeqW8aD9TLUVMq9fxzBW8/+rs1mMfP6CyDjWimmeQet
	KOTWnlqaik5CDAp3bzak1fZl6i4QrayyVJ+gja8dqWufLf3YCMzHrDPJLOqAYUbqKw==
X-Gm-Gg: ATEYQzynUc4W4O8iMh09W/kB9briKTQoy2MfVAWS0iXTJWOKsyPQ3wTmsdwFH3S1EVC
	kvVIEd3wKF0Z7PETXHYnEV1yss0L4G9Y7r5wUe74HMJeoBKLTHc679vvvpCXQLuiFwgP3fIEObD
	F28EBlvPZZ5GXLdFboigMnnrr/FOocmJHhqaBiLXovluTrgamvA9E/bjtgjPqOG/VBhYVscvG7p
	4nAXPQ6PpNxMhmFsrBuawMJRYbtxJMne/j2WiXV1iRWJTRPC+eZCmci+ozrdA47nrYw7h5qx4VI
	SxLJl0uXRHz9oDOw8Hbx57RLVWOoPj7hHcxGFW3V76AtSPQoc65/PUhVLhCTAOU8AKIk0gpWRGd
	JqEi/8FZuvFgGyNoM7AX9PvoE7r8ipedf7Nv3IbBSZz8UYOzJ8S77yQ7wtFXtydHehKXF1C1HJ+
	nvghvWf0sidbQakcNLNB3v9tH6OTvnNXa07ezkmnvASnh4+9Wl0mJR8OhTBoORMtDdDI3eXRw2B
	hVmISs=
X-Received: by 2002:a17:903:3bcf:b0:2b0:4d5f:1f6e with SMTP id d9443c01a7336-2b0b06cc697mr27079345ad.8.1774425507438;
        Wed, 25 Mar 2026 00:58:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Wed, 25 Mar 2026 15:19:45 +0800
Message-ID: <20260325071951.544031-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v1:
- Dropped minItems for clocks
- Dropped label in example
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
2.53.0.1018.g2bb0e51243-goog

