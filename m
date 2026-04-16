Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824703BAD89
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347054; cv=none; b=rPBg7KjaIRy3cXs1BYQKtOIC/MGs+FdYb3eo4K+m8r+6Qssb4p43SKg9bMEH3naJaSBfdYQMTdKA1KX71RpiNuSIKrqybTcefLNEnP1J3hIg8DQ8lx+rIM7ET8+g2G4et/YE+p9oA75ZasWkyqfEmFLKCvHpggiqW5QQ2g5L34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347054; c=relaxed/simple;
	bh=RzS5JmKjsOZYW4Pwddl7sWCABCvZEXMZ2Ju+Ufxr438=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sTTHB7xYX6kk4ktceQ9t85LflJVAH7ZqJ8EIbcvgGLKEVCPsGiufWxy2WNvUUAjxM9zg0PzMzS44v3IuCGGkSKUpqoIjJacNuGwf+/MNv5mm5FIuYJgtQTPI0Sln6T8RzMoh/SkUwkXR2YfBIr0A37wII0zVw9uXnDJiBZZOAzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQm7r3qm; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQm7r3qm"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7b37d84a6b3so46481447b3.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347048; x=1776951848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywTUM+tHj4kZ/RlgFq4JcNm8/09Xy2NM9dmr9xVBZQg=;
        b=lQm7r3qmUTW7uqxhtlvQQNCq1dO28ZJuQlEhBhTcdWvpUwjAOwiWeDIQl+V8y80Iqt
         pxE8how88qyvJ4tuNQHOVWcNRr0thrbYXWH8ps2FetmX/5y1mDugFQgesDiD9oT1b+tg
         phH7o3HlJJDla4YlINQtkmceqUvCTaH2tEe7xtHTTvY6DTCDjNO1PTFswgfcmg5wLASH
         wYjUJchPrv5FK08gGFxa2b9s4suw4Jr+HU5mTdr3awtA8Eg6yAJeGoCI/QzCMLGjOvZ8
         uILRJIZV2dGP6TE95Owu77KKS668zdzpbmvNk3/6yUkoYyZEsDPP7yNRruMx713GeBen
         V0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347048; x=1776951848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywTUM+tHj4kZ/RlgFq4JcNm8/09Xy2NM9dmr9xVBZQg=;
        b=SdJNk0MbZJxYZPv2+xGNMzojS/TO+mP/KU5IoXqbe6lIgV3uTzEK2MBaAO2f+izN0s
         VNiQ9d6eqekqDQ7ODDdtjca+/esZwGjMGvtcYizpaEh9S2C+RB+D9UrVGmQ9gWWbKp2h
         JtnEzr5AellD1EcrEtJyisIaE9rdQuXZ6wY9S18LKEzpCCWg1E+QWvsW8LFemRY21R5y
         IW0AVc1kGVsxoufxgE3z8waxDDym2ElRBO0BPsBD50BqZ/ja/NeZnnGNfWG/+iXxCoNW
         On0fSIY9t8nMBRTwodDONh38Iv2KdhKRFeli7R4KjKeaaXl9n7xTzE1+XBsii0YhqscT
         g5Og==
X-Forwarded-Encrypted: i=1; AFNElJ9R/dltnjH73Q8tL8X7AZeoIqTylxSxh3My1i0mpbbK7//0kJhWg8z7wS0bJ1Bfnhx/cv5IhVzjKY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxdWmbLhcjJM9f+Z5OxnrjoNKOuN878hBTS/264W9XOgAFpyu
	J7/aaPne48i9VKtF4vuHfaIJTFauYF7YwXlIk0eUBUMben13vlEN/LYK
X-Gm-Gg: AeBDietqkas7W3MBDEMQ7emJIgWumteEeQMynR6bTSKkIdl0h6DMdMuJSRRwtHKDh7g
	Cy/S66IsqtXzC+t0POv88F+eCjUPACEWDptzOPwxxRogx4uZr1JWeKQ1h8qyFDR92jeJn5MBpQb
	T1WgMWIPIYk4OaoxDWWYCEFk5WOicwxNwkkG6Io0a7DlPpy3NSOt0/SXotv0i36HQTBIJfXYvhF
	KcpbTgd9P/9Vn2OtBdEtV9s4iQzKrBl+RpoHNaQ4BLVCa4qMpdoHASSgwoI6IZjVBweTvo63boK
	aeNUldUCVTJxofcS3b44+DX9+hhoi7HIc3GZzCP0UnDYDK3S83lVtzOmZrftTYhqlY9PtzNLkSx
	xHOvOllR0i0dBhC/L2LNAUmlYQPyPGP+K7qcOulkjX2v4gkfpCaAnYIjmah7cUfKTRZW88GUDZB
	6KCah5RQErtTQlwQ6AA8p0u95lXaE11C/T5GNg
X-Received: by 2002:a05:690c:6609:b0:7a0:afb5:6876 with SMTP id 00721157ae682-7af70f92567mr262065907b3.31.1776347048274;
        Thu, 16 Apr 2026 06:44:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:07 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:48 +0300
Subject: [PATCH RFC 01/10] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-1-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
 .../bindings/media/qcom,msm8939-venus.yaml         | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..730473cfcce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,104 @@
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
+required:
+  - compatible
+  - iommus
+  - video-decoder
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
+          power-domain-names = "vcodec_core0", "vcodec_core1";
+        };
+    };

-- 
2.53.0

