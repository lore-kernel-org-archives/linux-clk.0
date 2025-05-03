Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFF18DB20;
	Sat,  3 May 2025 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746259822; cv=none; b=uZFIdEaxYSe+BLkZFTYVeBeArgnBgvixZPKwJOzzUyNbB6WmH7cgMogrncNZac2Zfqt3pX7M5c076/gXgYG7rSQgqOlHCMOx6ncEP5/jgQR4DowmOXvl/GJT5CutPtPRB29aJOgXsSYGVO30k07Zua4F3be5O46BtSgUt7N2Kqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746259822; c=relaxed/simple;
	bh=0rybimlKDX32tVNv6dUWOEFNrXeYzQniolth/7G1KeA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uDTAqMArLuT0Nje7fLy6iSz0SjyeYjHEi4yK3fO/63EE1mORdmZeujrzmUVZ6rEbXDx46cfrEHxWmdWXxiTdXpYFYPoKAjopF/btTGocNbPWyw18dC9TYmkqcnNcuphuvYwH6Ld1mWfj9ncf2XejKu5zTbYB+alEk33fj3ZqkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=SFOMRa7I; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="SFOMRa7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746259803; x=1746864603; i=wahrenst@gmx.net;
	bh=f9yFUk+rZhcL56xZdVvP5zsnfEQ/If1IUd8BdZ4zUgc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SFOMRa7ITWLxs7WY+8XQkv53kR5uytd6blPaVOlUm/V+9F1xpvSooRg2ajxkUhXH
	 R0WP6S+eepBPsjpsw6pdaPhyiykB49IYq4rl+I6fVpMOA9EeeS/Fu0aOo3m7vTonz
	 ajA//dm0UpchzHXez38sbLU/ICT3pmEz4l+Xypa+fYngVhE84rF4fvWUiKaV7lYwi
	 8lHa5qglkjPYUqgxH2FdooFsMYaJYz11K0eAzwXbPoA+5dBtAxZShhMpj83zzTCrM
	 F6Y55/wgUpNt8TVEAQVM9cmsBrF1T/v1MACPceIhuMOaPz9qrTUrJmSN5loHHl8Ow
	 FtAexdFkKgf+CCGfmg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0JW-1uvDH90gvo-00j2yw; Sat, 03
 May 2025 10:10:03 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] dt-bindings: clock: convert bcm2835-aux-clock to yaml
Date: Sat,  3 May 2025 10:09:49 +0200
Message-Id: <20250503080949.3945-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R82YShtapVE/GH0n0Xqc/xUyM4kXQ53V7LNTYoOvgJMOwT1mVql
 CYcZP9GWG3ZiaahuEW8W1/8LA300n0hVld4xyfwTA2zvpeSuXs7MXuxaY5WiaSHM76VR7Uh
 uc6hAn2fYlZj3kVvhJfhiLmuAolDd5oUd0gW2BTzODhdj+2ec7kzMzRgiTaoQvG6ErCB6xr
 DWZBViOiYfRwqhzZ+jzKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:14hOMghUO/k=;Dl7hE6mh5EIa6hVS0wKq5vo99/d
 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
 RfRMPLou5CWg/9Acm9WF0c+EkHdTyPd81K

Convert the DT binding document for BCM2835 auxiliary peripheral clock
from .txt to YAML.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../bindings/clock/brcm,bcm2835-aux-clock.txt | 31 ------------
 .../clock/brcm,bcm2835-aux-clock.yaml         | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-a=
ux-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-a=
ux-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-cloc=
k.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
deleted file mode 100644
index 4acfc8f641b6..000000000000
=2D-- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Broadcom BCM2835 auxiliary peripheral support
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The auxiliary peripherals (UART, SPI1, and SPI2) have a small register
-area controlling clock gating to the peripherals, and providing an IRQ
-status register.
-
-Required properties:
=2D- compatible:	Should be "brcm,bcm2835-aux"
=2D- #clock-cells:	Should be <1>. The permitted clock-specifier values can=
 be
-		  found in include/dt-bindings/clock/bcm2835-aux.h
=2D- reg:		Specifies base physical address and size of the registers
=2D- clocks:	The parent clock phandle
-
-Example:
-
-	clocks: cprman@7e101000 {
-		compatible =3D "brcm,bcm2835-cprman";
-		#clock-cells =3D <1>;
-		reg =3D <0x7e101000 0x2000>;
-		clocks =3D <&clk_osc>;
-	};
-
-	aux: aux@7e215004 {
-		compatible =3D "brcm,bcm2835-aux";
-		#clock-cells =3D <1>;
-		reg =3D <0x7e215000 0x8>;
-		clocks =3D <&clocks BCM2835_CLOCK_VPU>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.ya=
ml
new file mode 100644
index 000000000000..e19c2f4be77d
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm2835-aux-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 auxiliary peripheral clock
+
+maintainers:
+  - Stefan Wahren <wahrenst@gmx.net>
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description:
+  The auxiliary peripherals (UART, SPI1, and SPI2) have a small register
+  area controlling clock gating to the peripherals, and providing an IRQ
+  status register.
+
+properties:
+  compatible:
+    const: brcm,bcm2835-aux
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+    aux: clock@7e215000 {
+        compatible =3D "brcm,bcm2835-aux";
+        reg =3D <0x7e215000 0x8>;
+        #clock-cells =3D <1>;
+        clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+    };
=2D-=20
2.34.1

