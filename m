Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251ED26561E;
	Mon, 29 Dec 2025 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994824; cv=none; b=C74eV1Upx2p/nrWI7H2pHjOdTQ/Bu1V0UpzvHNEQ9toluMF2OIpMnpmwGRlR6s+qobRJnhM0RESlV4z097bmoUfO0D3ZVWEVyGAF1hqEbv6s2Bh0ztHLoxZo9m22QBk2ui2xLAy8YlQmVeRnhCB7KTiGaOrEbbc6FGVjMAk4ma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994824; c=relaxed/simple;
	bh=zpw4IqPyBVSXBkD9ivI4Et1mIWNHZJgG8WcQPGuQmxU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GIh5+SRsBSo+smnZHNMtn9QKUrKeaziZSN3ibydqmBGZwdsGCeIOpafGxWCkORi0v7hmEXNmSKYuKnDjozBC3qRnZhmlplzW05oejHy2MIw9uTF/VXxq3otA5eL30vb/l0tQD463b+fg3KXnUZCHDxFIm5ZYXCGJJ4OfdpED4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=iIgqI938; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="iIgqI938"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BT7rEeX5703566, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766994794; bh=d+kPtHSKE07tFl+NBp6BjmZEZhjrPhJuIwsPuelk4V0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=iIgqI938jI3vdlEtg6CshB9uJzRqfBD+mEBg+XssL7POgWjijDWSytSh3PT0fXHt4
	 XWTomTG50yoEpUSQhfxbang4zraWAKEc0+emftTDC/BgDAy5LhFdFxp0RQdIwpNQ1X
	 GwsjRwMry/+M9BBwSPi0cw5tsV6dvrizgdZJ17sVpaHsu+d8qRIvqaPAFoUL6MkcE4
	 LDD4+w1n6xpwk5y4NHoWgNYdd17zxnp6RzqtYFzC0JLKCAfP93+eZw+K3/5SbPskTy
	 34+lVVz5vYYCjTUS6i9x4li1xx4S2I53ca07YPXUE+EZQMOxi9qlK5m+x67vKJyKAb
	 mi7NiTXOeNf4g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BT7rEeX5703566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 15:53:14 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:14 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 29 Dec 2025 15:53:14 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH 0/9] clk: realtek: Add RTD1625 Clock Support
Date: Mon, 29 Dec 2025 15:53:04 +0800
Message-ID: <20251229075313.27254-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hello,

This patch series adds clock support for Realtek's RTD1625 platform

The series includes:

1. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
clocks, and MMC-tuned PLLs.

2. Platform drivers: two clock controller drivers for RTD1625-CRT and
RTD1625-ISO.

I welcome feedback and suggestions.

Best regards,
Yu-Chun Lin

Yu-Chun Lin (9):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  clk: realtek: Add basic reset support
  clk: realtek: Introduce a common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  53 ++
 MAINTAINERS                                   |  17 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  44 +
 drivers/clk/realtek/Makefile                  |  14 +
 drivers/clk/realtek/clk-pll-mmc.c             | 410 +++++++++
 drivers/clk/realtek/clk-pll.c                 | 191 +++++
 drivers/clk/realtek/clk-pll.h                 |  68 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  72 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  46 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 788 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 150 ++++
 drivers/clk/realtek/common.c                  |  72 ++
 drivers/clk/realtek/common.h                  |  40 +
 drivers/clk/realtek/freq_table.c              |  35 +
 drivers/clk/realtek/freq_table.h              |  23 +
 drivers/clk/realtek/reset.c                   | 138 +++
 drivers/clk/realtek/reset.h                   |  36 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 165 ++++
 22 files changed, 2472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-pll.c
 create mode 100644 drivers/clk/realtek/clk-pll.h
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
 create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
 create mode 100644 drivers/clk/realtek/common.c
 create mode 100644 drivers/clk/realtek/common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 drivers/clk/realtek/reset.c
 create mode 100644 drivers/clk/realtek/reset.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h

-- 
2.34.1

