Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797024ACC81;
	Fri,  4 Sep 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537540; cv=none; b=DAAgIlh6QcrAY5kGrRKB0siV1B4X191w0Zkr3238j5CFv3dYb0wR0eBMgHTsvJpuDt1SI2jUcshqqPVZxoZE40zZt4TumecVK0k84Mzb3fomOonnQ+RIbVXa2XJOVp5BdKDs+w96MKsb0dT2IovpYSNZNnjvDIpD17kODJudF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537540; c=relaxed/simple;
	bh=ORH2rCiVQueAeB8iL0F4rbAhntfRqdBJI4wUA9/iVE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nglPsF7xKt5rQ8PqoV40qH5iOCYgK/nIRVU4dfiMmgPW5O2PpTTwM8jpGKNGzcj7yuMTA8YsBZ83Tv+xgJtBLkD/Cz5EjOeefQav1feoAr9vStulLtJEgkHAy0M9W8O0WDGUv3CzMHkzKpdwCEnXP0JtxVLjC9fvaXQeCwn28TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HZbMI5YV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HZbMI5YV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537524;
	bh=ORH2rCiVQueAeB8iL0F4rbAhntfRqdBJI4wUA9/iVE4=;
	h=From:Subject:Date:To:Cc:From;
	b=HZbMI5YV5TZD0ouHjt3hxvYenMrWdr3LZ228JBRRyMSgcDNJrggNsw3me9nzecShu
	 8nIoOFqCLGrsw0Bd2uEoimof9eyu3Ph9EE7CsPi9qgcgpkdnpiILKOgzUkdYrjfOIB
	 U21CBfljzETkEYYx6n6Z/yesW1fM2OuYs+jkeV6VLav8jrNIIe24mzHnS2Y9Ee+FiA
	 1FiiLd7yOGRy0af49UQT49+Clsc5b85QtnEKNsOHNG+Ozkv/GALVD5mLPLFpOlu8IB
	 0dw5agdu3T2WrPSOZVCvxjvSmC+rBuvVUdZ0lnB2xVVhcjxEVtBTnf5UQgi242ejRw
	 LtRc/IUz7slEw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9A6217E080A;
	Fri, 04 Sep 2026 17:58:42 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v6 00/27] MT8189: Add support for system and base clock
 controllers
Date: Fri, 04 Sep 2026 17:58:11 +0200
Message-Id: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QTW6DMBAF4Ksgr+vKfxg7q96j6mJshsYq4BRTl
 Cji7nWcRZGKWI6t983T3EnCKWAip+pOJlxCCnHMg36piD/D+Ik0tHkmggnNtGR0mA03lvo++q9
 E0y3NOFAHCWnDGq5QdZ0AIDl/mbAL12K/fzznCb9/8or5+UhKzMdhCPOpGvE607LGMkkegXNIc
 5xupdvCS6L8N4wf1Fg4ZVQ4pkyHCDWDNx/7Hlyc4DXvKvIitpo90sRDs0K3IFunfbenyY0mjk6
 0yKwZ1K214CS0Yk9TW+2wm8oaylo7wyVo5fe0+k8zx3erswZeKc60bbz/121d118c3gCfLwIAA
 A==
X-Change-ID: 20260630-mt8189-clocks-system-base-70714e4ff2aa
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Irving-CH Lin <irving-ch.lin@mediatek.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=11290;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ORH2rCiVQueAeB8iL0F4rbAhntfRqdBJI4wUA9/iVE4=;
 b=rdLfU8q4wWCPgElFcdmvQQAUy1aCPCgupkoaCX+YkNg0eiYX/W1GmLJhEGH8hwmZb9kQ/ZZvR
 TbQOhAaAlTICLIz4uJpjQx/FjrpkOXKRSnQKeEwy9fzFJNj3Qu51Gjp
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

This series is a continuation by AngeloGioacchino Del Regno and I of a
previous series ([1]), that adds the clock controller support for
the Mediatek MT8189 SoC and its variants (MT8371, MT8391).  

The first major changes is the split of the series in two:
- one for all basic clock controllers including system ones (this
series)
- one for the multimedia and graphics related clock controllers (to be
send in the future)

We chose to separate the multimedia clock drivers from the base system
ones, as there is currently an unsolvable inter-dependency between the
power domains and multimedia clocks; the power domains need a
dual-stage bring-up, where only a part of the multimedia clocks are
accessible in the first power domain powerup stage, and the rest when
the second stage (SRAM enablement) is done.
The current workarounds for this issue, such as removing the is_enabled
operation from the impacted clock controllers clk_ops table or
let the multimedia power domain always on, were quickly discarded
for upstream.

The second major change is the dt-bindings patch ([2]) that got heavily
reworked, not only because of the split choice. We took the opportunity
to regroup in the MT8186 clock and system clock dt-bindings the
description of several other Mediatek SoC (MT8188, MT8192 and MT8195)
and add in them the MT8189 new ones.
The rationale is to ease maintainability and have common files for
several currently supported SoC or new future ones, that have the same
kind of clock controller design.

Finally the pending remarks from peer reviews on the v6 revision of [1]
were also taken into account and new fixes and cleanups were also
added.

A more detailed changelog between [1] and this series:
- Removed multimedia and graphics related clock controllers code and
  definitions from series
- Added new dt-bindings patches to factorise existing MT8188, MT8192
  and MT8195 in MT8186 clock dt-bindings
- Heavily modified the MT8189 dt-bindings to add new compatibles 
  in MT8186 clock dt-bindings
- Created a new dt-bindings include for the MT8189 reset controller
  definitions (include/dt-bindings/reset/mediatek,mt8189-resets.h)
- Removed unnecessary `syscon` compatible fallback from MT8189 base
  clock controllers
- Added missing 'mediatek,mt8189-fhctl' compatible declaration in
  dt-bindings
- Modified Kconfig to COMMON_CLK_MT8189 be tristate (and not bool) to 
  allow all MT8189 clock controller drivers to be built as modules (it
  was partial) 
- Fix pll unregisters in clk_mt8189_apmixed_probe error case
- Reparent several clocks to correct 26M references in clk-mt8189-bus.c,
  clk-mt8189-topckgen.c and clk-mt8189-vlpckgen.c
- Removed CLK_SET_RATE_NO_REPARENT flag from mfg_sel_mfgpll
- Rename TOPCKGEN_fmipi_csi_up26m clock to fmipi_csi_up26m to remove caps usage
- Implemented reset controllers in clk-mt8189-ufs.c
- Updated all file headers to update copyrights and add all authors
- Added all co-developed-by trailers

The series is based on linux-next tree (tag: next-20260903) and has
been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
boards, with hardware enablement patch series ([3]), and on Genio
510-EVK (MT8370, variant of MT8188) and Genio 1200-EVK (MT8395,
variant of MT8195).

[1]: https://lore.kernel.org/linux-mediatek/20260309120512.3624804-1-irving-ch.lin@mediatek.com/
[2]: https://lore.kernel.org/linux-mediatek/20260309120512.3624804-2-irving-ch.lin@mediatek.com/
[3]: https://lore.kernel.org/linux-mediatek/20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com/

---
Changes in v6:
- Rebased on next-20260903 tag
- Added contains keyword use in patch 5, as recommended by R. Herring
- Fixed typo and comment in patch 13 (B. Masney)
- Added patches 16 and 17 to do some code improvements suggested in
  B. Masney review
- Removed unnecessary header inclusions and reorder remaining ones in
  patch 18 to 27 (B. Masney)
- Added received Reviewed-By trailers
- Removed netdev mailing list from Cc
- Link to v5: https://lore.kernel.org/r/20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com

Changes in v5:
- Rebased on next-20260730 tag
- Dropped "clk: mediatek: pll: split default prepare/unprepare callbacks"
  patch and added  "clk: mediatek: pll: Factorise pll power on/off sequence"
  and "clk: mediatek: pll: Add PLL stabilization delay definition"
  patches in replacement.
- patch 13:
  - reworded commit message to show this new clocks ops use specific pll
    enablement rather powering
  - reworked mtk_pll_prepare_setclr and mtk_pll_unprepare_setclr
    sequence to handle properly specific enable/disable sequence
    using en_set/clr register (Sashiko)
  - fixed timeout management in mtk_pll_prepare_setclr and
    mtk_pll_unprepare_setclr (Sashiko)
- Link to v4: https://lore.kernel.org/r/20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com

Changes in v4:
- Rebased on next-20260728 tag
- Added patches 9 to 14 to add new clock ops data set for PLL and
  PLL-FHCTL to handle a new PLL switch logic for PLL control and BAR
  reset, supported by MT8189 SoC
- Patch 15:
  - Removed useless includes (B. Masney)
  - Fixed variable declaration order in clk_mt8189_apmixed_probe (B.
    Masney)
  - Added missing pwr_reg setting setting in PLL_SETCLR macro (B. 
    Masney, Sashiko)
  - Added en_set_reg, en_clr_reg, rst_bar_reg, rst_bar_set_reg and
    rst_bar_clr_reg fixed offsets and new mtk_pll_setclr_ops ops
    setting in PLL_SETCLR macro
  - Added pwr_reg offset values in apmixed_plls array
  - Fixed rst_bar_mask for mainpll univpll, and mmpll in apmixed_plls
    array to match rst_bar set/clr reg settings
- Fixed factor ratio for mainpll_d4_d8, tvdpll1_d16, tvdpll2_d16 and
  osc_d16 clocks (Sashiko)
- Link to v3: https://lore.kernel.org/r/20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com

Changes in v3:
- Rebased on next-20260717 tag
- Added Fixes tags to patches 1, 2 and 3
- Reworded patch 8 subject and description messages
- Updated Reviewed-by and Acked-by trailers
- Link to v2: https://lore.kernel.org/r/20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com

Changes in v2:
- Rebased on next-20260708 tag
- Added patch 1,2 and 3 to make the #clock-cells a required property in
  MT8186, MT8192 and MT8195 clock controller dt-bindings
- Patch 5:
  - Removed conditional blocks to check clock-cells property presence
    for MT8188 clock controller compatible
  - Reworded commit message to remove the note (no more applicable)
  - Fixed incorrect property value in else block for #reset-cells
    property check.
_ Removed from patch 9 conditional blocks to check clock-cells property
  presence for MT8189 clock controller compatible
- Fixed missing MODULE_DEVICE_TABLE in patches 10, 11 and 12.
- Added devicetree series link in cover letter
- Link to v1: https://lore.kernel.org/r/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com

---
Louis-Alexis Eyraud (27):
      dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8186
      dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8192
      dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195
      dt-bindings: clock: mediatek: reorder MT8186 compatibles
      dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186
      dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186
      dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186
      dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets
      clk: mediatek: Harmonize mtk_pll_fenc related symbol names
      clk: mediatek: pll: Add BAR reset register offsets
      clk: mediatek: pll: Factorise pll power on/off sequences
      clk: mediatek: pll: Add PLL stabilization delay definition
      clk: mediatek: pll: Add ops for PLLs using set/clr regs
      clk: mediatek: pllfh: Add configurable clock ops to mtk_pllfh_data
      clk: mediatek: pllfh: Add ops for PLLs using set/clr regs
      clk: mediatek: Move fhctl_parse_dt call into mtk_clk_register_pllfhs
      clk: mediatek: pllfh: clear state data in mtk_clk_cleanup_pllfhs
      clk: mediatek: Add MT8189 apmixedsys clock support
      clk: mediatek: Add MT8189 topckgen clock support
      clk: mediatek: Add MT8189 vlpckgen clock support
      clk: mediatek: Add MT8189 vlpcfg clock support
      clk: mediatek: Add MT8189 bus clock support
      clk: mediatek: Add MT8189 dbgao clock support
      clk: mediatek: Add MT8189 dvfsrc clock support
      clk: mediatek: Add MT8189 i2c clock support
      clk: mediatek: Add MT8189 scp clock support
      clk: mediatek: Add MT8189 ufs clock support

 .../bindings/clock/mediatek,mt8186-clock.yaml      |  129 ++-
 .../bindings/clock/mediatek,mt8186-fhctl.yaml      |    1 +
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   24 +-
 .../bindings/clock/mediatek,mt8188-clock.yaml      |   93 --
 .../bindings/clock/mediatek,mt8188-sys-clock.yaml  |   58 --
 .../bindings/clock/mediatek,mt8192-clock.yaml      |  191 ----
 .../bindings/clock/mediatek,mt8192-sys-clock.yaml  |   68 --
 .../bindings/clock/mediatek,mt8195-clock.yaml      |  238 -----
 .../bindings/clock/mediatek,mt8195-sys-clock.yaml  |   76 --
 drivers/clk/mediatek/Kconfig                       |   79 ++
 drivers/clk/mediatek/Makefile                      |    8 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c       |    3 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c       |    5 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c       |    4 +-
 drivers/clk/mediatek/clk-mt8189-apmixedsys.c       |  202 ++++
 drivers/clk/mediatek/clk-mt8189-bus.c              |  199 ++++
 drivers/clk/mediatek/clk-mt8189-dbgao.c            |   97 ++
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c           |   57 ++
 drivers/clk/mediatek/clk-mt8189-iic.c              |  121 +++
 drivers/clk/mediatek/clk-mt8189-scp.c              |   76 ++
 drivers/clk/mediatek/clk-mt8189-topckgen.c         | 1019 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8189-ufs.c              |  132 +++
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c           |  115 +++
 drivers/clk/mediatek/clk-mt8189-vlpckgen.c         |  279 ++++++
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c       |    4 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c       |    4 +-
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    2 +-
 drivers/clk/mediatek/clk-pll.c                     |  131 ++-
 drivers/clk/mediatek/clk-pll.h                     |   13 +-
 drivers/clk/mediatek/clk-pllfh.c                   |   33 +-
 drivers/clk/mediatek/clk-pllfh.h                   |    8 +-
 include/dt-bindings/clock/mediatek,mt8189-clk.h    |  433 +++++++++
 include/dt-bindings/reset/mediatek,mt8189-resets.h |   17 +
 34 files changed, 3139 insertions(+), 782 deletions(-)
---
base-commit: 0abd4c5dd02744f837ade691fb214ca7cb970e4b
change-id: 20260630-mt8189-clocks-system-base-70714e4ff2aa

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

