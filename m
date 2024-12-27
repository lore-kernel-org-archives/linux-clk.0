Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41113F42F;
	Fri, 27 Dec 2024 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735339784; cv=none; b=S2hFHq0B5dxSpOSStsp0tO62VcPqqqTyusC9W3b3IPzH2axOY1E2j4Ic92fusLvoSgyXYm7YwLvm50k5krDs0V4LMcF82F43pZcSbNyN4TEC+HqIASngfsJ+JDRIdD2dtxaGxkD4QvHBWnVt52OsWVY4yMrlO7oVE/85RG4i78I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735339784; c=relaxed/simple;
	bh=sospvm1aNXj7AEdbnqqLICPGxc+tPzldUHCEm0jX/Lc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAVW4J1MTf2A7x6YVfTIsivbogEfxBn1ZGWCN/Gq4lirPkiaZXEcehkdWcdgCcecPNo7xOi9oqjMp2WX52cMchtB1jz1xSlDctkUShpUnlWE7guuixwfhPEFvDUBiShrAPpZJYEBBDKvdjO2y78Dhoyqb4qkKFBA/qk9mfjBEPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l5hC0A+N; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l5hC0A+N"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BRLl9Yk003631;
	Fri, 27 Dec 2024 16:49:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=T/ahezeuMoNAHzZJweMcrxozTf3Vlp/CYGwVlAVSAsY=; b=
	l5hC0A+NGbca2ZsmKwvNQn1XOWq5uMH4pCOGK8cWL9EXF+nWoQbHBM8lwnn5bN1q
	oLLz65eDXxv45s1h8fzcpfHJliPCxF1E1q9rsd0k+EKRFtI4ZnMM6FElZlCry/sw
	ZSAQkDJl9Q/76dFYQxsPaeddkqrY7hECTsUi02hWtmO/D0iqOcuTfCcTVkog86+k
	aifIhSPVzgGCcrjjk8WHBCrSZku4kqhmbhN0b5oy9ABGm0zMEYi3+j6HuPifzn2h
	YKvbPxPpi4RZRHUJRvMjKX0AWlyXt37J3Y7FQ5QemQwzahic31S1viCeZ+YwDHqP
	eDhYPex0yMg5K9wcchSfVA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43nuy26kst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 16:49:27 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 27 Dec
 2024 22:49:25 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 27 Dec 2024 22:49:25 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 155B6820247;
	Fri, 27 Dec 2024 22:49:23 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v3 1/2] dt-binding: clock: cs2600: Add support for the CS2600
Date: Fri, 27 Dec 2024 16:49:14 -0600
Message-ID: <20241227224915.3813253-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227224915.3813253-1-paulha@opensource.cirrus.com>
References: <20241227224915.3813253-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ygWNjjYHEw-syWE8d-cLjH6tJ0kRhd_N
X-Proofpoint-ORIG-GUID: ygWNjjYHEw-syWE8d-cLjH6tJ0kRhd_N
X-Proofpoint-Spam-Reason: safe

Add device tree support for the Cirrus Logic CS2600 clock
device.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 .../bindings/clock/cirrus,cs2600.yaml         | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..0be613c78a9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,89 @@
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
+  as low as 50 Hz.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs2600
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
+  reg:
+    maxItems: 1
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
+      Specifies the function of the auxiliary output pin with "PHASE_UNLOCK"
+      to indicate the input and output clocks are not in phase, "FREQ_UNLOCK"
+      to indicate the PLL is unlocked, and NO_CLKIN to indicate the clock on
+      the clk_in pin is not present.
+    $ref: /schemas/types.yaml#/definitions/string
+
+  cirrus,clock-mode:
+    description:
+      Sets the device into smart mode whith "SMART_MODE" and sets the device
+      into smart mode that only outputs a clock when clk_in starts with
+      "SMART_CLKIN_ONLY_MODE".
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
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
+        cirrus,aux-output-source = "FREQ_UNLOCK";
+        vdd-supply = <&vreg>;
+      };
+    };
-- 
2.34.1

