Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91E30EF90
	for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556387; cv=none; b=uQ/LAJrU1XMLdCi8OkVGzY86IZTH+Sw9+YTwcNcJNVvn9cF9oCQrlOKD4a99Ek8hGg3Dumv738sTzzuEma3c0kolPtKuAWYvsaS3LUQgaSiqiM+s5KML++nTuFdp3N5i/xEdPeLAsKqHF0Drv38XT9h5HZHsAv7zbhHaP65eNj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556387; c=relaxed/simple;
	bh=XWIWVLbIdLBV3+v5u5QWw9/N7RG5Abk3Fr1zTbfDR+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnjNx1bCB2fXtnPN/+Lz4dIxdtj+zU7befIln/TzplDny/B5zLSWEJ6uYRbVyMbIhGENVCM0xPXCE9F89X7Dt9bgGWUvaSAiIPspGQPJtE8VQlZzyUwkwj5KhLIS6KjKMcuxhLlBMRpdslrgU6bnXeHvOQhcZCP2iTbcU5YJ3bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9i+8bul; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9i+8bul"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso183933a12.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556385; x=1761161185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDVfpgjWNTkgshrfBSIkTd28bSn0/t7hIZGP8bEifOk=;
        b=i9i+8bulONV/Fe1f8aVzvHsQIB3OarA2jSpTcrsizV5OgvaJuyFqb1BNiXt33Sfq4k
         GE2AiLUNtRA/pJgtSu9LgcZz3rjlGHCOn48zvH83GNC1uI9fCcNqOmyQaEeXOZdP7aTB
         IeeNx0tCoQE0utmEoQ0e6N8liXa0u2/3D+ZeLVsv93240v2bj4jHfQ8FurqfVAl0cAks
         rc4vRaSpk4X5uOnZjU2C+JCAwrcRJnfIMKrI7DCY6yoOxKTsqiwU/9HMfVWHeqU4NKlj
         EQvQYTryamex26WBeKOymGpmYOl54Uf2nSZHbkOLKUq6b8IYnzIMgKrINpJS/U+Rxvwy
         1xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556385; x=1761161185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDVfpgjWNTkgshrfBSIkTd28bSn0/t7hIZGP8bEifOk=;
        b=sgdBDbW7ae0gicfBUBPc3ym+uU+wL+tKYcYkUmALWgtB+3owTKtVfX1WsX10EmM6ai
         Tcpyw8SoKL6G+DBNX3CzgAM36jdUbF4XPI7yDIV0nJmpYGJPXoOpfq3kzc08XSXtb4Sz
         so9kUeqEoU2oIVOnfCY2erWPVJiyry4gyycGJhhkmOuEtPKx7kGAVHOD/lX0OsxBIM6+
         /oxjtBS1hZsjIVNVdsN8MknUDwJ14UxBsxkd22FV+WLBBOC08XVxkka/UVeIUP5Dlh67
         nT6CsXp9oeYIbJACoW0t0NqAWCWGSGIyzU6ST1IVdFnaa9oR65QbA+8OY76gWXRPqWPE
         4X6A==
X-Forwarded-Encrypted: i=1; AJvYcCXeteKMVOuMCj2/V7vk09XKW+hUqeblwV6BTdUE4OgHGd8qjXH3qrvDZJtnfmR4xLfep+xfPGHgt3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnuCe4EmDHBvxsaFSjg3Dhc/oHVp1rQKwYnPyJ8+VjHR87vey
	4J2nmzBmHwAhg0t5s0U9MdRjMKz3nEFPOeZODMI/v1rPfRRtSnn7BE5g
X-Gm-Gg: ASbGncuJxoJyb5NeI7LkCg7lDBx0Hxc8p/QQPohjngOV5TSY1LpMZLYnwI/ZRcFGxa1
	QzuvqljRPqF/atq2waZFLoL64ml47V4NoLC/7fCSl38qxLnb7VOR/wsUjrstulrPnHIAPEFUCJ8
	5mSRzewfdmB0WM8je2hJo5MzHU5HUQSSoy75lGKYylK1Cy91gK9HaIe41yhjLgI1riQpCHBbD+f
	jIafu7w/s0iPPGhX0+YFUTzsz85EiDLDtVzzEccwiXSM4J7z6P1qBoHSMbj+0kGyM2/TYdWic8Q
	yb3681XwnxDOkSuYsfn4gE+UB6GE8qp2yqj0cBAm++6f3uEP4jh3DOkRWbWZdZLkiSkrOm9kNh2
	OmzNLMtTH0EfPSgt9SzjYq887wufgnJTZFZaW7+e5u8pd+G/toSdRGo5jmRBki9dPrkjuxS6FGL
	i+AEaB6baE9z7IHm2FPD2g6T9FZgiJqNZ0JeBTCb4dNf0=
X-Google-Smtp-Source: AGHT+IG/2RGIvnUlwhvRDKAbkNVBWO3Xn73wZNztecEYo6j0q//PBHfIYwwln5qR7o46Yt1zH+ZUwg==
X-Received: by 2002:a17:903:94f:b0:250:643e:c947 with SMTP id d9443c01a7336-290273ee209mr370284695ad.28.1760556385119;
        Wed, 15 Oct 2025 12:26:25 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:26:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Wed, 15 Oct 2025 20:26:04 +0100
Message-ID: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
MIPI DSI interface on the RZ/V2H(P) SoC.

v10->v11:
- Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
- Updated rzv2h_cpg_plldsi_div_determine_rate()
  while iterating over the divider table
- Added Acked-by tag from Tomi for patch 2/7 and 3/7
- Added Reviewed-by tag from Geert for patch 2/7 and 3/7

v9->v10:
- Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
- Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
- Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars()
  in renesas.h for !CONFIG_CLK_RZV2H case.
- Dropped selecting CLK_RZV2H for DSI driver.

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
  to calculate the PLL parameters ie rzv2h_get_pll_pars/
  rzv2h_get_pll_div_pars/rzv2h_get_pll_dtable_pars
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

Lad Prabhakar (7):
  clk: renesas: rzv2h-cpg: Add instance field to struct pll
  clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
    RZ/V2N
  drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++-
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 512 +++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 453 ++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas.h                   | 145 +++++
 7 files changed, 1315 insertions(+), 40 deletions(-)

-- 
2.43.0

