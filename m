Return-Path: <biju.das@bp.renesas.com>
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das@bp.renesas.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Borislav Petkov <bp@suse.de>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH v3 0/3] Add r8a77470/iW-RainboW-G23S single board computer support
Date: Tue,  3 Apr 2018 12:19:36 +0100
Message-Id: <1522754379-64116-1-git-send-email-biju.das@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Hello, 

This series adds support for Rensas RZ/G1C (r8a77470) SoC and
RZ/G1C based iW-RainboW-G23S single board computer.

The series introduces a cpg-mssr clock/power gating module, a power/reset
controller for the SoC.

power areas for RZ/G1C are similar to RZ/G1E.

Few functionalities have currently been enabled in DTS and tested: serial
boot console.

This patch series tested against renesas-dev branch 
tag "renesas-dev-20180328-v4.16-rc7

V1-->V2
	Incorporated geert's review comments.
V2-->V3
        Incorporated simon and geert's review comments.

Biju Das (3):
  serial: sh-sci: Document r8a77470 bindings
  ARM: dts: r8a77470: Initial SoC device tree
  ARM: dts: iwg23s-sbc: Add support for iWave G23S-SBC based on RZ/G1C

 .../bindings/serial/renesas,sci-serial.txt         |   2 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  35 +++++
 arch/arm/boot/dts/r8a77470.dtsi                    | 154 +++++++++++++++++++++
 4 files changed, 192 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
 create mode 100644 arch/arm/boot/dts/r8a77470.dtsi

-- 
2.7.4
