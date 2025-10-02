Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7E21ABD0
	for <linux-clk@vger.kernel.org>; Thu,  2 Oct 2025 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421863; cv=none; b=Cn5B4+Ls28c77XokAlJvF8RHe2/hY/CgmLtiHxRfY1kOMAsINFmMHxplfawAGC0H7sxTaX0ftmloOyouZ1kEf+A9rB04mLYdT/C3pSRNQll5w5zIV1m7aTeHWrQ1rIh6CHgSWduLMkS12X3fqsnorLFoyHOTBd5dLXUTRb/ehRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421863; c=relaxed/simple;
	bh=xxvRe2lk5v6z4GHvi4gvhCLEPq/UdCzzDR2ZBmyfCzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIy02pGP7F4//CSQqJG2aj/JH26bIvfbSzFV/Ft2l52eAhrxgPzUlUFyPwSzL/ahNtqTa90vsT0rxCWwr4q8Hfu+HtXN4YXYNeVY7dwhJzRd9TQt2YN872+tE2EKvPNHH7lKnlWoFbFFLq7IQUbfSwzq7ezMx7BOwewErzBZvUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Id0QxmAV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Id0QxmAV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso10784175e9.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Oct 2025 09:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421860; x=1760026660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Otx1/PA4HHwSEHLDk3fPYI5aqAtZZe0cB6f3c8gmrpc=;
        b=Id0QxmAVsJFm19U5DZ6k2PRkpsjY4QagUIM3S9go0kE5ab5rL0WG/3dwLqQ6fa/I+f
         og3Wunt1Y7Ha1s4tRIZ16pl5e+Uc/t4V0gevhJjOrg8IqORj2rwvbC/vf41xFU0a+bg0
         scg96Tbr9IYJ0pEpsSmZrCbXlNULtpkr7fzrX0aney7kTlRgo7BsDZ/ef5Ttj8abfToM
         a64d+nXE4Avy//4864VlseoicNMiwAzfnD3oTKBYoG5idO3XWqX9AdykgwEdTd+sydAq
         jPPTi9unaiK4GAGqw1TPO5QI8eL+BmJIdhZzXe0pdbwNcVVTb9dxel9RRyymy6vxsg9u
         UEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421860; x=1760026660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otx1/PA4HHwSEHLDk3fPYI5aqAtZZe0cB6f3c8gmrpc=;
        b=aqvl3qFH0zmE/H5EuidIcIS1RbpBW4QslHoFqd2ZFBPm7lRzh8Pdg1HEwf1YQh5XUK
         bIB394TG+P2EHFLCaSrv0NOy80B/zcyV7oQ5Roxa42kLdIoEgzVq7J5IYDZcddxeTW3T
         yUMyFAXALBW8UhIIX+oeJd+qVhzwsdHHLn5LjEJb3jWjsJqO4ru3YKvqRsQZB/0kT6Y6
         HEU8aV3SMpkxzsCp0ipnUol/BZPzl5foUDUTEndohu/H0jvvreJLQUEJeG1Kasx6FXIJ
         CCV6mOFJY5fPQMaU9iWceQ9M88mUvVIp1xmP6Ash2kXToOpCaUkv6DsKLuaYuMfEkuKe
         QH7g==
X-Forwarded-Encrypted: i=1; AJvYcCVPo3IixVJSMvS4DE62Ecg1xU5zSs24S3zup2H9zHBwMZleE+5VQlyJDmoqYXDtQyJVhgwEpObtvFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbayHQyk4fenyH4Du7G1Pdoc4mJt+uOpxjF6gqO617H0iwZ8m
	Whffkwdm8T0EnaVWVivjGrnh5W7f+75M4FjPwe0OQ8gU/pC7em00NItU
X-Gm-Gg: ASbGncuM5HXUPYEwbM5bh8rXNPONuDiUxNxhiMh3/YHbtAVSsdqNhCONfLhY1YOknQz
	NC6sD9y/SS8xlbiMydp0e7q+ZoZz2HxFJqldj5sUM2yhzPjDY5myIpm8u9USCDx+ggdu0swel3S
	jV5Q1tGWSNwA2aMgK70aBk5NRkKLDSrQUZ1tdAKdZ7Wk70Jk+MXyxWQFN9bkXZM4Dv9/5wIqDO8
	2dgDjGznURC9J1e4u2urrXvuYkH8jxevs5UeXThaEcAofn78qK41Vrsl/SuHpEb6WRDXIVXeT0b
	dziELC69U5hbILgEwnY5Q3AcrTVu3Wo0vHUMRPHK11h2HSnjyoSPuN+oYrZqgQrNlTUCWpC2uCL
	u64xxE1ufFXGwqNz0o4GdENp6b91rs/EPW+zjm8HDXhN1hFEO/FvVI4u74pDbvoeyRz2hz+e3tu
	dNEa/n
X-Google-Smtp-Source: AGHT+IHrchvEXsxFJrlTLE8YJHQSNf/sirg2DAFD48uIiyWWeicecXuXT0nMUm5JOEVAQSa7EBcWwg==
X-Received: by 2002:a05:600c:828d:b0:46e:19f8:88d8 with SMTP id 5b1f17b1804b1-46e61293bcamr60986875e9.34.1759421859733;
        Thu, 02 Oct 2025 09:17:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:17:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 0/6] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Thu,  2 Oct 2025 17:17:22 +0100
Message-ID: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds DU/DSI clocks and provides support for the
MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
series [0], but has now been split into 6 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v8->v9:
- Dropped `renesas-rzv2h-cpg-pll.h` header and merged into `renesas.h`
- Exported the symbols for PLL calculation apis
- Updated commit message for patch 2
- Dropped reviewed-by tags for patch 2
- Updated to use renesas.h
- Updated Kconfig to select CLK_RZV2H
- Added reviewed-by tag from Tomi for patch 5 and 6

v7->v8:
- Added reviewed-by tags from Tomi, Geert and Biju
- Dropped rzv2h_get_pll_dsi_info() helper and opencoded instead.
- Dropped is_plldsi parameter from rzv2h_cpg_pll_clk_register()
- Updated commit message for patch 5/6 and 6/6
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.
- Simplified check in rzv2h_mipi_dsi_dphy_init() for PLL parameters
- Renamed start_index member to base_value in struct rzv2h_mipi_dsi_timings
- Added comments in the code for DSI arrays and their usage
- Added comments in the code for sleeps
- Rebased the changes on next-20250902

v6->v7:
- Renamed pllclk to pllrefclk in DT binding
- Added a new patch to add instance field to struct pll
- Renamed rzv2h_pll_div_limits to rzv2h_pll_limits
- Included fout_min and fout_max in the rzv2h_pll_limits structure
- Renamed rzv2h_plldsi_parameters to rzv2h_pll_div_pars and re-structured
  for readability
- Dropped rzv2h_dsi_get_pll_parameters_values() instead added modular apis
  to calculate the PLL parameters ie rzv2h_get_pll_pars/rzv2h_get_pll_div_pars/
  rzv2h_get_pll_dtable_pars
- Dropped plldsi_limits from rzv2h_cpg_info structure
- Updated the DSI driver to use the new PLL APIs
- Included the LPCLK patch
- Rebased the changes on next-20250728

v5-> v6:
- Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
- Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
  CPG_PLL_CLK1_DIV_P macros to use GENMASK
- Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
- Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
- Dropped rzv2h_cpg_plldsi_round_rate() and implemented
  rzv2h_cpg_plldsi_determine_rate() instead
- Made use of FIELD_PREP()
- Moved CPG_CSDIV1 macro in patch 2/4
- Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
- Used mul_u32_u32() while calculating output_m and output_k_range
- Used div_s64() instead of div64_s64() while calculating
  pll_k
- Used mul_u32_u32() while calculating fvco and fvco checks
- Rounded the final output using DIV_U64_ROUND_CLOSEST()
- Renamed CLK_DIV_PLLETH_LPCLK to CLK_CDIV4_PLLETH_LPCLK
- Renamed CLK_CSDIV_PLLETH_LPCLK to CLK_PLLETH_LPCLK_GEAR
- Renamed CLK_PLLDSI_SDIV2 to CLK_PLLDSI_GEAR
- Renamed plldsi_sdiv2 to plldsi_gear
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.
- Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
  PHYTCLKSETR_* and PHYTHSSETR_* macros.
- Replaced 10000000UL with 10 * MEGA
- Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
- Replaced `i -= 1;` with `i--;`
- Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.

Cheers,
Prabhakar

Lad Prabhakar (6):
  clk: renesas: rzv2h-cpg: Add instance field to struct pll
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
    RZ/V2N
  drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++-
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 560 +++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 drivers/gpu/drm/renesas/rz-du/Kconfig         |   1 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 453 ++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas.h                   | 136 +++++
 8 files changed, 1355 insertions(+), 40 deletions(-)

-- 
2.51.0

