Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24434C140
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628456; cv=none; b=KFV7BJUC3Vdmnks/q1c/IsVK8CliaoUcW51jjfsqXcHUGIS+PNIpJwwPjE58bkLfoh807B+J2E4q8je+nIErsr3VDNasF4mtHaL++qijsihNDmpGTUsxLAopy0hUnyQDwo+yP6G5hbxC5vvPpeadyhHdXEJUK3PgF+nlehrfxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628456; c=relaxed/simple;
	bh=5jZkQrWzMPJkfIzX3S7BWaNjPUf8WyPLKrjNr6dDhoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpzCSMD6L45Px4jQFwZZb1tWPhbL2VutA6tb2wkNCECgZLWC2Di2E5/C5UYa/7qzA1b45N2rM7QP2TGvmnX2LPSg6YWgI+AhOpjT+07quODLkllwZS0veABeMWF5c8p5/mvD77pyvCzq/w9b3VjwvBX/U85ROhZG/+V0pcERYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoZO9iYi; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoZO9iYi"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-835b78c3797so3818345b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628454; x=1780233254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE8wJ3jlNRIEeJNM4GCaChXdFFOYYazZzeu2MkBYm4Q=;
        b=QoZO9iYi7O3arR3YafQ5D4r1iH/dVnURt/IW1C43rsBsStdxkC+LlB698SuJ9aw3Go
         T80ZJelaTQ4iyUsufyg3AVfQzaDByBYip9gFlHgJfIFntLf0qqjQd0wSDbXwZsMftZWv
         hsEpfa8VWvrOs3HN2R4OXHn1Pf8uyJMncXgBjKsUARruVO4jAC6c8meBf7Y4mWfAlC/g
         w59iZPJZ2Ueacs5Jf98su7/wf6/oa8SOc3q8i8QqR2EfqEaSQbvmuuAAi2FCL1y6lLZW
         Z+EPbtpmTt969ZOoqnQR5ob56kjV3Nabkv3IPzp3wT2IGvw2WJqee79r9c5zLMAzLXeM
         wViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628454; x=1780233254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TE8wJ3jlNRIEeJNM4GCaChXdFFOYYazZzeu2MkBYm4Q=;
        b=ZxFST/ZhqhUaLbBW2ZNvtIUkRUnv7mbE/ESQqBKjtEcWBKZ1FVQypw+CBZ4UW35W3n
         W8PHGPhrAqu2fGLyTw6Se9U4PWZbearwaMXEcHL9F5Yv3iyHeMxila0nl8At+rtFg8eQ
         i2PxhgSUYn9kSSvkK+S1Cq8tO1exkNTc1Ix7hm2p4lrMbxmWkWpNSfVxEk4KZUG6hofF
         jjSpL9lQWGRbZNXTwcgILqanpeo1nbn+uRYn3NudzkFNi9drt/1aaiR8Ec3Egf3S9yEN
         XUStY3jo0B/eZS8irPqYRnQAQb/4p6U7DuWtxN/O5Kb4r6t/VdCUBBN766ypfZNTON42
         BUBw==
X-Forwarded-Encrypted: i=1; AFNElJ831B8b28GdaFbtI6HRiCT8D8lmtiwS5UKPTuD+i+yJgItQpbbj7tZyNjSuJPWMbpR07Oky5zCOArw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJyYOOe8L5KKzDuZB2QKjl8aWY6fUSIkori3/QhjIdDzXXcdq
	OAm2JMr9LCzty2MOtuw+Cp+rCll6YbKouxYSDofoAXgdCb1SVtoCJtF9
X-Gm-Gg: Acq92OEFEUJ5qmEsUKatwgGsKL9wzexBHoJYH903x5j0g72LY39pK3JCGoYPkyc8h1z
	UCOWpJ+3+AtG+OMO7g62TYjqe0QymHHPRSN+JH8ywR+jfxp0HQZDOS36fUTA9aMS2uOY7YaBff6
	nQhlj2Pet89Kwy+p/iPAz61hvO1QgN3aDXD6Jwff3h6xFMvcX8zgbqw3d3ksJ13kr1/sc9ZVTqV
	bOuJ4suI34DUZ2dNTQPDgBRNbxnHXmdTtX1RifWGVGH22NuAKoyzzjT15SrQXkzn+zKdHbFUWEv
	AP4oQ/0ogQNgiTBGh19P/Ug2pRnq4XeHM9nbELc1IFbbUYy/SR1zuI7YVa/zs+FEHTM4UMw5h0+
	VNKiOONBWjWEtw7rQhWsBLlx/Ju4el6m22Y5gaAn+9zEtFcULp11ETrmGkD+zIXAETbk0bTWW4F
	1aOdsyaFIqyyutr7h+j7vHU3HI0uw=
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr9954766b3a.35.1779628453867;
        Sun, 24 May 2026 06:14:13 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:13 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:07 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: add header/doc for Siflower
 sf21-topcrm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Add the device tree binding header and binding doc for
Siflower SF21A6826/SF21H8898 toplevel clock and reset module.

CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
clock gate/mux in between. An alias is created for this clock
to make available clock names align with the datasheet.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/siflower,sf21-topcrm.yaml       | 60 ++++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   | 42 +++++++++++++++
 include/dt-bindings/reset/siflower,sf21-topcrm.h   | 25 +++++++++
 3 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
new file mode 100644
index 000000000000..3782d9c32370
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF21 toplevel clock and reset module
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The toplevel clock and reset module on Siflower SF21 SoCs manages
+  the main PLLs, high-level clock muxes/dividers/gates, and some
+  reset lines.
+  Available clocks are defined in:
+  include/dt-bindings/clock/siflower,sf21-topcrm.h
+  Available resets are defined in:
+  include/dt-bindings/reset/siflower,sf21-topcrm.h
+
+properties:
+  compatible:
+    const: siflower,sf21-topcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        clock-controller@ce00400 {
+            compatible = "siflower,sf21-topcrm";
+            reg = <0x0ce00400 0x400>;
+            clocks = <&refclk>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/siflower,sf21-topcrm.h b/include/dt-bindings/clock/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..1b2e3cde931a
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf21-topcrm.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_CLK_CMNPLL_VCO		0
+#define SF21_CLK_CMNPLL_POSTDIV		1
+
+#define SF21_CLK_DDRPLL_POSTDIV		2
+
+#define SF21_CLK_PCIEPLL_VCO		3
+#define SF21_CLK_PCIEPLL_FOUT0		4
+#define SF21_CLK_PCIEPLL_FOUT1		5
+#define SF21_CLK_PCIEPLL_FOUT2		6
+#define SF21_CLK_ETH_REF_P		SF21_CLK_PCIEPLL_FOUT2
+#define SF21_CLK_PCIEPLL_FOUT3		7
+
+#define SF21_CLK_CPU			8
+#define SF21_CLK_PIC			9
+#define SF21_CLK_AXI			10
+#define SF21_CLK_AHB			11
+#define SF21_CLK_APB			12
+#define SF21_CLK_UART			13
+#define SF21_CLK_IRAM			14
+#define SF21_CLK_NPU			15
+#define SF21_CLK_DDRPHY_REF		16
+#define SF21_CLK_DDR_BYPASS		17
+#define SF21_CLK_ETHTSU			18
+#define SF21_CLK_GMAC_BYP_REF		19
+#define SF21_CLK_USB			20
+#define SF21_CLK_USBPHY			21
+#define SF21_CLK_SERDES_CSR		22
+#define SF21_CLK_CRYPT_CSR		23
+#define SF21_CLK_CRYPT_APP		24
+#define SF21_CLK_IROM			25
+#define SF21_CLK_BOOT			26
+#define SF21_CLK_PVT			27
+#define SF21_CLK_PLL_TEST		28
+#define SF21_CLK_PCIE_REFN		29
+#define SF21_CLK_PCIE_REFP		30
+
+#endif
diff --git a/include/dt-bindings/reset/siflower,sf21-topcrm.h b/include/dt-bindings/reset/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..fa700accff54
--- /dev/null
+++ b/include/dt-bindings/reset/siflower,sf21-topcrm.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_RESET_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_RESET_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_RESET_GIC			0
+#define SF21_RESET_AXI			1
+#define SF21_RESET_AHB			2
+#define SF21_RESET_APB			3
+#define SF21_RESET_IRAM			4
+#define SF21_RESET_NPU			5
+#define SF21_RESET_DDR_CTL		6
+#define SF21_RESET_DDR_PHY		7
+#define SF21_RESET_DDR_PWR_OK_IN	8
+#define SF21_RESET_DDR_CTL_APB		9
+#define SF21_RESET_DDR_PHY_APB		10
+#define SF21_RESET_USB			11
+#define SF21_RESET_PVT			12
+#define SF21_RESET_SERDES_CSR		13
+#define SF21_RESET_CRYPT_CSR		14
+#define SF21_RESET_CRYPT_APP		15
+#define SF21_RESET_NPU2DDR_ASYNCBRIDGE	16
+#define SF21_RESET_IROM			17
+
+#endif

-- 
2.54.0

