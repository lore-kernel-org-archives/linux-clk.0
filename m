Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6D38BDA0;
	Tue, 13 Jan 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303437; cv=none; b=BbMWgV2IQYTXLW4NHa01BMhUa0osfniHafpxrJjpyFC85j0Hw162Oe0OIB9HqQvFSj64mlF2jHLYt4R1k8EkWUAHKlwZxUjSKgjkxAD8nuL8BQgRN3DqUoladUDHo11qlsAd5ABwJxumYg2J38sBt87506HZpUbH9oHj3krVLiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303437; c=relaxed/simple;
	bh=vxtg9jsKtalSXeCZyrsPADDJyHMh4AnLbXGAN7+lGzY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MXj0cx3Z8VLpa4+9r8eqaBZ7DEQQVj21/5rWJvKBgiTOKOSNDvMnQvH5tE+y9PNIVIyZ4z6cpyNmwGh4Z93FCMpeaFm/gDwmsp/0MjpQVcBKBYdxS3/meE6vt9kdAg77OkL4rPTrgb8St7vP4fhjUMBJPdbFkv5C2c2Mgs2IG00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=uDwIK5cm; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="uDwIK5cm"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60DBNXF102915407, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1768303413; bh=ngKImDzb12UVsQoz04+wGKYfLLCs83TfQtwX4jYuA2w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=uDwIK5cmmdnI8y5oDWRku/L/X+G5pv82QdP2dg7eeGoBgzMu4fOzfM9pv9HhYVRmc
	 O5eG5KvfeiMbxVc/D3hxsf76we8VUD9xsfa6CiIrkrjLGzQbr1WfIJbUaql8D/E4Ou
	 /QBBCodL/Snpec46qdXPO8z4EPG1R4zyjO2xOHCnAB/mqXNKJZ4HCcBCUS6WUVE9WQ
	 KdO4D/DzPDAVORyxYjjVplkdWRTkrRRWGPkghXFvy6H6sLE6ECTHfVAEWftysP+s7f
	 3L6uNfbf9GlK1Tm6RLr1HD2AcSl1SgyjjKkwTtli6V3eMbTAC6eRsFOZpC8/lbv2IT
	 mPUEXYaKfhzBg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60DBNXF102915407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 19:23:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 13 Jan 2026 19:23:33 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 13 Jan 2026 19:23:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 Jan 2026 19:23:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v2 0/9] clk: realtek: Add RTD1625 Clock Support
Date: Tue, 13 Jan 2026 19:23:23 +0800
Message-ID: <20260113112333.821-1-eleanor.lin@realtek.com>
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
---
Changes in v2:
- General: Added missing Co-developed-by tags.
- Patch 1:
  - Shortened binding description.
  - Updated MAINTAINERS entry (BINDINGS -> DRIVERS).
  - Moved software variables from header to driver.
- Patch 2:
  - Added missing maintainer entry for driver/clk.
  - Removed explicit of_xlate/of_reset_n_cells assignment as it matches defaults.
  - Added error handling for rtk_reset_read() return value
- Patch 3:
  - Fixed coding style issues.
  - Switched to using dev_err_probe() return value.
  - Fixed format specifier (%zu instead of %lu) reported by kernel test robot.
- Patch 4:
  - Fixed clk_pll_determine_rate() to properly update req->rate.
- Patch 5:
  - Added error handling for regmap_update_bits.
  - Removed .disable_unused callback in gate ops. The CCF handles the fallback to
    .disable automatically if .disable_unused is not present.
- Patch 6:
  - Fixed return value signedness issue in clk_regmap_mux_get_parent (reported by
    smatch/Dan Carpenter).
- Patch 7
  - Replaced eval_ssc_div_n() function with a macro.
  - Removed clk_pll_mmc_disable_unused() and clk_pll_mmc_unprepare_unused()
    callbacks to rely on CCF default behavior and avoid unnecessary function calls.
  - Fixed clk_pll_mmc_determine_rate() to properly write the calculated rate into
    req->rate.
- Patch 8:
  - Fixed Kconfig indentation.
  - Removed excessive CLK_IGNORE_UNUSED flags

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

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  51 ++
 MAINTAINERS                                   |  18 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  45 +
 drivers/clk/realtek/Makefile                  |  14 +
 drivers/clk/realtek/clk-pll-mmc.c             | 398 +++++++++
 drivers/clk/realtek/clk-pll.c                 | 193 +++++
 drivers/clk/realtek/clk-pll.h                 |  68 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  66 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  46 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 790 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 153 ++++
 drivers/clk/realtek/common.c                  |  68 ++
 drivers/clk/realtek/common.h                  |  40 +
 drivers/clk/realtek/freq_table.c              |  35 +
 drivers/clk/realtek/freq_table.h              |  23 +
 drivers/clk/realtek/reset.c                   | 125 +++
 drivers/clk/realtek/reset.h                   |  36 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 22 files changed, 2443 insertions(+)
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

