Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880C3E8C5C
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312727; cv=none; b=ngKPDihNLr7+z9s4Tqa055ErrtmfCpHq5V9+qhW26YiMSodKZXc92c5+q91XnqP1karJU2gC1bsdg7x9sbc6X8ZO3bDGOY39mh9StKUDoO4A8CzIIWNF6pxGjUBCTgnHwxC+qiZAx8cpaHdVcJgR1ZpxDU0kJzGDWW6B0Nh903o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312727; c=relaxed/simple;
	bh=sFgdCYiD5TfywfevqOqs8Vz5/tI6iCmjO2YFGeFbPAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NcMvHMnKUt+yMPqLrXk4ZwEg4ueE+z55VzaL28BuDdBkqoKOa5bCYZYQ75jruDaZXxfBrXhmu6XuFQAxlxQR3yW2TSyIQAxISz0I58yd/7Htd+IDPufCjYS8lqHjH01hz+X4X+9WhsCybgbusMmcJK22IELHsg3LfcWSVaEErXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbmt1lMc; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbmt1lMc"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7991db3dc98so115166657b3.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312724; x=1777917524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=jbmt1lMcDni+FMLlmXV1JnIKbnb9nmT+Tc4zIBEzUfTNHhzDWBK9/lga5UNB8HNgmi
         /SAf7OxUU7aoxa5UnnqRGo0RM8qDo1lrUny5vKlCxMl74A1jwZ1xnAMR6x4qxSn3j1xv
         n0BB2hXST1dNNaZHpp92GieQG6JfnOErWeOYazczv/zpnOgvTQnkMXPjLEEFoXUF3iSj
         hVrISl/ZgGvXIKdD6TyMWMTxz1HbrlhEt2fIDk+/Zol9PCp1AaHQsraG48xsTdd4P/4x
         zBYglmkPsY338RPYTWH7iTvfu/2MojG/c2J5VGpC3tT5p3C7U3RKdYFOcH4LWyoxmPh+
         FZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312724; x=1777917524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=d/UbbKdUuHmTL1IjDIx6VyCsWJuRhmnC1F5HhSmE2dEntNla7bCQCom/lrEQDcHiL1
         qKtqsraiMZDtjkusWUDq5dD0C0u/KEWMHi6MCffTqAX5+EviEh8sp2dgp1aI/UQxsctN
         Y2Wg699ikSJ4v+CagzjpDe5xJUOfKiHP458emtCWzaLrDSKVp9raWnAo0Ri7U39+rYtF
         WcKqcZNrtNZV0ISSivCh5N9PkWxr1IqSaJU58wmnLglakcUv8buX7JjRZaU7bkLrwUzP
         Qnw7uQ8rFl7Q3dzu2LLUfapimOtE69jfAz5Bf7mOp3lWb7svJh4e3zjyJ8nIwDHKX+e5
         QoJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sLH2k1EWyjN7gxAqCXxM6/2e1F639imv10nrnD/wBHsrU2VYoNXBVj3YPg6YYFWtL5ZhIjky0pxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzaRVijlV/nQDiNGfobccuKHBwlBkj1v3BQVBMuMe/5D+VGBo6
	a2mmVDUzFYjFtMPZBixEhib812cZGG/5oYqtm5MKQnfkkf+QBde/O+dz
X-Gm-Gg: AeBDietFnRqNXAPKwXe0H4JacP4brDSqyENxM51JdxZoJv6sReWNVixS7OkGgY+NglD
	W8t3VF7SjR+9C8/YgwkuZVetALywXnr/RHqzlSXdlS1l1X0tELzXdR21g577CXU8Ma1HJ9X9l6g
	CnIUOXWjRpcANlSTk0PrczjJpe9fhN4mPOiCeJB6jrqLO4UjsbZt4qBHz4NzE90WUdSW5udX/Ja
	ySjix+OTqnfLpVbweqUocrUsIg7uBO+ttMHf7D60HOpWSY3aTmBw4Ztr87W2ZHF/A9xdJNoEngw
	gwIJ72y4pGEUECDAfF7WmB/+cxbQSnSlb/Rgc61LKvZWMCsE0tqSERqnaYRe55WzVl3Edd3THyG
	nTcDcNGTLdxTnyzYxoNKCsvcDhbkBv6YouERBcQhZOARO4ljZCBLPF35YfZSRteS0qYIa6X1AYS
	mygnqJNJraqodvK18N6SHERRJsOA+eMfAj49Gh
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3553787b3.6.1777312723838;
        Mon, 27 Apr 2026 10:58:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:43 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:23 +0300
Subject: [PATCH RFC v3 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-1-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5790b3bf5aef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,147 @@
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
+description: |
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
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - iommus
+  - video-decoder
+  - video-encoder
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+        compatible = "qcom,msm8939-venus";
+        reg = <0x01d00000 0xff000>;
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+                 <&gcc GCC_VENUS0_AHB_CLK>,
+                 <&gcc GCC_VENUS0_AXI_CLK>;
+        clock-names = "core", "iface", "bus";
+        power-domains = <&gcc VENUS_GDSC>;
+        iommus = <&apps_iommu 5>;
+        memory-region = <&venus_mem>;
+
+        video-decoder {
+          compatible = "venus-decoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+
+        video-encoder {
+          compatible = "venus-encoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+    };

-- 
2.54.0

