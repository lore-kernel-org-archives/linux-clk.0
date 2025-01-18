Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83E41D86C7
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204082; cv=none; b=eTVdntXfW3La+5vELJnBQd1Yq9ZejWSvMl53nD8MbnkdGJZUqhPP4BqfH3YXuUBMvPv4MjyWH5pyNUNZIommXG6J92Bn9NJ5Iaz31h9/nmyFpIevZ4xuB1TbP8ViiHUtG5DGI0WSD27mDgs0cMWOPBpzU7YiOlwLCw7DGQIhiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204082; c=relaxed/simple;
	bh=El72Xw99HLuBdH9KtR0LW7UzZsYG3PNdKxTAjv0VMF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4l3PzR/uxjN7Zg/ipguxPT2ik8V3SEGCKZrU6A3PMuQe7mLncHwDIk/TM3sZShS2eWo5pg+GsCt5PuFP46LNuzSVj+38Yj5/EiU4z+5Ukp852BwlJomcM58i52nN4m5ufYeO0M+ANQPIce6axDzpoAq4U83kdNXxG9tp7xwYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YSem1jv3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YSem1jv3"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so4562996a12.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204079; x=1737808879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=;
        b=YSem1jv3kQwqoWXgZfxtx0RAl4l0J+eG3zcaR7farAwOW88tm/Eu4PyeyVr18am8wC
         qPoqQwSyqG4eJ84jPxlVLQMmh8j+H8BaGQRb5S/SwlJqLdqST/gIB3g5DOX65sAWJ9Xr
         HqMwnC0qLnKCwoBT39qUO/XPWjcaaDjPA2Nc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204079; x=1737808879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=;
        b=LsA/egIdEQgoS+8akYs4WKs0EK0kdTXelo+Zuk4JQ8M63yEzdfxX+fZR7ZWs4j6VKc
         NbzC8bk4kuyOQELEllJbBPB9jIDknODSOTv0YO8r0XWUozJHmhDIrAfrmxvCngzyiBNj
         uzt02i4E/KkmC4uTFyeF0L4/Xn8w50lLmwaeHMBdfkuoizq9gIpuETXp6mNCwsdnm+U1
         olwCUEa0x9IgvP74I9GEHAqrau/CwuFRTt0NJkGfj8WLiwv1waeVbFEoyFkd4E8sppaF
         O7v7TQL+sqFD0NAMP0qf5umwXK0iVS+WsunjUgAlnwD2Sw098esC5Da9YYzOPSyYGuzh
         yhMA==
X-Forwarded-Encrypted: i=1; AJvYcCWbA2SeywiM+Z4u9QDFNIx370Gcpp4z3ilXySftZE23G4m/mV4cAliraTegWcc4gNnORUegWuztLLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/W+X8SsB91Txf9GTpgD1d/GgtUFPAnid/s+YDVS0bqI21D37
	CY4wH7cgXZ6i4QhdCB9CdZvQ7r2bXZ1yILnJ4cbCq0kaCAvO240cRHY55bjmXvE=
X-Gm-Gg: ASbGncsqeOSQiNOTAjtW9lMzSnIOO6hgau4rXTEvSetNKUX1zHasdLxpXwmF+UB7oAe
	LCLA0BT1RL5CWWpuWYYCHAPd+GXR+8Uazc4JCTcTOEUKoua8NMwupZMIUa1gWgPpB+YrKmVSU3d
	45A1sLHFj7Twonsqgna7Et957znolsX6iEvymOewabUB4UJiP/f44chI5czAr+QGkJET1THabLt
	/vc5uUMDtghCxG36rWa0/0bgM8cuegs4knZFEHNlKTkCBC4FL+v/IhcUDkQ4ciMIaEWUF8U8RGU
	sNFF2rl5OIitOmX095yyPhxLcm1bOCxEgKHN2h7Pfq5HAiAYziIQtPzCANAMChV4z9GNKSdLYm6
	Gete7tTcJab68XJ0dSCuli4r5c+2dG0FCj4qC
X-Google-Smtp-Source: AGHT+IEGWBFQCcPRpsGYAMeB7nEf4t2kqxNBUWYNEEALNt45EQbT5cmxoYvaE5QDjvNCrevmdUBs3Q==
X-Received: by 2002:a17:907:7fa8:b0:ab3:875f:a246 with SMTP id a640c23a62f3a-ab38b0b68c7mr643475766b.7.1737204078976;
        Sat, 18 Jan 2025 04:41:18 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v9 16/23] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sat, 18 Jan 2025 13:39:59 +0100
Message-ID: <20250118124044.157308-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation can be applied specifically to the PLLs.

The "" value for the fsl,ssc-method property is specifically intended to
specify a "no SSC" case, as in the example, when you don't want to
configure spread spectrum for one of the PLLs, thus avoiding the use of
a method that would only make sense if SSC were being set.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v7)

Changes in v7:
- List the PLLs to strictly define the setup order for each of the
  added properties
- Drop maxItems from "fsl,ssc-modfreq-hz" and "fsl,ssc-modrate-percent"
  properties
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- Improve the commit message
- change minItems from 7 to 1 for all the ssc properties added
- change maxItems from 10 to 4 for alle the ssc properties added
- update the DTS example

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

 .../bindings/clock/imx8m-clock.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index d96570bf60dc..d347d630764a 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,46 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      The modulation techniques for each clock supporting spread
+      spectrum in this order::
+      - audio_pll1
+      - audio_pll2
+      - dram_pll
+      - video_pll
+    minItems: 1
+    maxItems: 4
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
@@ -76,6 +116,10 @@ allOf:
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
@@ -124,6 +168,9 @@ examples:
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0

