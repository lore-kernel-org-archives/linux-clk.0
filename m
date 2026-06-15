Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B9330644
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520531; cv=none; b=pCPbP6V9HKsGR4uQ0yBo0+waAagJB7t4RWZgBl/ZWn+CYnv3qlQEDUJrQ6Qjzxa1zAw/NAQwRn4AdiImNhEqm4F6nxwNLREyYgLxt5doDn3igSSrcFikFmsc7P3YGIqD6wUfhlxFwYNeZH2QGFV0cg2ODThSE2LEgBbdw2cS1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520531; c=relaxed/simple;
	bh=7HEj4WEED0R5EEGbwYYG+JQUNMtKiAap8Cf8DhjhpFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bxn2xe332EjlbSL0WeIWeZUjSt3uUB7cZIXeAOWEtX1utXTaeqochUIqtV4dg6bksMSErYXjq1LPMKJTvmi4ZDEAeXTT62mUt0WmlDUzZuWJj/5rXkupMIzjtAnzeCZgrpFOjrRof9j1yt/GzwJovXVNVtZ25C/A8pf+DIgH30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbJQi97Z; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbJQi97Z"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso23664675e9.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520529; x=1782125329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7w9hPguA1bshK09M+ZUaGXEUslA7wzRau8OxxMknDPw=;
        b=jbJQi97Z/wF8cdoApZulzSOAU4gKSLTpGWYc1bShnxlsv5zvratsuz7CAYsJRjxkkR
         aljX8iHBJGBAPov9ITFwn9UqJoMhvrlSkxY7pj7CZB7vusgwErt+UX3FJMCChUsXJyQ4
         ISJbna554hm66Kp8ta/njguHbloYRfko2Ujz4t76lGlXVV+zLihIICNNeOE12+xzrs/N
         mplDga3nhzPhkcbvbu2kfCVQbRGt8be8YTUS0LGfy6VvO0sfJWCb/BIed4zBedbYEvsD
         HdjXkrICWxUxIzkSSX5uLT4xgIlXCK05dMYx6fU1hsfVNmJxwKQ0je9mRbzo1UVR0hZM
         Ljxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520529; x=1782125329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w9hPguA1bshK09M+ZUaGXEUslA7wzRau8OxxMknDPw=;
        b=HyMmkIa2eE7tKIMkqpD9UoGndszgxQ8ocjumnHN8vUrhTBkZXuTPBDK8ahMD7PhkTd
         dCnywO7Zp8oYJgZSDFWEwXex6O9XkkqhdY5slImGcR2nhLcFvtAcVHUOucIjMT5EDGfQ
         yUQ87psr3LDEQb14djT8WcfdXQwrVqdpgGHEN/idHepxKK14qK+SNHFFJCUIo47eTenE
         zKtcT2zlvFPPv2CpFgMcURpWv8jDBoQ1yuTXF3IxVoAPHpur3vUl6SXGmn0oIKJigIRm
         QgI/3UsAzAG9RfZ6R0JVOYJfflg/EmT8H7vVwzR/YC6oliA1c7C1SiaEs8nveOrBhAtv
         B/rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VrFVzgVWspb7RQeqarEzuDVDQZxG/D4Rzn1vLVJtZIpx5D3OW4j4rAboWqIqypogKO4vDH6HUOc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynM40xXER3ibZN8N6FlCeJ/fU1D/wxAFyPB+HR9SbPuZgSmwR1
	keXIiX2Cc+cT3CElqsgZJLTaPkzbVNMmyerUPXJjVgFAkBgzcn1DWhlJ
X-Gm-Gg: Acq92OFwaYIaS9irG7PROHS7xbm8/Uo1AeDvMtxti9bKLunN3KPy+TnDAVZDZCQyU20
	LEWBCiBFtR2SV05cM3Dm1/JNDQJno6KSwF5wszgcPMAnKBd6Yfahf1XlljAwjg90SHkf9/c27xU
	goVbwxyXJuG8WvL4lDeihmkGGkdIGEheVxvUpWaR70RuLkADp0jr+QdVvJ443UDb9vp6Q1Z/jZE
	vm5wqES3VSQ9l7Znsf4FcxrtPSGPbPWJsVMUevSwTssU6+3fcmronlBLlbS5I5v6ox9arVrs2kE
	N8XGoH+7D0d0ZhWqenB9MXWhS5tPPgULoRzwlhIAvQmxmpylHgxQRcQoaLTMUk9ukY8xKes3OIt
	GejK3jZcL6YrYjLqHXuBkdnnL13XnnpDcGiwZJVfJ/6kN9UK11AXH4nNK/6V3Toy7NM8HncFwS2
	K+AafMv0P15tiSaoC1QxB0eNXFJQBqrkMQw/rXPIVkYgYa8Q5cRrK+ZtRm6kWH7DGWucmlXlCdj
	izv+SK8LrVmwRY4WU6HZpeQAcIn1v7d6JXL0f4Qpe8xDJs=
X-Received: by 2002:a05:600c:820c:b0:490:e913:6564 with SMTP id 5b1f17b1804b1-490ec4cc6d8mr177591485e9.3.1781520528560;
        Mon, 15 Jun 2026 03:48:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Mon, 15 Jun 2026 11:48:40 +0100
Message-ID: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v2->v3:
- Added export.h include in rzv2h-cpg-lib.c.
- In r9a09g077_cpg_lcdc_div_determine_rate() made use of 
  clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

v1->v2:
https://lore.kernel.org/all/20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message for patch 1 and 2 to reflect the new approach.
- Dropped using table based approach in favor of direct conditional checks
  on the clock index.
- Added Acked-by and Reviewed-by tags
- Added new patch#4
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32

v1: https://lore.kernel.org/all/20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar
Lad Prabhakar (5):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for
    RZ/T2H LCDC and RTC
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 373 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 217 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 186 +--------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  28 ++
 9 files changed, 650 insertions(+), 183 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0

