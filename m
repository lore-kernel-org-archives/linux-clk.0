Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D67196D90;
	Tue, 31 Dec 2024 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735676275; cv=none; b=pe4OZKGqnv6EQnFcQn+/6AJJb9HcwnAsuD747NQWeThOkp8kJH8AdzBU45TSR8ubk6kch207maX4mtRceJiyWXHpAStFdz3Cd7KiwEa5W9DxTtKWnjzYPk6xUK7/eUmvp1K0PLuQCV3+HUmGMBsms+Hk0IQ7jqAVhil2fCB5Rhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735676275; c=relaxed/simple;
	bh=0GYkRxpTTa0gpRMpNV4M3YdF46A8Qgm1ypXL0CS+Abk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sHnkpTuo02GeW3xkzqZO4oQpt/w7HmtECnM/6G9K1TuM2gZ/+bWXibHrJSSHvlZKi/Bs9PKy02fduGIgolOw4Oj4orD1iklU8EYWXyW5ttZubwRO6eAvgroKnDJRKDyd1f7ivuvEsCOwqXbSRmQl5WHSv/okwc9QX/di+swv3lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jEma/40i; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jEma/40i"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BVJaPho012080;
	Tue, 31 Dec 2024 14:17:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NZiPFB3s4FPl68x32dwqD9VR98eiXhm1zsIeh8mq1WU=; b=
	jEma/40iwUTDQA7BziCaY6bsBohDubr4LBx/ofAkTZ2Zg7T5XGLJOQuz5QPyfWaG
	5w24HSzeltKdmoFa+pF8Jy9IpeUHKC8KISoOZyzHR4BOixw3kzIHZKFR/oDQwq1f
	ZmrV9/thjnFVoMZBQHQeVeEvYMZYb9AZ5OBF3KvnT4Ai3FEx3zIo+Dr04GFLj9YD
	IyfIHEmn7b+0fK2TmmcNOPQZxk+PiMDQxP8FszIrReunOqe6TJ+sLM0XehzRvMb7
	uUEsqKbBdth8TnoYHBXsWUblv3AAaUy2vrHt3n3fCqv5NGvYMimMw35jfWVdEa6D
	z236F7qczQ+NiTfIRaLBFw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43tfm2u1rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 14:17:50 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 31 Dec
 2024 20:17:47 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 31 Dec 2024 20:17:47 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 83914820247;
	Tue, 31 Dec 2024 20:17:46 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v5 1/2] dt-bindings: clock: cs2600: Add support for the CS2600
Date: Tue, 31 Dec 2024 14:17:41 -0600
Message-ID: <20241231201742.3955733-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241231201742.3955733-1-paulha@opensource.cirrus.com>
References: <20241231201742.3955733-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fuuof7OmpHO1ZEQ3FSRqAYFlls90uhNl
X-Proofpoint-ORIG-GUID: fuuof7OmpHO1ZEQ3FSRqAYFlls90uhNl
X-Proofpoint-Spam-Reason: safe

Add device tree support for the Cirrus Logic CS2600 clock
device.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 .../bindings/clock/cirrus,cs2600.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..1ef4d5ddfc51
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,100 @@
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
+    minItems: 1
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
+      - phase_unock
+      - freq_unlock
+      - no_clkin
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

