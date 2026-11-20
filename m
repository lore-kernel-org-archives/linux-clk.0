Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199538;
	b=iAscLVKHwoq++pdqaY16LKFH/C1o0C+jL1ni7Cpw7TNqOoAR44tahaFk9xnIgX8bVBW+
	 ZnLnYLohlNb45pN8+NNwpTAQWCzoDZaJvGMRefT+DIU+MWLmFCxS8mQvi6otmAL5iO+Iq
	 N5bEYzvc4qSk6r5rZ7fl3CDOhue2A4GizwzPtbBH4Ddjj87ApkJWy3pE6FUspBmNKMlnu
	 MK+E34gCWXZKRIMM6l0MkCfrv/2sk1ICO2Qc7708U7tFQFr6C0RABkTrcFkt54rurggwQ
	 IkljD8nfVWJNLcV93q2Kag9j/s6lxzCsyxk9fMm1jGOFoWBTNSPnrUGL6oGkoRkZy5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AhstR5zaWRo7fxUINZngvFrRufcXZaKUCs2shSnAptE=;
	b=anpSOaKfsAOsq8VCkp/f4vfUfzeDH3C/rAqUv8PSgjeLzcOxb/N+8K4lhiM6/KlcpXqi
	 fgt2eM6ulo2rci5sbLAOEOvNJKiL8wHbRC0kJjlCavZRqZGuxCrVChSvGTc6I0owxHgEX
	 /nFSg0NYh3V/L7V+1bq+lx0ja+IN5QPIR/axQz9ZZkHRKFiQYph44INiQaf12y1tPQ9vl
	 mCrHrQmf8lwiySqszLIyV/2sNS9QAs0i+FNZUnNkeJ1SVB+2xBfUVnos8QxschXbEqV8q
	 Fn/rYIOdRYxlzFRxlhrEggFFMWVCvCRLHJoCizjawtFUoL7pDEKUFtUuZfWw2ils3Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=uWougswX;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C624606A335
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 18:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C624606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=uWougswX
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-55650fe1f0dso750243b6e.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795199537; x=1795804337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhstR5zaWRo7fxUINZngvFrRufcXZaKUCs2shSnAptE=;
        b=uWougswXbNllfy9rgTlLTvvRLJc1rJ1au2kV0NF9pIXfi7xfp5bJ/vbj39Nb3+Icb3
         R5asG58QIOTZXPjzVc5DMPiETlsKb9EelY6Exu0+NxIQfpPLCPMQzk81irBV/xXFuOuR
         cWQHe3ECzwg6wYG0x01OK8z1fQXCHikwCy27gmWnSWTaq8TslrqcvikIMQn/zb0LpKsW
         +cKMH0RxViExozMzQcb878OPijplZg+ApfVPecX9m2CU+0zhXePJn+SW3PF6A0ayicHB
         B9fxcc27WqSTC4tetdpW7uqtI01edBQj8SKTh673zwtGil2HG4oKX7gk5zIlkXLw2Ofo
         TIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199537; x=1795804337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhstR5zaWRo7fxUINZngvFrRufcXZaKUCs2shSnAptE=;
        b=ZwZ1i+E5uh9AFgvXY+5lSYuh9siYLN4WB+lEqK9zfU+9vXCGcbJ8OPQc3GNfaY3i50
         sUBXJC9vc5/hsA75xIKPBymSHPvmoy/I5eyTZK6PB8QZlIslbcZ/4JxuZ3zec6sw9AGr
         4MNj4a4KEZ/GK2ocdECT1bp+UOjYxabsq8sfobidWekjPSzvIj7w6UfCI0XX7MzUDdRA
         y9I6g/M01IkebGxneuEVrTPaGrVHK58Og9yvTTGPD/TEDYT4TW0vUPW7q2ec6f6Fqmle
         PoJOrPLSonN1ukl8/4lI1khgz5gSK3sVTGCvmsjFwnVVAKGBjQRmgwbnkpiTDm8KroRa
         h3Eg==
X-Forwarded-Encrypted: i=1; AL+hErH6UH/FAbXdlDAyb6ATxYYZcD06BiOa/cQRH6aQ6iin8b1r2S10mHEWLyxBL/PTgl2IUX4OOG5Jn+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QdGMTMbt/zPln7sJn2+E3Rv3KY1CbszIqBCWd6c7fyTV28w+0
	MVEMzbG7wL5P4SZMDgEEiHjZIi+6Gt6w6vrK2Ao9mp9CFFsvb+oKcrBrvnjozDTDOZlec0oK1fj
	iFzKGeGzvZg==
X-Gm-Gg: AYBFou2UnTk9yTiUYI77D/+ssA6+z3lmhQBJBLGtnafzckbXzsjArSb6mygGSeDtD+p
	tq3lJmzqnGPWe3GJJfRk4UcfCVI9Ii8ctGtySHgNkzrt/mXwvNZWplOD/MmYl4gneqJ+SkNcRBE
	UxaaIRwGRNrpIXL6R9TayT9EhaXJrnTyqykxxSd/3MSjQ0TexhlJ5cHLBi7flnOnToTlNuu9XXy
	ZhARu0ThMuIoFEdTZJ1RHyyISo5DSl3WyN9GmWexwh/B5sisrLoohkp7Fgi0RekZGr4OgK2jKb+
	PGf8RzKjhQSPEZ07HRHqqkKSek4jBhPQYbW1bdHQZrGe3aiJWwcL4X5umz2w0ctbA8zKk3jb62C
	vF1Q/H614OTbBroAklW0/yAPOsCCE5Gljntjf5y75iA3Sac2g4LBvwPLyRzcd3b/ghSx80R1Gzk
	ORB/57Bz+tD7FLFpEGPCXbFzlLaSpcVBLG5YF9Wdw478kIZS84giuFCB//gFJkZf+J7IEd7Wcv7
	ggBEAie3OMfFPtPOUhP5ioeB2WosxHZaTah4ptvPnOJ7jh5+npXfPkXhRIbElvkBfYWVVoH15Bi
	T6P3Nd91h2askUhaEZGtbAurC1BqNQg+pU1Q
X-Received: by 2002:a05:6808:50ac:b0:53b:f634:83b2 with SMTP id 5614622812f47-57a025f405emr4260415b6e.0.1795199537206;
        Fri, 20 Nov 2026 10:32:17 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm2619940b6e.12.2026.11.20.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:32:16 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
Date: Fri, 20 Nov 2026 12:32:10 -0600
Message-ID: <20261120183212.1264522-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120183212.1264522-1-elder@riscstar.com>
References: <20261120183212.1264522-1-elder@riscstar.com>
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

Define the binding for the clock and reset controller that present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New binding that combines clock and reset under the clock node

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  8 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 50 +++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..e789ce8c6a3ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock and Reset Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The chip includes
+  an embedded PCIe endpoint that provides access to various peripherals
+  within the SoC via its BARs.  These peripherals include a simple
+  controller to gate internal clocks, and a reset controller.
+
+  The TC9564 chip has a single input clock.  Internally that clock is
+  multiplied by a PLL, and the PLL signal is divided into a set of
+  fixed rate, always-on clocks.
+
+  The clock controller uses two registers to control a set of simple
+  gated clocks, each derived from one of the internal fixed-rate
+  clocks.  A total of 21 gated clocks are implemented within the chip,
+  but support for enabling and disabling only a subset of them is
+  provided at this time.  Two clocks (I2C and PCIE) are marked critical
+  to make it clear that they should never be disabled.
+
+  The reset controller uses two other registers to control a set of 13
+  resets that can be asserted or deasserted.  Here too, only a subset
+  of the resets can currently be managed, and the I2C and PCIE resets
+  are treated as critical.
+
+  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-clock
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
+    clock-controller@1004 {
+        compatible = "toshiba,tc9564-clock";
+        reg = <0x1004 0x10>;
+        clocks = <&tc9564_xo_board>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..af088e1092e63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28683,6 +28683,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	include/dt-bindings/clock/toshiba,tc9564.h
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
new file mode 100644
index 0000000000000..a0325b10b6c36
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __CLOCK_TOSHIBA_TC9564_H__
+#define __CLOCK_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_PLL		0
+
+#define CLOCK_62_5M		1
+#define CLOCK_100M		2
+#define CLOCK_125M		3
+#define CLOCK_250M		4
+#define CLOCK_312_5M		5
+
+#define CLOCK_I2C		6	/* critical */
+#define CLOCK_PCIE		7	/* critical */
+#define CLOCK_MSIGEN		8
+
+#define CLOCK_MAC0_TX		9
+#define CLOCK_MAC0_RX		10
+#define CLOCK_MAC0_125M		11
+#define CLOCK_MAC0_312_5M	12
+#define CLOCK_MAC0_ALL		13
+
+#define CLOCK_MAC1_TX		14
+#define CLOCK_MAC1_RX		15
+#define CLOCK_MAC1_125M		16
+#define CLOCK_MAC1_312_5M	17
+#define CLOCK_MAC1_ALL		18
+
+/* Reset IDs */
+
+#define RESET_I2C		0	/* critical */
+#define RESET_PCIE		1	/* critical */
+#define RESET_MSIGEN		2
+
+#define RESET_MAC0_MAC		3
+#define RESET_MAC0_PMA		4
+#define RESET_MAC0_XPCS		5
+
+#define RESET_MAC1_MAC		6
+#define RESET_MAC1_PMA		7
+#define RESET_MAC1_XPCS		8
+
+#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

