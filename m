Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447708;
	b=D5ACvuPN3fq2P3kn3vNEjfkTSzGUg27BhvSLQSw8Ye3/XekdWUnf3iztaiztDtmjYYWq
	 HqnB3c6HxsFfyR/3VzOvHBiplvf7DOxLI1shazCtr9gLmqR6gkdPVQLAwT5ABP5j8tc0m
	 dKAM0caqWNaBGCthE/uardjAY+b59gVzn3ve2ktFlzAYqmvqOdZJViB51F5lu47JjE6SI
	 DQVxAAmBX7Ma3ecsvNK7rxkqvY1MN7g+7JHcu/G6bPLmQDTW43DSdJOPTKpz/JYR7tapN
	 nVHXPn/JAHhwDoazVYIgpx/5mN1Fnj8L0UQ1QNThviw1TP51oAjrQhsIeS2JfQiVz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
	b=f/ZPJaa5kvAisCZPGY5tA8ZOUBI8JG7EV6l5E2JGlrUuyprn7Na3vUs17ORDAj5qv5vz
	 DlLCnaT8QlnS7L69ridRjefz0ucOUU/wxleYU1KpAN/BATO2dc1mR51dTv/JHrhQPG16A
	 QAkHq/QRCOCietGtc6CN5+XEFPhH1ct2QiEuFhQuQ+fKDLNgQxC+wJ8+gz+9Rg3JRoNJ0
	 ZE+1aVmEUqbGn9SyzOAlve4l8Ra/jkf5xToGCUS1dCeYlmN/WRAkq91wD4w5nRpmfZlGp
	 aNcJzB+bc1kd0lH3gOBwTh2SyE+ACNCTTQv/oI3H1TY1Cu3R/wuSHurtG49+OJZbYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZnRq9zd;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB6606A32D
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AB6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZnRq9zd
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so9394314eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447707; x=1796052507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
        b=oZnRq9zdypvS2DwG1Ss0TUrzwJ9aSvyFrAgZKobCk09IPnQ3+hbgssNi1b+88s6HQA
         gY4Db2K6ktxzb9MAmtjTkyYyl0T/RlXH2j+447Yoto8My11eO2L3dYutkdZyglh4lqrS
         eYoMzqXw8RXTLxmVBlFrWLynCxPgbvddL0jhkkPYuLsGmpr4QFhKcHPkTlOLEDJijtKz
         YwT8bHlo0d+Dz7pZXD49rP+dCkUE8WPMXhjo8/qFjdX6OIgTgcin7yJi7s5I0/LXUUu5
         sLT+vjPyhTTqkf5sJIueIN2yL11f1kajYwmftMAFy12vDLalFr+BeofwB9Cfr+291A5X
         DnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447707; x=1796052507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
        b=KwXxw9pu4tyHwG9piNfLFdSp5BhBe/aG1KE8JAvjCRWuUe4fpba6JST/RIKa1JsqP4
         OW9PLXpO3O1i2Mkg6qZG3Ra5n5otTN27ALlXLtM596ktwL8mqBiSnrINJwEqPbOerWf2
         ZAXzVzRD25MxCVGpeGLFO8QyqXF2RmDvi5OfdBwsVFVlTV61J4LXbU2r6dXXuOsCBC9j
         Tb78jv4vK4+rUtkg3KZ7tosxy6Lfthr2PMwgk+fa5LPMm48xe+YSKlF4nMm8FboF6y9F
         2SSb6263lOGEZ1h92iY19/FzjVZuMY0nbgm+6xl1Xw608ZfhBeae+FK0NkcNiPBaDTuW
         yKFw==
X-Forwarded-Encrypted: i=1; AL+hErFayDDmUZ/KlhSZJN1QEHIy03CpvPCoDITOaNpASbPmwRS3GEg/OE8UW/x/0k2t8k5UfEzqfmZB+CA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MezJGKp4TTXcG/XZ75t+TOqUfazCxcqLIBEu2RQ6ePJ6bVfYq
	r5Y6jR0OK8aLAJ4xEfCYdlfnACwz8Yx4a+9tMCq4zoh8kAtKJ8kZIDly
X-Gm-Gg: AZFdTZed2ZSGIIEh7KgUHkCnkYYOJ13DPvtgkVvU9p3CpGeKNStQNoFiFES4DdvWPyP
	2SPMiDOvKIZrq1RO1lyvfkyCo5cJFzP0pI2kCdvT6c5l+aw9HWdoZsMHE5WLVLbv9fEW6dsXiKH
	ZSBU2NBhQomdJQzdJfI6i2FYKg5vc+717WpRuv5DwCFWFFV/WjxsEPQMUaK0qLMK2h8PO1k3md0
	iNXXgnWB+nUswCjOv88ktG6vpYgN8olpqX9w0fo/Va/cb4ZLwAq01SEsSYdptCnJ97NQHYHeVIc
	wvlU4Nei2CJpBurok6kLN4+AvRJEtWXmZJiegV3anYjLvO3FJ3khzowdIPZbz3N0C1iZ+kVG7ZM
	0XxuKPupxrixIhKCUhfXf9PXzYsV377hlULQ2Zerota/pW804wPxdZo0alKyrnO6PShDzbuFcxU
	3ljw1MMbL2WVCHMJZKBcaH4zQ8rxzBUEZtTs8AyuhiYpNsriwD+HRTdSTDLbpnkWhaPetxj3JwB
	YujzJzEENgeuvJjpNSVF4ufgPNJ+MlZSMCrLppK377atCI4ZBrHrEwziqTKe6JxwYcISzzj04ZT
	f97m4oB9wEoiCqr3fWlBpzySxBKsMNiunDFdmv8/ZVlxRno=
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id 5a478bee46e88-386b82605b9mr1528240eec.7.1795447707306;
        Mon, 23 Nov 2026 07:28:27 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:26 -0800 (PST)
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
Subject: [PATCH v3 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 22:27:19 +0700
Message-ID: <20261123152722.168879-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
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
+              - const: 3
+              - const: 4
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
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

