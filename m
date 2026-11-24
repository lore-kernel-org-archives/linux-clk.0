Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487832;
	b=luZ7qppUMjVDlIMCY6weIDuPIgyL4+YLaq41o/sdvlz4RQuGxPlDDTOaozElh8H6Vtvk
	 Wi7DFDR5fZHocOfZeGGJMIs3J0kOJY6Wb9NeBy5ame/IGMjWgTOqCWrMvmIhhknSmO7UO
	 gG5kINmuLLfL2rFpboxstlcB1AmO+kiTTo/XskMEHoSkJxDOAWrpJcjePnu5HSrbmZfKg
	 yEdx8z6Bl1JGvPXldrg7NhpGHdS69Mo961LtbmFgAtoeDZWPPVkgH6fx+QCafy8gAuWvL
	 2s7qPWN0Oq/ND2s0gNLusYunyqX7QOv1/9AdgBIFEC7OAx71AjvldNKZUydiO+f53Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487832;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Gn1iKGRhqTBlJ2TLF/wXgHueVqFg63taAlkjw91Ipws=;
	b=s/eumtEnZG2tRgi899w2q9RSHGb3ZU29w+bnsutsVxOSXv34xNNrR16aFpzEZOscauAY
	 2crpBQVQ/VfZyNhLbiDdIwTxHOa4ljW9szonW48OJafe8Sfn+lbMSdyJnmlTsMBKCrsu0
	 5YvZWishn1VRpbaDyJHKUGdzxlH68T+Mt0H2VS3+89evR1/+nVLYvwwdARj/ZDqL824rs
	 Agsm+EqjqmDlGNYOBmitsVrs8Gq5FGBDpz366uVYBeiIcq/abY0nHtI48QscBcCLpmfZn
	 fW2bPm38LqgYUuVRfYXLL/4aUB0JudupzTWgmEyf7bV/QLeRCov0Hi81Ao0rGds7Ytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=GfWtOEb+;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD6E606A6B3;
	Tue, 24 Nov 2026 02:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD6E606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=GfWtOEb+
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2ZwH522160542, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487758; bh=Gn1iKGRhqTBlJ2TLF/wXgHueVqFg63taAlkjw91Ipws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=GfWtOEb+1jLIK66ieIAhsGAtwicq+/EoU0WBEYiYN+jkhQVyEFt8p4pCJqFXyZYVE
	 5Am71dA2ttb3rwwiCG2nbE0yNSLXXrrvU8xk/5x5IqgU0Nchj9SGkKeWQUEGpdewrb
	 e4xrONwokEwYCIFTmqJYkPdL6953lfZCgP0lqx5ZkNluSFSZHbOEI4bq5LCnmibhiA
	 t3JV22XQ4EZR5BQLG04wiCNZ8t5xV5+JaBAZkS9/bKtQ/GTBAx66slx8Eukd1rUKAd
	 A1HeOIEShXz0PZhqEEpTyZqIu8IvoyJSSzzwm6jO4kiBMakZpvBsbdt3dDDhsKo8FW
	 vTxUr+WS0/CAA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2ZwH522160542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 0/9] clk: realtek: Add RTD1625 clock support
Date: Tue, 24 Nov 2026 10:35:48 +0800
Message-ID: <20261124023558.4088635-1-eleanor.lin@realtek.com>
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
Changes in v17:

Patch 1 (dt-binding):
- Move the 'clocks' and 'clock-names' item descriptions to the top level, and
keep only the item counts in the if/else branches.

Patch 2:
- Make the "Realtek Clock Common" Kconfig symbol a bare tristate and drop its
prompt and help text.
- Change the type of aux_name from 'char *' to 'const char *'.

Patch 3 (PLL):
- Move the power-on sequence from '.enable()' to '.prepare()', and use
'regmap_read_poll_timeout()' instead of the atomic variant: 'wait_freq_ready()'
can take up to 500 us, which is too long to busy-wait in atomic context.
- Drop the spinlock now that '.prepare()', '.unprepare()' and '.set_rate()'
are all serialized by 'prepare_lock'.
- Turn 'ftbl_find_closest_by_rate()' into a macro so that tables other than
'struct rtk_freq_table' can use it.

Patch 4 (GATE):
- Return 0 instead of the error code from '.is_enabled()'.

Patch 6 (MMC PLL):
- Reuse the 'ftbl_find_closest_by_rate()' macro and drop the local duplicate.
- Make 'rate_tbl' optional and add a built-in default table, which also covers
the SPI-NAND operating point at 99,999,206 Hz.
- Add an 'ssc' flag to 'struct rtk_clk_pll_mmc_rate', so that the SSC analog
registers are left untouched in SPI-NAND mode.
- Replace 'shift' with 'phsel_mask' in 'struct rtk_clk_pll_mmc_phase', and use
'field_prep()'/'field_get()'.
- '.recalc_rate()' always computes the rate from the dividers instead of
reverse-matching the rate table.

Patch 7 (CRT):
Add '.suppress_bind_attrs = true'

v16: https://lore.kernel.org/lkml/20261112052544.555563-1-eleanor.lin@realtek.com/
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

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  93 ++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  41 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  39 +
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-regmap-gate.c         |  59 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  54 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  40 +
 drivers/clk/realtek/clk-regmap-mux.h          |  42 +
 drivers/clk/realtek/clk-regmap-pll-mmc.c      | 443 +++++++++
 drivers/clk/realtek/clk-regmap-pll-mmc.h      |  69 ++
 drivers/clk/realtek/clk-regmap-pll.c          | 177 ++++
 drivers/clk/realtek/clk-regmap-pll.h          |  44 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 859 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 140 +++
 drivers/clk/realtek/clk-rtk-common.c          |  84 ++
 drivers/clk/realtek/clk-rtk-common.h          |  37 +
 drivers/clk/realtek/freq_table.c              |  39 +
 drivers/clk/realtek/freq_table.h              |  45 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 166 ++++
 22 files changed, 2492 insertions(+)
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

