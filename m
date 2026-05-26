Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE353FA5E8
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802300; cv=none; b=llXS4BDz+/+rfEZXI4a24SLVVk7Hr75qMyuan7tU6FWKU7CNQ8II2oUQVyOLdK7KSrhYSVj2DKy29Hkgbp02ZEo0Fk8jlg2eu4Tjz0Hn0p+5HxXirHIJMJjVACA0NtlQJMzjqOeP5aKPcT7YXDKE2VNno2bEH9ux22YadwQjSI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802300; c=relaxed/simple;
	bh=TT2eyoTRfzWA6wV6jKgNOxATiT/ULKEb5pDlKZbjQaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bi09zbwKfF5xoXqvMdfGdF1AHyaB1qtJfcRnG0yadPcNDve/CPovoy6ypq0bxrUayrvspUokYxSn61RXzrdS3SLNlbUJpTP2K3rw04tED0TXQMskdNC9r9+SjYJkwDFPjLA38Ng6agmOfiSMcxtOdrE+/qH/L7o4BSV4jH+YMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2SAPNrc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2SAPNrc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4905529b933so22755865e9.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802294; x=1780407094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIHp7+5MbvYuooU2HjgAc6OMaVGphWri9A/MKFD+YlI=;
        b=K2SAPNrcWjwcHM53Km6lRgGSLgVVXV+Ebo7NwYY4otcgvghtjG4MeyZD/gCJlxU2eQ
         HEmUfJ5gxmcIScHh75y8DdMEP0KY/FJdlz1oIYdAZ4wp8SGCfsUiMY4VpaZftV4Dngnj
         D4SsK1QnNis9RiUZHkNzgyFK1QFC6PJdbsPTAs8Hh0bOo/RENtgmiwAO6KmPWHjww7T0
         QB6sbY9phyFUwjE61x/mcZIK0MvTJoVEItd4IE4IWBkiybNskeZbkPmfzTpHX+1O+MJ/
         YginCyy1rC8gljIpnPJF/xtsyUVOXI8J43tfBcFiCa5oFJ/QErFajrxTJGl2uG6/VKaP
         +iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802294; x=1780407094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIHp7+5MbvYuooU2HjgAc6OMaVGphWri9A/MKFD+YlI=;
        b=hGwI19rV/PcGsjIQqPeRZMBKcBoFTsHVX+G//Y2EVdBpiB7kBut99mUHKq3ltLOqWD
         DrvRG+EqvSYd9vp/eCznNQQw9bU6/YaKS4ddEUWw8dAkbe+DrY5gUFW46+xLkC3MkvAJ
         Y05G++VGfKPJz7aFFjiMx5DAkjYi0sOC4VJC/TKfa+0ldZMAhABVRNYgT9aoLfIR9lkD
         IttmJ1iTLbDehXErvS/1zVUij1SuMMe+giz02UAmGQpfRnpr/9bZ8Poa5mJNVVS8bIa8
         ADJiRp1oXkIlPZ1W6SrHjHEMrlHNE0TVKc84iNb4t/+Tl9kMjkmKHJthoi04CN3ERa5a
         K/vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2qpte9V90iLnwa4OSBg9Xyipa/u+ilhdzaeL21Jw6KmlFM0t5yL1mIDk0blc9qDBjmAitpD8bnNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLZ8PAy+mEARaSeoW0+I60e7gKuhBmac4sQ8ihNmEdQF6lWAD
	kC11K51d3lWPYtdvklHjrGMPQO36WhcsvIwP+2eDfC+sI7Dbr5xN+tW8
X-Gm-Gg: Acq92OGYzx3zdIr2oumeO2iHUbCwguCGQfd2yFNeXD7Ie2/Lpek1huCQ4vvdsCn3sCp
	P+dDpQg0f5+mn58x0t6iP+oxbbcvKt/Fu3yjoOsHUkQF5w0xXa44gje52nLmrE1w2NcC3riBjM5
	2Ji0fZ66UTD2Y6Uih9xF9TVJw0y1bdmpP9Yi5Fl1vQq5xsLsEOGb2mJAH/ycECkEMMyYkPfXrzg
	+x895tLRXmTYODyBzCle5wu/ExYLeVkTIl7YlSnIyZi8S9PL9gBRAl+JVCsxjhv0mIWOYrcReGU
	swUVUcXbqDdWz0GEaZLNcaDbwh4v1kyIGe+uGGTxMVWSx3X0sZj8v5B7oDDXFtcBwJsIAqG8IfA
	0VK0Az+ndg4Opk4azmNOgOzRBlQ0b1Hdb4cm677/RVUQl+6TuJQ2UAU4WvfA4RZ3002ldVep0Hj
	CDC/HHOPy0OdmEFoN1jkCTUsjJFg==
X-Received: by 2002:a05:600c:468a:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490428e5a6amr320764595e9.30.1779802293866;
        Tue, 26 May 2026 06:31:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:24 +0300
Subject: [PATCH v9 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-1-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..10a50a410748
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description:
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec1_core
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+      compatible = "qcom,msm8939-venus";
+      reg = <0x01d00000 0xff000>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_AHB_CLK>,
+               <&gcc GCC_VENUS0_AXI_CLK>,
+               <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+      clock-names = "core",
+                    "iface",
+                    "bus",
+                    "vcodec0_core",
+                    "vcodec1_core";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "vcodec0", "vcodec1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+    };

-- 
2.54.0

