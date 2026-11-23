Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432124;
	b=e13dXEWrtEq3rvCVKNl9WIIh2rJrIDym5I78R7rbr38qNicdCDVeZlWMWtL0FADSQQGZ
	 XiReDEjJKz7XTVqfd/YiY1D/OgNg+IZX79BT15G1QFhF0v0giqYh05p2xwc3aWtYXZeY3
	 rdlF6KNB8sE0C1RR8ND2Vm545ftnajqsaIIF9h1z6hWjHEYC88ZegxGu49PAHRjSeGDJb
	 tAGg0dF8QT29liC5TkHBYE3POoptmmDSww1tFsygm9yrelZXJhwHEU+EOF+haJ7q2oi/b
	 N56iFPkWbSZMnzcNQLRjTe995c7kU9j2OP6yOSUSbnOPIDlOAasBnK75CuOjCu9t1Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
	b=vBm1zPSxJGxD0951ZHZRhiEdM5cyOJ+Zg4WEhJhu5ZkAMSMopSLmIGXhuQfU4XvLM3Ya
	 TzGSbzuVNc8bxEEKpfxdmRVvXNJppI4U1mXBZJFSCwXvCslx1gNIQ8798a5ou6fnNTUNF
	 kHeht1AHHbicNUxhzj7IrcBCTvTiYk8eJ1at/m91XgiDPn26pgQHJmTiqG4ueMdGCdiGv
	 AAxXWP6lOrqcO7GHRneWOen4jmoSXohIkxTNXWPEhUJqrL7rCnRMZieku4bEsVLl/HwM4
	 ifXNUWgZVEHGyJArcOgeO+Kg/4CdCQfUrnO24X8UAncqN3eVA0O2oJPw7a/ctP9+KJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD8606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so4313090c88.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432123; x=1796036923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=NYhklWzVFa6EfONV/VswvwA7Rdk+KRRa+1Ppi9dOVfxxnO6ONCCtVvCV9Fa0jaIgez
         3qyQOKoxOp+nGGCsXHpCSDEMBrgAbdWEmHz781jWAGYqXS3Rad3DfH6UIOHRaam3xaKr
         ZIC6xeoan4KDakRyolQCM+S90cFzwyrVIH6vGUNY/CMlwpofanGGNQNcqPfEiZjM6Osg
         NSAE49kDjc25TZZFzKHxpDM8aemIN8o1tr2tI5Q788T9xeCgjyn5H54frG509qH4iqjX
         TSEGywEVdnSxcGKmIkaDGOBX4iHypo0z45vuHIPjdoF8igDIah2vqzmiyT4xlqdurLC1
         37lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432123; x=1796036923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=jQfGZjR53LPvqzGFcOf/SIzJx0ududYciigDrMbfpkHQo6VUAWrKC7LBaaHlliBypx
         kCfMWiEDCR6AAXUp31gL7GHqR6ic3s6oiwoQ96gLmWM9Mv+DDT3yVNrBdfnEod0XY59N
         pueIDf8K2XIJEINLs16pKPpkw3y3vF6xLBus/kkdyEz8izUoomyUTmxfeEpqnCKttGkN
         r1Qr9908Dtbe5bSv4azeq3TR3zCrU4FxJZOxoWu2Cl5wPKeFXN+74hIt8guVaaTqESML
         kpgxWLHNJ/GBAstI7+K9QgaRpt3+3wf2bDvX+7UHtacIwQiABPC0RW/JESvjg71K1KKS
         jETg==
X-Forwarded-Encrypted: i=1; AL+hErG6zG3ydZghSJF4GZpXAAqgXXJ47xEptSMmQ36ALWL0GqDhzzSr0LXdGE+IkcQ24aKdxdtHtuidRDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XE7ubi3+Y7RAm4oX3gjaABQiN8lXs8PXPOcUysze4bEx2HT1M
	V4Y1U16YUB3jqxJRWXQIGS4VOeHmdqmVXRsQr1/2unBks4o81hYqGtuC
X-Gm-Gg: AZFdTZdLIyF/LrzGktSyunyjqawg2TusGYf70JmBkt5EPMyO5UxmYloRZ6kX0aOlqll
	+LcqH22zXnwvoi+IJnU+RD0cUoZUXHkE4jfys4k8PSZBpl+uSyAqkub9bfFlrgTBaVTtOkRWYNe
	J5DpKRMo1iSy87MJYocTfbGNk9Web9umyMTk+S60JjJaoJvS4mUWFRqcQR19fPQTZiB3DEUOPIk
	nzKeNbA5yLatFTqBOCkP1Zw/F3rm6Xa+ZVQHfwKCOddWrMoIWMzcu62iQBlxEmlFHO9J6in+sUI
	UbkfhMNqGgPrK2AEiByTj4/RruE7bsFPDU/riZ79hEEKSvpt9oSlax3Tt1QDmWtgE7e4DgwODlB
	R50SlL17zkrf631/9Rn2MIvTJYfjzqVwc6sYPh3BK8VD5eNeYFgTgyvV0GS4B46eJbRTrEq/8wq
	esFdFWFAnmn5dJInCydGBDYKC4LAnlUOFN7hS5WvkNyIZ11aX0WHOaQWxB1RElHVg1fWcCUzUB3
	YTBJ7lm/7pYptEIocEzljSeWTIeNY7GCDyXnYCQ3pY9t2gXn1xYlAKssUrgUrR12r/IUk9h2uRH
	GcZlyyTs/iTS5o6paKkiNBYgDEoyxid498kPOYvjRH8N1Q==
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr14442888c88.10.1795432123328;
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/6] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 18:08:03 +0700
Message-ID: <20261123110805.119610-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel
MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..6919277c2b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
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
+  pwdn-gpios:
+    description: Active-low power-down GPIO.
+    maxItems: 1
+
+  vana-gpios:
+    description: Active-high analog power enable GPIO.
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
+              - const: 0
+              - const: 1
+              - const: 2
+              - const: 3
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
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

