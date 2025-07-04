Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243527EC80
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613450; cv=none; b=D+z7/CG7nRmPx1O7/WmndbzmQ5PoKOVPsfDVwXMMpdw7cCBlOiXslse3wXqp+SbsdrDLzCVQ2FYJRkEmSOx3zWRbsY4SRx6EGCyz4ne78rG16C8d3QbCMP1CEuz161emwQTdSqFU+hxmXA0BXxg+7Xsuo6xnLMAbdX82SSkIHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613450; c=relaxed/simple;
	bh=+AgG3zOOY6NcwwiQON9pv2xqdDKfNXoaCvH5y/j8frQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVbopAQXBZLxK71LMAkfyxTZTZKnIholKYgsgnXz1sHCplnShLdwXvWrWu+c+pesggOi8qoAhMC6vHhLyIiZu54MZ92ssB0umrdjnW0xDdzErFexICUj3IvE9sqaXZJGWCUY5yqkzFAstOeE7YkOnJ4toNaE/yvzFcFP0BUrOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AAJh0YlU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AAJh0YlU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0c571f137so125038466b.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613442; x=1752218242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmAPZ1M4vJWIEIU7ASOYdECUr33v3VxkNLgR1F0M0h4=;
        b=AAJh0YlU4RbN+ySWlCB1cgKePcV2ZI9p9H5SYljAVluwXL7WupNq4CJFMTf5xyCwLx
         QBrMGE8uRYmtY18jgRBuf0n7P1srT8kEbT8emC9rF/t6ZPLJqd4842FLLSPSs2HXV0Rk
         ORag1Q8H/2Vl9VvsWOZugZw8KSNFb+e33CnGsClYJ6r65oOKPX0fwmRelWIwfiH07VoC
         MQk1vslbAnZt/WCCASzRw49KkMstm4wNaMubI3cOxuIrZE0MgcxjCGg638//ic3PRtML
         vi6sCE12dtQRPEEn6rwPgYX1uGAW1rpZVJeapjpdgckKbV2yzdOwI4DhMNJ0JLsXhcaA
         pjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613442; x=1752218242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmAPZ1M4vJWIEIU7ASOYdECUr33v3VxkNLgR1F0M0h4=;
        b=Brf1sXPC+BKChxPLA+FWD0UBcjyMv5/tYhByg6E2iiDwW7RsjKXYcnJoquQX5EDvYi
         zOzTKbHwI/xYa9kHFshGoeh7m5hbULkl9sdNRxWpH/71nNDIzP6X1FjiTi8PgYf9mEx4
         W4VJVs2H5Y/GzsMBgpANT6GRtbYgUfe9JIAg26Pg1j+ypSataZBIzegUmSpySy8pxpT3
         QEKRxCFTAOeu6UsbyfKt6OdabTj8iBT5tntausbO3rhL5g8vqDq+8lLNsgy0UatpMTm8
         34UUcsO0hQ1mfRafxnn4Bao3BNTXYKBb16VNEWLmrzvhe/fdpp9GEPUWhTle8slhjWhQ
         r4mg==
X-Forwarded-Encrypted: i=1; AJvYcCXV68vb9D/45BoG2B9RjwJ9nJUakLWwCUJcQniaRmLdsA9SDfu0rIoxj9vvP+CmrYXZaBPNvxqK/gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yO2pmsh0GTrV6il6IKJyvLwhVA8fLKC0aS1wzLfDaaN0aHCO
	ySHx0ihJz68Eq/03n34/xLcQAW73uht5DwgO5+vYvZ5/4QVphxy/JCfTIi4L2qwzKk4=
X-Gm-Gg: ASbGnctMBtKmi2zWAfrQy8Wu9FwcDoZtx/dKwen/NxarYOL1FxqaPFEZVh/y+0jdDLN
	ReNw4jyRaQq2A1m6aTzaDpr70G2+8ROvUjkklf7viFmgvB9e5u3KwD5XYieF8uO+ihJGhtNAr8q
	flOD1bSCj2+4NfseZdGdk/NXkAZzCqEIM2hxD1q1I/qLPplogTwIzB+f2HRllmfliy+X8de9xTG
	duSQoGLqIyXxGtWLFsKRZV2tnn+thMN/or6mWPz44ipT3VxRaphkPCWnMXPOiV2U5n39YECAQaP
	9VAPVxM0jSIk5KYeUjISwPEvsuf9UwKpjj0uCFSciZJ++a2NLAfS6KFsaOdwe1UbkdRpkKgme9t
	bbPtljsTOolpDRDRKbkhKwZdrxEPh/0DI
X-Google-Smtp-Source: AGHT+IEUekF3B701XEWPlvz/t+TiOAQUERz5664X1jBMjY8/9naHI0rQjXZB5N+TlAUTHkeI3Tn5xw==
X-Received: by 2002:a17:907:d107:b0:ae3:f2a0:459f with SMTP id a640c23a62f3a-ae3fbdc944emr128364866b.54.1751613442316;
        Fri, 04 Jul 2025 00:17:22 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:17:02 +0200
Subject: [PATCH v2 10/11] dt-bindings: clock: qcom: document the Milos
 Video Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-10-9e47a7c0d47f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=3534;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+AgG3zOOY6NcwwiQON9pv2xqdDKfNXoaCvH5y/j8frQ=;
 b=j6yEHZm8qoUd1p2T4cYFS2hQiXkDm9rfgmvDYx5bvu6n0tdFs9nB51qM4Y2ihCYrcJ95g8k6d
 cdY8LlZ2ViiALnQXKai0hlFDtUXjNItbH4tlqOK4KYl8hjWSftyCxjJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Video Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 53 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,milos-videocc.h     | 36 +++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..14c31efe1308aadbea61eb7be7e56039a923aec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Milos.
+
+  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+
+properties:
+  compatible:
+    const: qcom,milos-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,milos-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,milos-videocc.h b/include/dt-bindings/clock/qcom,milos-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3544db81ffae6fb7c72b123063b9af4337742054
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-videocc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MILOS_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_PLL0						0
+#define VIDEO_CC_AHB_CLK					1
+#define VIDEO_CC_AHB_CLK_SRC					2
+#define VIDEO_CC_MVS0_CLK					3
+#define VIDEO_CC_MVS0_CLK_SRC					4
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+#endif

-- 
2.50.0

