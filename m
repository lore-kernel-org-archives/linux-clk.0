Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3939A808;
	Wed, 10 Jun 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078962; cv=none; b=RvzTXpEkm+n+2ckc2EFi9lSVS5uU03ayIocYm1MUbO7ii/k8GspTv3ty4RCDbW1Bssa9KasSdIfJgXOJTUmc5SSFKDomH2Y+/4QuAGXY8JzZG+2fKi0bHt1AuboRLithj6PlI5Bo25+KyIlykR7A5Nstp/uZT8LaQkjFbMyG3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078962; c=relaxed/simple;
	bh=RzyLWs5ekSeBphWZaxHpTCwIBtO03DKLV3ThV3gdwTc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JfSzD4jj0qXY8stsKUAmJfJ/OEcB8bPZ7YyS+McwbL64u6vUOjQdA4jhsgLuqXSWVv2Rpkk1sKCX9kMmMgYS5FVKSa5WpCs6+y6Bt3eXcKNT6IJ4qlKzeJu+/pAEaQEqBfTNQ93V5mMxmPaia7LEIUBEcEMEUS3a40HRN/cVGsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=m+NfrXTx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="m+NfrXTx"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65A88PvjC983531, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781078905; bh=IQnFaF4NRs1UaZKis68uVWMcUMSsrG8UNXI9EoY6F7c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=m+NfrXTxadkmql6sZS3TWLnlF9HZCwHab36SR1jXca9ybUkn5XC9MRmQnWIk8FolU
	 A1FkoMoQ/whXh9W74b8bQUsvnl7M+rgMXJ6YEU6SvmLK5+NFw64HbEAfQbotouNSpa
	 3FmqTpIpO1m7Ey6c/hwMHwfZINalYGkVvJLhTl4WoZoWPOh1Sb05fpIf5/S9o3pd3X
	 +EEVaQOF+kBAlZd7CjSa7y45oZqcEDoPQyOsfRYPAay/hUZTUW5g9bm+T/AuiMrPyU
	 TceEZlNVg2VTd+yHFUqKbsVRUehC7gZe0IwRsta1XDXQG0TDD1zVmwDkLoMUwnhlJl
	 cPNcujvpLSdMA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65A88PvjC983531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jun 2026 16:08:25 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Jun 2026 16:08:25 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Jun 2026 16:08:25 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <bmasney@redhat.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v8 00/10] clk: realtek: Add RTD1625 clock support
Date: Wed, 10 Jun 2026 16:08:14 +0800
Message-ID: <20260610080824.255063-1-eleanor.lin@realtek.com>
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
Changes in v8:

Patch 3:
- Add depends on RESET_CONTROLLER and select MFD_SYSCON for config
RTK_CLK_COMMON
- Fix error handling for devm_auxiliary_device_create()

Patch 4:
- Reduce the timeout value in regmap_read_poll_timeout_atomic() from 2000ms to
500ms to avoid prolonged busy-waiting and prevent triggering the NMI Watchdog
- Remove 'freq_ready_valid' and add comments to clarify that register offset 0
is never a valid address on Realtek SoCs, meaning it is not configured
- Add the missing spin_unlock_irqrestore() when regmap_read() fails

Patch 6:
- In clk_regmap_mux_get_parent(), return 0xff instead of 0 to properly indicate
an error
- In clk_regmap_mux_set_parent(), cast index to u32 to avoid signed integer
- overflow

Patch 7:
- Fix the mask shift in set_phrt0()
- For better safety and readability, modify pointer comparison for phase_id
- In clk_pll_mmc_recalc_rate(), return 0 instead of an error code upon failure

Patch 8 & 9:
- Remove the trailing NULL element ([RTD1625_XX_CLK_MAX] = NULL) from the
clk_hw_onecell_data arrays
- Add MODULE_DEVICE_TABLE(of, ...) for the tristate config
- Add  '.suppress_bind_attrs = true', to avoid handling pointer problem, cause
clock should not allow to manually disable by users
- Fix a typo

Patch 10:
- Sort device nodes by unit address

v7: https://lore.kernel.org/lkml/20260508111641.3192177-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (8):
  reset: Add Realtek basic reset support
  clk: realtek: Introduce a common probe()
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
 MAINTAINERS                                   |  20 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  48 ++
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 459 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 209 +++++
 drivers/clk/realtek/clk-pll.h                 |  60 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 792 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 151 ++++
 drivers/clk/realtek/common.c                  |  66 ++
 drivers/clk/realtek/common.h                  |  37 +
 drivers/clk/realtek/freq_table.c              |  38 +
 drivers/clk/realtek/freq_table.h              |  16 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |  19 +
 drivers/reset/realtek/Makefile                |   3 +
 drivers/reset/realtek/common.c                |  90 ++
 drivers/reset/realtek/common.h                |  29 +
 drivers/reset/realtek/reset-rtd1625-crt.c     | 187 +++++
 drivers/reset/realtek/reset-rtd1625-iso.c     |  99 +++
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 30 files changed, 2985 insertions(+)
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
2.43.0

