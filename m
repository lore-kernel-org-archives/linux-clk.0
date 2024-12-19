Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527CD4C62E;
	Thu, 19 Dec 2024 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734576420; cv=none; b=uaVpfzEWl15mGff5nifkjxuuor3C1BqYJnHJ4uZXwYii/0hVS3TH3KkV/OGqfipNgKQXS9taBpXd/FcdPTuuo53F9CSi+OfztfjlZMSr930iv/Re7qu7AmddVJJa2d59RY5FvzqjSInxOK3/GWrj9KBPlngrTF1Sg8OBhedQMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734576420; c=relaxed/simple;
	bh=lX5Dc/Pa17AbnNWu7bd9/h0VYJvyZ6KzRP/yA9zGO7Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GviD/Kl5Rl8uYM7Bs8l3S5ATl4Vf9ZSnvF5s6gkFNIh7Jtx08TN6H7dUmjmDVhwfphPFt5JJjO8EWRcISbeKJcMtbzWSDLnIsNDMnyR1akvR/kH3sg2reCQc/1Nu3eAY2Y6CV6Ina/fD0RUdo6/P2w/WnE5/1XMYxOqUb8Xl4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pi+TdCmo; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pi+TdCmo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIIiG61032078;
	Wed, 18 Dec 2024 20:46:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2cRBc5WSvTVJDyS6RsUj5AR1CkkSV+zy4m5ysuKKPpQ=; b=
	Pi+TdCmo5nOG6uQUZNkNoZfDOkC1pJMi3oJUahYX/3Jo+uSS+2udHMwO3ZKFURW6
	N7zzMwqyagfIGwaRNMned7pVGNcVYcfL6iHdLiM+3kuKsejOm+qxt+ZytqsLlWwH
	e5N2DeeuT3ZYXy1HU0EEmcrSAs9lzs/a41ZUYAHffp0wwpTYxmsUFe2uZ9xwZRKl
	EVDB2rgtNHgb1+PSuXy4QwtJKdstDuXjEHNvVRTImHNoyq6cO7qdJMC4i+T6q2vi
	dTPrWxuhM1aRrNuKG6jCFkbT2+Xu/TMNuq3DjakJVK09xyinshQhcfOJhPkJyhgf
	fBloH8wU2l/oQtGLDTgTfw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akdnhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 20:46:42 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 02:46:40 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 02:46:40 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6A4DE820248;
	Thu, 19 Dec 2024 02:46:39 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v2 1/2] dt-binding: clock: cs2600: Add support for the CS2600
Date: Wed, 18 Dec 2024 20:46:30 -0600
Message-ID: <20241219024631.3145377-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Jd3ifB_68p7pTnnm3RGd089clAhQ7k86
X-Proofpoint-ORIG-GUID: Jd3ifB_68p7pTnnm3RGd089clAhQ7k86
X-Proofpoint-Spam-Reason: safe

Add device tree support for the Cirrus Logic CS2600 clock
device.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 .../bindings/clock/cirrus,cs2600.yaml         | 81 +++++++++++++++++++
 include/dt-bindings/clock/cirrus,cs2600.h     | 24 ++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600.h

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..f49f720addf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,81 @@
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
+      - const: xti
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
+  clock-output-names:
+    maxItems: 3
+    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
+
+  cirrus,aux-output-source:
+    description:
+      Specifies the function of the auxiliary output pin
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
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        #clock-cells = <1>;
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        clocks = <&xtl_clk>, <&sync_clock>;
+        clock-names = "xti", "clk_in";
+        clock-output-names = "audio_clk_out", "audio_bclk", "audio_lrclk";
+        vdd-supply = <&vreg>;
+      };
+    };
diff --git a/include/dt-bindings/clock/cirrus,cs2600.h b/include/dt-bindings/clock/cirrus,cs2600.h
new file mode 100644
index 000000000000..86065f94a2b2
--- /dev/null
+++ b/include/dt-bindings/clock/cirrus,cs2600.h
@@ -0,0 +1,24 @@
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
+/* CS2600 Clocks  */
+#define CS2600_PLL      0 /* Internal clock */
+#define CS2600_CLK		1
+#define CS2600_BCLK		2
+#define CS2600_FSYNC	3
+
+/* CS2600 Auxiliary Output */
+#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
+#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
+#define CS2600_AUX_OUTPUT_NO_CLKIN	2
+
+#endif
-- 
2.34.1

