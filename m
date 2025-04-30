Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211425A632
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009169; cv=none; b=Qp9NKJ88UKYWkfxJ8/OArLHKCjCI18A4wK7p7Cs8WQxOAeuB8EuFBLZxS8ftRinnMw1IsmlzmlJjKQBrb7PPQA9pFrefvkn4TvJF2PBd7T/zPEGAQG8xAJdP2qhLoFmapIhxriawl2rwtY+Mslw4Gw1y+/cbsq6Sa6hXmEHIvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009169; c=relaxed/simple;
	bh=pEarZqORgR6a5PORX2Pgk2INz0nSmqJSTyovSEM/l9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwCHoQfaCpaxTlGdMN+amwt1ueGqI9XMA/046ocrJe18G1qoo27vpDsygiks8MZdr9ZZyvkhl/QTK8q5B48lQCphSAHA4fN+iF7zqnpMaSbn/C5G7kN0ykJ82VLN7mjBVrRroHXePGpiv2Z0PSzDgep4CnKFPylUCC+nELXpiyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m/3GAx2u; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m/3GAx2u"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acae7e7587dso1040750666b.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009164; x=1746613964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6J/wP60qX9EMmv9DuzGd9/gCNPLEX86V7P6R5wq8+M=;
        b=m/3GAx2unha3c06MNiFW7gShs/pwceVkz2S2vcZWGW9G8FYwdE3CAqaflCazb/npWZ
         cpn317JLUeF3h4Wb1+FeHsraVMZ//+9TlMAs/VaNSM5lI6u0SIP+beXk6Q0QnRX5Sbq2
         7pNmq8bzBXNCinj5628V+wXLsj3R7F130CeX6mgPoXC5s2H51RAXOwVo6YmDV/YZFx9C
         hs5AtJhwYYp2MNblJ4moyBf49aEuukFDRL8BrlZaNP3LJcXjxDj3+EGF7xSswpvwJ7RV
         HcB5kd8+EgAVK3U8z7ND/XamtEcFxk1ylRF8V+v12pQgz2Z/+iVuyJZJMvm6qKgqiQk6
         we5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009164; x=1746613964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6J/wP60qX9EMmv9DuzGd9/gCNPLEX86V7P6R5wq8+M=;
        b=a2XOsi9vJEx5RaJDbRv1oaKCwPwDOya5IVc7XIc1sZAbJ9Adre7rdGale5N7viONVv
         xJ0+UMT05iRfW13O08K1aGrNpvHDzKyIUTGNL4xUrqh8QeSwmNeWphe5I/QTe8miUXxm
         k4v/twnwmuwOMCZJrUNDrAhykAm45JPbwLqbbtX7PlLu8ItZSoBe8nuRe1+hDCiBgZEq
         vsZK8KTI98i276xm+XsfYNLF/VxKCW9DgBJd25qaoitHorlNaL5OY3AWzlZ+kNTkHAmZ
         pz1AtLOyn1ewJoP80vzimMuKOh5OvobwMC6iW81RSt3x5ZVH4VltOa5CtbZYlfPGYiiC
         jMXA==
X-Forwarded-Encrypted: i=1; AJvYcCVAOQhhS+MutaLogJiD/mFW1S78EFOpMtU/KiadyrQtKSHo3oJej+wV6+VbDKjCKdhmleUcluOqs8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxchxPlGYvfa5iR/l74rc45oV+esKCNOSZtfDTApTcSCQozkuul
	HOaxweNwqNqBWx0rY0XDi4xlH0NnYW9vJG7Np6He6Z9tzTHYXSSwvzYEHnhNUJc=
X-Gm-Gg: ASbGncs9PzqElF2mxbp7R1l2eLFvZdjTem9/niBHrZQQV4PkfiVwXdgEZrAciKqCAhH
	HYSfHnSCInZhe4l4bsTRr0gK5xLRtaeXaQlp1lmTfMcQf+YapmaZdg1lcq6fGbtXS2Ci6kxutmk
	bmhpcie5u0nQIoMpjnZZXE0ZG35YSYBKngivcNR8wiz+/D3d6pAlmWQjMyR6lBcpkLD8Jh5Cyu9
	7ssDHXKKTafrX18LinDKtbGQ+Zv1nUwhk+hK5Yk3fGfpcbU3rKfBH5+FwBF4nzxcCzMHsqxNiB5
	5WEat2Ui9nSqhy52Je7ttYF1rwC6Mh0YrFcoEmV2qwvPN5QXCRuiOC/YgOz2mSzec1jwcDQ=
X-Google-Smtp-Source: AGHT+IEOvbi2uWkiYWLZUKj6dkW3LeitEy0mXflUVZbtvIN6vYaH2BYKpM0Qfawxgrnw/YhMKetmjg==
X-Received: by 2002:a17:906:dc8c:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-acedc575056mr227019766b.8.1746009164440;
        Wed, 30 Apr 2025 03:32:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:32:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Wed, 30 Apr 2025 13:32:28 +0300
Message-ID: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds a PCIe driver for the Renesas RZ/G3S SoC.
It is split as follows:
- patch 1/8:		updates the max register offset for RZ/G3S SYSC;
			this is necessary as the PCIe need to setup the
			SYSC for proper functioning
- patch 2/8:		adds clock, reset and power domain support for
			the PCIe IP
- patch 3/8:		exports of_irq_count() symbol; this is used by the
			proposed driver to get the number of INTx interrupts
- patches 4-5/8:	add PCIe support for the RZ/G3S SoC
- patches 6-8/8:	add device tree support

Please provide your feedback.

Merge strategy, if any:
- patches 1-2,6-8/8 can go through the Renesas tree
- patches 4-5/8 can go through the PCI tree; these depends on patch 3/8,
  proper sync will be needed b/w PCI tree and Rob's tree

Thank you,
Claudiu Beznea

Claudiu Beznea (8):
  soc: renesas: r9a08g045-sysc: Add max reg offset
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the PCIe
  of/irq: Export of_irq_count()
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the
    PCIe IP on Renesas RZ/G3S
  PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045s33: Add PCIe node
  arm64: dts: renesas: rzg3s-smarc: Enable PCIe
  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

 .../pci/renesas,r9a08g045s33-pcie.yaml        |  242 +++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi |   70 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   11 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   19 +
 drivers/of/irq.c                              |    1 +
 drivers/pci/controller/Kconfig                |    7 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-rzg3s-host.c      | 1561 +++++++++++++++++
 drivers/soc/renesas/r9a08g045-sysc.c          |    1 +
 11 files changed, 1922 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

-- 
2.43.0

