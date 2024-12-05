Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2725720CCC0
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397608; cv=none; b=LsiS+8VgNVyR0WoVDjY+0PZ7JshWFz+TFVjp3WEAaM4AVdyqowDJlV7JoWWbvLlVA44Tit5vDr0xlBJwl8SAoFUEjjqEL3QQH/id6OHXK5wXUf3l2d0noWCwJil6afez8Sz8FTswR/oOtpEu/irvoL9UvXrDePjTt/b9WP2d0oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397608; c=relaxed/simple;
	bh=oa9Gm93vVm1rGdVo4AFQE15aHx6ue06yVsUQ62xYJYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/LsyiG4APyxfjAEpR5WAXIKXQhqPeTLLUT20w9+95OZxBSJC6MvTpRVvYtDvpwf9F1DsGtAN1/9AAzNn0Rixih9kjL45aKTssPDrhNNaFcKQ7jdRTOtO00cyIk5JpnY15o7CL/BqaHVhwSPL7dK6WtzX3wlrLQJFZDinDihpcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NO+AOAzo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NO+AOAzo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso95348366b.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397604; x=1734002404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qxAaFLk5+E1lAMIL+qkYRoUyf16X1PKrF8INezZ3F8=;
        b=NO+AOAzoTTM8vSy4+vPz/67m0Wnf6gUPXBO3ZkILOowG7Tn7n/+sOAUA8vK7Xts9NN
         xh8e3N1RgtZjet5egTZsnz+Gk+E4YPRyD1cppHwg6WH2WN4/PBse3geeS1fPD6TmB4ne
         Cnfv7X+Pi1Wfsp+/sUDzw5WxU/XYis91ISkXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397604; x=1734002404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qxAaFLk5+E1lAMIL+qkYRoUyf16X1PKrF8INezZ3F8=;
        b=tSEEpkJVgkwvUJf9CcxEumTtsJVXUfpSQ9qVyiccItv7VucrOfnbYsk/7XzVQh5FM8
         J9o0ojlRaTtqH3W7GhkjCSY92EQ1UBDpwgGnxwcZGPqNgHgDXDtL43Ear9oFLUl8W8PL
         uzTgSpbhd6BTXnGvOnpYDjCVyfbUcbON8uOt7/adeg36nhbxyMACOoD3ocN/psFPeEWe
         KtFwrp9Dp0Qg64Cj3JbEHX01EtgEQ1ZDs/+h8RayIZBxOESIfd/Uc12epS9fYBW4ZU4q
         HE70+L1KexwNPhrwqJi7TgnGRRFtXljAmvnXAVX0cBeAHcj0uT1/vK+13t7HWUka5doh
         /4ag==
X-Forwarded-Encrypted: i=1; AJvYcCXU+l4WVw3BQxCWRZKiU396FOeEIRejai+SOlCzoosNO0i3ESotzIsi5tS9Q3kSw+epwKOk+Bf4Jbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ymkzHvh0VinqhCa3Zmu+pwdfU8FtLzgUASq2BPwLJwz9Xpp8
	MTCTGEE2OwI8NkvESPJWFzHnQs5GuJLKO4W9HRHC6k/0UO5Z2qXGrH6zUscOMIE=
X-Gm-Gg: ASbGncsQWchgEWmoTAGBmzz+Ci/Q9K9xOUbWB793N7ibdn3PfMv+6SoagGg1wcpDsQP
	OjHxsYeD7R+nd5uyHv2/+EHpDiPC/0Hjm50RWtbLhiO4p0LD0gEXYKvqn7oYLEzDjhzCV02fc8p
	SATv0BRqHF5XauC/8rBEAgGnnt0M40XSH5FdWU4RK6yApov1LE3jmw4mKUOXhQU6Rb9PIA//dXu
	Sr1LUd2+H/MXyHO0zsytGbcfLsbQsipWi1twSsR4Cp6L9juBGJnxS+HO28jjjE/L8Z4GtLHoaMj
	GsvqLf31xMgFGDEmlWNzP4hoVPlXP6gGiqO66iJZpaMoNw==
X-Google-Smtp-Source: AGHT+IEgFpXLsMoTzNiUj81+8z1QLJMCQqPzFfWukhsHBlq5eIb4F02MTbl2wSjJnR15AvECCxPBJw==
X-Received: by 2002:a17:906:32c3:b0:aa5:43ee:2ff6 with SMTP id a640c23a62f3a-aa5f7d011c6mr812629366b.1.1733397604406;
        Thu, 05 Dec 2024 03:20:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:04 -0800 (PST)
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
Subject: [PATCH v5 15/20] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Thu,  5 Dec 2024 12:17:50 +0100
Message-ID: <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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

---

(no changes since v4)

Changes in v4:
- Drop "fsl,ssc-clocks" property. The other added properties now refer
  to the clock list.
- Updated minItems and maxItems of
  - clocks
  - clock-names
  - fsl,ssc-modfreq-hz
  - fsl,ssc-modrate-percent
  - fsl,ssc-modmethod
- Updated the dts examples

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

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

