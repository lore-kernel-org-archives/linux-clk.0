Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432115;
	b=VrLpNrdyR0e+OTb5gsW3nlJ9ROpbMlCiOwqT/O4gJ2OOOa/VreXxOcybW+dwct4AGDHk
	 GdsvKnVL8r2rjb1RgfcNAtujSXEGO7IwBntqVm479/vA01wKcv1ZAnmBvqaVITHnLbnYX
	 sZwCaAiawQMp2u8P8FL8IKDf7iyP2uZgN+Ne9stny50LXiuQphUbSjbAQnIuDxYod75jk
	 Eg+wx7Z9ufjrH/orJlfkIFpRTcaspjMPIfo70Ydg2UnibG49Pm0QsQcyLruVOWF+11mPQ
	 EHS/iAdayeFSNTZaX0CDPcT8s0YW0Si3PF7QRh39Vf0HoQLLorQ3GlXSYBb2H0xt+8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=e6RsP0b8pWTXIVqbleXUGC8WKkziMNpczMW3r+Fav+KSpSjIRa+ou0OhxmxX+m66+ER7
	 WYMsXKz2ckFITlzIL2iTgpFm6mr+72LTjfTUzkjaApgIubskifrEtIBzAY8nJ563o8BkM
	 oNxxLn+OerToDCx/UxVdGKOoDaw1dTON39k+LAibDHg0lBFFGe28GPxI18xKXEF09x/cF
	 iekZLzKo8MeO/nSE2vgddCDL4FCCGTHiAtX9/GnMHxjET6TJ+BZAjP9yAgtXbVcgAvwNH
	 rJC3sbDHC8BFwvOFTaRnAd9v6YPzbnDCrolrv3DyBqsJR+hv+T5n0RaKF5tt5JSxL2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1B606A32A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A1B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3807488c88.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432113; x=1796036913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=kdMpA+3XEIpWJhRS0Cf/pmEdcgIkOQFvMDyFXDhVHlrltr7setMvk12Eq5Fw/oUozO
         ARismXyoNbCSoI01ed6CtEwAy9cYw+tXXBPhv/0+Fr6Tu5sxBskpG7CN5/+XS2alDltZ
         sNDYUqnOc5ZXU1EAOUmUooKZgc/OKtZSTGBDRgWf26KYnmIgGVrvbP2lT/n/n5iWEqIH
         c/nmBEfIw0e1dCac2inrtRLqu5kewWHzHfWn1euJZedgvxfVLOcNnrGHCzc5Geo2LAmX
         vCzjk9trv0j8wKgVzqsSU99Zvzy0q/AR0s6oDGOiFiC86Hzw8Qr6VQDdaZmegnZT1hgm
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432113; x=1796036913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=ZbBpecfiNxNIyN2Djb/ZIJjM2LESaZBLNmBB2qXUtdsDnGFgNlDQ6LH5TfC7hpkXMg
         aHNfHcVuRE99f4gubA4bFSJofmOXsUZg0iQn/aSGexsGK+4f28Fv/YAUAQmvgtvSq/AT
         rjUGG06QR8d2u4WuKMjVYtSNwxE9H5TomupvgCDCcrBx6JP4V+kWe13jvBN7j9dcvkR2
         qFoUyRgOzdJgZW3JlBqSwDyd+pCwfTvtHbpHOzO7ZxdDuYkRUYORO01kOo+fppuKbbES
         P1FFO0N/Qfl5iKIzUHJfKH//D06PfZ1WJl8q+VOZDfts6fT8Km1BnLgt4gTbBBEFRoeE
         c47w==
X-Forwarded-Encrypted: i=1; AL+hErHud45bjwUewX1poomgBaq4HL3kp9GQTL7NN5HHix9MQhe5b/ttSC3zRRsMLF5GpQhz88hHAZ0a8fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UO5nlVVi3fPGuqPUs+2u45VV9vdOWO9Qxz4OQxXvKfpfUbD9o
	XI7ouQELiOgbLqTmcC5KN2M8ehUc8QvAMinbg94VOqnJBCYRTAMKijNg
X-Gm-Gg: AZFdTZda1/3EAc40LuKhu/7uUjLNIYVBnMi2HbV6TDHvqJnWaAT7sPLdM3tR6tuw+IY
	gPAX1t/SuKJAe1l5fDR7dGZgR3dzW4dSB1Fn7jeO+aUZPGjnB80Y3T12egpg6V42IutWHgsAQTF
	swzEtJJapnUI6REMsh05GU1c/3SvaIfJWU1EtkGTPeSotgcZPfaqV9DrMyx5XUU4Dx1cqTIdjdz
	ZXyq7wnwov+XAVeCQVc6qz6kF4j42rH7Tkq+gY/J9l1roundLPnb/1OQ1wXtaRmMjhrju00sfbL
	XBhZLusLi5uuD80jOJ1jcrMjJ6t1v797bOwC4WFKnaY42O+Pjeza/vKIJoD2rseSaUpTK6Bx5kk
	V16E8NzunWTihns/ow0S4L2EGXlUpVjJeVuo2Wsuh6KFkjRo4u8ecek6bTSJ5XqTrLQOdc8KPuu
	4Lmc+fzRjuwVb3UcIy0PyiLDF0yhpudaADLnWkoxyAfc9+zyCqEovB5ox1/uvPpNK+QouvVNfVW
	6NvFu8taiXVSXYuPksH/KsY4oylVWcKJoH6O1sN3eYENC8Oon1FgjRUNKtpOrQAdSlFBxZvHE32
	+pjU3hAVtco74VF2f+rNlXrOJ+PXYNgsLdrQHrLSaucgTQ==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr12384482c88.10.1795432113393;
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
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
Subject: [PATCH 2/6] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 18:08:01 +0700
Message-ID: <20261123110805.119610-3-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..0e440209c3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
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
+              - const: 0
+              - const: 1
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
+                    data-lanes = <0 1>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

