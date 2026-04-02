Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819333D4FA;
	Thu,  2 Apr 2026 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115778; cv=none; b=mKDx5V8BTGncjZL4YTgtmeFuyJMpYf4FwlEV7KNSarfXUfVjTsQEJHiT6kGNimbpt31F2MutEz1lcLG6MJ9/VfGUmsqEtFz0PfCl/5f+i5s5yQjSVJEWKkMuDv9/Z5P2cOY4qghwKQ6rZOj6ergcJf6ZcZvPDnFvvxkgG8ABlr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115778; c=relaxed/simple;
	bh=/RPXpEfc4Hdu8jzi5AQOiwsbSosTPzJxDivZ1y0K7yA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LNgT7oYUNuven+bG8QNZO1ytQRk1SSSPg6SeeLuIytCDPFTqc4ZTkY5+ybLwQHLZooraAXSd4dhsI6rAcTWtsQwQ0zM/T2vPYAHXq6xc7fXiNUbN40ATPiECYyYFL6gAGyHfTqNYOewAngWX3xz/r+2/cZNqTBqrj0wKtjAZWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=T2pgDWdg; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="T2pgDWdg"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6327dwl072694950, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775115598; bh=0K592jWE0NdZ3ZzozAFNSSmOxJ7uZz4M0cOg0o0oYTo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=T2pgDWdgy+2/DkemmqXcIe5iBtymiI8H6G88yxgVzuCnlZFk6lWznX2an1uMC7XvU
	 VRB2NPi00WQRMMfPyjkt4MG3Py49q5sLFtvtblFNZhGB0cwb+WAQ9HL4DgVgGmOUOs
	 uw9bVZz+IUQgJruL/drqfgTMAZo8ScReIWa2VADe1jbVMlGzVpqDqdq+TDzzkeG2G/
	 dZMhMtkS39DJmpNquDFXPCANbmwyu2uzI77XSGyQqFAZUdIrfJ0ANWF2Nld6u01A8G
	 52hTVCbOfsPNJ17Qh4hmz7uhAWT9N/pC+EexaIYR9SgzVlcD56QgmFcei8namW8ETn
	 2c1KhpN0I8NbQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6327dwl072694950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 15:39:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:39:57 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Apr 2026 15:39:57 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v6 00/10] clk: realtek: Add RTD1625 clock support
Date: Thu, 2 Apr 2026 15:39:47 +0800
Message-ID: <20260402073957.2742459-1-eleanor.lin@realtek.com>
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

This patch series adds clock support for Realtek's RTD1625 platform.
The series includes:
1. Device Tree: Add clock controller nodes.
2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
clocks, and MMC-tuned PLLs.
3. Platform drivers: two clock controller drivers for RTD1625-CRT and
RTD1625-ISO.

Best regards,
Yu-Chun Lin
---
Changes in v6:
General:
- Add the headers used in c file to follow the "Include What You Use" principle.
- Move dts patch to patch 10.

Patch 1:
- Add 'clocks' property.
- Add reviewed-by tag from Krzysztof.
- Add Cheng-Yu Lee as maintainer in the binding file.
- Add 'clocks' property.
- Add include/dt-bindings/reset/realtek,rtd1625.h to the MAINTAINERS file.

Patch 2:
- Remove the global header include/linux/reset/realtek.h and use a local common.h
instead.
- Extract regmap and of_node directly from the parent device.
- Remove struct rtk_reset_initdata. Now, when the caller uses
rtk_reset_controller_add(), directly passes struct rtk_reset_data.

Patch 3:
- Replace direct reset controller initialization with auxiliary device creation.
- Add aux_name parameter to rtk_clk_probe() to register the reset auxiliary device.
- Simplify rtk_clk_desc because reset data is handled entirely by the auxiliary reset driver.
- In Kconfig, change "depends on RESET_CONTROLLER" to "select RESET_CONTROLLER"
- Remove unused includes headers and added <linux/auxiliary_bus.h>.

Patch 6 and 7:
- Move to_clk_pll() from clk-pll.h to clk-pll.c to limit its scope.

Patch 7:
- Change offset type from int to unsigned int.

Patch 8 and 9:
- Move struct rtk_reset_desc arrays from the clock driver to the dedicated reset driver.
- Implement and register a dedicated reset auxiliary driver.

Patch 10:
- Add 'clocks' property.

Cheng-Yu Lee (6):
  reset: Add Realtek basic reset support
  clk: realtek: Introduce a common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks

Yu-Chun Lin (4):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  58 ++
 MAINTAINERS                                   |  20 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  44 +
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 410 +++++++++
 drivers/clk/realtek/clk-pll.c                 | 164 ++++
 drivers/clk/realtek/clk-pll.h                 |  55 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  69 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  48 ++
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 779 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 144 ++++
 drivers/clk/realtek/common.c                  |  67 ++
 drivers/clk/realtek/common.h                  |  37 +
 drivers/clk/realtek/freq_table.c              |  36 +
 drivers/clk/realtek/freq_table.h              |  21 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |   5 +
 drivers/reset/realtek/Makefile                |   2 +
 drivers/reset/realtek/common.c                |  85 ++
 drivers/reset/realtek/common.h                |  29 +
 drivers/reset/realtek/reset-rtd1625-crt.c     | 186 +++++
 drivers/reset/realtek/reset-rtd1625-iso.c     |  96 +++
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 30 files changed, 2848 insertions(+)
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
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/common.c
 create mode 100644 drivers/reset/realtek/common.h
 create mode 100644 drivers/reset/realtek/reset-rtd1625-crt.c
 create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.34.1

