Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDB4949EE
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017554; cv=none; b=WaMKjLKAFS8WgaRytHsvw8GxgxFjsoKzmlNomuLzDMY/PhRyR1UGJsLVB4mTTBSX2PZsPOzUjcYr/eTUHv7ORxkgfyXYov6FkbmhTq/7Mu9sCajTe6cgrLEbrtpefJFWJZL1sOjUfV0FPynhUC9A2AdMKy7RkYvj3bUqaLM0Yuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017554; c=relaxed/simple;
	bh=mQCFWruCA9liz8Y7GOoawRK/Gn5yRlh1Erqdlb2XZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfVxTznYQ+awjZIa6DPL52bwDqpQjkmv6Y0Qmq7pzQ2MbDNRjf9Mm4YNHDHbivoUZcAFH+kuJjvS7QmXapyy0R5t/uii2bt5Kvgt6YwzPErQm/9w/3aFSWMI47/v2qNybSVMkAi2KAXxaLjwzF8muM6i9YsE2uk824rt9GNyOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVtcG9KA; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVtcG9KA"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bdc947aa88so9078537b3.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017551; x=1778622351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbs3u+DXgi4DxtN9oIYsEpuaN0QPP3RX4y66RdmEGMA=;
        b=DVtcG9KAW5kh3X+Fnxpv6eB7vQviNp+fwCrMZceiKFDG8bbgeMX2Iqo/Y6DQjEzfre
         h7lvAY1D3jDVYPJVh+y4t2EO6DJRai0TbE+1c86IaYfY8sVwGQvzZ+TWpcTHlZi4cc5Y
         e3Jk7XFIXBPLStfMgVH2KbKPv8qqlkCC+Y+BMTDXCkKNSi033zabDS0+MvrRx9DAxTDn
         V59AkQovB4dtoHwRJPusqFV+kpdUYur+0ZRJ1BVSkyDT2q4LgyYcYo6UyjOpExA3oKXb
         zv7fmSOhlTayzi5S6PKmrASlCm+q9bTGVaaGGxfUCi1KPybvoJJ6KlvCnqL560RWgd3T
         ZLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017551; x=1778622351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gbs3u+DXgi4DxtN9oIYsEpuaN0QPP3RX4y66RdmEGMA=;
        b=I1MLD+czbFdV+1iD6l4TRWS249ZTUUQqX/SJ6YgCCFFcg1FqIdpqjo1weuj+zyn019
         Mp+1rXv7ikqYJQhGPU6RTESCsKSzhb8nKvY/oxQc8oKeWcUfBZgN06V/5UleHOomtk74
         pn6CU6cuB68b3gQ3tRL4mYqgnTHhQ8ErHNdc8xh2IMrVBacomkYndnUyl5klAQnnnhpF
         Q7QHuDcJW/hHKrF5FP/1i2dhppRJBusn7d1Ey385aSUW5crL4kkxGMEWfEQnfcjPS+gi
         btYcfVoeXcGHRPaYLlW3nbzW1ChzPpXMIfAVVC8uZY/k4nWq2hKp+caOOE/VWlNpSVf8
         OAqg==
X-Forwarded-Encrypted: i=1; AFNElJ9RH0U0EWcqxeCfokzCCIkhKcJhZ4uGWzHFmYlvXW4meGEMUEfGQx+cS1D0sqkqQm8rSyV9k/4Z4z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wmkQSoc10bvjcuTbOE7JUXjfzxxcjrUq0RW1C3uUx0sIxIit
	8N1PdrD75oURzpH+F4zpkrTgfiN4vfIsJAba9hXpts/b3e2ogG/pV3cV
X-Gm-Gg: AeBDiesUwpP2WMeo+sOZRIRm6meCrudLktnZ21eAgrI17L7vb0rBnoU1M2GBVjjq3mo
	cklUL5vUJOvboAFyXbVj6W7KLIfj7fVaojCBXjJMVDABqsCBhgMZDJCPj+ky1yQXNDzt/SZKKAo
	H8ZUcK3FeP9ilgCrQEkfUJtJNFuPaQmadlkBf4XnOjB6MNb/yRIf7qKPOmNPXMzf1y9jDUGLHHH
	aREDCGmqc8KWzOoGhWZ1o3IJU38l/gCuIHf44habSTBrMb0Zt8iab5PdXtoG70lVgju3NWIvnyS
	6l+7yK8smke+nz8GZs8zqZnqS47vWCDZK5zTNkeHGCYgYTjbxitPhZ2GRimvMurKnxV/AtC7eay
	aU8su4VzRxEyLObV1LCKPXBR+uU/FS0VLLVGUkMO/2tiF6vHChZUyxo3OdRVQfhaijVXxyv6F72
	7HP/k/VyI8J5izs7g/bmrk/4fJ2sE7UOvYIu4NPwFEwMdu0Vs=
X-Received: by 2002:a05:690c:690a:b0:7ba:ef98:9719 with SMTP id 00721157ae682-7bdf5db9ad1mr12857667b3.10.1778017550719;
        Tue, 05 May 2026 14:45:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:50 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:38 +0300
Subject: [PATCH v4 1/9] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-1-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
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
 .../bindings/media/qcom,msm8939-venus.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5bbc7cfb61c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,75 @@
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
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: core0
+      - const: core1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: core0
+      - const: core1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
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
+      clock-names = "core", "iface", "bus", "core0", "core1";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "core0", "core1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+      status = "disabled";
+    };

-- 
2.54.0

