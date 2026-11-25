Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609978;
	b=KC9ARi4ROi52udZY4RhF2RTMEyJJqcYEpMfXqQmKOaEX9nU5XeA1/tmoYeTD1ouz4JH3
	 hQB3ChokYGDeLbNjOjlHTePCVQW7zAm80LttFYyAKo7ExEfyD+UirVoqpvYuUBCZ6504o
	 WXICv39FGoaMSdvRDcG4PSinDLd8ATMivwccXRRBGAd13VNu17pY55oC4EKe25y0HTy6F
	 ENhh/1h6cNCmKnPbJ9LLt8e5VaSoKS87MO1Gzlkowb1/RVDZ6u+Ev8QkKTAh5X8zhvk5h
	 7JSx2kC2yg2Y1go2b43ph7UGVeoHlMKtMxbcVATRkRzmpR1KgUkG4UuOWuko6T3xUpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=0WFu9VGxGXU/Oy4bJ473rZbCN3Sl4NeFhWo2UWxCC1m0VSlymA6MqqsZrfM9fA9syTSR
	 DrITfPBcryS6UA6BzAfoluPueH3Rz/ApDVS+xjoIaSc46IIDqsfcA1FjJHtkdrJDr3uNx
	 L9am+Yeo8aFTYz5oi3aIuux9jhCFL8/liMPbg2fM8V6EwbimR29prGL+pZFl14wVmMZg5
	 hfT24n2Fuan6sJ3DhfMZRthHhAMXlAHE+vL18REJEZEf3+xiCv/uhDzSMQF7F8+zGqMXL
	 ToiLEHahiq/67FHkixg+fJeccmUdoS2PKEwoX6iTdl/T9rujSIYxSDGSKpPHiZwYUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22783606A330
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22783606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso2252192a12.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609976; x=1796214776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=wFw0of7vrl/UYupGvwc1d1CRi+/6e/EN7A7sYCP3nbhQDhcX/Y1skD7RavLyQeOkZw
         IRMp5I+hBjc3wKEyhhcFeN6Il1U2Q1C/yjWHMD2alXL1jLUOQFf/DRRnRX3NlbUrx06J
         OUa3C56ISoskjoQ0/6QwwM+nRHd6DOyx6RAJvdsq9zb8gcLroTfWl8PzYO3y0H88uml/
         i9bQVE2mVvsSALntek32xUwl/3q9uOxlPkxXWdzcM3Z1z4fNM6QAYC4qMxk5zu8oE9TH
         uQ6dNPA2xPxvyQCgdrt8xKa4xf3MiLGBV4z4pvCiblpHGsNDb1gBcXeUGm5a9ehwO4jl
         mi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609976; x=1796214776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=kxzQY4lms+pSQywmfE6HbuAIwvsrsiGWCtlRCHqLihnjmbcktvuA+hNlQjIwMPv8bF
         7tVfwS8e9Qm6ULxLSBGs/il6QmbQdX6eacdY/o/OCmSDEE4rHk0H2F2hn1zILO4tTCWY
         Ds1Ej4xtIJkxVkNRtd29WlWm7eAkE76aIrfGdq6ex8lGtvkdleXUxvdykhrR1tFS2iSt
         KPhHoE2Eu3xfEd9um4bxhBCFwoxIfIqbaGc6ZRcbMfBe6dd0cazCUSMaKAwwcTrMlRcD
         z4T/3fh/rUVBTW1jYYrHljz4bZ5ccK6jrS34iDIEucBztFV4fojtjVSydGN0CeKaj6wD
         hbXA==
X-Forwarded-Encrypted: i=1; AL+hErG9fPnRuPsPFla7HIuMxLQK0JWHsRBH7slDktblEXtsmgfHHON2i4TmIaqPSTzOsUglJFKu60Adzas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IAbziW1gBGtfSyVkz1Lpj3kmbPM5s7JTsVJM0GASOR52bcPRA
	vR92DK0Zql++cYWpe6V4cTl1BWPT4OzC2YymRvsFB0OA9nxMQ8FBYbbd
X-Gm-Gg: AZFdTZcf0xbmjDB5qmMqoYcdIr7gUfUTeQ6tINcMMlvOMwVnD2TM7mLqaSaf13EWeDc
	FLOEXWEl4U2KtbuNRm2fzZiAqgJRE2q4dunI62roPWipFuyj0+FK3HE8KfSF2V/oUeu1e2QegLM
	C00T0EICBsQu5EwREqMtrBjZJK5mViJuLqTFiZm3FWexy9BviJFYexTOsSGQ+8c1Hmg2zSltEkm
	q1BmFSE9kFleDqmjr8X17Dwvry3jLuxlyaE8UITqv3uvYWAZRQKGpORkI8OTQQfyMuFYueAtS2C
	V9u+e8xSKlBOwMQWGoZ0quPZBnU38T0rzxMLp81985/1OPaIA+JPSgwmWQJ64KLaSnlQuN0/0yl
	6PmC/jgcnrJTosbMN8iOJfrhEjvDMQuhYb6M3XkiC5AEnimnYRQyuH6wTUyiL5XdLCtaJ/IkwVt
	K4wtmb5+UaGhiAr8V60XD+c9UDrJphbKyGsstNZj4+VSY1VKrprD29ssekiqlpPGbxBNFTYFQJ1
	eKxg4n7pm9vIrh0KReueNLU8+cR2m4yUjzDSHl8Xdf8ZgrI8GSzxVE9INjhj/IP6HpQMeXyp8yH
	GKc63lGsO/I8LngkRMsEPkvhDuH+WnWUjuM4mY5El6RcDhNL
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14764645a91.10.1795609976464;
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Wed, 25 Nov 2026 19:31:43 +0700
Message-ID: <20261125123146.379057-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

