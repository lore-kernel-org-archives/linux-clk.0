Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B333F8B2
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804926; cv=none; b=YgwHlwlZpmbGthv+/baqmk6bIoIx/2FvCQtVerM5Yux0QGI07jti4pJTlDBWSN5i4UgI6FhcEPSNexB1sWLMl0KuirCDNlnC0X3DjUZwPZ8EL9FEehhGWURovBgjqZym0IN7dZiJvJy3XjGp9ENnWN1ksAIp2MZ/lJLwnU0bnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804926; c=relaxed/simple;
	bh=S4AYyFcTsusx6JymB78ndk1LzxPjBUj/RxkWMGbPmis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JThXjyKA2mzpFpk8OjaAzlVotbEFY2aP+FHYlMZm3TL6nUaAMUFE5QeInOg8tRcLoYmvnC/5qV2NjP+YKpfWAAL43I2xXnRzBoxMv+v7ER040iv9V5/NNpEldUiCK0Y7Lujimy3iFXM0cNhkg8rjWQnpByCGuijSDAZhVp1sKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=z+axEiQK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="z+axEiQK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c6fc2910so2244338f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804923; x=1773409723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix3uV33RQkJIwlvd9fVLf03DEoMJ43/Z6jDu2eagGtM=;
        b=z+axEiQKsxnQ517nvve/uhAJapQ7CMCQEyCeDQ3MdFAqjR++TUU1Q+woOwN/F6zEpN
         z8R0iJn+Hpor4agBzVj+ZfX5hOzhO1d/wfMswIjBKyIF47OZZdIGzhckPWucdMXJbkus
         P3yz/2qNiopibjBJDPkXQgKRo//Qxfx/RwXWS/1/Zvi8F8ujLgv5vmwpi6Fx35LvDV+0
         VLgwOkKpbsOixER+ZljUGEpaz1l0WrSAIZMqdnLpZ7L5KGjoJc/+BfucRMC8q9rmOgz5
         cdL5mblYSCRERnCqdj8HA+i5WhQggaGRnTZ+jJmoM4dhoo7nS9kbMxsKbQr+4Z+TmZSU
         nwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804923; x=1773409723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ix3uV33RQkJIwlvd9fVLf03DEoMJ43/Z6jDu2eagGtM=;
        b=hs37W+d9rUs64JojVCNIzFMlb93u5ZAfCiJwXmuQGa8dtZ1DvdngRrBSF1IPlzRUQZ
         f9/cky+06+dJRTa0antlXC8Un9Ti/cX/HNF3Qz8DuTveF3PPw0HLoWYz7qwKImQ78ljt
         ca8/MvxBoGIZXKDL+PG34VwO0Vwx3PH7y+yBc/J/Emre6dVpQBQvLQMnnU0D+0rEwQIm
         TAODsntg0aF+67QEG+i9zxo5DfojAeD0e9KO2dWR09ZW9xyb/k5oelC7KD+ZLUzWXleB
         OjzYQA7hEyHsELlZ5HVmU6hqsyIVXJTvcWWXrwj1sMIKGwxJ6BltGj8txFjHSUQaOqJg
         y/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKKloPmUncStb+TqfOanFYdY/yh5LdHOqAdjc/KW/dAnX12I1c1lFGDIImjI9w3RAMApPJbKlzlAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZnzJeiLi6Y5T85mfqTCOwz9p6V4nkyjvzDTpJ/HraRvebgku
	Wt7FPnJFBVOTplBLGZ1IlKKThEQ8R41Am1QkXBrjAG/wXQtQ8gL8n3x1MwGqR97wHiU=
X-Gm-Gg: ATEYQzwilODZlkj2ektoBFLNtzz0B5NpikDzfPlgoaeHidTbw3eocUbsdZSmfMs+mKs
	eJSsS3zhjcDMZdZYXkRv3enczai8A33XnhkBkH4A6cwP5W+MHcvVN+g9HHffrPnvdcDphV0TN0g
	OcbvBfxqIlITflnDQg7MB8bUXYirHJmdGylCJZLgda5g+Mej1sPrzoGirPE01WOmeJKKv0NBZeF
	kBsOZiyY8wnJAyb8h71GNVWU2tA5EW9D0UDlt5W6z/PImK51OlrfB4qcCHwJEBToXYrZpnvNdAg
	BCP9cNsyLPENibOjm0KlzF32qhriCZGI/Uq0qAIAxKZ4c3AO/BE7LSkjpqr0pHqvvg+rbhv/oSh
	9kLUpRGrKeGRSa25MKHpjZHAlw+guL9vpzcw1R3+ZGaNe0dpuAnGe3zbfN/fc2h9yAF5CpCy79J
	yWYt1Sd98tjS3E+WOrtcwokMItcsHjUCBtNKjsIUuLGl0z0cZ26RzU+6/d1tIEGxlO4h0mssiC7
	vy7FV6PHxRaUs0=
X-Received: by 2002:a05:6000:2911:b0:439:beee:43aa with SMTP id ffacd0b85a97d-439da351b41mr4056912f8f.16.1772804922768;
        Fri, 06 Mar 2026 05:48:42 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:42 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:37 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=2517;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S4AYyFcTsusx6JymB78ndk1LzxPjBUj/RxkWMGbPmis=;
 b=kTbKHsy8jRCEnPD2m5k97hP71fQLFbaGxDIxGv0EHdi8iyAguyE0P3/OXLbhWgeCUxmf6Letx
 C6vAaAw7wgHAHz6VS+U+eRiZmOrn0Q3QwZXfYemKr7ZsfwtKizk9pHi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..47dc6bb66120
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics power domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0

