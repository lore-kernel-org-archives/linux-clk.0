Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49531354A
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813472; cv=none; b=qsgsg2Nx8MlBYLkx/CkjpTHtKr7lh6MsmkwRdeC++WhaT/z933o5KmfqNdCu+MvXYxsAGe+0juSGVSa5Q0PuRvIXwSEIHX1piV4GA10Z5v9rzaTS1/V//18CYAR6XYzGuRE0OTovlTkNm5gBMoVscLt73HbwFFZIKKRvrYULcWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813472; c=relaxed/simple;
	bh=gpoDHkJKaBLo4I5P8qTwM5e7B7PwG7fYx3AIUNIrLrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfxxqSLKz79pd5GukZ5mpIdVaLFNg6XT6o4aE18BOy4ttTUBVFwcCYoeMtqE75nEmOvM0UuFOficWIR9YDI+HlesW4otu/M/zuP1L5vMly0lMmD6rZ4qjxxB7skJYOlyyTt9loW0xcQ16ipb9oAtCMI8jpFWL4Zdbe06jOxS6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWkd9nPe; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWkd9nPe"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57f1b88354eso1123815e87.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813467; x=1759418267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
        b=CWkd9nPe5110OeFGZ4GlN/QW+hQJTIFgMBHRnZ7tkXt8UJAsYmbGbQInC8NNAZ3Yy2
         RRdDaIxDq5hhK4WdOUtE3lzD5SIS+Or8uA+pBEDrQBA1TOqMM9Il59UbVmu2KFnN4tLx
         90bmBOKP88F8kzwkAnpIUhcmUFOQvlWn/2o/dq6kCCou9SAddfbEIb6uwewgxbHc6dCb
         vBWgxOTRYMvDozOCyGsv7fOMelH6SlokzhuHtcm1pHTjHDL6wSZqMoFMo+b86TYrugiu
         dPaAlG0N1xjFVvDKXnYHxBhl7IpTk9Zaa7hrVQT8ypUJSCXZPJWkYo+SA2jEOYOPFjoI
         o/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813467; x=1759418267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
        b=Sh2ZuYPm/THmq6jSNl5XCw22YKsn/qF2VJGd26M/Av9xKMmbtaNYBx/19Z1tIuGtit
         w+At1JwCjijlYolh0F+XLU0KB7YDcoVczq4zzbfw25Jf0agyUJ3udY6CmHSH3a4yEOE6
         YVqhakW5RZmcfmHTXvrR6G9/BwJM8yRsj1rfaz0ZDXFFEufTzw86oho2acYSM4bHx2GL
         dHgThqj40RmE6ZXvJHemZdcyq3ZkB2s4T16pvPSk1kABsYDdpajDPhBZTeg+SIyrSy8g
         ndrhityPepc33q3rx+qIgNgozG1HFWPtGYb2u5YLXHBoGvHqfazJM+24dmdB8ogZjiOw
         t/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUWkVQPoWyCPzIgDjhLnWOG3ZG7BcsYUpIQX3IUdmuOF33yHRmvh4+FDpgNfPMnOWtyreAvBzY8cDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1tIFco5ORgdSveQ3dKJs0z0Xn3HqR+4hVB6RNNkQM0KgTePxb
	ONhi/LLbVuYUDllBMxoEDTLP6mXZvJxNOqKJggATx9rP/Vd6+HP3CNUM
X-Gm-Gg: ASbGncusIU08BBE8K25wzxexpQzfPzAIjofzgcFiT32ZyRSQK9Q4oqpxekDiy+4+b/6
	bunVF3PoTMsqG1AYfI9tPV0FhehlQ4HulmKpSv0esmB4AT8L4nSvq1j6lFRknM3CRKrcefKXT0C
	zkjWITrAa9WdFxZzyH8DMeUyPsF9xiIze/WLkZgsKulaIhKe/4QZ6Kefai+BoMM9tB1O3faxpA/
	gdhQ6uAa0+pOD1h+989s//5FVwGQzm1ZROxCes+LjxUEpBefxvo82qZZwfmhny/1tKSI9VpJ5NQ
	hNaCwJaJ4+SOC3PeGXw8QFyqZRWaK4RPHSprID/2/GxWFJYrjZkZMhJLKpGM3C9oIQEHwZL5UaD
	IEaIH6TZKSRr6Tw==
X-Google-Smtp-Source: AGHT+IGed0vIRa+md+egWvWqgYYl4XwnX/bKqIftOs7kK/BC39V/DrV+l1FBmmZSDKHaohVTfkYJWQ==
X-Received: by 2002:ac2:51c8:0:b0:576:fbdc:e3d9 with SMTP id 2adb3069b0e04-582d0c2a3e0mr1199445e87.14.1758813466370;
        Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Thu, 25 Sep 2025 18:16:46 +0300
Message-ID: <20250925151648.79510-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..817b3097846b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,135 @@
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
+  clocks: true
+  clock-names: true
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
+          items:
+            - description: module clock
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
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
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

