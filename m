Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AC3B6C03
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707551; cv=none; b=ukBXfIXWR+f5ATmXBGkbIyYt5znqbcJpOr3doU1ib++cnRqKBLNdB5BRGN9sDWUKa4Kom2s9yYabmvp5l0VZpPLRykm4A6QeinXUcEtkdfk3LiyRRzgQOiu7G4cd+Urb+pvHnFEJxUi4cxZjaUlsJY22Bxz1M2yw9bDhoKeBbqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707551; c=relaxed/simple;
	bh=0YOIeEfM7VyMCOce1KEss0Hecntxk+HxQDlZl2XCTRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKKjzHJViJ+1bAJf/w+Qea80IQf3kJr1Xlpkvc4nMhjDRd/a6steU0XlYqVYaE0L4YFnc/4BGB4yT20xNkJSn7LoqTRsFogrPz7hcTWxG0tGicSyQ4zD/MI6G7Pqmq7P0ZR3zyYc++BDUBiZbEJE5sT5nJtnCFIFd+eIKem5afE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nsk2ssRN; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nsk2ssRN"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c0bda7f15so8219624d50.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707549; x=1779312349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=Nsk2ssRN1aEOW/O7GOR+etc+rMn26rzl9oqPFn6e+Re65IhjOOdgzzF5U6+S+5EETF
         xoUCZKS3tIVBzmxErTJgcttR52oywhZ4KNZgFQqTYZm9bdJ9oNrn4HoRsMx6HDPXCgL2
         VDSaltAfBo3oTx3KYO1RDOeytTn9g/e6EcQey0J71GxQJS2FZs3d9xR9ffgMLUbq0aq9
         lBXAOPa7dXvtHhU37vtKU04Kruqq61K96xZ2buzaFgxfD8vTmSE67IEUQXdRYGLdkSDh
         Ivb1JeOQe0h9oXfBJV8L0l94QMUEtdHhUJec0F2Cd49Y6zbkmX1aYDvIbDlNitT0rE9s
         yEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707549; x=1779312349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=TsFVcOeEIfrIflGQBAnwJwjchFYZd4u7bcBu4IFTJYfpEI9teCprJYzyBVX4bkMjFK
         Dt/M3/EyEAwSJshPK+V1uNZFgHXdfjfCTYbSUIzDLj/Qpw8m0eazIRRgBxx7bNd1HKDy
         49ebvcD17bbE19NpuRrKsmNr+FGVgupj6+Q2kF9ermbruaAXrcfi5PExi5ZenvjlAQHg
         Aan+MZH9bn/4d8vVv4NmZAiVlnVNMMbL3MTcf1PVDLyB/HRKSqjb1+Fl52l1QwWl3uq8
         Pc8lrnpa0o4QUG/KyALCDYexFTvGeQswSgf2e7AyLhW8Dksx57N5kVZxhZcsHV3sD1R0
         C+fw==
X-Forwarded-Encrypted: i=1; AFNElJ9oOqgbA51/KB0QtiCWwTiiTDPa/McR2q2nTsGd4t4RVr9SZbGEZ/JajYy3KyDWhQMQ2Bldqyq9bl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOWJ6BabK3eccPNKB1K8MPCZ1nyzG6u+cNwjSVSECqUnS/0EJ
	bIupuPagpURJxFQiTnOzSP/eXSx53pPwpHKNzpz8AFTo0X20pTBlJetJ
X-Gm-Gg: Acq92OGuOa+ON/yoar+XTGrEdu9JBZhAvoI150HlueR8L+vfkfftrl1FfVuiMyZ/36x
	rhuV6b+kXcYk5rjHflwmdhdmx5W6zDImd4DMQ8d7+ylGNvOAcwX6CzchTWV4iEayX+g6FvHLeBS
	q7LsyE6xA06EBeCQLcMO+qvaPdbDFQFzJtdfpKwqrvThBvGgCrLttX5KvFQm4du6ea9kBol65p5
	IfHe2X6raBk1OM6bO1svolHmk/luYf1bVwyd6R889J9lmma//pliKXgF3R4LdQtjS+T9nNrlBBt
	voE8YWMgyPVao9oNE7L3LdSdGZlWpG6OPX9A6H25nYVZugsJ/66610V/JL4BjFoK5KPF8BY6LL7
	KnhVs+LrPYnlMAWizZ4hSKs6asdvan6AvVaKd+WyzLkBqOdhNs51QHV7K8BG2OBe22ybrc8Mt7T
	KyWmIhs+vTE4zRM/qgqjZLokwQIQ==
X-Received: by 2002:a05:690c:6983:b0:7ba:a726:57a4 with SMTP id 00721157ae682-7c6ac5aad93mr55193477b3.36.1778707548765;
        Wed, 13 May 2026 14:25:48 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:25:48 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:30 +0300
Subject: [PATCH v7 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-1-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

