Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A085237C0ED
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406475; cv=none; b=FRbnB9hn6N8IagyUifZmY2VLNi9hJRZCodt7rYUM8aZq+29r62U6fJmztUjB9TBsZdvp000EwmwV7+yPznvzZZEUiGglLiMq3X523nCyJFG9BaK+hBXEnUwn8cqPAMi89BC8XEg/DgAyxfHQhYzhBFOuPZ+KoqERPuMws8KfpKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406475; c=relaxed/simple;
	bh=0YOIeEfM7VyMCOce1KEss0Hecntxk+HxQDlZl2XCTRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvALn24RjFo9B3OmspOox5Tj1pDrZbpli1IrANrJ1FoUr6uhjRzA2NnspkjUQEr0sLyaoydDYejQi05rh9d5pJ+HUzygRmIfZtYenQZbuBhEilX0mn5mgfVRqc/3/moeWelZiYa2O5N2gjkainebZv6/uLGH4l2qdguB//c6MI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv2N9VLl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv2N9VLl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so41252475e9.3
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406472; x=1779011272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=bv2N9VLllYYGoUjktdwyhydbEnLd002Q2QI0nmjeS4n/pg8U9Fhmza/0QP9gTa52T7
         dsAoy4Vq2o5h7HW83aHNv82kjReEkEv0uWLue1p87JB4CCKRZyPjG1rJ0+yMW/cU+2Mx
         A0ohPovFEwxID323ugcgTQFkoJScL257m2ulxzMJNoqRTOsuiDLO5BQPeE8z7X+A/yeU
         wSzZSGTlILEumjM6LKJD8oL/OZUzcqgkPjrW4c5w4Y9+8sFOouOWCBLxMO/M+RIHT7st
         qr/0Ju4c89O06+RkNBZ8c8EvNEU43j/J+mOM9e98tbdpoks4I3iImJm9r0ciotzefLYS
         Lvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406472; x=1779011272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=StxnvduRfKHWV4vcfhROzr8oVWT3h0E3yxO9M/8ypv4m6wRwRIpHOWEjU5MGe5jvwh
         O/2EPKjVBv4NALLxMQZoNoialf55+9TPYbbsSmVEse292L2zY+u5rPMUd9EJFACzWAu1
         gXkk6w+RwFqzCUllQw1atSUaye7kiGD6CFlK6u6rJhvTnhi1i2K9n221cd7JLgiZlbq+
         qngpru5dYSgiqgUIDPVCXDCdy3sLQpbbMccvIOTFCqldXCmt0f0KHN41/ZvqBDi7WjHl
         189MOzJcY9jUj0kyOyH++kbYC+WoUyQLN5qWsyYsHHRpgD3V8KoSNwbOpegaOevw5jzt
         fGng==
X-Forwarded-Encrypted: i=1; AFNElJ+BiJjziBItIebVACDsksWDSEcFFdQp+ro5REWgMCa5TuVNHXKcrKYRqbguXuD9+lPO44Loxdn5lmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypLkKVBMOTSNXrDTaQ4bFUIYVUb3dWbLWeGf3N+GlhVbJTo8Iz
	ZKWgbe+GR+hYYoKdqo8qMLmMl1QeTIojsaG2k3Febi0vHnvRA2MEHT5S
X-Gm-Gg: Acq92OGM56RSo9ann+6nzog0zpRJ2c62B5g+EytqzB31QAN1QhNamkNjAqWVJ96r2yB
	eAkcsbTgHuS7qVDGLI5BUheowsHtg/SKg00jFZezCLK1ybqWBrzRkFiXeLgacJuAc+GS2V1bKQW
	mFH3n5s6YXZ6y9h6kjeC0pr7nSWNIDL1Vs2fAPf7Sye2Fz7hgDF5lAAFIMTUwFpesUCXwZI2YNq
	xI/nUFvZpZJJDLMSt//Fq94ebAjZ5tKAn0HQV85MsUIn23v6P3rW/2ViCmCWWLRkaqrnUNuCLtc
	w7kTxhrrvEN/ohMhXyLaJtyZzKjhdLNGtXUc9t4n/ch8o24GCNfja2bZLlxEd3d0zFMe7p158xV
	yNUNaPyS7zYCKm2Zy354LBv/mHiED+yaDAmtI4EMT9OxdIz4QJMxbZ6tLukbDyy+EjI4iQZxEjj
	HsbPBVGuTqfI/lbTDyW8RFKRrHAK+8k1zrTisyG3Y=
X-Received: by 2002:a05:600c:c494:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48e51f42760mr305708305e9.16.1778406472049;
        Sun, 10 May 2026 02:47:52 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:39 +0300
Subject: [PATCH v6 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-1-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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

