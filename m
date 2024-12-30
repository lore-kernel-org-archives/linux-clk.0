Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789F199E84;
	Mon, 30 Dec 2024 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735596791; cv=none; b=Jeas76KiEkK4lSW5Lc4eZRFyz6IKb7lbihmX//x2k/nAFy+sOQiSzNS0LY8LYgasgA8XgSiSdsK5Vx4entM0Xp4BtpDzpTEHfeIJaTaQc8btKemSTP92IB8zsclzY75JZNAkSGDh80LW42+FGLCHMgjgYN4xpgGTtXzxYq3O8qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735596791; c=relaxed/simple;
	bh=ohgqIpWbAFBlFEkESq9Nw7xlmSclJ+Z9BzgafL503yM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbPD6NMVcEHdxIBdMNWhm03NqAw5uBlihTlU4Fis0cAW4ljAYo7YmKtMK53NiD+AI2695F5QG8KEH9z4SCmSfRJhvGKc9dnKVRgFb5TVQwcM+t/jWKG8zm4/g6v7QfLMaLf6VkPw244fjGlXWw3OSTGbypsShjx3kpuG87XWqvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WPwv4T3z; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WPwv4T3z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUM2jtr021623;
	Mon, 30 Dec 2024 16:12:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BOJ+m3Ev1/nJ9AbBVeH2RRLkBobB0+xKbS8txeHPJmA=; b=
	WPwv4T3zaj7lNTkJOn/8y3UPSLx8F7/MqZfc7mE1eUTGJhFuwoMGXBVfDnkfNSTb
	xCUMY42FLA459FpqbgxxR2t+5N7qJ5AEtmzxkEHbFgeXoc0ndyhbQzQn00OpiE3A
	zzFIhEMhQLoVeQc/x7kTkbiHQES21foxn9YRDM/C7kA6lci4vnJn6xYSvULEYm1f
	zDYwTVyoD9Y1x1FbHQvrpsI2RvhaIGu7Q1XyHF+xDHMYBoJLiVFERDhup+7EZE0J
	SdYeWBfTPlgT9hEyjgxkFh/aK7Sxnphai5mogNMTZ2WVcqecga5sGBNoaFeMPCl4
	tGYjAx1DB+cZyqIiqiRvyQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43temk26vp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 16:12:52 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 30 Dec
 2024 22:12:52 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 30 Dec 2024 22:12:52 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A61D3820247;
	Mon, 30 Dec 2024 22:12:50 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v4 1/2] dt-binding: clock: cs2600: Add support for the CS2600
Date: Mon, 30 Dec 2024 16:12:45 -0600
Message-ID: <20241230221246.3927158-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230221246.3927158-1-paulha@opensource.cirrus.com>
References: <20241230221246.3927158-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gkzIXo7cRRSJe9M5EBCG-1SSR2SJ9DSx
X-Proofpoint-ORIG-GUID: gkzIXo7cRRSJe9M5EBCG-1SSR2SJ9DSx
X-Proofpoint-Spam-Reason: safe

Add device tree support for the Cirrus Logic CS2600 clock
device.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 .../bindings/clock/cirrus,cs2600.yaml         | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..c6f216e45791
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
+
+maintainers:
+  - Paul Handrigan <paulha@opensource.cirrus.com>
+  - patches@opensource.cirrus.com>
+
+description:
+  The CS2600 is a system-clocking device that enables frequency synthesis and
+  clock generation from a stable timing reference clock. The device can
+  generate low-jitter clocks from a noisy clock reference at frequencies
+  as low as 50 Hz. The device has two potental clock inputs (xti and clk_in)
+  where xti can either be a crystal or a constant refclk and the clk_in. The
+  device can have either xti, clk_in, or both as a clock input depending on
+  the usecase. It also has three possible outputs CLK_OUT, BCLK_OUT, and
+  FSYNC_OUT.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs2600
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      enum:
+        - xti
+        - clk_in
+    minItems: 1
+    maxItems: 2
+
+  '#clock-cells':
+    const: 1
+
+  vdd-supply:
+    description: Power Supply
+
+  clock-output-names:
+    maxItems: 3
+    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
+
+  cirrus,aux-output-source:
+    description:
+      Specifies the function of the auxiliary output pin with "phase_unlock"
+      to indicate the input and output clocks are not in phase, "freq_unlock"
+      to indicate the PLL is unlocked, and "no_clkin" to indicate the clock on
+      the clk_in pin is not present.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - phase_unock # Sets output pin to indicate PHASE_UNLOCK
+      - freq_unlock # Sets output pin to indicate FREQ_UNLOCK
+      - no_clkin # Sets output pin to indicate NO_CLKIN
+
+  cirrus,clock-mode:
+    description:
+      Sets the device into smart mode whith "smart_mode" and sets the device
+      into smart mode that only outputs a clock when clk_in starts with
+      "smart_clkin_only_mode".
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - smart_mode
+      - smart_clkin_only_mode
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&xtl_clk>, <&sync_clock>;
+        clock-names = "xti", "clk_in";
+        clock-output-names = "audio_clk_out", "audio_bclk", "audio_lrclk";
+        cirrus,aux-output-source = "freq_unlock";
+        vdd-supply = <&vreg>;
+      };
+    };
-- 
2.34.1

