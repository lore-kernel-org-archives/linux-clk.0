Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339160;
	b=SmbwZ2oBLK4Vb05SvjnB9eW3lm6kTN6Qw02ST2a0y318cDUn2rOLW6y0B7mY1NO8J+N/
	 bavOYOlOG9M4Haacpo7Yap7azTYhs5MWvM1Ck9cgBsW1F9T9qoOBA8h4ujm45jx0NDrWU
	 IBR0LcM4m5SwWEJuEb5koQpUQGa3yTselANwSoke73g31nZCGtF1nBgJeEHVnpF5yYI2C
	 T38YnnvCtlAGNVQN800PAGmkPcKD4+66y4+5f8A2xW9PcpcjM5uiArWfiLTerFGKED/vJ
	 7QZZxin2ebuhxifoxEkeNdSOXU+R+bIRR0ZwjYOJSakzhF3ShPZvDU0BOYQXpwiP3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339160;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7mEklAilVKf92dtmVDJu0KURfc8Tj/Pz0ePFWAC4NZ0=;
	b=oj5RH6acqtAao0DZH16OEbq6qkJi1FLip4GkwcGAAvGUe8A0BDvaxh+slZigApyE4ceF
	 kPppR632yFl/ISwjELqumNCH7cFvIlLp5mKFS+j5bP9DkeOnJlT8l9E8oPY9Nn/8OT6FT
	 K972oMf7c2fFcfc7rfxsQf3480QP96XMRjJ2dWBX/5VsyYHdI3//9DQjHKi/SfFmloyxS
	 J7keiJ+i258EqGw0wvzdSQXIhmwrCbrX4OsAkXJuBwENgaoxh1uXmXDlUKdZSoO0zl5lI
	 RofGt6iR6dNNQRvpeUVUyN8pse2HenNbfYk9X6uD9OYk7AfCTDtWrfncbLjpbHpCgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JA8Wjybm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ABA606A320;
	Tue, 10 Nov 2026 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JA8Wjybm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B8D1F0089F;
	Tue, 10 Nov 2026 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339159;
	bh=7mEklAilVKf92dtmVDJu0KURfc8Tj/Pz0ePFWAC4NZ0=;
	h=From:To:Cc:Subject:Date;
	b=JA8WjybmoYPULa5SpWa0fBuvhrCVrP6lBuUztr1PxnysKsVbpHEloxbT1KANUUEuD
	 1w1iedTKgpSAl2zgLAVEkvwGmrA1+0T34yoH6HLzN9Zk/DmX7SGEmL0ncGoB7AZcJu
	 4fQyvJHVJ/Kg1AAYMts10Bq3sQDgp/pzaPvNT28fWxp4wpuvCd11Pss3sBvQIgq9hb
	 D6EcOfCzHrvdff76f74XnrzK7mDku3u5IvohsQ/N5hUASHquBDMYQ3Nrul8bXNYDY+
	 03tmZI05/qes+D5qjN8/3fukFEEZv5Iak4YeojmLPhdqIeFCsLzcyuWNbqEWcxa/8z
	 M8/ykNGLWmHCg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: clock: Convert hisilicon,hi3519-crg to DT schema
Date: Tue, 10 Nov 2026 13:32:28 -0600
Message-ID: <20261110193229.1531663-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the HiSilicon CRG binding to DT schema format.

The allowed compatibles was not very accurate, so update them to
match the users. Drop the hi3516cv300 compatibles as the platform
has no DT and only a few drivers (pending removal) upstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Add missing SPDX license tag
---
 .../devicetree/bindings/clock/hisi-crg.txt    | 50 ---------------
 .../bindings/clock/hisilicon,hi3519-crg.yaml  | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/hisi-crg.txt
 create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml

diff --git a/Documentation/devicetree/bindings/clock/hisi-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
deleted file mode 100644
index cc60b3d423f3..000000000000
--- a/Documentation/devicetree/bindings/clock/hisi-crg.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* HiSilicon Clock and Reset Generator(CRG)
-
-The CRG module provides clock and reset signals to various
-modules within the SoC.
-
-This binding uses the following bindings:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-    Documentation/devicetree/bindings/reset/reset.txt
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "hisilicon,hi3516cv300-crg"
-  - "hisilicon,hi3516cv300-sysctrl"
-  - "hisilicon,hi3519-crg"
-  - "hisilicon,hi3798cv200-crg"
-  - "hisilicon,hi3798cv200-sysctrl"
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes use this identifier
-to specify the clock which they consume.
-
-All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
-
-- #reset-cells: should be 2.
-
-A reset signal can be controlled by writing a bit register in the CRG module.
-The reset specifier consists of two cells. The first cell represents the
-register offset relative to the base address. The second cell represents the
-bit index in the register.
-
-Example: CRG nodes
-CRG: clock-reset-controller@12010000 {
-	compatible = "hisilicon,hi3519-crg";
-	reg = <0x12010000 0x10000>;
-	#clock-cells = <1>;
-	#reset-cells = <2>;
-};
-
-Example: consumer nodes
-i2c0: i2c@12110000 {
-	compatible = "hisilicon,hi3519-i2c";
-	reg = <0x12110000 0x1000>;
-	clocks = <&CRG HI3519_I2C0_RST>;
-	resets = <&CRG 0xe4 0>;
-};
diff --git a/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
new file mode 100644
index 000000000000..3c2cc3411de5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/hisilicon,hi3519-crg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon HI3519/HI3798CV200 Clock and Reset Generator (CRG)
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+description:
+  The CRG module provides clock and reset signals to various modules within the
+  SoC.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: hisilicon,hi3798cv200-crg
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - const: hisilicon,hi3798cv200-sysctrl
+          - const: syscon
+      - items:
+          - const: hisilicon,hi3519-crg
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    description: >
+      The identifiers for the cells can be found in:
+
+        dt-bindings/clock/hi3519-clock.h
+        dt-bindings/clock/histb-clock.h
+    const: 1
+
+  '#reset-cells':
+    description:
+      A reset signal can be controlled by writing a bit register in the CRG
+      module. The reset specifier consists of two cells. The first cell
+      represents the register offset relative to the base address. The second
+      cell represents the bit index in the register.
+    const: 2
+
+  reset-controller:
+    type: object
+    properties:
+      compatible:
+        const: ti,syscon-reset
+
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
-- 
2.53.0

