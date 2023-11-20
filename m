Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="T95/bxIE"
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6409310C0
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:31 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso55651411fa.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479109; x=1701083909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta0MJxvruSCk3gKB4JBR+iRqy/ulUdX87ERHRuURIrE=;
        b=T95/bxIEIYzwcKn9k5Xvx0XOEAZuAQl8l2iGsdoYPxHtn82HWEuWq4PqmNO2eGJVLz
         peRHInLFxOjYY3lgpDoUGkTOLDR0zMB5bX02DzonwATt4T1GHqaiU4zR5ESQcqTTnhmB
         844P0lLznVbS6Fu7pWH6DiUgbYH7I8L+E8tOTZShEU3eKwhD/NxmB4EGeapHywHh69cg
         X5cLq+PdG3Lg8vZHnnKe+iKL3JwXHzz4mcs1dJOd+IzodJRFWtiRQgfmmiV6GAVzjjXz
         EAxNIiHPmHvneVZso5w0sO7IT3v9njTXhiroLJpu0QQTwzFe330kTLomETzLub72olqD
         etuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479109; x=1701083909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ta0MJxvruSCk3gKB4JBR+iRqy/ulUdX87ERHRuURIrE=;
        b=d3Pt6LSjs5PqRUp7dVc1GyXkJhN6a/eZhKz38QokQMDPeKQJBpFtMhgYkOVMKgSmDT
         80glcYMSRn53tLbMPjZ0ZJEoiJVbyJoBhalPjpKdFLhl1s+Zac94F77kiZxa+2NTq4ga
         7xxo59BfrxD1YHzLRNR3sn3kxx+D5Z17g8iAefTUxPHzTePwM3KsIn+39MqUNpwUZeBS
         AgBpSHG693ASoMhcItAodDylCLcbbeMmmM63ItJK54+FA2b9YmM9H6cuOfmcQ6zhRKKm
         4o7B07qbTVwUaAgAkPLX6svRvZur1HVpgjnc/1MOlGC1cSKSeiBbNivWQTRZNLW4fljG
         81Wg==
X-Gm-Message-State: AOJu0Yw0oBIIKwPxKyiuHGo2PWwGopuq89+FLM+d9uDnM7K9g7FofPgq
	sJl3adJLqHICijp2fctc+Q+PtXw+4tXRfftq3Gk=
X-Google-Smtp-Source: AGHT+IF5FLrdx0L0Gk97U8GMzPHq7HmzPfjAM7JslJn77Qof3Ur5QXy4PuCQ6cM1ZuCnRpy7lp15pA==
X-Received: by 2002:a2e:9bd7:0:b0:2c8:84ff:4a25 with SMTP id w23-20020a2e9bd7000000b002c884ff4a25mr1146973ljj.5.1700479109421;
        Mon, 20 Nov 2023 03:18:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:29 -0800 (PST)
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
Subject: [PATCH v3 0/9] irqchip/renesas-rzg2l: add support for RZ/G3S SoC
Date: Mon, 20 Nov 2023 13:18:11 +0200
Message-Id: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
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
- 1/9 adds IA55 clock
- 2-4/9 minor cleanups to align with the suggestions at [1] and
  coding style recommendations
- 5/9 implement restriction described in HW manual for ISCR register
- 6/9 add a macro to retrieve TITSR base address based on it's index
- 7/9 add suspend to RAM support
- 8/9 updates documentation
- 9/9 adds IA55 device tree node

Thank you,
Claudiu Beznea

[1] https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Changes in v3:
- kept driver private data object as pointer
- moved patch 1/9 from v2 (dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3S)
  after IRQ controller driver feature patches

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
  clk: renesas: r9a08g045: Add IA55 pclk and its reset
  irqchip/renesas-rzg2l: Use tabs instead of spaces
  irqchip/renesas-rzg2l: Align struct member names to tabs
  irqchip/renesas-rzg2l: Document structure members
  irqchip/renesas-rzg2l: Implement restriction when writing ISCR
    register
  irqchip/renesas-rzg2l: Add macro to retrieve TITSR register offset
    based on register's index
  irqchip/renesas-rzg2l: Add support for suspend to RAM
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3S
  arm64: dts: renesas: r9108g045: Add IA55 interrupt controller node

 .../renesas,rzg2l-irqc.yaml                   |   5 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  68 +++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 110 +++++++++++++-----
 4 files changed, 158 insertions(+), 28 deletions(-)

-- 
2.39.2

