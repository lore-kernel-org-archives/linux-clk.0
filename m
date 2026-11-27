Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787141;
	b=E3Zkln+PN8gLaAize+ePievKxgt+CRqbAZfrgatWeJysL5NUp8Ady/1dl5+QXf6ikfod
	 6DQjFuHbh8q3XwOUjj/NE1NR3npCUhU18PwiRhFyQnA5+BeLtOFvbFrylfKWuDygCXNv8
	 ZUW/tma7pUEjbhd8Ja5Y/Y6zzM4KqQLaLYL1EtW9pM39Z+HsrrZube5pujU3iGx/MEuxS
	 OnUb4nOZL161sD1I+3jxq2hDFnIVf+b0CtzM7JBp7f0alaNcX1jXd/v5B1avPp3m6QlKo
	 Qjjqvz01dSkKmhdhs82BX/jt4Bo1F0c2yU1FU/rMjl1juJXck7knqDEgJ/fm6485rOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=kxQHP3ObvrN411GKnwlBLVaQY4eg/FJJp9VwkLY/z/6RbeN16TK0X6hTkd2KSlkfQTaa
	 e64SLV9+GYp+PSHhkuxGFVCG66J9PcfRjYWUTANoP3+O+F6vKOp03auJ8Wawk5hLqIU5Y
	 ixTV2X+yZGGlnZ1nXJg1MemcAqQbpJO2iBXA3oniBX0LPsQIxCfR657MbQ6SRz1t9gX19
	 mKnS/p3aVDiTQloJdTe9IHvtzxjfS5c0ICN9nSGir588tdmnedhneyQGUirjALqodzlNR
	 +FnVtui3SjGsA0B4s+zbl2951R+HQuUl9kCARj9iCmDPj5YsHA31bQup5aw3Z9psbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C0606A337
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13C0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f052ae3c86so43963535ad.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787140; x=1796391940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=zqWC59HFBxeqnkwiJcA/vmF7PXqaSn4cPlghUfmvZNV5G3RaxpsuHbuhncRjcKUvVL
         RgVWQMgdXN58QHoMug3raBl6dLYdDukfKBAcgyeL28e2BM5cL5Hxg45qmG4jBDawc7S7
         lAEjzMp0sak/BpEjHW6drFOVkxWkD/DpzpIzeKtu6KfB+8s94kiR9T6TxqTYjNvoZOVW
         uloDbZg5rFJzZY5VgoLAdc+uiTL38cnKFgWeKaB+TMTTtan+bHjkFDVKszaB2FV/MKDt
         qUJrHVLE83u4ZrxeAcFD4bNulHhzew7Ez/XbUGlvtHVKZZZmkem3K3rPoh5EatDDP2EL
         X1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787140; x=1796391940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=CVpcnoozw26w/LvWS0qQn0LmjZWGPgDnqlG9s/ugwr7e4wbP/fTYAqFnr+8Fw7wAMx
         y6jvnobS1/l36SvRlS0KVCDidMmR5aF62oTLN2tHe3AbyVxzgDuR/5/wZvE7colf4Roq
         nXkeGitahEye+7Z/iqGKvZkNaCAl7bOheJ+F//vCREd6QCKRa09dX9O7NzhJGZ4xYMCV
         AzytSn1zx4+RKVXU3mVvTGmabGRUGgkQb/oVd7gLdPJpixOuutGORNpPiMbbneVtXh6p
         93WF3esEJ7SZPEHjiAh9Pws76OG/BR2M4S78PHz5uFEZozs8TeglKo3JNkuguO2VMF7F
         s5yA==
X-Forwarded-Encrypted: i=1; AL+hErFJPTMk4BOf14FM8bE3t7eLKFU759TYbMZ2nVQ4snVx0IVmPHW1c531CCwPQdLDm3P+ZdUZoPFfQMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vytS59dH4dcex2TDSv18uSuwEr+i/dtmlqCTgnKn0r9KYbQ0B
	FtpJ30ID9KZ2HXxqx9HKYOTCRNI9ZQyOTlLNrElj+OPJG+4JnIM7Q+hV
X-Gm-Gg: AZFdTZcQfxjb5KPm6GImdtI4IuvI6z6ArxjYs7sl4RmKQ6Zq5KHZrOILX1OoyWjcyCC
	b2F8SIKwmq2p25LjYZnZPTSZ18FfdPsxYQgqExLJxPub667zHUu4AEOtv0XUbnLHenPRNtjVF0P
	w7RBnqMU4nG29+PruDF4wtD4xUzgkFDwnxiVUJUqULxNPF3pXxGMeB1YXW1hkSTfuW1Pv0EeMRS
	+pddtTPOoL3WPx1PCop/G0xCoBh6s9DMkX7aGFYxwHAxWQpQxObCMS9OAH5LRGVtkt/Cxue/IVg
	IhibGPJ1SYHfBG//XA4hC+60NdwtPAlZKy6WKCkdrGXUesC4PWO1O/nThy3Lce6IWJRt1c0AIWk
	qEQkVgHkngUTjBQDgIiVZWJCwfBpooo7EktiyByrJdFpzvtQHn7DzN9RvLhPkkH27pvUwY4a/KD
	mMAPlnmRiiHesLT1TXs67qEnw+Xp1Hyof1VBSajebc0+1hJfeupw6CjKa+7DS7rwDjGPnRHfcLs
	5HtgsPWFKMSVOWqEz76rheX82I7r6r7FCL31/0SVpO9XhUuo1n6Z7zueIux8ibu05QbgjKxP/w6
	QhXHJvR9EfpNX4h6Yq8ro9q55h9A0+nEsq0PeUCWlxk5IA==
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr270576165ad.2.1795787140051;
        Fri, 27 Nov 2026 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:39 -0800 (PST)
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
Subject: [PATCH v5 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Fri, 27 Nov 2026 20:45:02 +0700
Message-ID: <20261127134507.125513-3-hikmahgumelar@gmail.com>
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

