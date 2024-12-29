Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F00194C96
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483855; cv=none; b=qNdClkXwQfy8fSwG7Bc+drbRPr/+wBU5KqiiWaXBi9vS+CTR4FlHQekA4DslbNsBPsxU7q8k8yS2MJh/lQEXMZ43z4Ll0C4FZX9Nd+ozmPcONbP4sn6KRH7n49KHDUOARiKYsBcjYvsQO5H9xfWQGHXTlatOYwIbmmeBvafrreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483855; c=relaxed/simple;
	bh=3HpG5JSfnp1rR8LM9tLDyGAnkrv7gQYHSv7Ks+OYcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ry8I/NaAcRJ8WVQfUzDfPc/TXcjojITLa37tuXLs5cVHFS5DxvybBMrbDuIdeO2FICBvhI9wADMSpx0YdGTPYOHbvlZyo2bgQUEbgz74vzlHBRQ3eoq5pxcDx4T20RCTXzoL/H5uNESp40RIGQcX6ygunOJ4mQSxSMOYdn43IKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fNx073Vk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fNx073Vk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaeec07b705so666671166b.2
        for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483851; x=1736088651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=fNx073VkFNcHajTQaq7kMBGREn9S/Uy0N4fCO2FxqT7p1hYPKzAlRQ/E+0iANAcOMr
         9AtGY/6DT5XdVaOaa+WsH9W1R8liHqjTLgKgk+mqkNVq1kGQf5YMenhJSR3QzXVRHudZ
         KBRxQjlWdDnzkq7tM14F5tPNyh9kHHLiVDIo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483851; x=1736088651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=VMm6or1S6fcYk4BZYYTKkn9bBpzqt/5O4zi7+/Dq+B5NWTz2RAO724qGfYJ/sxMMXM
         Yez32ojycWED18LcKxEc/pQMcCzqx6xZkkibuZRH9WQQFdPXopndlRKBFGPIjlHeBCXe
         w9jPSjcN5Cye3p8SrUZpaCdRSYG5H8rL8Ax0XJnzAdGsuQKaVKLt6+EjgZ+EiOHYPd0p
         jMKcHIlWTGF6UHtu2KDZAkRAP+fQwtV0CZCEjrwLh43BjZUoTU3JmxzcGtYVjsUoQe9V
         qeE0OWqJ+LTfZuPkxZ/0S+PfzbmJ6Jm9qqxkQXAaLJd/ODJfAf//FRkbnjCnt2A0HWRj
         fzyA==
X-Forwarded-Encrypted: i=1; AJvYcCWnM9fcO8m+opSLZqWAgvrVIDMgZ10OsuN5qJKAYVw7ZKamHVbYE4OMY9OODg8SvbsQ4dRUqQumt/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypk3C7xlE8JfdV9Dcx/GsbtFaViVRyoHiVYyQ6xbI9QmDxpaxh
	wtnCGQIb23FXrn8YA5zs4ndYZRTPkHpc7Lj42Z8vAYSTsk7UucJAOJRq2hGYfSE=
X-Gm-Gg: ASbGncsFMZUyAcxGKj0l7Wky3OWBAvyuhzOxSwmtkVl6GqG0bnjGzyyBeRCjVSljpB4
	Gd6Y2ceQUFQFiOK8bB0hVM9PwbaBHaAV3xZhC02y8IEbh3mM/zXxIU4tldRN+qFn3kUA1f5cdh2
	dCwbThC8lT7V4x/XCvXvK3HngxZt6vrl2+jbK2w9w1q9XhdZOITGexsxcrAQRprohZ6dhJrGZ9u
	AcGNW1QTjqxmUL3nfBwWHt90t5Us8YeqUxbXg/ler5D919U9o9QP7W69IlxILYlvHhX0bZSA0Sj
	V1k8aX8gsH2jTlGQBot3Hw==
X-Google-Smtp-Source: AGHT+IFxgItt54HHYH/8mA88WaD38CQ9mOKSbKko/RvuXIeFzD1DAkYznBzK7j3ZQqQYmVzmFb1k8A==
X-Received: by 2002:a17:906:6a15:b0:aab:d8e4:2062 with SMTP id a640c23a62f3a-aac3366b549mr2566530166b.56.1735483851580;
        Sun, 29 Dec 2024 06:50:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:51 -0800 (PST)
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
Subject: [PATCH v8 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sun, 29 Dec 2024 15:49:36 +0100
Message-ID: <20241229145027.3984542-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

