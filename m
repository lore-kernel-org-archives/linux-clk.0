Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B42D7388
	for <linux-clk@vger.kernel.org>; Wed,  3 Dec 2025 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764609; cv=none; b=I3zK41tCbiG5LP8+1MEKIWhpeVBZc3+TLN5+AfBfWZc9Cn5ic0SLcE1c3qXZLw97kA9ah9L7f7uXVb/OTz8sWlqISJ4VzovlPyLNBkCj7HkTl3D51Khl0lcfhQ8S92Rm+fEq5kkoNf/cGLwZZd6PDQOf+L1mXOnhfKEIAZB8800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764609; c=relaxed/simple;
	bh=hGmcm9QAZ9qqYKdmz2DQfIFan3a5wOxRVnlr9Q0TxhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/JqkcHPAACS0Nu3jWWguiDsv4SF3vXCK0MbY011Mmrxn/dFo6foEUru+mDG8edlp22/diUxwu/TsruxsneXSMbUHmRYr2rzAFGhBdcakHtiD97bMkImbI65ROiaRzsxvpJjv8jSIjCwVEn5pKjtQx2qBmsGkzZxBy8JnOLhPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ToU+Q5gM; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ToU+Q5gM"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2ec756de0so627353385a.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 04:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764607; x=1765369407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=;
        b=ToU+Q5gM60eA6jBWYcbEwtlwBaYr0VyzYtcshynS3eyd2i39Z6PTh9cnnJZrPpJbd8
         nQNLO+/7Gv+U2Yni9xS8JDWIBIlRsLBOaGyeXETM0omBweC6qTRfjB916csq7Ab5nVpQ
         FDCx7/194GMJSFFf/wX6+ZtN0M22I2AclVu/f/ckzM4nCKnc2MsZdoFFTPqvsiKd070j
         DmT2r9Iq7dWPaQYnUW4Feo9rntnmDzqeTeJm+azS+10ZmbItOmJiLtDd1dS5lrTTV6Ou
         HHT1AY0ku5QdnH2Z5MlTZ1qxofNJLEimcJ2F1E9ql/vTakk+toTAc/kS93XiodvP7vKf
         JKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764607; x=1765369407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=;
        b=jpJSrGx/hK/m1t6eaoYicl7QyDqkaYMsQwT50jCRvN5cR5CHN5lRcyn78uhQGboTdv
         R+rK0yZbvV8Rt0pkYqmjZ3/AkIXvOW3DYdr/eVuX/ykq8dZXYOFNWnpNeJgXz9SBxnhT
         /3Ze+QIjWtKoNXvbu+xdNzNatqpV7AkVUswE3EcqqsK4wFgN8Cn0beDEpnSr16dQnKYD
         R64MPCDXLe1USb+dFCn5xoy+J52KVbdskmFqD7ifiyPnknGT2dhyj+m5sY5PRHSYyQZw
         LkP2JshRbv4INI0zHT2TKK/6/pP45QpnsBCUanYZpDp+sv/zGxteFum53vKHrmdl3afs
         gdRA==
X-Forwarded-Encrypted: i=1; AJvYcCUvf7L3X2xmoZpEkTkbMxcAUg2zEzDRjK6KA3nSVJIQwq3OnVB6Rr63IdD8ky3ZSpSrNFb6LOtxD/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1q4LNgqqJS2Tds8Hy+M25VZN90OTKsTBPOrZB+matzpZ1ZmD1
	9FpRU5xfIWw3K5ags+WeV9wfoB3zFQvE3gg75ZlJE2cHCfAf4OnwTE89fwEP14nFDYI=
X-Gm-Gg: ASbGncvFpAIseI2pTBXFfjQ4K6Jc4XYQqlC24UWEdpdFM9yFrHegh2nvRnCSq1tGOHt
	vZTKYKuQ2bLjNj7z6JZDkviH8UfknZrm1FfsN0B9E3CVT0IJIp37RZ+5eNxUIq060Wxnrk4RM4E
	Q7K+9D5CCdQEfaI9xz7BI7Au5tJPABmeTpfdYbH8nm98wLcZrGtu9aXY0pZ0g5H1FRuy3yiosuL
	gFf8uZllRgCdD9ar8xKAb/0yILRk15spRNd3QQ6Q06FLPkdoNJ0Iv7VaRH6zsTEz97SrucPKuR+
	MuQWTfBUDgANE8vEziSuTEcwZyiGx/u+RKzNnUczeGrW+l/VvQO28eJZUHm60+XF567oLCDGFJS
	WxRxbw3qIKtc7hcwKDpAhl23AUysJpjNH+qZa4pyRQ25mZSnWmG47XCjRiP/2uhVlVxH3aMtgqF
	cWCASlZwUH5esMnzOoUgOprjD1mbKV+bSGxKlFGofokxSK
X-Google-Smtp-Source: AGHT+IFBqItcO02HwRqZQ09Eftjhy8B/A1LUHr5yIyZjuhioLZT8jA3EARqXdnEATjeL7hbCsn7I/g==
X-Received: by 2002:a05:622a:d05:b0:4ed:423d:48ef with SMTP id d75a77b69052e-4f01f697666mr4823071cf.40.1764764606528;
        Wed, 03 Dec 2025 04:23:26 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] dt-bindings: usb: Add Microchip LAN969x support
Date: Wed,  3 Dec 2025 13:21:29 +0100
Message-ID: <20251203122313.1287950-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
speed, so document it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
new file mode 100644
index 000000000000..7ffcbbd1e0f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - microchip,lan9691-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,lan9691-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Gated USB DRD clock
+      - description: Controller reference clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/microchip,lan969x.h>
+
+    usb@300000 {
+      compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+      reg = <0x300000 0x80000>;
+      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clks GCK_GATE_USB_DRD>,
+               <&clks GCK_ID_USB_REFCLK>;
+      clock-names = "bus_early", "ref";
+    };
-- 
2.52.0

