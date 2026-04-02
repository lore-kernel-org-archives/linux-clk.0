Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EF2328B4B;
	Thu,  2 Apr 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120834; cv=none; b=JatzpdLaEsFkAexbud2/flbcJcQ6HBbANaIXQlN+/fPrnEMTqRGL+VQtb86PGzNnROvts2octQTKGtzKecKjFWZEZwCJtBtcQzLinXw8pK2XD+REhIymrPUNbpmRy+yxhXYT0ZngnPzk93QsqfjAhcQQPciyq+o47786hNVMK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120834; c=relaxed/simple;
	bh=xixV5RkwLk5z95u+nLxN4EdJOHoKOzWPM6DEQMzVwnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8KUN9LW/VA9WEvwP4YM7ZLrZAUnfkXeHs+Zklp2xHSqgePD8jTssuX1epI3DgTV/m7RdMgOonDbSroh6OHYIY3fC+F90Qd3HpG+QLWPJdCPdyqLP9pzPFX7/kHfHU0fLDt9nrxs+r1FQCOOS6XsB7hmgt04sBk7++zPEBCSQJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: YBocXJXfTZiExZAeyV3GAQ==
X-CSE-MsgGUID: 5xLgOFjnRvyeGWl4dtf8Lw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2026 18:07:04 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3159E413E676;
	Thu,  2 Apr 2026 18:06:55 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	John Madieu <john.madieu@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2 00/24] ASoC: rsnd: Add audio support for the Renesas RZ/G3E SoC
Date: Thu,  2 Apr 2026 11:04:59 +0200
Message-ID: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio support for the Renesas RZ/G3E SoC and enables
it on the SMARC EVK board with the Dialog DA7212 codec.

The RZ/G3E audio subsystem is based on R-Car Sound IP but has several
differences requiring dedicated handling:
  - SSI operates exclusively in BUSIF mode (no PIO)
  - 2 BUSIF channels per SSI instead of 4/8 on R-Car
  - Different register offsets for SCU, ADG, SSIU, and SSI
  - Per-SSI ADG and SSIF supply clocks
  - DMA ACK signal routing through ICU

This series includes:
  - Clock driver support for audio clocks and resets
  - DT bindings update for DMA ACK signal field
  - IRQ chip extension for DMA ACK signal routing
  - RZ-DMAC driver updates for ACK signal support
  - R-Car Sound driver updates for RZ/G3E support
  - System suspend/resume support
  - Device tree nodes for RZ/G3E SMARC EVK

Note: patch 04/22 depends on [1]. As this patch will propably be routed
through the DMA tree independently, the rest of the series can be reviewed
and the remaining patches applied without this dependency being resolved
first.

Audio configuration on SMARC EVK:
  - Codec: Dialog DA7212 on I2C1
  - Playback: SSI3 -> SRC1 -> DVC1
  - Capture: SSI4 -> SRC0 -> DVC0
  - MCLK: 12.288MHz from Versa3 clock generator
  - Format: I2S, RZ/G3E Sound as clock master
  - SSI4 shares clock pins with SSI3 (shared-pin)

Tested on RZ/G3E SMARC EVK with:
  - Playback to headphone output
  - Capture from line-in (AUX) input and/or Mic
  - Full duplex operation
  - System suspend/resume

Merge strategy:
 - Patch 01-02/24: Clock tree
 - Patch 03-04/24: both in DMA tree, as there is hard inter-dependency between
   these patches 
 - Patch 05-18/24: ASoC tree
 - Patch 19-24/24: SoC dts tree

[1] https://lore.kernel.org/all/20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com/

Changes:

v2:

 - Fix Rob's comment on  maxItems not needed with items lists.
 - Drop DMA ACK second cell from DT specifier
 - Derive ACK signal number in-driver from MID/RID using arithmetic formulas
   per ICU Table 4.6-28 (3 linear peripheral groups)
 - Split of rsnd.yaml into common and R-Car-specific schemas
 - Introduce RZ/G3E sound binding as a standalone schema
 - Addressed Kuninori'comments, details are in individual patches


John Madieu (24):
  dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
  clk: renesas: r9a09g047: Add audio clock and reset support
  irqchip/renesas-rzv2h: Add DMA ACK signal routing support
  dma: sh: rz-dmac: Add DMA ACK signal routing support
  ASoC: dt-bindings: renesas,rsnd: Split into generic and SoC-specific
    parts
  ASoC: dt-bindings: Add RZ/G3E (R9A09G047) sound binding
  ASoC: rsnd: Add reset controller support to rsnd_mod
  ASoC: rsnd: Add RZ/G3E SoC probing and register map
  ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
  ASoC: rsnd: Add RZ/G3E DMA address calculation support
  ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
  ASoC: rsnd: Add SSI reset support for RZ/G3E platforms
  ASoC: rsnd: Add ADG reset support for RZ/G3E
  ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
  ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
  ASoC: rsnd: Add rsnd_adg_mod_get() for PM support
  ASoC: rsnd: Export rsnd_ssiu_mod_get() for PM support
  ASoC: rsnd: Add system suspend/resume support
  arm64: dts: renesas: rzv2h: Add audio clock inputs
  arm64: dts: renesas: r9a09g047: Add R-Car Sound support
  arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
  arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
  arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
  arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec
    support

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |   8 +
 .../sound/renesas,r9a09g047-sound.yaml        | 371 ++++++++++++
 .../bindings/sound/renesas,rsnd-common.yaml   | 196 +++++++
 .../bindings/sound/renesas,rsnd.yaml          | 319 +++--------
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 529 +++++++++++++++++-
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |  27 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  27 +-
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  44 ++
 drivers/clk/renesas/r9a09g047-cpg.c           | 129 ++++-
 drivers/dma/sh/rz-dmac.c                      |  72 +++
 drivers/irqchip/irq-renesas-rzv2h.c           |  40 ++
 include/linux/irqchip/irq-renesas-rzv2h.h     |   5 +
 sound/soc/renesas/rcar/adg.c                  | 133 ++++-
 sound/soc/renesas/rcar/cmd.c                  |   2 +-
 sound/soc/renesas/rcar/core.c                 |  60 +-
 sound/soc/renesas/rcar/ctu.c                  |  22 +-
 sound/soc/renesas/rcar/dma.c                  | 167 +++++-
 sound/soc/renesas/rcar/dvc.c                  |  22 +-
 sound/soc/renesas/rcar/gen.c                  | 180 ++++++
 sound/soc/renesas/rcar/mix.c                  |  22 +-
 sound/soc/renesas/rcar/rsnd.h                 |  53 +-
 sound/soc/renesas/rcar/src.c                  |  71 ++-
 sound/soc/renesas/rcar/ssi.c                  |  51 +-
 sound/soc/renesas/rcar/ssiu.c                 |  69 ++-
 25 files changed, 2427 insertions(+), 306 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml

-- 
2.25.1

