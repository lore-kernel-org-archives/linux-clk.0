Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249905;
	b=ZkOO1PhdAhJB9iygfWY0y3m3yuOtcZ6WbmPQN8HD+9ar6OnCsonnmd8u+tVBw/MLNhNA
	 8dDnI8KPLvAPrGGOzDJ2amWeYHfAm2wekdcUzUOCcmLebmzgg3+s3LoNeP06gQlEkOPKM
	 FngQMYmLF+BH3Ej6tfCprgBB2rqdJe+mJXPSIjU1NsuduTCkdgXs/3HnvPRmrkv+2d4Lp
	 GAKCYVentJ43Oe0TvOsqSM7D6uO4gVMHT4HZp4YASHtAKHCrGWsuzS23yka6yUZKs8W2p
	 kfW0k1C+r3nR6vdMQRH24g4U/Lh/o5Y2nbshRMGc8dBo64MmhgaH8UKWGBa3MsO3GMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249905;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bEdb1aqtr3kgW3GLcjmKjP4faluOT4/pgNlM7Hd0DHI=;
	b=jDJOoA8OPfmbMQ53a7JgOKOybs8JDVhdeq8V9oUgqaJdirxKZCY+VuHluJPW28kjxbeK
	 5l6rH8TVq7LlhgWw+7OdRjSxbzu3Fmifb/MjVj1khsPH6hmRUuEWEv7woapOrgeKg3Ybc
	 U+H4XIKWu4uULC6KenBvFzP92NXGaFHnKAFQ9PNwyLnftPR/DKNXXhOYrAnLAi5vRS34Y
	 uSW0FMhJYFAsGdizOBFsHHkdYncRvKVdlLwH7u3fLOJNsbAqUNDPtXG2GwUcWLRBGEu1K
	 VoY8jhtfFy1EkCCyTe6IFX704GvzJJt4UmO2kiBo7DAZRJp3JRrJD9nLdY7/cHVfFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Djr5FASI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24B606A321;
	Mon,  9 Nov 2026 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Djr5FASI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C0E1F0089F;
	Mon,  9 Nov 2026 18:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794249904;
	bh=bEdb1aqtr3kgW3GLcjmKjP4faluOT4/pgNlM7Hd0DHI=;
	h=From:To:Cc:Subject:Date;
	b=Djr5FASIrZokbAR07zxKHRKGrVo0/+EC2r2qpovpyp+MRe9z3Ud25xUTQtUTfQfM6
	 hnUd8klLrSn3YYUAJpHueczC6poMq9teoNnAcmM+Unk+XAPRikBTgDE+MEiip6hANZ
	 Ep3PIIo3czMQISTGCm0fbcAfjukq9ka8jIY4SYHO0Iw/HmAlGuU0drdx+U4b7YVaBD
	 9xRAp/6MecTYMjvRvL3pvynyFv10JkoJHeqokOcXVSRkrllasBRPhBadVXYtbtNDm/
	 DXuw4zAckartT8GTvGx/mDvm+R1zimhqjmHCDkOq9mNg7VX9aHrm5YwnnfQkh0BV8p
	 SIdtcPnDRlTpw==
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
Subject: [PATCH] dt-bindings: clock: Convert hisilicon,hi3519-crg to DT schema
Date: Mon,  9 Nov 2026 12:44:52 -0600
Message-ID: <20261109184453.449141-1-robh@kernel.org>
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
 .../devicetree/bindings/clock/hisi-crg.txt    | 50 ---------------
 .../bindings/clock/hisilicon,hi3519-crg.yaml  | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 50 deletions(-)
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
index 000000000000..c0b7a5521fe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
@@ -0,0 +1,61 @@
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

