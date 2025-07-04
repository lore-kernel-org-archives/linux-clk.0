Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726FE2701CC
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613448; cv=none; b=az2UYG8kIKg+jqUQBzflRF4j8vB3lz0v+dG3x57b5LN1KPblUiD+U6MPhjjOWhqrvP2Rcsus5Mq8czTAEC5dULUHTGq1FcsnEF7XTG9/N4gwBNlRiXWnnnLQVQfDdNJeETjqN8oM6DWPMjj847w1sE1M51ypi91Scq38h8LL5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613448; c=relaxed/simple;
	bh=6MvXChn9H9cw/bMi6FXB2mO40dee5aW/+uTFO1/0HK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFoWFIccjSCWXUYzMvqMrCTh1j1CNLCpEZP/lZLVg/uCbF9mj5uJHlNhZaCQ2v1RW65c/CdZcpSe/dJji23Tk4EMkoTbcrSD+qUyY5y0ePR00fbF/EBHayc1pf8jjnFYrM9LL7wtyx9jXQwNCVPUBxcWSAtFJxi1+V0uiN26dFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SmXO1TgQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SmXO1TgQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0dad3a179so94037866b.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613440; x=1752218240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1sXB8vBl3/wRvxnvKTI5nzO+o6yvo13WXmmYW72+RA=;
        b=SmXO1TgQtPId6rdFBEMdXGSEQNnRudSGAXXdlo12PYCT4K1Ty6IMHyk8nzW8Ceahvy
         ji+QsZZ4cWw4MyOBt5ZM+65H4R8kEJZoXN5AiOs/UNSHtCd3PCK/NUM4YDsRJmO1VWDQ
         d7MtLIhlpgaZod8kTIBa+uzoDwauQ+rnIzQVa2UYeyzlyrPHl19VxQvVdcQTdgXsamkf
         CiybtYHJHWl6O64utIFJ7fIg2oZREU4bNRGzhRYNt6CRXSZZ6WZoZlJoIeqpm2MmGGJj
         qXdTq8gMlSBWiAcUyyOwb7bR0IjPNCR4JZTuXRyf5dCTFRLQKw5+K0WoKgipq47H2u1/
         TsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613440; x=1752218240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1sXB8vBl3/wRvxnvKTI5nzO+o6yvo13WXmmYW72+RA=;
        b=a0x6lYq9RSBeDqwNGmcWIgtpf+R0vf4qEAhc6WkAMxQ0tL4KiWBobAG+rwgKGa/VT5
         0uUMIYz6tLn/CdD1qgaF1W3ugghWQMYEfXLcXrFRvnFSHDirlDGQgu9MExfoZb4v2Pol
         ICYiwhO2I1a6h2YGWZn7Bq8ME7oPutDXPK3xxmfXTLujWOu2ob42683qZStFW/Uh3tI/
         8qUdB9OlzMtiTC1gQmo2x4MkKeDIL5DQ1hIKDDXqngi5mYntqE2WQVVrkwCsqKDS02Z8
         In7sOWZGk/GZNbYVFR10/LabOzE6Yr3w2h110drsskdziPq2vO+ThvUSfnP8WIBWmstT
         ueIA==
X-Forwarded-Encrypted: i=1; AJvYcCXighw4mCN5OHElZTarWw7v/UuJ1fC5GtVAQ95EIXpofq+EEZfOcwiGNBQm2vMnLABlpAfk0Mwves0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqc185+JzDJKxL9Dx//EZ5bfqp5+CRaEdlkT7Y201RpYCBdAKo
	LWa4nMdDoXjz38hWF1E61i1I07v/pV7LQPEgt3YmTPe1epgZ/vTNqkAeM9vj7WDcwGc=
X-Gm-Gg: ASbGncuKNPDcXkjHEICQBf8D1ra4rA/gyJ+MIzisf67ID9mGenhn8fwDRo6Qu5m0Scg
	5oq5EPdnKcTYyp4qG4yU/quTjoqu8P7cElT42RzMoeBtp5/95X4TTCRLtUIUb+oFz8nacC+I/En
	5YU0uuwWiAT39c9zoP9ilWwcI0san3M8QbAZwPW5rIXkMaa2nDmZ8sy+NWQw4iNiGJAfbvKpihH
	bXZJ9dbRGXklAaADbsLW0X6Hb9aFlLk6cUHrSq3p79vl7wVAo3Zc/6ytOG4slcrYvpdFAVHi/ss
	hh4ccoIemCgHCJaXR7bXhNpTBSpndovzEOpqOrCej9xpjqVfjDH5Zpfe8HSk8g1mevys/26dZmo
	PDCA2XeOZ7AP8f+LTc3S8j9Wbm6ojOk3k
X-Google-Smtp-Source: AGHT+IElGLpw/u7952nbwD/YHmIWG7YWO0q16mfXFREPrpS7P/6EixfLzQCLQjp2GkgXcZ69/84xZw==
X-Received: by 2002:a17:907:da4:b0:ae3:f3c1:a5dd with SMTP id a640c23a62f3a-ae3fbde9e6emr143426766b.61.1751613440012;
        Fri, 04 Jul 2025 00:17:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:17:00 +0200
Subject: [PATCH v2 08/11] dt-bindings: clock: qcom: document the Milos GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-8-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=3341;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6MvXChn9H9cw/bMi6FXB2mO40dee5aW/+uTFO1/0HK0=;
 b=/xAwuNTLRmHK6EPxC+GJ43TUvwHnah0RYfMF18VBovpLoRUZooLVsqyMQz+itbNVyv5Yvt8GT
 K6hEBHBvvsWDIeZvxaA/WDCktMvInLZQtKgJiphyVI2y9FX21VBYcJx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Graphics Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,milos-gpucc.h       | 56 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 02968632fb3af34d6b3983a6a24aa742db1d59b1..44380f6f81368339c2b264bde4d8ad9a23baca72 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -25,6 +26,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,milos-gpucc.h b/include/dt-bindings/clock/qcom,milos-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ff1925d409fcf3a0930bdb01f06b13218b0e3fe
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_MILOS_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0						0
+#define GPU_CC_PLL0_OUT_EVEN					1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CB_CLK						3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DEMET_DIV_CLK_SRC				10
+#define GPU_CC_DPM_CLK						11
+#define GPU_CC_FF_CLK_SRC					12
+#define GPU_CC_FREQ_MEASURE_CLK					13
+#define GPU_CC_GMU_CLK_SRC					14
+#define GPU_CC_GX_ACCU_SHIFT_CLK				15
+#define GPU_CC_GX_ACD_AHB_FF_CLK				16
+#define GPU_CC_GX_AHB_FF_CLK					17
+#define GPU_CC_GX_GMU_CLK					18
+#define GPU_CC_GX_RCG_AHB_FF_CLK				19
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				20
+#define GPU_CC_HUB_AON_CLK					21
+#define GPU_CC_HUB_CLK_SRC					22
+#define GPU_CC_HUB_CX_INT_CLK					23
+#define GPU_CC_HUB_DIV_CLK_SRC					24
+#define GPU_CC_MEMNOC_GFX_CLK					25
+#define GPU_CC_RSCC_HUB_AON_CLK					26
+#define GPU_CC_RSCC_XO_AON_CLK					27
+#define GPU_CC_SLEEP_CLK					28
+#define GPU_CC_XO_CLK_SRC					29
+#define GPU_CC_XO_DIV_CLK_SRC					30
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_RBCPR_BCR					6
+#define GPU_CC_XO_BCR						7
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+#endif

-- 
2.50.0

