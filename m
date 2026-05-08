Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A63909BC;
	Fri,  8 May 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239094; cv=none; b=gGug0tH/xof1+UpFfWuz1IH7s9TxpA6fOsi9oDZLyruPqHCMJXSJBQrTPQl6hT13+6+5Det3hEX3N9z2/HMCepTw9pvucXoRmQhRq0NUDibgnHFAjXjdR4j0Kf9E/Q5awIrZUfVwMtVzgMf6nPkw8Fw6GhKCOItlsjqqQXq5lw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239094; c=relaxed/simple;
	bh=EejRRADk3D+ix3Ue8ePeChH6lCnFWVUPMSQk0kTJEF0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XUTaqgYH3ysDMKDPo5UVFOCEOV8wGyOUL/XkiyKT8UpUwnn6IA7qljw2t48tt5KXSwkVdNToG/Cx8XO272Ku9sdJ43RWmBCisulkI376iWzvGfA4zMwqvqZQExiODR5KAEN8NBjxhqDIe/fJKlbsSJHRUaLzxtokjdm3TkeYItQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=M/o+JZiN; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="M/o+JZiN"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 648BGgV423763937, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778239002; bh=YbnRwB2CcsgCrELUiDRilOMpVZJDmLp88GIu61sBrVg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=M/o+JZiN6xVWjQvd/+SGLgoBAEXS9udcBLo5PHr87jTxzpkcbWIvQZuJmvJv6vIba
	 mydpiqwGwelgxoZdAKbNEoKnCSVpwR03EeFPDUbVju+u9hBAcOh3Qy1bjf+ux11ZP8
	 V9vZNgZ2NNmEsajaK4VIL++ThVtvlYqGZnFVES2Yj+2l+S+75MRYIMAPWGkEHZbmKa
	 VaW3ZVFlw5pd62VJmcOgSvTZQQ3be4kuu5hbNBimDwXTJ40+tLs5NvsOUX9VMlga0r
	 qCs4YXeNUfiidBh/JgP8FL+Kv6WtDQWgQLFgPvdyktTXPeWKGEKJbKadTUCHvoGOYE
	 6DkFDH4MQwWiQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 648BGgV423763937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2026 19:16:42 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:42 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 19:16:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <bmasney@redhat.com>
Subject: [PATCH v7 00/10] clk: realtek: Add RTD1625 clock support
Date: Fri, 8 May 2026 19:16:31 +0800
Message-ID: <20260508111641.3192177-1-eleanor.lin@realtek.com>
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
Changes in v7:

General:
- Update copyright year to include 2026.
- Use EXPORT_SYMBOL_NS_GPL() instead of EXPORT_SYMBOL_GPL().
- Add missing header inclusions to follow the "Include What You Use" principle.
- Sort header inclusions in alphabetical order.
- Sort local variables in reverse Christmas tree order.
- Add const qualifiers where appropriate.
- Fix coding style issues.

Patch 2:
- Move data->rcdev.owner = THIS_MODULE to the caller.
- Make config build-testable with COMPILE_TEST.
- Retrieve regmap via platform data.
- Append the U suffix to constants to prevent integer overflow.

Patch 3:
- Pass regmap as platform data.
- Replace dev_warn() with dev_err_probe() for clock hardware registration
failures.

Patch 4:
- Add a spinlock to synchronize PLL operations (clk_pll_disable,
clk_pll_is_enabled, clk_pll_enable, clk_pll_recalc_rate, clk_pll_set_rate).
- Remove unused macros and move IS_FREQ_TABLE_END to the specific file
where it is used.

Patch 6:
- Remove unused rtk_clk_regmap_mux_ro_ops.

Patch 7:
- Fix incorrect usage of the BIT() macro.
- Return immediately upon encountering the first error instead of accumulating
return values using bitwise OR.

Patch 8 & 9:
- Add locking to synchronize PLL changes.
- Set module owner in the specific driver.

v6: https://lore.kernel.org/lkml/20260402073957.2742459-1-eleanor.lin@realtek.com/

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
 drivers/clk/realtek/Kconfig                   |  46 +
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 453 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 201 +++++
 drivers/clk/realtek/clk-pll.h                 |  61 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 791 ++++++++++++++++++
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
 30 files changed, 2969 insertions(+)
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

