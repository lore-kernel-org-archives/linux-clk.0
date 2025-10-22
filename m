Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC334BA3B
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144582; cv=none; b=PiCRmhSTkXOzwZHmza0zM/uPfjoskitklwFJ2CTR99JXFJvdu9vjkNdYxXjzxW5IMh7Gnc4pMJPLXEhGnhBQ13fq7O83cp+n4MnQqAbtemNS4wQwjRfq249rFTtnTEaPRUWg5WvpAl4qbQYYCYV6ilxLKLTBBsbjG+A+S1JvkXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144582; c=relaxed/simple;
	bh=UxRv2Dj1eWAwuBaqoEAma5UyiLaBLfeYj5gZy8jzJSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LbgfLuhWHkg7dZ0miIonSX/mqJt3duo4BPm3dnmABAqUEYD5E4PjuhWyET/CXjSga4pl8dHulfMLERaz94kuj8vFfqiwbKra8IClF3NuvMwwc1Bsnpyrah4cJvXhI/N3TPlaMcQD2DtGTu0avkoXvF6VHkaqeP461LqEJv+GGUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mD0VQm4X; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD0VQm4X"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so13272995e9.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144579; x=1761749379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeVW7KIs34xjHHALn+sD+JnpOfHDngShiO+k3xh4Ufc=;
        b=mD0VQm4XuASkoXtSYmRwMPsBeeCi23yjyFL3lfzV5nhh0p1pXZIvUnT82oz0GBeg6F
         kFxebY0r2xzPOT9vPQkwEm0pM6prkKehs4fTuh6acGL59xvI5PAZqsVgEQUA9CmNrXGI
         cQp/AvRvwbZQNKOfGV7UQLZCRlhXgs+pqGbuEJ8CnGSfX8aXywuD0Grl6O6RqA5XLrL4
         KfO+20oVqVgJf//k1DTgJltRhznPfqxHfdTkbo28DICeCN64kjbJSqK6Yp516FIPsdi4
         nehFIdRbUDDyaWYkZVH22OS0XWFQmK7z0qqETO4Sedbf9X24IZ3+ldASTH7meqGJ2NLt
         zpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144579; x=1761749379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeVW7KIs34xjHHALn+sD+JnpOfHDngShiO+k3xh4Ufc=;
        b=WusdPoMSXVIXT9raBUld797CQgXKvEiRb9hZwsKkzXRW7VHBC5V1AhJx4R3xitvJtY
         6Exbd2YWOeQXd3Aq3RwQNyGHsq414DF9SlZM2zC0CkhCJeouyrmyheedo+tm0uWLbESz
         66WhypLV/m8ajZbue1djMSA1fcmK4o/oE+CWOqnd38Lf1vmapriRaMwAB+stX01yyWe8
         uERbgBrQgI3CzFEgLqiCgT6Kup3xXQ/pLaBw3qTBYChrZR2dXK1G5hHxXhBF+465zLvD
         zJXump4yUg8hBAXL/gNP9oTP+AxzEKFX9lbRnyyol46hMcTigxEXj+hJv6zEGdheeA40
         D4fg==
X-Forwarded-Encrypted: i=1; AJvYcCUv0SnWf4B7LgymKSWKjpFQvD3uZklOCPKeaRrcGW4X2GdHOgvSeto9RMDvSaxG2Fjra+2McHNFW9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzglRsnBCv/lGyBawUpd/VgVL+oS+Q8U434O3NBs0m4n/C7B0Xi
	qACvU8sR7rSqSVFIeh/d+TdWYeLqzTkV8s6ZMvGlVumUurTKu69YPpsp
X-Gm-Gg: ASbGncvX9pPsholGD87EGB59EdZSmvBnrP4S7UHDzGO9wdBYXooQLJd69pOZNFtU+Lm
	cQQ87LZ1O1In6WAgBL+HlICxdpSMc31lkRHEiGKo4I8AaBCXRQ76HvtcALnLJjdM5c1ohIx16UI
	V1sZe5eoLdKR1XvYRIsBzuuWpoRgMIbRlavxYYPBkxQ1r6icwBwhX5ud+P0ZM2tdRSm+1bFNT3w
	e/hf+a7L25AM8E6ZHYGWjA7uGKmFYoQEz5mCGKd41pW6kFzdgRUNJc+gpK+A8qiWxa4vaBAS8So
	CCfKN2N4OUdWwmcYDKeanNC7MTF2hLBLfJJfZUZjl5kI0OQnvHLilSK5LLQ88ojZ4PemMQTlCu/
	DOV5WePD+lOJ4qaScNToG6J68kq06NFLKp/tOSNroMtNxwVDDrfECA5EwFw6t9tM4bWK+LQtUDe
	bcTg==
X-Google-Smtp-Source: AGHT+IHr6Ob93t9v00uJwuP7yAAMfu4kGsf18j4jl3QNK0VUxssU6icvlb5KeKOe4fTOZz3h10i/+g==
X-Received: by 2002:a05:600c:3e0b:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-471178a3faamr101708965e9.13.1761144578447;
        Wed, 22 Oct 2025 07:49:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:49:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Wed, 22 Oct 2025 17:49:28 +0300
Message-ID: <20251022144930.73272-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

The #nvidia,mipi-calibrate-cells is not an introduction of property, such
property already exists in nvidia,tegra114-mipi.yaml and is used in
multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
mipi calibration function and CSI function, in Tegra114+ mipi calibration
got a dedicated hardware block which is already supported. This property
here is used to align with mipi-calibration logic used by Tegra114+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..a1aea9590769
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: module clock
+      - description: PAD A clock
+      - description: PAD B clock
+
+  clock-names:
+    items:
+      - const: csi
+      - const: csia-pad
+      - const: csib-pad
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description:
+      The number of cells in a MIPI calibration specifier. Should be 1.
+      The single cell specifies an id of the pad that need to be
+      calibrated for a given device. Valid pad ids for receiver would be
+      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pad is used by this CSI channel and needs to be calibrated.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1

