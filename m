Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F380198827
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500521; cv=none; b=HNlGrGtIl0UCO6Ynh174Ey2lWv25fyFZ0oPj8xSHCfD4AmpWt3GvzYghofLQjmX09uYV3YSxiQyTf/rHGYUVvhC3IAxrkB7nZsSMrYLks2cKJS7QNDN/8PYqzmNHFMKG7fNe+kja9NxwfgICDdfwiz06cXlseIp+7DSIDOUmyOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500521; c=relaxed/simple;
	bh=pLhrZ5IemSdTOWROkP7c38cEvRC3LBemwPPuEetKG/I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYYjJZRt3+C6mhw2EjHsv7WN70Fvvzg/5SWVkbqKwufnXYIRp/qKeqc1qf5Tj+Laoawx6LAbo7zmL+iNy6UHMNjhHU4OYyhIXbFpjzzg/4vNFqvb9taDJxrGVp2OdDIHffIkI8pmEc6ucgHzwLqleSt7JAN21nH4+fGc16lt2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=aD7T0S4R; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="aD7T0S4R"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a70c0349b64so579041266b.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500517; x=1720105317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=aD7T0S4RKsuGMUeIi3Xl8hLZqltj+vuI5x2n8aREzwPiKJt0qOmC26IkC25p0nXiiq
         jrAuMntwRIp4cOBEJQWCW2mHB0NY7eO6Nis+MjPnnDkh795YbbIiZI6lBoRlHPVuReZp
         m1kIa3zikwlSqkrJItYLKf5gW9xWJb2nBKY8z8uz0kWujm5i+LfuW3wi8f/TW4dY8I5s
         uzRN7ta3kWoxBI0ahiVW0/2e/shJo1yKzKhG1mshYUnk5wixIA0Hz6zZr+u2Wx7hcokq
         qyUJfOdi64dm9upmT5n4Soo98qbw2MHLfjG1wRSGqbpccyaL5WBlVhKJ7OrgZB3lBE7y
         WlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500517; x=1720105317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=UaZyTVB3tO1X2V7JmsGVDOVrvZybC6kU79Ya1Yy/pQHMYj0gq5FSoOvseKM46pvz6Q
         HiqeaShdBYofNO5M1V5Gx0/BotAmWirLKDcijA8WbDe1e1lIymK5gbQFQhXi+ocWJYpX
         JsgSajqnb0d1WZOD10xRnHPLkrtyBin6IBxni9CpM7Zdw1B6Y2eUix7B9V+FNNIrphN3
         lxi+dcggydghnYjkYDNqMDm+JBQsxEQ0RpqR3Fay0+760iWdHEsS3vtNMM8xrzI6ukzv
         RkLAeM6+IZ68HjAB1iudpzzAKNg8SxR08HxxOHqKfPuCztqxbou7vQmmyxWanKgzsBks
         21iw==
X-Forwarded-Encrypted: i=1; AJvYcCXy22Lo3zZoaXPHHv6F/YX3xK7Pb6vSNWG2HldbsjjWingW3AZ+CGdXInBig56kRFenCYL8BMV12xAiMIJyi2x+hhannE1R6yrF
X-Gm-Message-State: AOJu0YzvoJ22KVyaYYd/UikVo/8OhKOgXZfuaRNb+S6hsG21PZuBAth2
	jjtMMnABETBnqkywUfr/vA4KF3ANqHHur52liSZROXye+xcnbLF91MBkLZ616oc=
X-Google-Smtp-Source: AGHT+IEWo8x1/iXINSSRXRjfHX6NuiOJZ+9H3uzsJ+4Q86IVM9o4hb3qxcQgbAHUbFD+wWnFiMHwIQ==
X-Received: by 2002:a17:906:4a12:b0:a6f:d085:9e32 with SMTP id a640c23a62f3a-a716593e3efmr933093866b.76.1719500516992;
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
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
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 27 Jun 2024 17:00:20 +0200
Message-Id: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
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

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Corrected property order
- Added maxItems to properties
- Fixed example
- Removed "N:: from the MAINTAINERS entry
- Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers

Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..32f208744154
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  reg:
+    maxItems: 1
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+    maxItems: 1
+
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@7c {
+      compatible = "nxp,lpc3220-dmamux";
+      reg = <0x7c 0x8>;
+      dma-masters = <&dma>;
+      #dma-cells = <3>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..79b44addc139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2384,6 +2384,7 @@ N:	lpc18xx
 
 ARM/LPC32XX SOC SUPPORT
 M:	Vladimir Zapolskiy <vz@mleia.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
@@ -2396,6 +2397,14 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1

