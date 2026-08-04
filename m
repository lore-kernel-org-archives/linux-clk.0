Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC68B47989A;
	Tue,  4 Aug 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861559; cv=none; b=GcLpWDGAVJrpMjy2xnXmZuz8NmSdwtM6QMcD5nO2jBqWh/5pR1fTNsSS6ArYGlzc2H2HT2cXI3tHegk5utuVyY+glTMhQ6ieD1QEiiKRTBG/vUyhWxjoeVlywgWLR3NKwKIO0h/5ldlEqX9tXH4OigDhu9vTdSGtRMbda61G2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861559; c=relaxed/simple;
	bh=G/0Sltf7hWFm4zsyWu9XcHcSRhwNy1w91T5q0PhUuYo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XxR4KT/If83tALLAoebB+Y0QPnkRIvH8oTH6Z5VSzfqv3aYDv2YdnYJhZFYebGFSBc7DiuEJXHbNVKGpwfbXjUUuZUf4PPU+LDQqy8DvJY5PNPNV+ks8qHFoUniiqWhkEpmexxPfyhAfJ4BefWD9fL9+mKkQrXn/28ROXRAafgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZSLNK7Z/; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZSLNK7Z/"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 674Gc8C811231931, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785861488; bh=U0Uqu5gGjAYqxgCuwWNz2b4T34uyekdTQEu5bpVKqgQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ZSLNK7Z/3Lmh8+F7hw2X7FQZDdp2oVvaDuGScN7YeesUqEa0wsgkgJIabtUs5t0BT
	 1KD1NmDSqyP+rbYHN/IiQnIDbZnBqfNF6YMAwOlhCSvmq400nc69BO98nAyau0C0+C
	 9F/oOUMuhszTg5g/ubebLAaDRWva2Ih78c70tUekL4s23f4wm3DX5C2nsnvKLc4gwz
	 Y/tzPXUKOSL4s5VG2EH7lznMli8VSt3eoFGLZ/TnTY3eHwa1nm7PhBHCuWODnrCz9h
	 jaN8ogYk0UGEuGpioP18Qd24PPmnaZ4XszGDIJZVLJTTYWXqxDmO1fnEfpYe4QnG1U
	 Px31O+upK+hrw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 674Gc8C811231931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 00:38:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:08 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Aug 2026 00:38:08 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v12 00/11] clk / reset: realtek: Add RTD1625 clock and reset support
Date: Wed, 5 Aug 2026 00:37:56 +0800
Message-ID: <20260804163807.1285869-1-eleanor.lin@realtek.com>
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

This patch series adds the clock and reset controller support for Realtek's
RTD1625 SoC platform.

Because the reset controllers share the same register space with the
clock controllers on this platform, we utilize the Auxiliary Bus framework
to decouple them. The clock controllers act as the primary devices,
registering the reset controllers as auxiliary devices.

To make it easier for maintainers to review, the series has been organized
by subsystem:

1. Device Tree Bindings:
   - Add bindings for the Realtek RTD1625 Clock & Reset Controllers.

2. Reset Subsystem:
   - Introduce the basic Realtek reset infrastructure.
   - Add the RTD1625 platform reset drivers.

3. Clock Subsystem Infrastructure:
   - Introduce a common probe, and add support for basic clocks including
     PLLs, gate clocks, mux clocks, and MMC-tuned PLLs.

4. Clock Platform Drivers:
   - Add the clock controller drivers for RTD1625-CRT and RTD1625-ISO.
   - These drivers provide the clock sources and instantiate the
     corresponding auxiliary reset devices.

Best regards,
Yu-Chun Lin
---
Changes in v12:
General changes for clock:
- Rename symbol namespace from REALTEK_CLK to CLK_REALTEK.

Patch 1:
- Drop mailing lists from MAINTAINERS.

Patch 4:
- Add rtk_clk_remove().
- Add Reviewed-by tag from Brian.

Patch 5:
- Add Reviewed-by tag from Brian.
- Sort Makefile object files alphabetically.

Patch 6:
- Add Reviewed-by tag from Brian.
- Change 'gate_ofs' type to 'unsigned int'.

Patch 7:
- Add Reviewed-by tag from Brian.
- Change 'num_parents' and 'mux_ofs' type to 'unsigned int'.

Patch 8:
- Sort local variables in reverse christmas tree order.
- Make rtk_clk_regmap_pll_mmc_determine_rate() return the fixed rate.
- Add '#include <linux/delay.h>'.

Patch 9 & 10
- Replace of_device_get_match_data() with device_get_match_data().
- Use module_platform_driver().
- Add spaces near {}.
- Remove .suppress_bind_attrs and add .remove callback.

v11: https://lore.kernel.org/lkml/20260728142806.1954638-1-eleanor.lin@realtek.com/
v10: https://lore.kernel.org/lkml/20260713155630.3054636-1-eleanor.lin@realtek.com/
v9: https://lore.kernel.org/lkml/20260624112940.3475605-1-eleanor.lin@realtek.com/
v8: https://lore.kernel.org/lkml/20260610080824.255063-1-eleanor.lin@realtek.com/
v7: https://lore.kernel.org/lkml/20260508111641.3192177-1-eleanor.lin@realtek.com/
v6: https://lore.kernel.org/lkml/20260402073957.2742459-1-eleanor.lin@realtek.com/
v5: https://lore.kernel.org/lkml/20260324025332.3416977-1-eleanor.lin@realtek.com/
v4: https://lore.kernel.org/lkml/20260313081100.596224-1-eleanor.lin@realtek.com/
v3: https://lore.kernel.org/lkml/20260122110857.12995-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260113112333.821-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20251229075313.27254-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (9):
  reset: Add Realtek basic reset support
  reset: realtek: Add RTD1625 reset controller driver
  clk: realtek: Introduce common probe() and remove()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

Yu-Chun Lin (2):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  58 ++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  48 ++
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-pll-mmc.c             | 431 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 217 +++++
 drivers/clk/realtek/clk-pll.h                 |  60 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 798 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 142 ++++
 drivers/clk/realtek/clk-rtk-common.c          |  83 ++
 drivers/clk/realtek/clk-rtk-common.h          |  38 +
 drivers/clk/realtek/freq_table.c              |  57 ++
 drivers/clk/realtek/freq_table.h              |  22 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |  19 +
 drivers/reset/realtek/Makefile                |   3 +
 drivers/reset/realtek/reset-rtd1625.c         | 263 ++++++
 drivers/reset/realtek/reset-rtk-common.c      |  73 ++
 drivers/reset/realtek/reset-rtk-common.h      |  29 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 165 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 29 files changed, 2955 insertions(+)
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
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/reset-rtd1625.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.43.0

