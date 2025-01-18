Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939F219DF5F
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204076; cv=none; b=JqqJPSliVypRppfUgjQyPa/ePhQX5dWQduwptU2MXncyS4yKGt+JuZ544Fw2Yb7pCB9LY8lfjh71gRyGnlYpSZ1dHAuov7m9peuO+aABPM6OQOHzYmTW0+EkpiWTPZisUHD1RAnogglK8FTTsGOp2bE7lrEhoi2UwcPtS/7EBAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204076; c=relaxed/simple;
	bh=3HpG5JSfnp1rR8LM9tLDyGAnkrv7gQYHSv7Ks+OYcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1Au1nn9YVvhNoeUQRtgn1STFOrdoC078v1hDDjQfcixHvJZnsFxMDP0lsDJqGCZ8r0E5EFdh09sS5ORN5GjumQKP9DAHEoYZ93HS3FZOn+KMRcXad95Lkj8fw5fqYso0m8HYS3eBQYihNJqcDf4OgQwIQr7BmEQoZCaTCE8DEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XieMXG3l; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XieMXG3l"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so513147566b.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204073; x=1737808873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=XieMXG3lbp3aURG07coBeZFV3DUiLQEBPTVFIsOem+kMTnwEcUXKhqA3gYnaEPuajQ
         AI2Gf/6yEHOtc822j4J2bgZkgkIsU6TG8ecRMHRLwEAzYY2zdF5FE19RDDA7HHylGBdT
         TGVJsA8xI2u9Xzj/wO4fx5+46mz9H+xAnRdco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204073; x=1737808873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=Z51Css2Ed70l3v1TDaojEL7TG0kdCZYoNfh+TCoReywFscizn/lYw9aZzRqj/wSQE+
         DbURNZz1rI9/dR64ChkEDoyxtk65VzKASNDx3KtAmYQI9+s/rLg2TWrFV+g7hctyhB82
         5neDru0inP+UVSVIC6yHi1N2TxoG2HQSHhouXNDeWpsdlDJb1nVz40wksg3YN4difLm+
         Jqgd/BwFrJhGHQsf8gqMXVMZ9ZQzC676dTZhfqfWUasF7regASYqM6xLvSpx7h/ZNlaR
         9m2xLwTesoKAKMfiw/Ob5OM7Mmk5icJFUL87aDXdRHYo+g5y8XsXotqkYV+B/fw2k5fc
         4OLw==
X-Forwarded-Encrypted: i=1; AJvYcCWWDNwBLwBwWmHyWaUZ7tL0+K6FuyemU1iUh9qopaCvldnh3OqDJTiE8rJIvF8Q3+BlrP+wheiSCKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbM0Gv0476XIOgj7GC5k4rGtnEMz0yAbGsGYJJx5yPNt2XJnvk
	7uqgeoGTO2NsdZUPfbjkjr2WryF0VRRI1v54YisDFuVBzfb1jEF63JjM594TK/s=
X-Gm-Gg: ASbGnctikOChHpcRUvzo/574/unMR7JsqtyBG7Hsa8kXwaunYVI7ZfDxU2fm9iwwQ7o
	5Ywle5kUkb4dkMaEa/MOpPLgNRmVc7FzwQEG386eba8oBp1z2kBPa6dEd8LbXmmkJyKVLfTrE7e
	/BiQS33kWKxkvR6jI4u0GBTVD43nECm3ebzZAmUQbnLeFFrrCkyn4sTRifN5XAGKqKmuBVsgXDX
	oNBaFxHvEk8osihfm0x1H3eWzjBDL1VaQIfNlYpeUf205xSAJMumIslFR/Q3Ej+u5JwJcz4eehd
	KhV+nhmD2hqeNZvVw0z4yLnrkuzpkNevxVwqT6wlx2ho7u+c7Row/pvrKFyAmO3dbGwDRx0oaFQ
	mzjSQQt2QyCLl+WiQA6J5a4IMlRB9lMe+sewa
X-Google-Smtp-Source: AGHT+IGaQfD+XOUXbE+BkfgW/kdqk8npbiYgJKweh+ryekNShXVP8/4p8gDEZxKuRlimfmswkORPdQ==
X-Received: by 2002:a17:907:3f28:b0:aa6:79fa:b480 with SMTP id a640c23a62f3a-ab38b0ba07fmr581216666b.10.1737204072939;
        Sat, 18 Jan 2025 04:41:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:12 -0800 (PST)
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
Subject: [PATCH v9 12/23] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sat, 18 Jan 2025 13:39:55 +0100
Message-ID: <20250118124044.157308-13-dario.binacchi@amarulasolutions.com>
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

