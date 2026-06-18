Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8E35E1CD
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806795; cv=none; b=IVY4AlV80y1ay6cKl8bbvexbQPI1AaTP12DCFMZYUoixLxa1enXH4u7O/qcdFDprhs0fqVc7j4QfAaIcZmH5CIOB8H5L7cFbdNGoMeDzMGpCuZa8ziq+sT5ZhAx3//7sEK3GDFkkjCcKwKPEaTQUHjQHfuQG7GDyHGnk2oI/N/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806795; c=relaxed/simple;
	bh=wyus6jMf6L/ne+kZpMNuO/ZqYEE/vAChmJZBV21nv+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/8s5robIH2zGw2L13W/7tXPcRRcJKuzj+Oz1TiRfHOmO3yKsX1oA7SdnUFdXpUXQYwhxyxx97kF+iMSrfecDLxQ0ndfBYx/GFnRcCaV1yLNhbVvAzn/t85rv9UzeCZxR8dzArspmmme9CyS7wKGr+wLDtEkCDacVMHdq9EKkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrHlSvKn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrHlSvKn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4905529b933so11575055e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806792; x=1782411592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDx2KOMtLHoOAsbWqrbmN2XtpZ4cl5riM/ynIeqZ12E=;
        b=RrHlSvKnZ00IwZD0KFKd1d1lz+8jIQ2ze2pPz/xTLrCzQSuKBdJ5OElN+IPqxq13ND
         KERS3B+5mpqyj+CMLWW2Ooc1ifV3s3WBGBFfU2Q2IlsM/pC7uSOpQ5wl8X8MsPZIstEE
         Q3/MvyFRwzqii2PU8oRqMPkDMyFDk0b4prvFbmsbtPcBtUs4onNXdIDfUzS9kzG5K9Hv
         /MMIwhGPBUe/OeiFuGdtRoNGbgsB/jTYfg/WsaztTOEOK3D+M/n4S52jaEv0KQqXSqsa
         qVRNxqS80bwYQR5S6mgaL4DeLOd5qknNj9bYNZbo6gOkTkOduQjtqQBjtkaIAcGfPgdM
         cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806792; x=1782411592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDx2KOMtLHoOAsbWqrbmN2XtpZ4cl5riM/ynIeqZ12E=;
        b=CX6w7G0Q/jv70YjwE6eBDwmIAmUgkRlJCrSKIUg3zsYGCLPuZVrSUnwy6pCP3YCG/9
         bWNqtMaRvRk5wL7fu/lH0dyYo59gRAL8/Dfs/OqndXOaF9mB9vX4QIr+xwW7RZrxX5it
         czrXcAfKzRwMHCqywClfH25ZRPHHyWU1isLRxDAK24+8/ah23VavrLHlrkBENHDYOvy5
         tHmaSKVKl5yyCilz7LJTj88gIFwTNlue3isKNhSnCo+5fKRpaxfgh4IG8idVssrwDHPH
         OswFtRIlpHr0U9iSb7vR6UNZZqcW7XHH7ezXh20WoohZn3pMXoeAKkS0uSUEO4nyDDp8
         TROQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Xg6s88WeXImn+sTpwI/+oGB4jRrZOSqO1Qnrnee42KySthz4u0z/ytN+WzH9OzKccAcRC32ylan0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7P3zq2fT2jPPz8P7+GcpykqGi4i6uEo/fXePh9S2TcKM1dDVY
	a76K4KjwYwd5SGaMcfecN1snyPEdx+HFiaf4zY5DmkpDV0Bkwb29Af6r
X-Gm-Gg: AfdE7cmffLQDGJmeM2ualXM0Rbn0vpuNA9Nef08czjNO9fTqxxewTfl7tMmdMabX89K
	X6VCtpIwHRpDOf2QQfkpth6THy/KcfE3PW79fknDJnJWBgkUE53COi6d0456lfKvMMLg1Fpw7GX
	7K8kYZmaZREmrLs6O69tFwfRGd4JUmosp//QesUBf3WshT2I6C75c84YDt9P61opg1bupI/SmPq
	2a0Jz7Hh9yGJhcyQuuJCSd+SWDaWl/7hsNGkF+8xarvLfQqidLd+xPzWWAlnMYFkT5cX18fmz/J
	B7WOJuEFerPoSytCxDxiDz4L4UrJnVPrGx6LKsUgjoEIJo6ABt719dcrmM9kOB/Kg0slTfFnGGR
	eZUWTmol33Rg6Pg+eMMuR1+ljhw8W5mTpDBvLmEYTA7kN1k+eZdFuLPELkoFrzr0I7cOwnBdwLZ
	cyUKoATB+vG5eDhaBddMZw6chUqNkCezXs0AUjbENcF3lXaP97yhMDb1i29Fl3bntIfIA40QQ0f
	Z0mQ8esVLhTWMdDTmq8wbIanyo=
X-Received: by 2002:a05:600c:1f92:b0:490:c2a3:1781 with SMTP id 5b1f17b1804b1-49240eb1519mr96105e9.34.1781806792275;
        Thu, 18 Jun 2026 11:19:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:51 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Thu, 18 Jun 2026 19:19:44 +0100
Message-ID: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v3-v4:
- Fixed MHz to Hz for input_fref in the doc comment for
  struct rzv2h_pll_limits.
- Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars
- Added RB tags from Geert.

v2->v3:
https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
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
  clk: renesas: Extract RZ/V2H PLL calculation helpers into shared
    library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 373 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 217 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 203 ----------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  34 +-
 9 files changed, 637 insertions(+), 219 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0

