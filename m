Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB252EBDF6
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257202; cv=none; b=J7xuMXdczcyg2Li4S89hB8aMlExezPXREFfvxqeQqwIVOssJD7zAaTTtojHvEg465dfs2/tJMK5s8ZuzR0g/t+/4BBEegzCKlQHVMIkR+vzxzyHCXPKFgbHJ/SpDyiBitHkz4VGPRNf1GEo8+Bdt3IeieIwdPWtMN59Fi7Y71T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257202; c=relaxed/simple;
	bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBhTaiXdRlNf7IZkR+k149C21HWte0GSeT//9x47LVGKn4oFY/d50M28qCg5pDPE8cJnf/GB48r5hJHl1v3nLDq37m5UTtvGQyYTt/XGzKYGt6ToGyeGi0QpwKyIUVvEqfSn1H62Opo/zbhr+ktBhHWk9hto7akjaMDPkn39VGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pv6wTokE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pv6wTokE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade2db1b78bso128834966b.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257199; x=1750861999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=Pv6wTokEbaFAxr0BK8U0RDy9o1m70QH7nAFSgU3CblA1OK8+JQJ/enC6NuAn0lzYyj
         4tLoZYcvD5pPquFsrGPy0AFG1JkcsxwyWuuqLItcpGbMRrzli37rm2LV+1LVBNMicGyG
         H841/mGvNEfinzNDV7zZ/Bmh/OZHWeszJLW/n8MKS0cI0atiC5wk74VA111OlVGV2SUs
         FZFaJYAzqwBP1h8MKN8bKbOWsAhUjSXehsj3uhxeI8Us4U7qHqvoGgnwsAfNBjS130+P
         DRKss3ftA2MLR2KAZRo/Eyr9lkSPRvijmkLmG65OWj+ob6bFUjMsmYgqJKbmBm6jhxVj
         qynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257199; x=1750861999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=PS6gF3mc5t2W6mwDd2A+1+ud5fy6fVpxVZRAfSDVCnGcDl1uy5KvQygVNmpYUcySaH
         5N7HdBs0UD9ErkXLMXTeu0813CXrAd6odP1iC2Rc4qASRpqqqfA1FViY/k4F7SUWDRM1
         9jrARUAnG0pIwXKzGqI+SyAAcqlCXsqJFYSAPO9oQ1rYrW4ie3ndaz3AZsefQ5hrjrXo
         KWuRBqsj8e3N8gDTftHLKnB+8hYXBSOZNApYJBaQWDeo9VeVsMZHkgLatXsyjUnf4wm6
         iZoxcZalgezp7TaAswu1gS4Nwaai9082oq3ifNi+hDFvCbpE4s45vTkZM8uIOR7Sr3fg
         TvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPawpbE6NDWXZo9M3Yz5wR2vKmp1lg77N30tBE5k9L25RRajqGnGQkKrcTyb/73cUvBUO9YzuTC5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOA+XO+IUxIG05Ki6H50saARzODQN+cKIG3DQIRcd2HQZTWuG2
	XYu/v6Nx7mMD8ev80UnprbDyt+JlgpUWWW81giud5TizHjTasetmBjSbwkb9xno/+f4=
X-Gm-Gg: ASbGncsJQY61vH+IsqcZsDIlx5qdb6t2LKmMDIzC/W+GrxqdLGecFq/p3Lm/6uEAqzO
	hmmBTu8f3cvARfVkTBm4VzvrNtSrrf6swCwKPxcdfSCI/8nxjcJYrYyuSwWjvEOm6/IfZOCO60C
	15p9dIVYjfCqCpejlwc62TwULbcw6qtf6vcosCVkS1Dm9RTQo3+qseCqso4O/puLi5JJv29waZo
	4uJw2F/amlgaly5+0gjd6ZyycuKzauUTY0r/QRC/C+UqLnrBLZdSoshK0SbadQM35+2WATBRBNs
	1xxGzZfTfzmckD3d/JQfP91NbA6M/r1o/md4o3idoXYoTDprLu9LAQTjxUXxV2fGV0rEP7rjdC/
	BDSBukOg=
X-Google-Smtp-Source: AGHT+IGnO4AeGX0v+xlGD2WvBUnNlaLV8qfrgbqsidl2MAahvBa3dYReqfHNCI7spPo1T7GtkiXpYg==
X-Received: by 2002:a17:907:d29:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-adfad3748bfmr559881066b.3.1750257199028;
        Wed, 18 Jun 2025 07:33:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:31 +0200
Subject: [PATCH v7 02/13] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-2-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4bib0TEGjh6PRC3ElS2V34P5xI8OZ4+ka/N
 sivMV7mbICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOGwAKCRDBN2bmhouD
 14NhEACDDmu3EbTY6hDUY95YqoiGg3PZANS7q++04+7UPtSdj0ys1bAuZidDqDqhVFaA3Zmlz7y
 QZ4TCxzra/I7YX3fhJeQLhRxT+R/Cfmt8+cb3vJxMEz6r1cd5m3dIwLHL6kngjuTNIvNY3gCMaA
 NMOCzYcgyf73U6Yz7a68S2CmJM+ZjXMjZLb4RG5WWOfHmbGtfn3kM5i8KIFjSV0sfGsbpFPrBnu
 hkTN0bVYhu0TG3EZfrPOAa1V89etmpwA9r7Y6KVLkk1g4S/lKWu1voKp5T8Mb5P1qfH5lwWyDn6
 vfT6iU6HsGS1KrvyT3hpD+YG1ZYcMY9CIhO3HryqTLEeIoRS6VBGvMjHhKLy2MNr6t9FwDdAjtt
 RPqfaxnXJBKTpylwR469a+/0PGndp7cd4kcy4rQp+BGcnP7SGGFXr45ejv3fTh+AIlPBEnf1P4o
 zM8A4XVW8hJINDJJtDsIgIUgctAlJdwIC2J+q1MuzStRCVM/djebQL8tpftqKSgvb1feH/dN57f
 nJ6x2WiB7CS974UPU0p5QxHpcxWcZa5Q789njnS5KYGOifRcTHH/X1oEoE/XTYJGFytM2Q92Y4+
 3MXVYF24f/7pYMz9Of7lIJSsbA5f5tKqgacRWgx0eMBPIaJ57ob9Hc6a70dDGoHsk6HRtkzaT4Y
 mgZsli/RbyL8hhA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI controller for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

It does not allow the display clock controller clocks like "byte" and
"pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
configured (not prepared, rate not set).  Therefore
assigned-clock-parents are not working here and driver is responsible
for reparenting clocks with proper procedure.  These clocks are now
inputs to the DSI controller device.

Except that SM8750 DSI comes with several differences, new blocks and
changes in registers, making it incompatible with SM8650.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 82fe95a6d9599b5799549356451278564dc070de..d4bb65c660af8ce8a6bda129a8275c579a705871 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -70,11 +71,11 @@ properties:
        - mnoc:: MNOC clock
        - pixel:: Display pixel clock.
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   clock-names:
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   phys:
     maxItems: 1
@@ -109,7 +110,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -218,8 +220,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -244,6 +244,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -266,6 +269,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -288,6 +294,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -309,6 +318,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -346,6 +358,35 @@ allOf:
             - const: core
             - const: iface
             - const: bus
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 12
+          maxItems: 12
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+            - const: dsi_pll_pixel
+            - const: dsi_pll_byte
+            - const: esync
+            - const: osc
+            - const: byte_src
+            - const: pixel_src
 
   - if:
       properties:
@@ -369,6 +410,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.45.2

