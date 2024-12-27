Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF61F9F75
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318675; cv=none; b=rmEfsg0rZY81Udg1TsizIlwgj7bdKRmAMQMHIncS8wVarSAaigI0itTzm/yNjQvJWwf5QT2kLjGTWZRCV9R906gfKxtt30SMLpE1mIXyhQuhizUNhuK9mFsOHVzsbD76loMrYqN/oSsp7vkAlaGpFp3MxBHJEK0LwvjoximhYJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318675; c=relaxed/simple;
	bh=xiX70RWooAV6haHCXU8rKEC/JtSy8CH7kIzRC9tu+nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCgjHZJY1NIYF1ByKNwdipBA6SQtfXHAEBDmUu+U4UamqL8cUnsLtVlMOcBWr3tJNdnh2SQ2PMfegdkOxXM1BWDZsF0BhHGekWOW5fbqDb/bPwzzVBUAwEeItPS/q2fKcMB9h4h4P23dL0btyRlwOdgjd7FLbwg7mF/5mCoTgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=leJn/NaC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="leJn/NaC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa6a618981eso1242986866b.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318672; x=1735923472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+kAaC1AoQ98ph6jwnNcppkKlX4Rs9Hgex1b/X1iVho=;
        b=leJn/NaCPhMqCu9ZnGVucc8w3xVKrNAWMVOVOrWPXsxWjw9SPg9/GXhQMe+9FW390o
         JopdWMArsnEPfNdAq/A+9IAOrpRsXREvFMJIofbOiQWJbQw6da1b/pKfJU5VKgHM9o9P
         Qp/ea6CeONIHKdBmB98ZW9xG8/kGRzWuARu3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318672; x=1735923472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+kAaC1AoQ98ph6jwnNcppkKlX4Rs9Hgex1b/X1iVho=;
        b=Tg4i2LXMVYWC1XL53lJdTuTpHYsItFjmIfCp+zbG8zTIZ+kIRCGH7CseMO0ZFKDqzY
         KnNhzwkf1WIDtf+d3I0Xc0+D3yQMeK2k80HGGuVZsJHPl5mDvL0a70aIgQIHP9wkf72v
         7VD9bPmMOMWGEpCE69fGypblW5aDTGs+NXMXkjf6Z/Ua52/jvnWMoKeFx/wC1Afl7hIl
         NVTbRRORo6iEM/Fwu7vtPogCYMcHzLwO9+GVCCL7sdZolUUkzARETamFMJqQ3mTQ3lg3
         VEqbAWfZWJbvcUCh5N1xvbJzAsgtaXq8ckVszuqct3cnhK1sqhRRHV50iem4U7yz70VQ
         o2ag==
X-Forwarded-Encrypted: i=1; AJvYcCWKYRbokzaK5avdOFXbEi/pB7NQtqSS+ubLqSIGAoiDbO9HAhOnirhurfm5xwUf2POeF6hEvVCbD5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAYsYYvmtjiWXzxHi8oKITsmBqGpTkKyEanXoHp1RWd8s/CoW
	4Kb/kuUze2ncK5Cbc8oLySS9uqjUFOIl7807XgVRChvjEJOXeOpuIeCPuEf9Kqc=
X-Gm-Gg: ASbGnct8Ch5AQIoxC0bEJLP5+tJzu4moboyHj+0FrZ7R/5FI+Wfx+Ga676Bwhbs+ZX3
	Ex5tmQFK7skud0JE3D1jL4sI0UB0yIMVKBQiYsQ+qnGYz/gUk1SNPS6ncHyElNKXx+51oORV+eS
	Ud85PWJ8w7UCoD/fuWZt6M41MiaUCb0ixl8Pigk66U9Qn52OpjyT5nlvSHErjKNqrLK1xuaHmKc
	6OlzhVWZKmbTc+PrcxImUAj4JUJ7JL1iZeVTjBQMpRVYdA0pMqGN+6i3wORRR9JCVzCCdUMCmXO
	3Wm4F8Q1i59jjU34G7IaGA==
X-Google-Smtp-Source: AGHT+IGpyzrWcBX65CdqI/PNJ/Mfz9DLZVEv6Ofyawaq/nCyclfh2gsXwoQk11JSAy6/krhgua1Pmw==
X-Received: by 2002:a17:907:60c9:b0:aa6:5385:90ef with SMTP id a640c23a62f3a-aac34404937mr2534593366b.61.1735318671648;
        Fri, 27 Dec 2024 08:57:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:51 -0800 (PST)
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
Subject: [PATCH v7 17/23] dt-bindings: clock: imx8m-clock: add PLLs
Date: Fri, 27 Dec 2024 17:56:20 +0100
Message-ID: <20241227165719.3902388-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index b23e639e6389..eb2e6e702de9 100644
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
@@ -94,6 +94,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -103,20 +107,31 @@ allOf:
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
         fsl,anatop = <&anatop>;
     };
 
-- 
2.43.0

