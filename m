Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668094;
	b=nANVy+S6nW1m+LvWT50JZTMP9YLjk7KWjYhlMkMmeY3/e5lYKn+qcWZnwEftHHDOC4bx
	 vh7Sueim7IJxEQVo+vAonGep9gRa2kMjGLKVW4vpVkZFp0LA3HuboiqLSkXq+CZPHg9NR
	 mZSFMTOj6SCf18+OnpRKSrA299IHb03KCko6Pu8GE44NKFpn4a+FOQhfp0he++wf1tjcp
	 8T48T76sUumEvST6dZ6DmgTj+p2+OnEBpa2mU5x0VB1fp6I0/p2lxjyMAj049UBcXNdJE
	 g7IHUEtor4hg8x0flvgP3/8iKfxg/13sLLQdvsNHgbfL8KUapBYiKdLP/aJNfkyTgsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668094;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qU4Ln5CxBhVjmkEhfipukTuR2scl1fb16n9ll8nNZug=;
	b=h+r19kGyQPaB87dzxKWZTTJCjZ5dtqgla+KsUXIBTBw+rf+h6gijkG0H0sYSuUr5dHcK
	 Iyc4BepgGjHI17glJi7BG4RE86zTTmTrh8fr1LdzpPXFS016svXcrbtJU2dIeS9aGAEBz
	 HqDHaD8GMKeYrb2d91I7Z60om1yspkI9Yqddh0hDBLQjX+nxhvzl5Q7jivm8MJNC4qolu
	 MsYUVcKiNA2/PBEwg6Xld+EGaVR7OY55ExD23AGC/T9Pb9KGiUI3DVs9AUHBNU/QuOcOC
	 43RzyvIdcy6BfattTp/jKWoZJIHGKF3d9HCRnIlm9KLohiraoYfLHqzUtZHriTwSYxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6437606A329;
	Sat, 14 Nov 2026 14:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6437606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9R-000000005Gr-2Ug2;
	Sat, 14 Nov 2026 14:54:45 +0000
Date: Sat, 14 Nov 2026 14:54:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 1/6] dt-bindings: media: Add Rockchip RKVENC v1 video
 encoder
Message-ID: <8db82947fc17304e785815a7180d59cbb94b4b35.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>

Add the binding of the RKVENC v1 video encoder found in the RV1109 and
RV1126 ("vepu541") and in the RK3566 and RK3568 ("vepu540"). The block
encodes H.264 and HEVC from raw frames and reaches memory through an
IOMMU.

Describe the register space, the interrupt, the AXI, AHB and core
clocks and resets, the power domain and the IOMMU. The core clock is
scaled between operating points with an optional supply, and the
encoder is a cooling device of the thermal zones.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../media/rockchip,rv1126-rkvenc.yaml         | 104 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml b/Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
new file mode 100644
index 0000000000000..9a83ce1499493
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rv1126-rkvenc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RKVENC v1 H.264/HEVC video encoder
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  The RKVENC v1 encoder found in the RV1109, RV1126, RK3566 and RK3568
+  encodes H.264 and HEVC from raw YUV or RGB frames. It reads and writes
+  memory through an IOMMU with two MMU instances.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-rkvenc
+      - rockchip,rv1126-rkvenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI master clock
+      - description: AHB register interface clock
+      - description: Encoder core clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  operating-points-v2: true
+
+  venc-supply:
+    description: Supply of the encoder core, scaled with the operating points.
+
+  "#cooling-cells":
+    const: 2
+
+  resets:
+    items:
+      - description: AXI reset
+      - description: AHB reset
+      - description: Encoder core reset
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rv1126-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rockchip,rv1126-power.h>
+
+    video-codec@ffbb0000 {
+        compatible = "rockchip,rv1126-rkvenc";
+        reg = <0xffbb0000 0xf00>;
+        interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_VENC>, <&cru HCLK_VENC>, <&cru CLK_VENC_CORE>;
+        clock-names = "axi", "ahb", "core";
+        assigned-clocks = <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
+        assigned-clock-rates = <297000000>, <396000000>;
+        resets = <&cru SRST_VENC_A>, <&cru SRST_VENC_H>,
+                 <&cru SRST_VENC_CORE>;
+        reset-names = "axi", "ahb", "core";
+        iommus = <&venc_mmu>;
+        power-domains = <&power RV1126_PD_VEPU>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cd098f0d91f3..26991dd3a3569 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24544,6 +24544,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 F:	drivers/media/platform/rockchip/rkvdec/
 
+ROCKCHIP RKVENC VIDEO ENCODER DRIVER
+M:	Daniel Golle <daniel@makrotopia.org>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
+
 ROCKCHIP RK3308 INTERNAL AUDIO CODEC
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
-- 
2.56.0
