Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609966;
	b=KN4icxIuA3MtwV3golLCcKCmOcR6vS67dq/kNkJZ1r2g+ZsjsKdISL17k621f48TqDqM
	 LxGTySJl3Tmg9hcJ4Z/iPeupdIGXTvmHX5xZ/rDpQLq8It8QWycrXLWaDstTzpNv0/MfT
	 JTQxUZiKiFqNmLqKOq1sGjQz7PquUbuGuYJJSc57YIduzLbYz9Wk25M7Yy8t6ZcjWpeUU
	 4UEP2AeFYqGv0wJSlUGe2MZLMsJojjKGFR44ETkUdQILjfNxLQSU5F5W4rpgdNAHDXsil
	 scgEfuMtx9E+YP66VjU6EIB6/mCsdLVtLxnyuBTiXAYy7RB6AGEQoKCRawLuYKhIM5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=0/dDqrXim1hmOop8WeeMFyzQhoSKvVRgJXnW/6d1Q5HWXBrc4OVjckw3ZscZ+V+0PKLc
	 wgIfWGUa+s61x4hbXFyPw2/Q2i3K42kH04OTelLTrrghqOHn9vZzcd3YrcVV4NQyCHQv0
	 qrHJhMXlJ1nyzayPgZsFfFDx/nowhDo2Hl862MKAPY3hhqXcECapvdl1NFWtA+h3QnVSz
	 qCZ4fy8Glh8vMAl4jmlBho19lTPMmwyV+4BktWP7tXNnYl4WQdMPfJw4SqDBw6gZY2GYf
	 8IgI6diQUXGgK8pbJp7O9Cn4kj339WgGlR5VFgtmZuzpuBQNQi7XBXlCaYq672gkhqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NANt/KWh";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93F606A32D
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A93F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NANt/KWh
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde1479f76fso3194025a12.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609965; x=1796214765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=NANt/KWhIDdvCOeY4utjDOeqLYM4twhmFG1ItWWr3HFT9jCk4yOM+BgBGWNOd5ahZu
         etyEMApCd3o8OOE7+A7McFA3J75fbpLKjLtKw4hs8S5XrQQ3oi6X0ow3zlWFZzwAzFtI
         wLCY/cPCP0Bb74osRlvhcYTbXoe7C86voPzvRciY/wVa5IvEHzGTJpVQwj9Os04aI/v+
         FDcmPfmq+U1YC6K73kI0mm49vPu2QV4pucYa2aEF4YvQWHV23zNY1kpx+bFRH1NOOu3K
         zYibLiQlcmSvn3TzewhtK1BOYPKuemoEFLkGTqdUtQcJKNSFWRXHvmddFInF3mz273cp
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609965; x=1796214765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=HYBK52cb/MSr7KdVf0bJ0aVyTX5fhJoBcbKkzW6qCm4J4tEIfELok04uCzi0edwuuU
         RR9uLvPc7hu7wv4QYrJsvbWOvTgFt4cVbrcChximrSVtJKokHDda+PJ60x13XZ+I0JhU
         Pbynu6Jx+N1+kNXMMzCSZix24tc5Nqs9kOq7mW606IqQPQ8av7xfpJUxhseFpSQcj/QI
         YCjoDpA1kKei/iZGVCLxQ53YnJDVFJa6ZQvJOQ5OGe/LBuo1XOOkALPRVPstzpjJ+u3J
         HTjCNS/1DW8VqfJ/bG1zjJCGKEeotjNctrl235eu71KQEaQjgi03ZBWTZy0Zwpultu/L
         V8iA==
X-Forwarded-Encrypted: i=1; AL+hErFzAJk2MbUDqmW7oJvmJQHMTBMj3Pj5urLMgLAgqAmQb4WjqEXBNxRMx/AP1C/hUvGDzPZKk33Bjig=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PpfEGQEdbrvjzDNQiQk4hAcBcZa49BuRbb5OHDARyzFWU9VqG
	ktKW290DnIl3WYxAFLa0+deQdJNh1Y7H757db8ueuoQg2dTJ6rQDeMBb
X-Gm-Gg: AZFdTZdkfePQ3bQQV/W22eQIGGAL9jZ8VTNm3sVYUlxhNNwMyGA1eZ7Tapx9wdAabKH
	s80cnN/M05/mzpLQApVAXmoOucmTs+tG4wfq3Q2G1wR9Mn/30IjYjPfih4keb+e8Z/5jEi4Rmrx
	dqv9SNLjIu8Rc2i6q3/zJbPw4KcVwLgNHLFLWgBKb68FG/qKJhUBY6OoQERyGvXG0sg3svM+Ok1
	Hz0NlGH1HCz61NzQ9ERDfxz1FIfrvC+nAGx85axakETCn+sFAzZ3Tz8vpOp3x84xR4a1d7qzD9k
	+7d8fLCAjw25vWr69J/N2pN988URf6K4UYDgr07xTONrCh2YuklH0Lk+3a8EKcZsymBUlfPBLXv
	4JyALMU16DJghYBeQ1vaUqODKOO1kJu6MDLj7oVnaGDnncwull55CsGoerxVr0qxxZM5Ra8DZ8G
	Q8f1WGT4q8VArM9AwnVEslBX4Jd5TBgoWmsJ6L0E3+hwkGlBRBQpTiC1zjhPsuarcuVZXyv8DiM
	5v9/84n6UQKmF3Lpux+vuUgWGfqrriOimvbJMkIxGFxJp87689H160m1qD5DA7m5HOM0/fW1X/m
	5k0msWVZ98MleWOB7cXiFcrKWltUYYxUqB9U0roW6Y+Zjq8=
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr17317487a91.50.1795609964791;
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
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
Subject: [PATCH v4 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Wed, 25 Nov 2026 19:31:41 +0700
Message-ID: <20261125123146.379057-3-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

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

