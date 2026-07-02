Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF447ECC4
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985109; cv=none; b=qBZOKiSbv4f27bhHsk1WsyUjhPnGuiACMc9OCnUZS7A7Y4ZvWDzID7yposyfqxScBPPvzs7ryTk4QTU5nGkh56pxuXk/i6B7Oq/D1juy5n4Qnd9hgh5BEJSjo+zGUD8QC6zX8NrJAXvnr8N17xqWKIJMFz/8rpufZGV9Y30Lhmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985109; c=relaxed/simple;
	bh=ynuOULMP4iOziuYv2J6d3jxrIlvxTnPee/5KsaaChHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kd4+mB2ha9Hs+neniwbd2lLks169GABzhVXCpXavbKxDoEYwX/J+RLbNzEl8f6ZlXk/x3mOPfWUXl3VVB/ZejOp9krD6dh/IPC6XozrjHLs0GV4Ckh7HgMJXZr+1qA1tkKVJVt1E+oaXoIE9p4vZS55/Ei70l0GJLKvJUgomBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMhwP1vF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMhwP1vF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso8822005e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985106; x=1783589906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=;
        b=KMhwP1vFj+aFlEPC4EqjP7vLE/ysusCeUm0nfr6NZhQn/4U/GDZbt7cPyclzRLC5qh
         pVtf+XfNo9ejWJdyZdrBWT8PfbS6rilmfqHfZbM0oue7E8XDItWBdEMH1yRA6X6CZBqx
         +dM7xOEKLAphHOzfE+aLSi84Jn6HoLlRw2j5LIhnpPqiPSo1Lt4xASSvEv55UjzJ5C25
         +FcwWzIctDMYsncY7xbOEvPLiusSmym+iD3mQPmbisIBLF8bOCMhQwzn7/yY45gpNt6E
         kCfG7BRWaOtt1jYOWpVh87PumM90zV5LSN0YBPtJ60ODx3Rv5opoCUAT4Fk0Cd6h/rj1
         0deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985106; x=1783589906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=;
        b=SbLYBHE3cQDIHWeEuBtvT9LzBTJMjg4BYQH8LsTAiVJxDZ0HNI3p3ltvyoZwwW5JQ1
         mrue7n0WjUt7YEDtn5h6mNtaMKvpU8XwvAXCWkfWKuSsgNHbqc+TNRYjJWzhMq+2GutL
         CbYN068G67/7UwmPEzxCa+e6qqLxOImB4rFq3D5hj/w1C9vM5BJdoYFRQeWWUXgn+GbR
         llIeRBkIi5ge2c1nBwxg0iaL2QCfXnsdRYAhXIUDX1dAahhUdZkjYVBxExv4UjhQe2ri
         kAcQ1h/jODwSvUUbHo/VDd8PslkeC9cZj4+pyr+11xWLhj0ufMtLuu7l4PDeUu3DAtf1
         57Ug==
X-Forwarded-Encrypted: i=1; AFNElJ9zQfADES62dDP3wgkyQbJ00LqutIdJpvo/SDzPatDcJ7VfZnm6crLRoKDp9rpU39Zyy+IbBFXbBcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8s7N7kndgFtR7T1gsg4cxA7OIXVFc9gR3XiKKD30AAV8U4nB
	gEBQGtwsFJLYbxU8/wPEhG7c8FhWhthHrZwsk3Z6SbhMkLe6Rv1vJ0Kn
X-Gm-Gg: AfdE7cn8S1swOzTQD2ZAmQCqostIqT/9JmDAFR7J2lyWUPjUqVgs4YxDYrtlyThaWuz
	FB5zcVWTKuOMg+jl6tOQ4jnbu+EVhpgGMhT/CsTt1c1NhlJ2nmdy1wy+pTAeeDJtG3Uz0NsnXia
	KY8kjXeybKWSnRNKBIfqDet/zWspInul7rSEqFaNyHSMhtmDt6oaqAKia+zLPicweFBMomk5Lrw
	yLtTG/7o4hCPtGfRwUxNOGHPCqcUCsArvr7sXlklRerJnqaaNgpGD0JHJbXiE5BHR4yFbgndkG9
	SUkCSHzDDK3E6OSemmViL8w5dW4O+VsvBvTb8JzVkPbwsC66XR1xFFQy4lhXjyIB0Db4CEvPL2f
	tntoY3NhVMEAPazI54MlycFexa7qf5JkWvp4ZGiMpTII7HUWweJ05D9zWMsTbSeA18V8Ar1hvIF
	hsSeuwQSEwqrr9pSgakxYcKB+ucwDuIkHuvPgH02vkWsSvWdZJS6pkmTUlo/TTczWcG6e9xW+IC
	NVmTQ==
X-Received: by 2002:a05:600c:5296:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-493c2b99781mr72214405e9.28.1782985105669;
        Thu, 02 Jul 2026 02:38:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35502285e9.10.2026.07.02.02.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:38:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 2/5] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Thu,  2 Jul 2026 11:38:07 +0200
Message-ID: <20260702093812.15918-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702093812.15918-1-ansuelsmth@gmail.com>
References: <20260702093812.15918-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f42e3d49a61f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 1705eb823dd0..05e90c3f7fe0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -777,6 +777,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.53.0

