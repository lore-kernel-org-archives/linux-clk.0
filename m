Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C722526981A
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388202; cv=none; b=EH+UKOReZuhc17MM+I0x3FkiEjeTXqHEiKlNO2s3UYnrp860nDeihAlYAXwYfUid/9NAx2pnegUUxl0JRGJECP/IQBHYW0AkTSJen/biw2fp/yOHc+/U0TYFvRwDSvQzoQs6jYdSh+2nZcdDMfqLpoln04yjMDDqryjc/+y510s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388202; c=relaxed/simple;
	bh=hkq6fHmdJC3Lk8cO5+DRsRwOVcxTWLet80Z76mwc3rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXzRaMpcshSM44iEzuY3Z5Wb8ZEqeWvsAGSiQOYFGC8Eo4TDnSRDMixnpSdHoQkwpWImqlx8KLLYlnt8wDEHYhZg018iFOBHBIx0i8/K39aUS1euC7RiwkLVL4SFk+Sed/lxfaDP16f2n2lT8QLWtp/eLwD2HVRa6MEynS7i2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=P625Zp0j; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="P625Zp0j"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3b12e8518so975805566b.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388199; x=1745992999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=P625Zp0jczns1ZSi5WPIf6dbVXWksPnRToz2OsyR0jp2DCgEjhqmOSh4KAVW73Htnm
         qfC1rp4xGtRVtQm5unCo8twqHEtuujeTisSLD+wivAzRJz60Nb2HBpvRSd3q8cz0tQgF
         qGi6NkZ1QmKcLGpt9GHoKane8l/hyKhN1/Lew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388199; x=1745992999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=NI2NVRYA598LyvmirW2M+nZJekUYPgc8psvBUtchKn9+M7uLvdJCQ66cIOpnWJlkAk
         atoO1FBp/vLvwShuMZZY0rGpUWxI2F65MmANr4W/zDFhPYxWv1+uTY5waUIfEKWdnVcG
         sL96znYahhcG3i2yUkVCDd4FmeFur52l0GXqwNCRnf2jt9kztCZt51SdUt3AMgKLFRSR
         27Co0qIvVe01ey3IgQAyR0sInBV0Cuzask4tRhnfMbyCtaOlQfSdS3Hwtl3irEx/kM0M
         zTtIbb0PTCZTM8VCiYFoB4v1fRD+lRjEKkdAq9re1lQbO8uYhcRdw2vEvOnk0KyD9Jsi
         yP+A==
X-Forwarded-Encrypted: i=1; AJvYcCVse7Ps7kHJ0/2XA3Tt2dFO/LPn4M6KrN84COCAxqGwGSAJ9Sf0H3ylJyAGaQheAADJKEaU1GPjdXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGPnmxwpgST9JtuYbfe7un/IHHnwASLcgCylKDRIMfZybbZ3d7
	45ZyXWpW0euOQ+4IXlthZ0Hw3KxwRiQXm8hmIY5/eqpakgdBYQEsu7siPenYfyY=
X-Gm-Gg: ASbGncsAyzjCZPgMBN9K6bC8cIbcBtBUyPYb1XDH2cHeK2lqyPFZjqa0GQ4CFGkNPKB
	hnd/3Q9nnJpAmTqvpmU9jHzUBl1D2jYqvYZH3mFSA4D0uVPybe9aBKubC/Uc60Ohl+oRbosxkKg
	7G3qFaTw3ObbO7DZsqBAJ+ZyQt4UbJWBS69fRzIKmuPyaiEk8Xn369/948rHOaD1wBv4X3SzmrZ
	C1tNpHynkaPvPCD/vIpsTyXRotKC3QpV62L2fTLaBQA4PBWecCSD2HVjINolYUZVRpxZcheHlH8
	v3tt+pPBxw7DZGlaXvn5KXbO1NdgMrPNmxpGSwy8nU05HJthScmzVoWhYYCfA3Bodl++crdTdj4
	zfuMt
X-Google-Smtp-Source: AGHT+IFXK5t2CjXs/VSaGgLG16geNEJEoOfNTY2wN1N5E9kGgqXmwH2XgsdysdftJFFBu3tzrfnH1g==
X-Received: by 2002:a17:906:c154:b0:aca:a162:8707 with SMTP id a640c23a62f3a-acb74ad9629mr1643817866b.7.1745388199239;
        Tue, 22 Apr 2025 23:03:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 15/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Wed, 23 Apr 2025 08:02:32 +0200
Message-ID: <20250423060241.95521-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

Changes in v11:
- Fix conflict while rebasing on master

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 4fec55832702..e83f08abd44c 100644
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
@@ -93,6 +93,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -102,20 +106,31 @@ allOf:
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
         fsl,operating-mode = "nominal";
     };
 
-- 
2.43.0

