Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652F226CF7
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026064; cv=none; b=dyhLfCKTe83k0NMLMis8hq8HqvD3w5Fty3hflUguRGgyPbvWpGMMphrttBKgEcR6Hm3dnalqBQnNog2EM2YMxNMtt3RJmRV9Y1LLoAM9FSJFvcEiHChFBvFuLToIU7SsnnrGUooIiFS08SQSmYDjj8oq5bdJyS+7REvHx9xWm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026064; c=relaxed/simple;
	bh=ZBKYlNjssO3a9NTTMCoS8WJFqiGOTxYT0Q8KXdGtvgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLYQVojY+u8CgsHTxihrD+davHt0u8odc96uLfHIVycsJNE4cvVlSi/fYLTpJQNx4usgKmwSuvvlMe0FjxtfUKcvBME6pGyQIaJ+cPtUk8BD1BfUiN7+XAttcGjgPZjv5mm7UVj3A8Cdq/CggU94ucjmL8VcBKgku9q/W3wqoOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCa3BPND; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCa3BPND"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1090195f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760026059; x=1760630859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah71RYYCwhvPLrflp/SE2C1CvVpY05ssrF2NMUD4q1o=;
        b=VCa3BPNDfM4HqfCjL+Y0Fzj1HdVCLVYhm2UCIT6iJJKiwuqSYN7VAzAHh2bnrVYnyS
         INDTAy3Rr3v5ISg73ZUvI4itIfJeHCUqMx7NMrTMJEWGWRVlDWqtOp9cyUMd9Th5BZg7
         M/XEPPQlR5YnhTX2Cfb1GVT5qfEOFtb9OG2IC/rlAME8ZL/wJW1L0dae9B+KEqM6CtG+
         1PWITRkKq5EuSws2OgZZ3pUK0+xX4TMnrwF0NeAKo6H4t2BC2DNbmtZwSshK2GAJeaWN
         yQnwWPylIribLxVWOcBI4XiOieP73xR78k12l1KuyPYmvZX5ID5U5paUuGEj288KGXBW
         Uh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026059; x=1760630859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah71RYYCwhvPLrflp/SE2C1CvVpY05ssrF2NMUD4q1o=;
        b=kIHqXOSniYLo4GPQ0Uqjtks7EsVGsIfAak39/8Jc/2BGrzbToIRaQOL/JY2NMxgd4D
         bQKUoVbUXs42sBDv95PX76nnPFJbC5ev7IbLFjPnJwKwJU7MfHDjCG4OHm8+eUXe1cKJ
         tu6CtQiJgjebA62BNSR8jp3UUP9bpPMzTh08Z6f5rV8BjJNy+sFkZ0WHApNxcUoYaF1m
         bUMGCFMVAjvYAtUMaHHAqfkMb2obpCX9xX3NLWJ2eMs3lZIGMAYucFn4ybhNhNOVXVJ0
         Y7QiWAKZTygdxzzBJnc59H1fuoUypMZXMK5ct78gkaYY60HS8zJBP0zMMCd1gvJMQpiI
         V9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXypww4Ho7f5Gih4fqpKDGag+S/aLG0IOTZZPAurLQRGdjaxzS3Cag6HaisW6cNY1SJic/Kco8qjBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYohQs2nzD19jzoPad5SHWg26EnhddtceDQ0P8eequMCbkD5a
	/FJkBWrcTzlev9XeVNybai/mT2aGplMZb3/nJc6YWsU/nkRwS3UxpY0fHbfTqw==
X-Gm-Gg: ASbGncuRHYP2lL2D0oQSVlfvtPiCXPSORFEMAlzGBOGBM2E/+8IAOHXI6SN/iy0f5Y3
	mmmwXYld1rd8cCbhCol3Ndwse8DrhBSg5zgEmhLLU9U8sPUVGuOkTGh3rW6tG4HW64URxzXCW5W
	X/GehPZQLUnA2ZvjfUbhjU7DQE5eDOnM4HiiVhjfjDiwg1EpQz4htkCOmPWwhUaFypZIREXwJf+
	cZKqYxN6Wntel3/WHBflMzXFBMPIpVxbGhB3KGcPVZOTsngG6ByPBgblpyqA01WqALgapqdxbWH
	bcJpK9E62jAogezeAAYFyVIg02/G3dLNJuCSKXK+qDV8jo+pyiK/gNF1cFn0LPMbVQSwAbgyPhG
	VzcstNm5ce0A92a4BIA2KlOsORpOonr1HdafW2CKEEGDNUx8NywYS7zy9lOhExICLXJo8QAYmYv
	OXNqen
X-Google-Smtp-Source: AGHT+IGxuBNO3H+uGp5GLq88cFcoq8l3NQrqENv31LLcKHd2kWMzfztWuUeSeIUqEX0lkAYgro4w9w==
X-Received: by 2002:a05:6000:1845:b0:3ee:1494:27f5 with SMTP id ffacd0b85a97d-42666aad658mr6085490f8f.13.1760026059072;
        Thu, 09 Oct 2025 09:07:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:480c:edeb:2884:a92a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426cd93e45fsm94632f8f.4.2025.10.09.09.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:07:38 -0700 (PDT)
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
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
Subject: [PATCH v10 0/6] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Thu,  9 Oct 2025 17:07:26 +0100
Message-ID: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
MIPI DSI interface on the RZ/V2H(P) SoC.

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
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 514 +++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 453 +++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas.h                   | 145 +++++
 7 files changed, 1317 insertions(+), 40 deletions(-)

-- 
2.51.0

