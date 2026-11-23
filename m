Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447693;
	b=fr6zV65Y7NokoEcHQxOAtbv6lXl97W5cL57QPuSSVasXorjtpQ9cemfKK5PpTj06npES
	 V14SyNFAiLhbyCiAEgz+2669rpZY18K7T6MBx3lBSMPgGCE6GbUotRGvmAmCdOM0USRf9
	 SaxOY4NhYyC9HWtiJNQ/Fwdt0xh6HpYJIHpS3GLDVr01qh6ZY8heS8ysSX9Mm5aPh0q+X
	 z0RN4fEaMCqHn1AMefvdsvI+gLlZoi2GcIui3JyWIaRorrQKw1jDNZJeZws5plMcr06A2
	 Qul8zyc00UcjDNPyFd7Ix49kqsHj1V4cll9EKd0cHI9KYOxkcz42TO8wN/NWMSeBh4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
	b=YPTa8HcXwINKPBSIPnlIG0aezDuaAUyL2T2fvnyMhN+i7Z7a+EMcJl8U46JRbpR2fvxj
	 Qbap7qgxu2dgKP4697qVtYRozgwS5emkw2NEvqx+GNM91zWbdrCmEdpoW2n0VpYN+Gqla
	 g8sZnwl/SfO/DyHKXNfBdLpkvQ5WKItXvcBAeCUBygaY83NaaK8A0cpteQXb9UXJgb5Rh
	 ZNz+fyjYf3uIHUcFZ8ODLGQVpgxfrsU4I9FDu4tGfNt45jiPo6rbLD38DWiI+p8sH3Ygk
	 6M5Zh4U2YbCrHEuAh1pTuWezRAjrxw3URM4i5kNj9njaKFr1XLbUSdmX2MVeOl4WAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1611606A338
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1611606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3869f03af6aso2541243eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447692; x=1796052492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=fuKkteo1U3dppxRP2dfHZJlaJGXVfzk7FUDnXt8LXhm8fvRhvljLUCN7f18PvukRPU
         WWDpbqYrzmrS5+PO9OZTwcY/Y+zcoZbDol2fisOndc8AkOhk4n63tiyyp8khhsZbSFYz
         Uk20qp+Ms6uRkWeEuv1pAZOzSg8x3zA0PNd6YMcfxGvwxLCQar58MFTeiqu5hvr94TaH
         P0p1/W7tMLT7DLuBxYK6tVAoIIeP2XxRCOXdyHU6uJwrTVyiDpqMLFS7Y+hAnrJO2pKR
         LOU3lWmb0cQJnm9tz32aC3NKKysBMksBDm66doIzP+z2/Ai9KT/lYg6QBoD3jW11k27I
         uE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447692; x=1796052492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=el2LJ2dT3QAQENfvRc71N9BeodIvQ/eif3tUEdkHKMCofY5eeypWyGgg21id2GhLDm
         Kmzb9I9Fe92KgL167c//1FY7yGEthD7UJDZzqmL7XpmS8hVErvBQQHFgu4q3tjdxbo9V
         2o9dYFtrRIg/b1GH4IfVnYOTu7qfoTpNLzvhWLxiKj1NfYPTExgMda0QBiOh8PQC1+Z8
         uUn42bV2uSeIc7KBRpTfaBz7QTiZIUtZNK0fxd9pvgpDQijcXjNrd9Q+fv8ms8XnI1LI
         d9gVPnL1ArnoYnSTLUgwdc69IgV1hWAzx+sukJo2zs9vlaBBoe2ndvywIEbILmqzCkZM
         OtzA==
X-Forwarded-Encrypted: i=1; AL+hErGhX/QqB0BZawQoODSGtZVR4w4rI17XLkxnsofEoJQ7k22R4ZbTVfiPCNsg9/McOCnZUWKa1IAvyZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v1+SaYlUpNuElswPeGzditLENxjMNxxCztwwbZCkEEJl7p/Gv
	MCkFK+wd1Gp2XdVONNIJKNeNg8bgGazW1BsKMNvuFYXKsuH/F7y6OtY9
X-Gm-Gg: AZFdTZdBfxSCVS+RGB4WrLL/7tIfCIEBwxAQhNQr/3WrfbkRTkHtZN/4VbX7srYKVjn
	5uexCuDqVIStYTAgOExLS+cBJ8GNDzaSBUl9zaHdnV01gXw7bshGZ7mkMS50m1Rs+9Joi5PpN3M
	hagSDQ6oYjDqb36Z9v1FwSxZNm9mdsvONvOhNAR6Ixl+iDx3+dtHW9SwzbAFJYLDMhA5B1SYQMw
	e9WpIMAPwcekluT+5QOVDZtU6TCwgpgdm/hM44dEmnia2ZKrqvayXp0P4+orSM6TnCftkO3iSP9
	mYeDTWu6CDUuLMQN2hw5Le72n4HWzgIpe4RnHOQvfWktyIewRoApAzauzxI/oyQgO2VvxfOZE5U
	/vazBpe+V8PVOyhNOc6F3c1F3Vt1sLR7U7GuloEyLRfMFJlSXclixPsKeOzMHd4WL+ajWgNG7go
	3V4DsGNDzE9fKUADkcG6psiqf8/o8AOupv4G79sWp0oe0JrJE3/K1/Jj3hR8ZBNzBfytKt7foYm
	sW4sniCDC3elDhzR2C8xzbCG68sYjCc7EdjqmvdNnvJRa82d94Y7m27aX/5NPFenTo2JuyoNUsA
	egAZXEbHHb1yQB+tt7F1JVhuwLc/oPvcA2bZRlqXwPoaxQ==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10401298eec.18.1795447691706;
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 22:27:17 +0700
Message-ID: <20261123152722.168879-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

