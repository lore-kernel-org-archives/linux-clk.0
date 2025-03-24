Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9425D55C
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805673; cv=none; b=jkDIvBWB1HDP9kwQUpQMxcjHVTMW+hQRyVsC+74lrV0SHYJKyiG2Rd+MCUJOf14MBpkUGpzvZ+fbST1cPjR0sM077WcItLHgz4F+B7HN9Tz+QouXj/d6rrlhA3wxB1TkW7YZhb9GbnoHXA1A15GCNifm/UMeMDbHGIOMOOhz/g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805673; c=relaxed/simple;
	bh=GLAsUw1OONraXoc4O2AxkqLiMT4MdPKRGHr5nbrSBI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTW8nmv7YUg+4U0ThMSTatfDlL3xBBagInTQzzSEhVtKVIMCBXIodWeiWUzXK4aVGggywMZJhNGi18S9bPS4v+VL2cg8Cfy97OywO6e9DZnlShN0TBoPTB3X9OjXqJXjwWgYq69o6j0xD4NlvZ7Qf1tDVZP9RISi6D4wYEYEG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T5xDHaeJ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T5xDHaeJ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so6382692a12.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805668; x=1743410468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHERlL971lhRhRNPhw773ZN7phaB0MazKYjf9mnRkOo=;
        b=T5xDHaeJdhNYbVjkiU0qmpziz5FYqA0/E69+GlOtc2ruR9Eu1lJz8JbtD8IQEcrib/
         JiZaPeEV/5h6MLw78ryzML3FX4p8pDFr9SVGayw20yz6YMlS1IOOdJ2Nm+wf2r1DoOq3
         TJP/1LralDz2AgfjjvsC1CGrCQ1aWTMnMOAdYMlQnjFN3I0FZdfRATW5LHrAt4rddz+v
         pi4x1n4Sw788bJiJ3+8k5L0oeH39+IEIWI1E7JzBt18GUhpPXiI8xPWCfD8ymPf34vYV
         HHcctPH+af5sSfVKzFwqknWZOCPmQuGI5WKtPQGohjg3wixbVnOvRbYMaEBCIM913njD
         aXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805668; x=1743410468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHERlL971lhRhRNPhw773ZN7phaB0MazKYjf9mnRkOo=;
        b=HWhPuvYfp+6hq0LrefIPCfRZ1dU6QCga3WQ90kkfGuTJuWkq58jbzd7xvqpUCUHVEA
         iYgCkKVosRd3jJqB/b6RJ5I4FjJRfroYBeUKcISxnwZN6qJPTd8/Z2pgqrDXMjR3njvw
         sXK3BcpcXajB10GRv1I5EK9EjqCAnW0v4mh9oS9IfnhBgqJ0MXbLinkelleYBXJiqEfB
         rn9A32Add8CHrITfY2KhxRG4+4NV8WynWZFNBNS9fWY52+4nwWAFPNTIjPRQJ6Z82IlC
         /O0XuMA0LnWrnasn1i3asAZlQbdl607wI71h8V0PtRQJWv//gc2c34EMrYuNM2dyK8L8
         Ph8g==
X-Forwarded-Encrypted: i=1; AJvYcCWNYoflOQLo7yB4zc167T80y0S/qFjAl/Y65zuF3p5TsB1IP97P5osE4o8kXE1JDThycuMhgUnN0K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UaePJRGuReBYckMM5kXLZ6lflQUBfCOIiii4Lx1hQZbbcQg8
	e26rajCJLdTVkEvLeuZHDUXVOR3uYPSeXs0vBB5rNqyHCtJDDXp6D5YKE1bWsiM=
X-Gm-Gg: ASbGnctKjMAxB+G9xDJ6Vtv8CPRXdlI+GDLePJZJIqvl89sWktXj/8K6ZRK/YulHUSi
	7dx5tMcupuf93rPJ+a2m2S6AyNwWQaYdtm+Abst4gVvKGszOBvNI3wUfOAQU9NE2xTEIe060QZt
	KT2lckupBoN5vAKIMjKlwoGr8Z3oVkMlmrHNm/kz6WapUw6cO345u5b9XD6pmghQ3vuLXcZMJig
	G0HIlYOudoIF6cZP8OLWu1sPlxxyVE2gDvPk0mXl9eJwqVewYn2rzumfN+wKuW7/IRuGUv3p89N
	IQH6L+dtteB37mrajnK6kbsVVT+h9xmne5iHfSrLRHlIfPElEgJqhhBUihVbkojRveNAq6xF278
	N6sbqyS0usLhxQ0XFhg==
X-Google-Smtp-Source: AGHT+IFE5/MpqqL2hNF98hOzKJwcxXpuxQ2ZxAMOx5ASm9H25AMrv76V9q9yPx88TbUT9h5ov9f4lQ==
X-Received: by 2002:a05:6402:35d4:b0:5e6:466e:5866 with SMTP id 4fb4d7f45d1cf-5ebcd4ecdeemr10659531a12.25.1742805667522;
        Mon, 24 Mar 2025 01:41:07 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfb33sm5715937a12.68.2025.03.24.01.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:41:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 24 Mar 2025 09:41:02 +0100
Subject: [PATCH v2 2/4] dt-bindings: clock: add SM6350 QCOM video clock
 bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-sm6350-videocc-v2-2-cc22386433f4@fairphone.com>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
In-Reply-To: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

From: Konrad Dybcio <konradybcio@kernel.org>

Add device tree bindings for video clock controller for SM6350 SoCs.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    | 27 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 340c7e5cf98024dedad6d7db4fea10e9f8077419..5f7738d6835c4ba999402e163fc85a07e3a47a5a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,sm6350-videocc.h
     include/dt-bindings/clock/qcom,videocc-sc7180.h
     include/dt-bindings/clock/qcom,videocc-sc7280.h
     include/dt-bindings/clock/qcom,videocc-sdm845.h
@@ -26,6 +27,7 @@ properties:
       - qcom,sc7180-videocc
       - qcom,sc7280-videocc
       - qcom,sdm845-videocc
+      - qcom,sm6350-videocc
       - qcom,sm8150-videocc
       - qcom,sm8250-videocc
 
@@ -87,6 +89,24 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6350-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Video AHB clock from GCC
+            - description: Board XO source
+            - description: Sleep Clock source
+        clock-names:
+          items:
+            - const: iface
+            - const: bi_tcxo
+            - const: sleep_clk
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/qcom,sm6350-videocc.h b/include/dt-bindings/clock/qcom,sm6350-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..2af7f91fa023bed469bbb2c071d93383dba29441
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6350-videocc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM6350_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM6350_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_PLL0			0
+#define VIDEO_PLL0_OUT_EVEN             1
+#define VIDEO_CC_IRIS_AHB_CLK		2
+#define VIDEO_CC_IRIS_CLK_SRC		3
+#define VIDEO_CC_MVS0_AXI_CLK		4
+#define VIDEO_CC_MVS0_CORE_CLK		5
+#define VIDEO_CC_MVSC_CORE_CLK		6
+#define VIDEO_CC_MVSC_CTL_AXI_CLK	7
+#define VIDEO_CC_SLEEP_CLK		8
+#define VIDEO_CC_SLEEP_CLK_SRC		9
+#define VIDEO_CC_VENUS_AHB_CLK		10
+
+/* GDSCs */
+#define MVSC_GDSC			0
+#define MVS0_GDSC			1
+
+#endif

-- 
2.49.0

