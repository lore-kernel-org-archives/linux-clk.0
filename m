Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A838197A7A
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500541; cv=none; b=p4xLnlCjrUbV+rWAx6FC4JmFxden848NXknbuTMqi+l/hTiJLtZHG9mbaWkN2Jp7w/tknrEDk1JnSZ6+pziu/r/ik9Ypk/eWZlyWlJQ3slKeBK3NsxkP/Ga9eO1VsZVe837rlSoRidljx9l8a6BD5+phVxMHnY0Zg56Yq/KuOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500541; c=relaxed/simple;
	bh=BLOQubT6+WDGMXLbalL2gtus5F0xeE3IKPVA5IYu2Zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WcyWuuwhMHNsYSNuanwh2McKgFkrME7dFc4BL1uxuvjmTAT+2hz2/5FdgKpBsz46AOEOgPQPoaFk1gQgD0LFHwNSAUvZAwI/mPHaRnIaK7ku/5i0cJ3CLzPFS4XQBJUFDN3nye+WMps4dvb3d4a6h8H57tXk7aVZ73KudfEauPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=CxIiYDOQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="CxIiYDOQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7245453319so338754566b.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500538; x=1720105338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=CxIiYDOQ7V2PxKziJuZ64gyv5+XDJI1rxdIo8k+99KJ8uRYQdqzW2clKU9+x3AXY1x
         dYmhfOyt8N1bo0ZyJqjuvcfUkpEqwgr7X3RGZqLy+00enJ8TQNJ5pvfB/ZXHxsTjsXbK
         Lz3RkYY/LSBqAT7EfGGXkgYoUnWsUKWUwRr63QAwuwsz5L7S+gK+Y3oDELL7/6su69IX
         AHMhF9wVE6gMmiZHnWsgXC10js4CPF3tgzyzoY6sx3OJTgenGPTfgBtT6OYUni9J2D3f
         tMMhYldDvp4lXXR3rOWpwmET/tGTUOQhGCcbMcmxZJcmUuxPIMRT2U6s6tfS8F9cMobl
         4p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500538; x=1720105338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=vDk222SLr4Bn+3TXPugez2pgBpDDgA5qr8pHGt+xNeR0d2KQc4qhLlJjOqTGJIV3cJ
         6K/WhMSBLCJeOobWSzImYliJdZrDeGS48KaQN+KIbGL52xc4h1wcDqe8yOzSNSWFcjvT
         75J5kjXyEJCtGimwd3CQzb+iSCWPT8VHTonvQVaKyfAYH3KB/Zbu1vjif3eV+Ou+xoAg
         xwOWIoO+egDGUAVGpTea0kBaMaexOjmriDAj+syi0Hruzbfbuc6AQ48J7eSlxVFhrK5y
         C5hEykHOFKoqmxGzOuRx5Vx3s71JYsKAFaQ0v0rDyOuRsvJEK6WC7fAzAcm9XO8Y3qyG
         uLFw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Zda/W8m+mYkaaZiUBxcKzLqypMO9qxBUOwZTFL9gBuEe2zoyGPTYkOgtwZxTsYHThPEKL9fAqRQ/OsvbqkYQkXT5XwFq3+sq
X-Gm-Message-State: AOJu0Yykv9D7dclo9BMAe7t+Lsutw0EZuqAl729CxEwH45KUHELGOKGD
	WsiJ+ZrmAV8aFufSxITExWTYQGDtoEDL0TCa/Gyqh6Q6pIIh24eS9CHj/gNQDIo=
X-Google-Smtp-Source: AGHT+IGhzRCqP2RV73RAfCGRkGAsHtE5znhuHD+qNGBvgcJ+PHUmpdeZlb/WN59v+vhaTirBRQcRFg==
X-Received: by 2002:a17:906:dfc7:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a7296f808e2mr189909566b.21.1719500537821;
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Patch v5 03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Thu, 27 Jun 2024 17:00:21 +0200
Message-Id: <20240627150046.258795-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v5:
- Removed "N:" from the MAINTAINERS entry

Changes for v4:
- Custom dma-vc-names property with standard dmas and dma-names
- Added to MAINTAINERS

Changes for v3:
- Added '$ref: dai-common.yaml#' and '#sound-dai-cells'
- Dropped all clock-names, references
- Dropped status property from the example
- Added interrupts property
- 'make dt_binding_check' pass

Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 73 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..40a0877a8aba
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs, ASoC DAI.
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - dmas
+  - dma-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      dmas = <&dma 0 1>, <&dma 13 1>;
+      dma-names = "rx", "tx";
+      #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 79b44addc139..ceec359c68fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8918,6 +8918,15 @@ S:	Maintained
 F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 
+FREESCALE SOC LPC32XX SOUND DRIVERS
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.25.1

