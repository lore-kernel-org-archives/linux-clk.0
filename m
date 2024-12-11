Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6998CA4E;
	Wed, 11 Dec 2024 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877180; cv=none; b=MeD/id+X6xkm/jkq+X1VXoaUyaYSLnyhm89D8ix4HKHL+HKxyKcZ2VDUC4RLXJ/scX3qiOyRlBgOB0lPAhA6nn9AWH9jx6Su03jg4/0tFWPpb15X0iwnkVvnHUh+0EuyQbUUAp+5BK+n86JdeTQeYhiw1a1M6TZp4HArM7LicR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877180; c=relaxed/simple;
	bh=yRGnUBgV16aTmTUx/culrbs2t2vbWNnugv0Xn0KxFvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cesXT1a8re5Y/7ol1cwDoY0l1dih/wMo19qarrSC1iCa+dA0vkgngozAXF1hSPEfzKE/EzKSUa5XlJMOnGQ4SWv9BQ+WXstxtzwIp/5C+DvfH9EmPkhVh1/iqNc7PN9YIMzjBT18lQbIi4JbrsLn9qEzup/4T5iinBgmaLMQHsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cvmwnUQM; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cvmwnUQM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6pe4F001359;
	Tue, 10 Dec 2024 18:32:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Y+HxuR6MnW/K6rSnTWBRWWhlZof5+b6kX1+Ihj3B3s4=; b=
	cvmwnUQMS12NHpyo83azcl9GmD6HxlwWUAcfxKVueTzRdjFsZZDjddn6s80xGb5I
	JzTvN6osD7mY55wIuDsrvISSxzhgf5kp0Nriw0ydJ/L8fiwiNNaWftyjrZ9l3Vj1
	dIXs0q1onVNALwnIxUN6gcaq9bBab26BM8TwFQwDKTNajyCYhIcHqOxmZiyNvu1c
	Pb3JEghaE6GblTu6b6ftBH88XEnASjvh6tssXkA+pjvGQgoL6RF+xWHgIemtpoBX
	YJzwojzjG97wpT9pgWoHge/XPJkvCCja9zqyt4vb2oYg/+F59+p1moxJtMpJWQ2x
	2tPJcaXLc9Crn79cPYkalQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43cmn248d4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 18:32:43 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 11 Dec
 2024 00:32:41 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 11 Dec 2024 00:32:41 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A43E4822542;
	Wed, 11 Dec 2024 00:32:40 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH 1/2] dt-binding: clock: cs2600: Add support for the CS2600
Date: Tue, 10 Dec 2024 18:32:35 -0600
Message-ID: <20241211003236.2523604-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
References: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1voj0OkPzY6YDoSuIloCsG-BhD3glNt8
X-Proofpoint-ORIG-GUID: 1voj0OkPzY6YDoSuIloCsG-BhD3glNt8
X-Proofpoint-Spam-Reason: safe

Add device tree support for the Cirrus Logic CS2600 clock
device.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 .../bindings/clock/cirrus,cs2600.yaml         | 78 +++++++++++++++++++
 include/dt-bindings/clock/cirrus,cs2600.h     | 23 ++++++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600.h

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..ed23f347f382
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,78 @@
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
+description: |
+  The CS2600 is a system-clocking device that enables frequency synthesis and
+  clock generation from a stable timing reference clock. The device can generate
+  low-jitter clocks from a noisy clock reference at frequencies as low as 50 Hz.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs2600
+
+  clocks:
+    description:
+      Common clock binding for XTI/REF_CLK, CLK_IN
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ref_clk
+      - const: clk_in
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
+  cirrus,aux-output-source:
+    description:
+      Specifies the function of the auxiliary clock output pin
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # CS2600_AUX_OUTPUT_FREQ_UNLOCK: Frequency unlock notification
+      - 1 # CS2600_AUX_OUTPUT_PHASE_UNLOCK: Phase unlock notification
+      - 2 # CS2600_AUX_OUTPUT_NO_CLKIN: CLK_IN is not available
+    default: 0
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
+    #include <dt-bindings/clock/cirrus,cs2600.h>
+
+    i2c@0 {
+      reg = <0x0 0x100>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        #clock-cells = <1>;
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        clocks = <&xtl_clk>, <&sync_clock>;
+        clock-names = "ref_clk", "clk_in";
+        vdd-supply = <&vreg>;
+      };
+    };
diff --git a/include/dt-bindings/clock/cirrus,cs2600.h b/include/dt-bindings/clock/cirrus,cs2600.h
new file mode 100644
index 000000000000..673b4b4cb1f4
--- /dev/null
+++ b/include/dt-bindings/clock/cirrus,cs2600.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024 Cirrus Logic, Inc. and
+ *		      Cirrus Logic International Simiconductor Ltd.
+ *
+ * Author: Paul Handrigan <paulha@opensource.cirrus.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_CLK_CIRRUS_CS2600_H
+#define _DT_BINDINGS_CLK_CIRRUS_CS2600_H
+
+/* CS2600 Clock Outputs  */
+#define CS2600_CLK_OUTPUT		0
+#define CS2600_BCLK_OUTPUT		1
+#define CS2600_FSYNC_OUTPUT		2
+
+/* CS2600 Auxiliary Output */
+#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
+#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
+#define CS2600_AUX_OUTPUT_NO_CLKIN	2
+
+#endif
-- 
2.34.1

