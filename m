Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461196;
	b=GpLgwTb6Vos22UW5MUqqiIwAUTeG4UXS9Js7SAamM5DX6cx1rJvXFt+dqPxY6bHhLad8
	 uqP2lxTo3hU2LJhhOHhuHnnmE2APM2T1Har7Wg5wTSA94X5AWgcEUongZWSIld/1PUOtV
	 qBQd8CD9xzFj6n21SkH0ejWctTn4Y4IqPuqXsEvH+aHW4Jc6MaPBmLmhmfMsDREJ+vXb3
	 Y7FS4+rMkBVhb5hGyj2SAvmwD5PXISnnrkINZVl17eQ+4EZVCqWErXrpbH5OGMhAnXIlC
	 nNcpttRsJhSuxVVCHcJC+7iTZFYRvuzgmE0xgMmVQW3hE3LZcgcNp8hs+Xs8Rvt3t6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461196;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=5Bj236QKlbOmZUne8+61KK72I2ecq4E/arsotSfNs+I=;
	b=pzsEKavLWDqMfAXnOMZ8czZ52u4arGhTGWtWxno7KzPHf9RU85wp0AGoeVL5z0c115Za
	 TPIYB6ZI0WnPVaCmKCD7ybc1KNtB/S5AJa8lrDheXFRwAAqZGcYsmYcAP9CzbX53ZK2Nh
	 UxBn1hjB12CZYzY3XZJzDTwvs24m3W+Rk+lt0prfoHL9us8GzUAR9Usks3knP2gJTbapM
	 6VKxFqIoTSPEW7c8PNKc4/DOqevA3HPr1C/kd+f4N56MYMiFY0WXrAg3gVmoKzwRilk3b
	 HhkfWgm74bHls+nmyEXsp9+bg9cr8uADeSP/0n8xm5JZ+bXkcK6u2aH6Fwg9iSX+3Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EgCk1Kws;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4A606A887;
	Thu, 12 Nov 2026 05:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB4A606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EgCk1Kws
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PjSO23459325, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461145; bh=5Bj236QKlbOmZUne8+61KK72I2ecq4E/arsotSfNs+I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=EgCk1KwsTO4MUsW0rNwSIqUbyIbUO/q6hDKcPSNxfHnIirHhF133fIHDjf0rvJhHw
	 rkt+kS+DZaYRggQ4QwDwk+iXnENjaAlCkYupd+cydDg4pVW2UDR1nlHRz+td49oH0N
	 hDvZRVpDlYeFndLnS+RuzgCYahbWVzDcuwIFufvGSoVibhg8fOkoMGlyrjWmsYArq0
	 baPKeK+TfHRxkJKZJbsxunyntMExpntjY/5bhWsMXEQgVrpfWYctL1cAOlYTp95QdY
	 VlbrhezLqgEf1DkzcdrixeqktK1hdTPf5mtYnVIfbXJ2IuEK9TpiJ7Wx2E0ERGH12h
	 FLjGFT+0j0pGw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PjSO23459325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:44 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:44 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 0/9] clk: realtek: Add RTD1625 clock support
Date: Thu, 12 Nov 2026 13:25:35 +0800
Message-ID: <20261112052544.555563-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hello,

This patch series adds the clock controller support for Realtek's
RTD1625 SoC platform.

Because the reset controllers share the same register space with the
clock controllers on this platform, we utilize the Auxiliary Bus framework
to decouple them. The clock controllers act as the primary devices,
registering the reset controllers as auxiliary devices.

The series includes:
1. Device Tree Bindings:
   - Add bindings for the Realtek RTD1625 Clock & Reset Controllers.

2. Clock Subsystem Infrastructure:
   - Introduce a common probe, and add support for basic clocks including
     PLLs, gate clocks, mux clocks, and MMC-tuned PLLs.

3. Clock Platform Drivers:
   - Add the clock controller drivers for RTD1625-CRT and RTD1625-ISO.
   - These drivers provide the clock sources and instantiate the
     corresponding auxiliary reset devices.

Best regards,
Yu-Chun Lin
---
Changes in v16:
General:
- Split out the reset controller support into a separate series.

Patch 1 (dt-binding):
- Remove Krzysztof's reviewed-by tag.
- Add 'clock-name' property with a predefined enum list.
- Update 'clocks' property constraints.
- Move the reset ID header to the reset controller series.

Patch 3 (PLL):
- Remove Brian's reviewed-by tag.
-  Introduce 'expected_parent_rate' validation in '.determine_rate()' and
'.set_rate()' to safely enforce the fixed input rate requirement.
- In determined_rate, replacing the floor/ceil algorithm with a closest-match
search within [min_rate, max_rate] boundaries.
- Improve comments for spinlock. 
- Add '.is_enabled' callback to 'rtk_clk_pll_ro_ops'

Patch 4 (GATE):
- Remove Brian's reviewed-by tag.
- Replace 'CLK_HW_INIT' with 'CLK_HW_INIT_HW' and 'CLK_HW_INIT_FW_NAME' macros
to avoid relying on unstable internal CCF global names.
- Drop all unused NO_PARENT macro and 'rtk_clk_regmap_gate_ro_ops'.

Patch 5 (MUX):
- Remove Brian's reviewed-by tag.
- Replace 'CLK_HW_INIT_PARENTS' with 'CLK_HW_INIT_PARENTS_HW' to use '.parent_hws'

Patch 6 (MMC PLL):
- Remove Brian's reviewed-by tag.
- Move the MMC PLL structs and ops declarations out of clk-pll.h into a new
  clk-regmap-pll-mmc.h.
- Add a separate 'struct rtk_clk_pll_mmc_phase' with its own to_clk_pll_mmc_phase().
- Merge prepare/unprepare/is_prepared into enable/disable/is_enabled, as
  suggested: there is no sleeping operation.
- Introduce the 'rtk_clk_pll_mmc_div_cfg' table for the SSCPLL analog tuning.
- Introduce the 'rtk_clk_pll_mmc_rate' table.
   - determine_rate() selects the closest entry within [min_rate, max_rate]
   - set_rate() programs that entry only
   - recalc_rate() matches all five raw register fields against the table. However,
   only on a miss does it fall back to 'clk_pll_mmc_calc_rate()', which implements
   the formula.

Patch 7 & 8 (CRT & ISO clock driver):
- Remove Brian's reviewed-by tag.
- Replace 'const char *' parent arrays with 'struct clk_hw *' arrays.
- Switch all gate, mux, and fixed-factor clock initializations to use '_HW' or
'_FW_NAME' macros.
- Use 'CLK_HW_INIT_FW_NAME' for regmap_pll initialization when referencing external
  clocks, and add 'expected_parent_rate' to ensure a safe input rate.
- Refactor eMMC PLL initialization (decoupling phases and appending rate tables).

Patch 9 (DTS):
- Add 'clock-names = "osc27m"' to the 'cc' and 'iso_s_cc' clock controller nodes.
- Explicitly wire up internal parent clocks from the 'cc' controller to the 'ic'
  clock controller, along with their corresponding 'clock-names'.

v15: https://lore.kernel.org/lkml/20261002074331.3066919-1-eleanor.lin@realtek.com/
v14: https://lore.kernel.org/lkml/20260901072446.2563145-1-eleanor.lin@realtek.com/
v13: https://lore.kernel.org/lkml/20260812020009.3480538-1-eleanor.lin@realtek.com/
v12: https://lore.kernel.org/lkml/20260804163807.1285869-1-eleanor.lin@realtek.com/
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

Cheng-Yu Lee (7):
  clk: realtek: Introduce common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

Yu-Chun Lin (2):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  95 ++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  41 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  46 +
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-regmap-gate.c         |  59 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  54 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  40 +
 drivers/clk/realtek/clk-regmap-mux.h          |  42 +
 drivers/clk/realtek/clk-regmap-pll-mmc.c      | 457 +++++++++
 drivers/clk/realtek/clk-regmap-pll-mmc.h      |  66 ++
 drivers/clk/realtek/clk-regmap-pll.c          | 219 +++++
 drivers/clk/realtek/clk-regmap-pll.h          |  53 ++
 drivers/clk/realtek/clk-rtd1625-crt.c         | 878 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 140 +++
 drivers/clk/realtek/clk-rtk-common.c          |  84 ++
 drivers/clk/realtek/clk-rtk-common.h          |  37 +
 drivers/clk/realtek/freq_table.c              |  63 ++
 drivers/clk/realtek/freq_table.h              |  24 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 166 ++++
 22 files changed, 2585 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.h
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.h
 create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h

-- 
2.43.0

