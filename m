Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180290;
	b=5L8rQVHg4ZJSDmHxs1Kjbk46w8JN+BzU+RHsXy8KCVrXGRY4XjCVC2K1Pk+kjTFYt7LT
	 /Lvh3CKSfpzt0xOi/J9+HknYNLQAoDflnGnmTO4oHolVZkUeBo2JYlV0lkoifY1lH6ZDf
	 jJ2tJxrc/EBxbyvMEWldj1VbWnVM3zbRwzNMGWArl8CfKjH6dQqVybeiPS8LHLyb9frWC
	 czkBtB4HmDxkEz5PI989NjuRx2Iu796ogxDXUm9a3WOwxdlIq684ID74iQ+iLl89jZpq6
	 Qllj+oNGmmHJAkB8wt7M9mgtdWtQ21oND1DICg7Yw84NWDtgLWop4q+2pezCRxysHqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
	b=AQA31tGt/hEW3p2V7DYUInc/sHjCiYRPGRD1Dp5arUj0XSxS5hE23ws0vCVMzYHYAhnh
	 i2+OOXltgKUiJQJpnQux+UrNQfVHaVT+drIGX1zD1sOIgum05dudz3yHkc5CORHGW0GwK
	 fSh7ojMKKSKcX0y4j49tGDEDE2ExaBva7CfMB2ChCqHXna6tr1+rcWdB0SbrHDQXUGyVA
	 G9zZg3prvan7bVDp1WN4MGDdg1lyYkbOjGOFtWlTXUfyp/DCbrkXceWTWllKUdJFK613e
	 2U2s5b7NE1K0keFEENcUx1Q2t1q6Qfsq89ipAwPZjrrC4ubey2JiUwMdD6FE7CFH63A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mY+f9A3T;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC80D60A3833
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 13:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC80D60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mY+f9A3T
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so5605015e9.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180288; x=1795785088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=mY+f9A3TKxj/WzAusDlIW/+s6W4JA3ZIHLo12KNu/QQm40xJvwPIM0NvYEJgGNCbDA
         XD6/9zB/rXsqskJWHtj8lN2SzsQcwd6MULfajknKrLNIIJRgFYobLtbrsAibCKAz300s
         htPwLA89dXOF97Cd8fc77k3lhJenl6CsnF8KJ71cJUl7+861SYH6U+DcmEu55SSLWOWJ
         akFhMt1yx82EwKOSTpNMKgQ0zVWg1Bi00pHI3l15kbHKUNBwEvs+UOdRJJQfQ/v/xqC8
         xPb756XZr9S5FeS9782nvGlHAeR4ygHNf7MBw49d+ytpIf8ejOLkrEwyEazZn+6c4NhF
         uUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180288; x=1795785088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=JYxGH5cEQnj7/6yNTUwCQAG26Oz85P+akP+P+68HaFIzWQb4BlB46f7UrXLbeHD/lA
         5Ye9fUgQ1ZarWfB0vNdu9c3wGvhVAEICEKGcFxPieU+zZBtvjZJbYqkUcxolaqRSYki7
         7nE7LBZCuMw5VK0qUxg1cnOfGgIlXZTYMByFxiYYYY/5Zkl/J+U6EhguknMhYnLyWUjV
         MtTcfH9d5kFL8zFVUUW5TWghc+jPp5Q8elgaFqoAuJD35MEkZTipy8hqPGskWTiyEn8A
         e0w5JDvYeaYjlx0AIUr09hAY065gM7/k5FHYV9O3DptbmilAi0LgYWw1x4jx5ljR9Fx3
         oQ4Q==
X-Forwarded-Encrypted: i=1; AL+hErEfnufhjwp8dI5BSyZ4swNVCoM6R8EbZ7z65N0ducDaVgCCy2Qrz8pFWtGjwPh28dbyuydR0ALcg0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QUh7L22qG3U5bPZtnvpbEuHzGCMvND5bf8cpaQ1TnMB5twStu
	kS6nN99ovwcRN+0OP79puQSMlH6ub2nY8WHVCDInM1pDh8pfbBhOS/wUk2dBOeoapig=
X-Gm-Gg: AYBFou2wX/jJ6ZOSCPzulTQwYKMrwcaCbWYY4CmLozgwuY9/RJKokjVUHjScY4AJ/6e
	PCXH9uL8w9ADbCpm8zpKlXOjaULNOZcLYJsFdq7B4O3F+q2sW6pf1pCSWpSgvNW3VO8cpfctadB
	CPhc6i5L9uknb6vQeuGfd1JeseCrHpQHInaPqeYMjER6/bnxWKP72NFVF/rgtlRbsZye/NG3bpR
	lekCg9EAGRp6Gecu/asrRZCPxhyvKZ70ELMQaZc9msg1u0L52mlrkjj8UNVBMWEBRhtvlck5JmT
	LjI7C/a7xT9TDg0dce3kfb9BW5Nt7Yo3qZY04sV12hpqY6P6r+5U0Q96PzYxZemUNoXNjxrVZRE
	0YUY7rDHmMeaTGxJF+BBIAXHYjtEsF9wRi2vgIFzfEmeNQISotOiVqV6sX0HZKqcA+DiJf9JtIE
	d0xBI1bXnT+4WAnC8BtsIwJz9umynHeyk2lPzzGSy5qdi+gbfQQKfDYAs7HsXcLC90mSPuUQebe
	dUZbbYGRX2MpyyLLopoFR3Q0qG/Dk27Bzkwtz3JV8Gkokn9EUAGPI7P+ftVfCALTr7vvJcyCYEz
	ilVU/nAMa+IcL9CIV1acEY/BScPl4p0XzmQ6xkYjNDwHaHpWrgblbNAMVc9Xu/B5aouT2AsnCx+
	D6XYIn9u8JCSwFg6NOryJzHL32NohZ/qZcs9x0qWK/vdeZw==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr72814425e9.0.1795180288235;
        Fri, 20 Nov 2026 05:11:28 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:27 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:06 +0100
Subject: [PATCH v2 3/6] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-upstream-s7-clk-v2-3-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 71 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..1984cd42fda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi0 pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi0
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@fe008000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0xfe008000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 3>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi0",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..6bea314deb31
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_VCO			14
+#define CLKID_GP0_PLL_DIV0P5			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI0_PLL_VCO			17
+#define CLKID_HIFI0_PLL_DIV0P5			18
+#define CLKID_HIFI0_PLL				19
+#define CLKID_HIFI1_PLL_VCO			20
+#define CLKID_HIFI1_PLL_DIV0P5			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_VCO			23
+#define CLKID_HDMI_PLL_DIV0P5			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.1

