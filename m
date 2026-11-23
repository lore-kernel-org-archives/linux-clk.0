Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437377;
	b=hKgrPIi40mylj2I+QK5q/aWEqgEIMIf8DtZ2jRw7jb7tDAEBmuSAeLO9jKsp4bL4Xzl6
	 ZKAgge60InuxInRiH/P1Bzy5CTek2/ijWJkdv0kNS/Dny6KzjMAm0JegaHoMJqSH43HeY
	 q8p9AWEHkWj8BWro5edj5UXbh/IeX3P4FH7ORKX9JcEjwRTL35oufmLZ5CAJb4UkN8HqQ
	 JGJoE4yjCYcSYkmzOrW3tS5tYLXEVs5mNqhLhjASngCPDI4olFwxCOkjSc/zBiv/ijXXa
	 K9B/bH8xsyjWmrihOnQNrADRZB7LuwcBOdiMjUpYj574ZaZ4xTtSqr7Gvs1d4emTHlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=0jleKDjnxU3uznRu+kZN/paObDHVNQwXNWJeaWXHT8EvBt8Iov9J+yo17EuGYCgEsFYl
	 M3gsh4wUPKyQj36BZibL8XA+7EXN0Mvml6MlvbKjyYaa8BsXwLPwJGqze7ZuaBCUIzKCQ
	 JwGfhM62eSr4ovQsv/Mpgj/r7Gz7h1pCqeqDBH2v9ljBYHwozR/nQRk7iXLwbTtxx5HJ5
	 F35G2R2b4RmqzDRZ8PrCrA4vpDGXU+7W1ZBD+tW9+/gn1i3L8TC0aTlLnGT2cUc+rXMjC
	 Wq5UbP1cQM1M4AIHXsWg6Uwc7KmMhDSKK0Kr90ovHZcHU94dzTfv+K6n282U9RNVwdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFD606A68E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAFD606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso1913224c88.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437377; x=1796042177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=R6i2UD+8+1SWXf6raMYqaGU6H0ZivEnYsZ600TnGXzjRiBt2okNAeVKSlYBYOoW5Nq
         sTjhq6t3svnLQy8/KKx48rxekAp41/oU8wMvLXcUJHSlB5ws6nby/8WiCuiIEWqZLPUr
         6OGGhhdkAW1bGGOeS9cZHZv2TtjQaATT+kczHXZnkMDVUZZZvTfIXWopXsEX6nkGPNCE
         +7IuT+u4Ag53FHsuExyb3aJTlEaKFfKiNEBtMP6fFKFDY5fqs9/0WjfiJDyXqyqAxzcp
         2ShqeKYlzL0+vd4juk0LrKZE8XEezjB3tuvKz1g483yqW+hjXYLFccv2syX2DSBi9/YX
         lD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437377; x=1796042177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=pqFOdmLcg0auapNGsC9g/q8meYLPT6sdbdjkEniY49RaEh5vbQg/MnunFR7C+Xng+H
         3mKf76DKaCq9E4EfoAMONIbmagZNVv7A2q6GdaT8oCwSqIaP7md8h8qGn8YKrK2c0Xxa
         1ko1g4d58xNCYC35hWLLS7KflPJZsoLndtAHeZCSQ3gtEZBUF3dMINh+b/UkXuu1B88E
         HdeGpyCcZiIvp7ds1WPw9n8tYORVkcDYLszn4rCxmh7qOAQgkxFQCQyIQhmSoV3tJCow
         HKVflCQw57mJ8Zfor4cp3iW/OCgQN0nj9dqHRJ65zeTE4fbmeB0CH6zBfnYdCZqKt7Qh
         xMmA==
X-Forwarded-Encrypted: i=1; AL+hErGS2YewKPrQ8/gjkg8WJXmvBaIsgx6A0qmNWvhPl9UJhfuHnmkNmX3UuFVQfypxYJEldzrYEWnVKRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZV+7/U2VY21Vp67wCaGR344X6h0bYopU77gW0Li7iAP8ngdJq
	t7Q1YDil3c26wEJdVTObWVyxFHeU3O4OcxZrHtzLEZTs4CZltGrvF2qD
X-Gm-Gg: AZFdTZceep3eupmqdD7Wi8enrx3VI0d1p/M76eazCvAUjXI0wtegH6FNOq/3JXBXu0x
	clcZaefOWZ6VW+ezHzEb7mPsqfbikmecxZlvHcytxGkk+u1eGbV+lD65RuWODc9KXv21lBWFbJM
	uZwO+GP5PDaT65ci2xROb5KWdv9DI6jSH7Ts5ZyKBflmhalO5dtbVFYiyhURraEaAAEkKG0uMIM
	SCWjRBYW7yR2EsjFMjSdq+jlgEz5MJOJF7AIG4td/G0y+PqXhgRChHG3L1zQttl5UJu1WI7qM72
	DmEpLpriiprJcyb1yxMr8rMlKcil77RQSidla8garU7xmzehCQbPrELTIak9mQki5M/6ToY3GB7
	lYZ6S85fP8UP1RBJBHQLbTlkKmq0+JOqJLkz9IrH0p1ugNsF4pB1cs4ERdzi2UIv3MEia++96XE
	cC6SLleryeXhByrr6mx5v227SVhCE1FjfrAE68fGGAiqf6ktglH2luOtaz7vFY3FmPCTf1rTIDF
	jZNXDrzNt5ASb1ehRNPns6zaQBUiwnmEnPpr+BvU/zMnqjOaSCXAUTfPLPKXUZJJWjLQBbRm0EQ
	8UX8bCBMJqVdC5MqppW9TDMR+A9vZZ8i6YfEZQaHAEGPIlX0nssvMC5BO59feId34X0=
X-Received: by 2002:a05:693c:88cc:10b0:386:b306:4ff6 with SMTP id 5a478bee46e88-386b3065916mr2485851eec.21.1795437376602;
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 19:35:41 +0700
Message-ID: <20261123123546.152162-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

