Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787157;
	b=0ppXbTMWbYeXLxmin2OAYxrP6gWp13Y5VP8wuU91swZ1TltPi3T3VAz6a4UrroO1QMcv
	 BoeNS7TAXpesNsDBnnpBy01zIt62LAMHu5MweanXBnwHFYFPg670bjTeWPGn1yykRiKHh
	 TE6f9pJ0DqftsfIZ/dd0LqVW6UaWKy9nbJLSRA68Loh4+ugmDj89dWzvSIN9QbodpaB11
	 dxxuY2dVM5MS6XkD/0ucOVSkSw5KeXsi4XkxrwDopQhqYujUurdgRungpsXDPlCR0LXkF
	 PADzqpM3z3siQeyJzmw72nN6fVLW8tBZrupmbOID2d5pyeKPLi5vui3ONQma608CAAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=J9LUjRwk9fmzXBXTeNVGiB+7GRjhfEh3sZqHre0xpDesEcF+6k7GAz55oWvyXuVW57TP
	 ak5QSqLJopbkfqpVLtnxaR5wkxsoSUTc/IcH7gk0d2rPCWYcmAMm+nhV6teyzd8Lk2skg
	 JQYmTLijrDz7vfD/Ee726Mv0TMTmrDV3IuQkJ6pKaNBDsM+1VnbzZjCg4l9X93Jq/vDEK
	 AvYlgzVMRCeer2RkBq5NKtEXkDXMg+gBNrWyur0KX7tCpoA1YPVJMhrpEdgtYi7mqcXNg
	 0zLaDntqhbaSmOubzw2b6q5ugUgHdPjOS4PXRJZyZYWbuWTKrI0hH8hjPNgmLUD1SsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7325606A31E
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7325606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04b676219so44713485ad.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787155; x=1796391955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=D7bbcdEAeE+MD1H9f/KFWjA1H0YHRcfugdEdaeaMX53BmxslbpOMfjMmcwOCT/CP4D
         t+lnzPTOsvEXQ2Q7ISIaj+E5yfcHPKhPGQiry2RCrntqhZbmL/6Vle/D+EH2+yH6s5am
         wGPpbc9db1bpOsHn6av5rYEiLdkf13qUxzTcycRzoD7zQezgjozlhhVDHeYMLoR/9HhO
         5h7L68EZbURFnZy/JazppYXdbp6uuIxO94o3KD0Ro0TxOaPrIPO9MfZh0rI0m8/9nASS
         Zr5OH1OxEOKb8sJcJ3ln5EwXap/ryFpk/erP/s9fU3MQBUxfelY0/7KAnBiV0C3dCqff
         Oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787155; x=1796391955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=OjqJ/2WA1Sa9PBpqOXpSkaJx0C6xD0c6kXg9w1tNdRPZHL3DJ4zVmdvWxGCQoA1QN2
         YQqKZl7BCrQL6bIGq9Qj3pCD1Q9ZxRRAOLJ8XIUSeWCQwYAI3BSatFvxLYgoAwy/SB+T
         KjkIMl4UO91FtY9/TPa65XtOcXjCNRUnC3VrjgjzYgic2TimeDBzxD79tZlemCK2+o5V
         Nd5QRQWV4+9Sa8W4y1bSSNykVumyNv1GgFhEuhm5/VyqnjN5CU6NU2RUH1a4gTx6Np0E
         yN8DDEeFE3DHhK95aGIO+4OkxfZqATmpOPElSUKh+e6TgJCB63g02ElaqS/0jIqejbQ4
         /b8A==
X-Forwarded-Encrypted: i=1; AL+hErFmD4HEOhB4jyOi2/OLz/ZWfwlCTjKJWiVQ8cmk72A9EhzHhw5SvKG2tUUreo4FXEuVvWBbT69neNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aw1LTkeooxlKjETaCiAHkc6S+1oeYW6Ngg3EYF3s37s3O2kww
	y7dauSFSnBARCxe/58BLhud4njwNtcx6ZgVLQkgEOC2ie0+mevdi07eD
X-Gm-Gg: AZFdTZfVUSQdeC+w0Jvz29h6wx9Mhohd4VO5NIqFikl2DyAteMcmDb48tj/ZuEPsmml
	HQOIUjI8vN35lWZ6ST3lujMXEKGx+0gahgs9JS8+X+RbSm7lVMEGAfeyjotRjESC7bqsWK6nS7w
	wUJQi+ouqMOjYPgllkVoRmvB4AvvgthTS52Rw+XDcuXWCLsUFDsO8GzHBawXPOu5WUQX2pYAUgk
	zK3KQEMdAUs8gQo1YC5a9pODpPXjWj0dHgDnw/aUTfPImCyKatUW1Cx0gGhoFMJO0cJQb8K8Tmv
	h2ys3aCdoxFHBenM1rTIcbz2Ks4/JfmyglVY78vlFOVqDkhs+SOKu55NprmtQLkjz0g7CWM/Lp0
	3ngLMrqEI427BbnTN+34OyFh3MBdjcORmoMPAii2poc4MCH85XYLTKViDBJtgUhrvmnB6JoTo+X
	tDPVstFJJZP4ToT5d1dA779d+6G9XHhLiY2YGYjyeh6r8u8t57JkkKUxJENt/GrQV+6OKpmtbJt
	1/Q+c16aR9dwZizb21RTbpcR95Dbf2O6ubonCmWsJvqXFqY6GKvy0Qq/FLxrYIenuGqHg4zyZqm
	mhISbG84KKfGAtq3NtuXqf0GkXsVSsakx9VmzKVG4Jg/ww==
X-Received: by 2002:a17:902:db08:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2f03f170f5amr261112775ad.33.1795787155319;
        Fri, 27 Nov 2026 05:45:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:54 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Fri, 27 Nov 2026 20:45:04 +0700
Message-ID: <20261127134507.125513-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

