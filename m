Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05656C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhLNMC5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:02:57 -0500
Received: from mail-4316.protonmail.ch ([185.70.43.16]:55787 "EHLO
        mail-4316.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbhLNMC5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 07:02:57 -0500
Date:   Tue, 14 Dec 2021 12:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1639483375;
        bh=ukLWa3tIKAewxepWnVDB3fnZuszEZWi+8QNN64PLAoA=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:References:
         From:To:Cc;
        b=eSOaSfP3nHMm0/huM91Tny0U3ufHtH4OooRD7cGNpAdVooxYNkjFOTahPXJ5tEnnd
         gpbiaV7f+D1lFQYpOMNRViHyG/0i+vtFyyeFjBhxXt2keZSxg0M1UT6l/K5geGpnMo
         rttmS0V6U94dnTkigtN7jFl0LAZ6lF4vIP73z5m7cLY+MJBnL0zwrghqWy/KJXKNqj
         0xtOAxWIjXLjTFCBOOQ7evXFsZDNqq5KNoWyMbtPeuCAtZ69xhP/Ef73ndzRe0xU2L
         yRArYvUV9LbULZWB0RUaLygRSay3thY+xEuOquTJYOhakjQP3IoaDha2EAkoJ9LiCK
         G+bjRGmW/Zy7g==
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        kettenis@openbsd.org, marcan@marcan.st, sven@svenpeter.dev,
        =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Message-ID: <20211214120213.15649-2-povik@protonmail.com>
In-Reply-To: <20211214120213.15649-1-povik@protonmail.com>
References: <20211214120213.15649-1-povik@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The NCO block found on Apple SoCs is a programmable clock generator
performing fractional division of a high frequency input clock.

Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
---
 .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.yaml

diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/Docum=
entation/devicetree/bindings/clock/apple,nco.yaml
new file mode 100644
index 000000000000..5029824ab179
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/apple,nco.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoCs' NCO block
+
+maintainers:
+  - Martin Povi=C5=A1er <povik@protonmail.com>
+
+description: |
+  The NCO (Numerically Controlled Oscillator) block found on Apple SoCs
+  such as the t8103 (M1) is a programmable clock generator performing
+  fractional division of a high frequency input clock.
+
+  It carries a number of independent channels and is typically used for
+  generation of audio bitclocks.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - apple,t6000-nco
+        - apple,t8103-nco
+      - const: apple,nco
+
+  apple,nchannels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The number of output channels the NCO block has been
+      synthesized for.
+
+  clocks:
+    description:
+      Specifies the reference clock from which the output clocks
+      are derived through fractional division.
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - apple,nchannels
+  - clocks
+  - '#clock-cells'
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    nco_clkref: clock-ref {
+      compatible =3D "fixed-clock";
+      #clock-cells =3D <0>;
+      clock-frequency =3D <900000000>;
+      clock-output-names =3D "nco-ref";
+    };
+
+    nco: clock-generator@23b044000 {
+      compatible =3D "apple,t8103-nco", "apple,nco";
+      reg =3D <0x3b044000 0x14000>;
+      #clock-cells =3D <1>;
+      clocks =3D <&nco_clkref>;
+      apple,nchannels =3D <5>;
+    };
--
2.33.0


