Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1726ED41
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141882; cv=none; b=inuPT1zCWpmg0uWRrOgMzG/jBZmdh2lp+Afe5Pj8Qs6JlkW3G2GlGBg8YANWJoEW6VsobS3ZBWMVLedP0yZkNiJei20465CfGONHJ6hTD5AzqNdyFaL3Cl0P5rJ4PEwjODkrcRdh5kD2OCrSYgrpCy44K13kG6RvDe9jyawAu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141882; c=relaxed/simple;
	bh=sFgdCYiD5TfywfevqOqs8Vz5/tI6iCmjO2YFGeFbPAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWH+c12ZGEtxEAcSiPK3ppYwUDyYBwuYHyE5higvGhHkldJUVmOfrMZZbGc7DE2SgupM5mWA/QQHaDT9SkX0ASJo+TXAKz3Ad96LXg6YZPNyIPnvJSgAfBNTrAjI+BU8daCYdvyIP2TYTvuxRz+PF+rsZLNErX4LQ7J1Zqvqdzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spY9IRBA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spY9IRBA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so101765665e9.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141879; x=1777746679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=spY9IRBAQm24NEyYKsyUxzdxxh7SyRDyR/3fim6JiAnc9mUp7uIklerXnVUh10iZze
         gA7Nnrs6FHLiPl00ffSCDBRXvDWl6Zx0Or81GbvWB9qKPVsO/stMBC46tC0zRwUnnelO
         2D/qNA/L6XOUSjaVCDEHBmZ0QQh53MNodNWTd4KKk1IplhukLUbJ+FKfQj0fwwsFjc+w
         d5NpIr+clY/WjMhb688lstS2GvXdj06SkfwXyDkuXnRCacNMQmmRcmcBGo1ugKrFkGh+
         708hCnIkoGoTukJUlZeZWttzNlJyNjrOGoIvqr+dBtUrFLuWjy3TAHde1ZJ9pQz61Jya
         EabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141879; x=1777746679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=cHQSZnwUF2ni6Xe26JagTvXyqxustdsVi1uIsm/wERQ2QiNC4Z7EubZUNRW2Q78kH7
         snNQn0U/+Vddpg7YjgPxYDikT6EPP9NFyPhjdQOZf0AvFMly5XPoLQ1/AHCEBnKvmd9b
         2/RAURFWtm0dTHuWNyHYQLtYtn9nUeuOiGrh3WgM6bCrZXcyKH12xJgzQ6WnYAbmkqON
         C2/6CZVjNgWQW/15+ezioTYD0fpZSi0vXrKJKgHPqLTH6lIBLfSxTEqHZBPLzu+2rbxg
         JdJln1leL1MIKKAF8+oBPardawlfxX7AqmkasoETq94tn9DbvoN1eZ+xz/IO77hNodpa
         63/w==
X-Forwarded-Encrypted: i=1; AFNElJ9R371Sgq3PFi/LxZWt9xTukXwlTZrgE3QkwEnytD8gx9mCe47c4nHLiFsVYF3Ap9jkcPz/fqCdo7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzar0i0se/I/+Nf4xIWpnPjPbduo/uyFt8TATGM7f3HvMy6lTrL
	MWtx4zKJ4QhHeM5QMTQeeCnJD4kOD8LyQt6M8ewhsSMg0ibpqI4iy3tZ
X-Gm-Gg: AeBDievdJ9+GAIoq7Unuk4zJFxgj3MDQZdIkKzr1LgCz7G6pEBnRk1ZJ5HPNDbo0v17
	huXd8IHoxxf3H+hIt/AIggmyrZvP7exD36DLUH9BnUKUxWnS/6JKzOR4P+HhlX6/AMr1aYdlGVq
	6OCx72UEGetDPeBrND0C+mXm34W1H43d/gunMUI9J3hv9DaUYrw8iNgrnEk39MqkVwRtkTLqHKA
	KwW0+0AfUAoQ70S+c/2RSgun+IAqefpp//R80DO9lBUDElkP1yJJJ0G1+VqxSIhMoTqiRXz+ZJP
	q9GSog3doDKzHZ/5l/beRTAxGNmvYkAVL58yXk5+4zsSUhAI7VzVFbMS51vC5UfLpgwp2LEhr8A
	QXHdcZvxziwUdoQxYzKw4YF1b3kxkhKTHYPQWaThInUBWeH0isOmoduSOFPgy056PsHtMflnT/a
	cV5B0sxqpLRtL2twip7QcPfZcpOtt5EKkXJOQ=
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr410723485e9.9.1777141878764;
        Sat, 25 Apr 2026 11:31:18 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:02 +0300
Subject: [PATCH RFC v2 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-1-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

