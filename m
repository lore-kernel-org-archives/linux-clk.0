Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090E228DDB
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="os8cyFDN"
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D7D101
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:38 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d10f94f70bso994676866b.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058516; x=1700663316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1bYEl09IoLqZ4ey+eADiyqvL5SUtiEl1aW7JJS482k=;
        b=os8cyFDNBB2SLocU2l3XP9mO+eKkeEtTmr6pM7D4Mlrh+xVuXzA6GeMEOq2Sd4OfQ+
         KfGcvfOWkZZmSqGXlCCoawZxv6XY25yalS/O/u4y8W6wNyZuyzJLr43D7iBwvEp6SPc1
         RDz2ahDNjLv4xn66kpnLIvbs0UxzyzdGhhxYYbDf7BeEmJYg7iabiFK3TNqE/t/tWnSR
         zuKbOL390S3hL2TzHIM0BaWuajFaWLy+fymao0tdUlAZqXzULy/F2DRQFrr8Pn5F0Nft
         UWSootp/IrgOLotOHWQTIG3KzDTAowtxzaSGiZo1caymqCTEMGjoOTo4elq2yP1w2KMd
         o/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058516; x=1700663316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1bYEl09IoLqZ4ey+eADiyqvL5SUtiEl1aW7JJS482k=;
        b=ZwvTLafzAwo7hiz9TX2oPkh+ycMMijLpMDoni7AXD2YCBei81Y/RUQp+ityoJxk1ob
         OvbXLEPTMGMrLY5xvweWn+zALCHCKepMKuEn8q95fo/a+SorV5Bu7zYtp6tk2LErlwsn
         pVNsrVCmdT+SmvQ+t7g0PX6hvscJQU3EqV4+rCgC0mPAsehhH4YSYB9wX1jd77Q7WfkZ
         ocPVCiGQkW2+j6g9PTUlvJdd8B5s7L5ApbtwER+h2nXHX6/0cCsJV097iHa7H7jPz7ZZ
         hruqvVyI7hQ7+Lyq7jLFNm8qPmpw123Rcrh60PQaoTrR33CF+oUXAJ/aUEi7LkpVJ3oh
         HGpw==
X-Gm-Message-State: AOJu0YxQ7fM4LiZravyily0ufPa56tNhDaLw6/V8C5yTy7HPMU3/T6o/
	qr3d1G6DaWVig8rFGUaO7TbFRA==
X-Google-Smtp-Source: AGHT+IGr51Xp9J2M/QL2HgUJoT05UgyIsuf5IK5LOC5/gt3gQmAyfU3KI/4Vncq8iuWLEctadZ1uLg==
X-Received: by 2002:a17:906:4b47:b0:9be:e278:4d45 with SMTP id j7-20020a1709064b4700b009bee2784d45mr9348004ejv.15.1700058516380;
        Wed, 15 Nov 2023 06:28:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:35 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/9] irqchip/renesas-rzg2l: add support for RZ/G3S SoC
Date: Wed, 15 Nov 2023 16:27:40 +0200
Message-Id: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds support for IA55 available on RZ/G3S SoC.
Patches are split as follows:
- 1/9 updates documentation
- 2/9 adds IA55 clock
- 3-5/9 minor cleanups to align with the suggestions at [1] and
  coding style recommendations
- 6/9 implement restriction described in HW manual for ISCR register
- 7/9 add a macro to retrieve TITSR base address based on it's index
- 8/9 add suspend to RAM support
- 9/9 adds IA55 device tree node

Thank you,
Claudiu Beznea

[1] https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Changes in v2:
- collected Conor's tag
- updated commit description according to code review comments
- added patches 4, 5 according to review recommendations
- updated patch 7/9 to retrieve only TITSR base address; dropped the rest
  of the changes for the moment
- in patch 8/9 use local variable in suspend/resume functions for controller's
  base address, indent initialized structures members to tabs, updated
  private driver data structure name
- patch 3/7 from v1 was replaced by patch 7/9 in v2
- patch 5/7 from v1 was renamed "Add support for suspend to RAM"
- cleanup patches were kept at the beginning of the series and features at the end

Claudiu Beznea (9):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3S
  clk: renesas: r9a08g045: Add IA55 pclk and its reset
  irqchip/renesas-rzg2l: Use tabs instead of spaces
  irqchip/renesas-rzg2l: Align struct member names to tabs
  irqchip/renesas-rzg2l: Document structure members
  irqchip/renesas-rzg2l: Implement restriction when writing ISCR
    register
  irqchip/renesas-rzg2l: Add macro to retrieve TITSR register offset
    based on register index
  irqchip/renesas-rzg2l: Add support for suspend to RAM
  arm64: dts: renesas: r9108g045: Add IA55 interrupt controller node

 .../renesas,rzg2l-irqc.yaml                   |   5 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  68 +++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 110 +++++++++++++-----
 4 files changed, 156 insertions(+), 30 deletions(-)

-- 
2.39.2

