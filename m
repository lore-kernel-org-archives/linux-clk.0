Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4CE1DDC2C
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075264; cv=none; b=nTJxH8Fus/4e+ltqtaqFtP6aCFO39yIejZVC5DW3w+TODh9HqxZuPuFX4oMmXNA8+n5HrRg0NVlTbafPNSzz/Xg32DWx5oKna8ocoeN1vvj9BfuIxcenPHlm/7xnEX7MftLc0Ga3clAB+yoClLZjGPqOdCPLywOd3ABtX8n3nFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075264; c=relaxed/simple;
	bh=i+zaQKGw+SJKrdqETRU8S6D5mn97fzLB2huk0KC7t7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrPuXwhFIk/JO0/8Of2c8u8DXa0/J/zp1WHqg7SZXpHFMf7WZg5eKbQ6pKPkssxKHK7PEiQyAwIlVuqAR2cfdTCLSlS2gabVa28IwXetZ09ZoAwAd8gQZby3Ol1g/cFHUvIBu9t+CjpJ0uFXvPYhx7uUdrM1/z1HQlLOrmlu3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TdXRAtwe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TdXRAtwe"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa549f2fa32so548020966b.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075260; x=1733680060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8Mnl1funP026bpupc6kClrugt4oD6R0yljLualdHeA=;
        b=TdXRAtwedXGz/VxnGAzSId548nGsSo4FiAhzNxCEnpvXo2MziF5KONrLvzuy2U8x0B
         OxpsJzoo+EPImiuLg4CM8qSasIW+mZk5ytJU4q21Ao/mjXDVlOm8ubA3MKjmMvKJvrIw
         sKo3X/nQtc3oQccs9QPfUgHZ3xOwtTrH3eIgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075260; x=1733680060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8Mnl1funP026bpupc6kClrugt4oD6R0yljLualdHeA=;
        b=oLTg4gNr2qi6l0ZhIwneHHzmOLFTy7PTYBe7646gbhcpF0O7RS/QsJs6aSTjAYNsBf
         f5ELSrpzpAvdZg6of8oGhX+VR2rcL4nIKA/Y1mAyNSzIFnbvRkSuioow5Q2zRnn+jtcr
         sxArpNBWyZtR9Yki2DjqREdlV3CyLGWpThSOeJyLYJavbFn4zlHg5vosm4SpHBWfQJAS
         KgEMzTRpGfGyQ16yBK9eGP7idgujfcsbs67KYFsvPWnmpVEFdVulsjMaHtPXDqKcMTy0
         Rlo3PxvqhZROTtJWBMnJQKyhU6hNHUGz6XSovgoH34mkTIKoC3SAVbcYQHlXHrwNIbD1
         CIjw==
X-Forwarded-Encrypted: i=1; AJvYcCXjQ9DIBl51yaK3MQg0a4Og3lC+3wqaCGgEQ8wSQrOfC+S3b2p/PF0pr0o9KL02RyWD74UTNB3/nxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjybacnsiUQRYPGInLSb80ij94GjSdpsotTFfUKA8ZzYrIYnPe
	LAOum3t5QWl6Ja/wAqvdLyWFg7N0PhEsZABQXAbst24xYa8BCgWMwoADO4MHesM=
X-Gm-Gg: ASbGncuhwxl8scp7e01FS2iQF4DoMrgMWkyKAgTWhU3kKke6LpvlA6A/xCMEiuMxRbK
	RfMCFdn6Ig2514RtAFh5n/sKo1Q7phJFdfXWZHhAs8Hgct/uhXOEbnKiv28uWeXthKVrkVVhNCM
	4+t40I8eBpercPrbYQRfYcC8FLEg2VUgnqrQokBUS4xWSaOtFy9tPSxu3Q3tHJNMHo/OwaYTBeL
	/IOxZvBRQE5Lla2bQIx18ygv5JGeuSUKkLA6vxt/6qzJ1CcL+1VmUntnoH6lbpGGTbj4zbbXBCv
	co1nrnJtof4s2xZEMiMqtAvj6e6ovfm2Phlb+e3V56lFejYEOXk8UyVO/gvWe9WIggwH/MRWmBO
	00Zkjdp9ccNIkpzVh
X-Google-Smtp-Source: AGHT+IFV72Xrog96l7fs/EfUFu2CelIfYRaRPp9iwFgjtNC+Uq3ekIXkP8zlYtkGxH0RM/aN9S5fHg==
X-Received: by 2002:a17:906:2921:b0:aa5:2232:c8d2 with SMTP id a640c23a62f3a-aa580ef31c1mr1541928666b.10.1733075260573;
        Sun, 01 Dec 2024 09:47:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 13/18] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sun,  1 Dec 2024 18:46:13 +0100
Message-ID: <20241201174639.742000-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds the DT bindings for enabling and tuning spread spectrum
clocking generation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Drop "fsl,ssc-clocks" property. The other added properties now refer
   to the clock list.
 - Updated minItems and maxItems of
   - clocks
   - clock-names
   - fsl,ssc-modfreq-hz
   - fsl,ssc-modrate-percent
   - fsl,ssc-modmethod
 - Updated the dts examples

 - Added in v3
 - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
   indeed more or less a syscon, so it represents a memory area
   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

 - Add "allOf:" and place it after "required:" block, like in the
   example schema.
 - Move the properties definition to the top-level.
 - Drop unit types as requested by the "make dt_binding_check" command.

---

(no changes since v1)

 .../bindings/clock/imx8m-clock.yaml           | 77 +++++++++++++++++--
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..83036f6d2274 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -43,6 +43,34 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum.
+    minItems: 7
+    maxItems: 10
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum.
+    minItems: 7
+    maxItems: 10
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      The modulation techniques for each clock supporting spread
+      spectrum.
+    minItems: 7
+    maxItems: 10
+    items:
+      enum:
+        - ""
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +104,10 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -86,6 +118,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +131,49 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
+        fsl,ssc-modfreq-hz = <0>, <0>, <0>, <0>,
+                             <0>, <0>,
+                             <6818>,
+                             <0>,
+                             <0>,
+                             <2419>;
+        fsl,ssc-modrate-percent = <0>, <0>, <0>, <0>,
+                             <0>, <0>,
+                             <3>,
+                             <0>,
+                             <0>,
+                             <7>;
+        fsl,ssc-modmethod = "", "", "", "",
+                            "", "",
+                            "down-spread",
+                            "",
+                            "",
+                            "center-spread";
     };
 
   - |
-- 
2.43.0

