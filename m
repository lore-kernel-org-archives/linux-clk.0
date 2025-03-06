Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A402153D2
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260658; cv=none; b=hqGh2L4xmURV1tbPz9bPx39QSfvHLKzbkt3+rBTEjeT2U6n8hdZFcasOgfT2jDSWIuD/uiOdfQvp9ZTLa3tkVj1FA0jqvfF8WAhQ2pkAbMDtmsJHNSibSa2Y8lJMosZZCiQTI7gJRnqIm4fXkKfDeLmJMO0C+FyBosMsAhdUE/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260658; c=relaxed/simple;
	bh=3HpG5JSfnp1rR8LM9tLDyGAnkrv7gQYHSv7Ks+OYcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHawXjiBWCMZBvW8DsglV7COHLDzSRzfmzyrcAn8dq2kAFffwFskQHvE8qVZrmSa1Xs5pIG0dgyrAMx0sq852O0hxI0S+CamdYDpWceiK6VfSjqcIjCem+avxm0aTD/xVkdeU5R3Lgt9pizMQmKCfqV7s6EMNzS+gfgi5xcNnUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dZCz4B3m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dZCz4B3m"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390f69f8083so521592f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 03:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260653; x=1741865453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=dZCz4B3mo1aJhl/32RYWzj3TKW6fTmDe004hw3Nel2Ub5pvvKpoflzJg2ObwKji0Gw
         2xs9/MVvP9sfulN62JvIpELZLs25hc/LiRNbTz9T0/vwD3v/7YKrjRPT/OwJpT710+Gr
         P9c9BcmzDxu8Jm6UZyCR4ioipG1JjvcsckrYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260653; x=1741865453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=kcADhWSXhF3N8gD+1AjcwNzDugya7O3me3GYOnshVIenQ0IeQwGeGi3FNMsO4g+5c7
         hV2YUD1JtQXKdRhMfDY71PnDSR9wXJeKWdhZAcb3z77qiOAXISfYZBxs/ZxnOdREnWBG
         TSXqZGoXTkb4lbhgE1bJxONl5oCs5OgYqhhCBqapkTBIlZnKsQetxNbpEExy05DNpj6I
         1Qw1FmhLl9ym49MI6epGGoZASBMpX5weY67Dm1m3/v2PTuYhh63Mibq7X9l0IeeR87v+
         Jl6nAw4I8pRCp1btPpn4xFw0fQm8ySXoMkYhLXCsYTYcI58250rlvo+lOu19HtWwRTNu
         HXSw==
X-Forwarded-Encrypted: i=1; AJvYcCUP2jq5wolI274VCnOmueLatdqC2goZOV+4j5txPJoK2SbBxoOB+TFX4fxgxv4YpKqmddi+j+0lOTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4Nx8l7nXHb49rvBIXfHcLnuP5cSV3V/BOnbSyL+qy5MWiVQq
	f9pibQa+N1L90u6q5H5ewbz9RRfYFGt0BFK6NUmuptrCC4OSFcqUtrFa8p1jTic=
X-Gm-Gg: ASbGncvfqM5vctpHxGk6jw0IxBYO+UYJOHjjYTCwqMkIbq2aD+W1MgZUEWrjtUu1iam
	A2dAQCaLOgcIElT3U2cER2W6SFaxhV5K+dd4pekPRb5H1Iof4XW52VQK7sTrb7Nii3axlpLT9JG
	G4JgfGOHQR0djYNALX+fKVeDuF2elvAmAGOkMYVoO//49uLfCnwaUhoY2HtAvR1CNNnYm8eTIvw
	2lD1JBVgAakAelTcZHUr+ATtQNWYw8y5ZMcUsEBOmoq+6nK59OUEisJkOUAh90ZCNNrYbXax+OI
	mOSZ81pJGFaRn/ejx2ztrZ7mjETq9ueNLsqsc90ICkCAtdzaaP5E4rIwCnz+onppIndKkD4WmDF
	Aw+1nDQ==
X-Google-Smtp-Source: AGHT+IGSCIcSTKiT7I3EfkCIRWduueONT660Ga+g5wK4QQGoA8bK63FcMx77szIfKMFdz74Of9fxSA==
X-Received: by 2002:a05:6000:1ac9:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-3911f7d1074mr7102679f8f.51.1741260653419;
        Thu, 06 Mar 2025 03:30:53 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 15/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Thu,  6 Mar 2025 12:28:04 +0100
Message-ID: <20250306112959.242131-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..d96570bf60dc 100644
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
@@ -86,6 +86,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +99,31 @@ allOf:
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
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
     };
 
   - |
-- 
2.43.0

