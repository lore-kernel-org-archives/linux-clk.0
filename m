Received: from mail-sh.amlogic.com (unknown [114.94.151.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861F72639;
	Fri, 12 Dec 2025 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.94.151.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507295; cv=none; b=Wgesc1ZxGFEhapY/htC65cGu3HBTripWvOi1BDri0qXQ13Vp4GHdwARZ4evODzL8TTGNQvllEX1OIeF0JU7c0uWeEMoX8Mw1cV1xQUFSOcuzt0/7FX9fsw9SvyoIi5WFLMegUJUUBMyrLLP5P0m/4gIAJZSHJnI1PIsrMK94efI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507295; c=relaxed/simple;
	bh=5a8wdd1KH3LD/sFRsEFpvA2mIexazzJos0ZdBqNFFCg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m1EFAjbDpsiQSvnlMuB77AcQzUvN9nghGv8iy9Kh5ythWZ/gq3kyPyh5j9xqyBCFhV60EWbdIVUCJw4FM5zymLPlU6IJUQqpPB9kUc1k591dANAT63e5eS5O/6m6yugAJ/TIwrA82bK3zrAo9qcv6mlY/jACqwYWG6N2exFngbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=114.94.151.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.61; Fri, 12 Dec 2025
 10:26:21 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring
	<robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 0/5] add support for T7 family clock controller
Date: Fri, 12 Dec 2025 10:26:13 +0800
Message-ID: <20251212022619.3072132-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It introduces three clock controllers:
- SCMI clock controller: these clocks are managed by the SCP and handled through SCMI.
- PLL clock controller.
- peripheral clock controller.

Changes v7 since v6 at [6]:
- add COMMON_CLK_MESON_MPLL for T7 PLL Kconfig

Changes v6 since v5 at [5]:
- add a blank line after each PLL register region
- update GP1 PLL note
- update PLL and peripherals help message
- add parentheses around the _iflags member in MESON_COMP_GATE
- drop CLK_SET_RATE_PARENT and the 4th parent for rtc
- move sd_emmc_c after sd_emmc_b

Changes v5 since v4 at [4]:
- rename rtc and cec dualdiv clocks
- rename dsp clocks
- rename anakin clocks
- rename fdiv2_divn to 25m and fix its parent
- add flag for T7_COMP_GATE
- use T7_COMP_SEL/DIV/GATE to define glitch clocks
- add CLK_SET_RATE_NO_REPARENT for t7_eth_rmii_sel and rtc
- move module_platform_driver after clock driver

Changes v4 since v3 at [3]:
- drop amlogic_t7_pll_probe, use meson_clkc_mmio_probe instead
- add CLK_DIVIDER_MAX_AT_ZERO for pcie_pll_od clk
- add frac for hifi_dco_pll_dco
- add l_detect for mclk_pll_dco
- drop v3 5/6 patch, and use MESON_PCLK
- drop SPI_PWM_CLK_XX macro and use MESON_COMP_XX
- drop the register's prefix

Changes v3 since v2 at [2]:
- update T7 PLL YAML
- add 't7_' prefix for t7 clock name and variable in t7-pll.c and t7-peripherals.c
- correct v1 patch link
- add new macro MESON_PCLK_V2
- update the driver,header,yaml file license

Changes v2 since v1 at [1]:
- add CLK_MESON import
- add const for clkc_regmap_config in PLL driver
- fix eth_rmii_sel parent
- update T7 PLL YAML file

[1]: https://lore.kernel.org/all/20241231060047.2298871-1-jian.hu@amlogic.com
[2]: https://lore.kernel.org/all/20250108094025.2664201-1-jian.hu@amlogic.com
[3]: https://lore.kernel.org/all/20250509074825.1933254-1-jian.hu@amlogic.com
[4]: https://lore.kernel.org/all/20251030094345.2571222-1-jian.hu@amlogic.com
[5]: https://lore.kernel.org/all/20251121105934.1759745-1-jian.hu@amlogic.com
[6]: https://lore.kernel.org/all/20251204053635.1234150-1-jian.hu@amlogic.com
Jian Hu (5):
  dt-bindings: clock: add Amlogic T7 PLL clock controller
  dt-bindings: clock: add Amlogic T7 SCMI clock controller
  dt-bindings: clock: add Amlogic T7 peripherals clock controller
  clk: meson: t7: add support for the T7 SoC PLL clock
  clk: meson: t7: add t7 clock peripherals controller driver

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  116 ++
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  114 ++
 drivers/clk/meson/Kconfig                     |   28 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/t7-peripherals.c            | 1271 +++++++++++++++++
 drivers/clk/meson/t7-pll.c                    | 1074 ++++++++++++++
 .../clock/amlogic,t7-peripherals-clkc.h       |  228 +++
 .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   56 +
 include/dt-bindings/clock/amlogic,t7-scmi.h   |   47 +
 9 files changed, 2936 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

-- 
2.47.1

