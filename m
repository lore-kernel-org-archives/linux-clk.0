Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CACF29ACDD
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842766; cv=none; b=MEW5cR1T0+L+fPjfYFVgh2O2DChpuqJTYI8nFbV6ZlZdQq+kEvffCflnazYvuYQhpXT5flTZRIN7F0qJf7r6Ps/zFDHOmVwA8LZXYyPJYbJi20Kt8ujEdp+OPQppo/jsQrO+B4e7ClBugozO/BX37t4DcpB9h17MBbiTa5iTpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842766; c=relaxed/simple;
	bh=Y9F/e6dicZGN3H4g41Qmi3nJ59/DcdHmY62nX1l3Gag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2lNCPuAl0qgfpdAO927OLrZaIYJgkTvENLpLhcJMP6aQy1vZsag/DQD/bDzkBSNYu18KFVcTT06k8iVE+3lMJJNAixhtNNnavCQvROXf881RV0cHQw56ov8nvpLhFOYTbLqV8OJxwugk+GbyAgqBLeoJfgzNfUC9heF37mjYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KytQEz6J; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KytQEz6J"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade4679fba7so239193866b.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842758; x=1751447558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEUC1GsQ9aW/PL1OvYcG63di2Amn9awZJQPmv6C0j0U=;
        b=KytQEz6J5f6O6ENZ4fkF12zmHzQ/fCzJftM1bu+wvCe7ylPWqfoQMCeJtoxYw0RRM7
         flSyc9q1Vq2EFYAu0wDeio4Ckv0FiErFCt6P3yBEYAPaaId1gopgSFlkGXidINTjc7Cp
         qkv1Lt+eaLZfeZVQpsWP8jQJoMAs3KNqDEGwbX97VvKYmfS/UnbUurDg415WVgHqoqKx
         elbQzGjZwngCZHsrr/q3yik1ukohJz6O27WENtU1j++s3YPE285ijCFDe1bpkVUjcjaB
         y9y/07loBBcwf5j9co2WcQAsy3xjtnlDjVhShPf5dx+ti8aY29jWGNLeaYC0a41iOQg9
         1BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842758; x=1751447558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEUC1GsQ9aW/PL1OvYcG63di2Amn9awZJQPmv6C0j0U=;
        b=Hrkuuwhe6jzMtIF5DpPT3fwAWz7oUjq1DH1Qu83GJkWhY4ELU/IZjg33bjXLurzckk
         HEq4ybdBLMAiTS1G7uQ969r0QBv5h0AxqAtze+wvxjbeFao9OYxJv6vv77KrRHxwWpFN
         yAnon7FLcoz4ozd94aSVW+knqbdagI6yI0LV0B7mnFrfrKbqBPaxV+TwcJ/pWmD+Zl4l
         kXG4Zblw/f4aWG753KO/7x77GPYc/QJ3jhoGlEKMfyikmUIuuzyuVY2Qpgi+sLmRP0GX
         Xz02hPgD+ecEGpNXuoUgIz2lOVNPGJ/aUfvRIRk5/X5tPik2UgcLOAGV3SCtmiNWGRiW
         mp9A==
X-Forwarded-Encrypted: i=1; AJvYcCVLd0kPpLXGYRmgYp4HEp5PRZbkE431/Tgs7JKH2jnCLw7svsYoJppzDx9YBq9lQfyJtCD6AvqT8wg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5o7DVAMl6R8dun8EgIvoYCEgvdBPsSnTGwGdUc4tMdR/+PkGX
	8oIhSwAUgnIO8HJ6GNQH9ozD8TKTG81QY/hkBqxOPNqDH8RFZj2gph9buPEZWS0JP+0=
X-Gm-Gg: ASbGncuwfLD/hbpZtLY3VVGBgzaHZDTjJBiStqkyxfcpMU1DKy9I58RP4mA2l1Xwa64
	xd1UOFV4V9bPuzquppTPMKXqPitSmVPI7SZ+LSvS8uByZaBbaTcpDHkoZbmzI8AOI8+9U/jSO4e
	nDIjVjFwpc5ITmBZ/DW/vuuJQ0YGHMRZ7Urb2Ep0cPZUuKbUo3xBge0iun66RjnVx2vGNePrpZ5
	BJ+kHJ6zwl2NR69T4iL3+10xGFbTFrIyTVl3klo4iFWMKLd8Jf3FkgJJh1t2BZOegszsEeVOJjR
	6Ge2IIWgxDBTqN8NRqehaq+dMfjjDJkHilXkoGCtvj0lKe236qTc0tjhVU+nSjB9Uu1dMyv7Ans
	SWgVAoR97AgVYK0WTAmPZ080J8jknlIhG
X-Google-Smtp-Source: AGHT+IHWx2Byt1D7Ev143Q/5KsBqXnkbdTskG5+royIm6iVQCN0VuWJNzssimeKkNapJed1YIyKgag==
X-Received: by 2002:a17:907:9688:b0:ad5:34cf:d23f with SMTP id a640c23a62f3a-ae0bf019daemr222194066b.21.1750842757797;
        Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:27 +0200
Subject: [PATCH 09/10] dt-bindings: clock: qcom: document the SM7635 Video
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-9-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=3535;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Y9F/e6dicZGN3H4g41Qmi3nJ59/DcdHmY62nX1l3Gag=;
 b=AMHHXFNnJ6Ll+3mffP0MiXjndN5s6haTHL7MeIv69HRFSzP/4lEvoQUN4OZvjidrFyajoGU90
 l/QBKmOSX+cA7K9MvCsHndDtFPDUWu3Ol4jSXQ1NbtaxhwH83+Lwp8P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Video Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm7635-videocc.yaml        | 53 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7635-videocc.h    | 36 +++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e893c37ddd0ee4fcc9cdf9faeaca75eb6a29c0b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7635-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on SM7635.
+
+  See also: include/dt-bindings/clock/qcom,sm7635-videocc.h
+
+properties:
+  compatible:
+    const: qcom,sm7635-videocc
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
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,sm7635-videocc";
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
diff --git a/include/dt-bindings/clock/qcom,sm7635-videocc.h b/include/dt-bindings/clock/qcom,sm7635-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..5461250792c30e216dc812db722562fba7e40dd2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-videocc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM7635_H
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

