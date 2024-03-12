Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A881419B0
	for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 18:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710269442; cv=none; b=hF61Rn/FSi3kslLbfaq08/wBaHGY5bqwre6PCxcMnmIOD4vrR8VXsD/h562KWLWpI5GUen96t2FmuwBNgtI/CYrcf/15fuGiETRYLKcZu+Eq4qtzBPeAmWyb1FtGV7LmhwYwX9MNwD11Cj5H5V53yy+LbIUweEF2DTgmwp/lC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710269442; c=relaxed/simple;
	bh=VXNVVnHLzcUMf+eMc1cXZF1qhCcY1ZICBw2e0CD90oU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=GQPxwaumD7O826P2S6QXoeesauhivaI+fEcgt3OOzCs6aiBUx54ShLrDhxGpSz9C13o4nbW1pZy6MLP1qyiMoAQWn0Iw0qaF2JzZIJKnPFp5uydq3pCNFCZFp55GsbGY0P/09vrL0yq0KK7rVm/xx/X45UUhEs3u+g28Zg93NQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Icjz8BUa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Icjz8BUa"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5131a9b3d5bso5729493e87.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710269438; x=1710874238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWmv8PROciGabllAPSqvA9F+FHYmPZHSjaaUfTtwxLQ=;
        b=Icjz8BUayisfyD6eGg27vg1xvbZZpSUDXWgVXRI3XLbEG1XoTUuQ/g6NCdeq2S+Ona
         W7nV1GOjyVyiswaaxOgVjcvElnr1rXQc3fqT954JwzbnAVH5KqmxqKgchKgCmp/34st7
         KNtRRyJpyOteA3ZIZ8ear3MO5agCjyXVF0IC5nyt9Pi9E2MUw2MV4qvLZdLEyD5kujSS
         6coBBc0cTw/taDGA2+YR2O0GNckvkoDgCDgTC0u+L2hj+2jMx9LT6boYa4lEQxCI0wMc
         NNq+i7Zuh4X83lPpkI1TakLxShYp2zwUj/A92Ghz62IeMQ2CSPxtKiwdcbt/6q+59ZI3
         h3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710269438; x=1710874238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWmv8PROciGabllAPSqvA9F+FHYmPZHSjaaUfTtwxLQ=;
        b=tFUn1IFWnRlIQix4m16xLtoOX/nY7sPCAq5F7zxBYZO6e3xy6gWTwR4q5NIjvp+Tw7
         X/6J3Vg87y6BUXVTypeyVTEf03SAQKsM/uZFnIBnM1IOdskMaAH9EEPhI3V6pdfeoczY
         MKmNKGoLdi8YXOGc0H0qj2QySAbGwh4Ygq91Aoc2tNPbuMOZSbM3vGLUe1FaOrl3AzTu
         Z5VSfe/CwDq3oFJxxGOmYTCe3UhGf1T6cLdTUAzQ2LU40xoD5jcz+SLtxwqWtk4cRdbQ
         3Uc5LbqMN7Hc7uRZEfkeAHZmqeCpUM3E3Wx8dNYnf0XbDvVOOVnRFjedGgHZqrFr38Tr
         9+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXUOMfnmP03/YpHFHQRvJgAgCmW8OXrA79BAd6tPQR/xVg6SNmhFAGTRMYZlybRtnnNlR+AMhExfJFu2mKxFKF1A1lAHaMke+Np
X-Gm-Message-State: AOJu0YxmigprKUkfwMV1vsJXC3IG/OAQSNykxVhuQ+78vEBwnm4wpQHA
	5YUgy/4ahqVJkUQGVjzeU/gLVHgL7X5hwcyHl6Dgy9f5tAASPR9SV/H8MvgE0qg=
X-Google-Smtp-Source: AGHT+IGxrhlnbqnZw+75kfh+yq+KarLg4EMELr26c6t+nZ26T7LkDm/X5ar7Kec8Nuoyw6XvydLALA==
X-Received: by 2002:ac2:47fb:0:b0:513:588a:2614 with SMTP id b27-20020ac247fb000000b00513588a2614mr737193lfp.49.1710269438328;
        Tue, 12 Mar 2024 11:50:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b0041339453775sm2557465wmq.48.2024.03.12.11.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:50:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
Date: Tue, 12 Mar 2024 19:50:35 +0100
Message-Id: <20240312185035.720491-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Samsung S3C6400/S3C6410 SoC clock controller bindings to DT
schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/samsung,s3c6400-clock.yaml | 57 ++++++++++++++
 .../bindings/clock/samsung,s3c64xx-clock.txt  | 76 -------------------
 2 files changed, 57 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c6400-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c6400-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,s3c6400-clock.yaml
new file mode 100644
index 000000000000..d0660313c262
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,s3c6400-clock.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,s3c6400-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3C6400 SoC clock controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  There are several clocks that are generated outside the SoC. It is expected
+  that they are defined using standard clock bindings with following
+  clock-output-names:
+   - "fin_pll" - PLL input clock (xtal/extclk) - required,
+   - "xusbxti" - USB xtal - required,
+   - "iiscdclk0" - I2S0 codec clock - optional,
+   - "iiscdclk1" - I2S1 codec clock - optional,
+   - "iiscdclk2" - I2S2 codec clock - optional,
+   - "pcmcdclk0" - PCM0 codec clock - optional,
+   - "pcmcdclk1" - PCM1 codec clock - optional, only S3C6410.
+
+  All available clocks are defined as preprocessor macros in
+  include/dt-bindings/clock/samsung,s3c64xx-clock.h header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s3c6400-clock
+      - samsung,s3c6410-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@7e00f000 {
+        compatible = "samsung,s3c6410-clock";
+        reg = <0x7e00f000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&fin_pll>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
deleted file mode 100644
index 872ee8e0f041..000000000000
--- a/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-* Samsung S3C64xx Clock Controller
-
-The S3C64xx clock controller generates and supplies clock to various controllers
-within the SoC. The clock binding described here is applicable to all SoCs in
-the S3C64xx family.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,s3c6400-clock" - controller compatible with S3C6400 SoC.
-  - "samsung,s3c6410-clock" - controller compatible with S3C6410 SoC.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. Some of the clocks are available only
-on a particular S3C64xx SoC and this is specified where applicable.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/samsung,s3c64xx-clock.h header and can be used in device
-tree sources.
-
-External clocks:
-
-There are several clocks that are generated outside the SoC. It is expected
-that they are defined using standard clock bindings with following
-clock-output-names:
- - "fin_pll" - PLL input clock (xtal/extclk) - required,
- - "xusbxti" - USB xtal - required,
- - "iiscdclk0" - I2S0 codec clock - optional,
- - "iiscdclk1" - I2S1 codec clock - optional,
- - "iiscdclk2" - I2S2 codec clock - optional,
- - "pcmcdclk0" - PCM0 codec clock - optional,
- - "pcmcdclk1" - PCM1 codec clock - optional, only S3C6410.
-
-Example: Clock controller node:
-
-	clock: clock-controller@7e00f000 {
-		compatible = "samsung,s3c6410-clock";
-		reg = <0x7e00f000 0x1000>;
-		#clock-cells = <1>;
-	};
-
-Example: Required external clocks:
-
-	fin_pll: clock-fin-pll {
-		compatible = "fixed-clock";
-		clock-output-names = "fin_pll";
-		clock-frequency = <12000000>;
-		#clock-cells = <0>;
-	};
-
-	xusbxti: clock-xusbxti {
-		compatible = "fixed-clock";
-		clock-output-names = "xusbxti";
-		clock-frequency = <48000000>;
-		#clock-cells = <0>;
-	};
-
-Example: UART controller node that consumes the clock generated by the clock
-  controller (refer to the standard clock bindings for information about
-  "clocks" and "clock-names" properties):
-
-		uart0: serial@7f005000 {
-			compatible = "samsung,s3c6400-uart";
-			reg = <0x7f005000 0x100>;
-			interrupt-parent = <&vic1>;
-			interrupts = <5>;
-			clock-names = "uart", "clk_uart_baud2",
-					"clk_uart_baud3";
-			clocks = <&clock PCLK_UART0>, <&clocks PCLK_UART0>,
-					<&clock SCLK_UART>;
-		};
-- 
2.34.1

