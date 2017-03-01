Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/3] Add support for the R_CCU on Allwinner H3/A64 SoCs
Date: Wed,  1 Mar 2017 12:15:38 +0800
Message-Id: <20170301041541.24388-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
(V3s and R40 do not have it, as they have even no PRCM)

This patch adds support for the ones on H3/A64.

Some clock/reset values are reserved for easier extending the support to
A31/A23, but for this I think some changes to the PRCM MFD should be made,
see [1] (Although this is only a sketch).

[1] https://github.com/wens/linux/commits/sunxi-ng-prcm

Icenowy Zheng (3):
  dt-bindings: update device tree binding for Allwinner PRCM CCUs
  clk: sunxi-ng: add support for PRCM CCUs
  arm64: dts: allwinner: add r_ccu node

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  11 ++
 drivers/clk/sunxi-ng/Kconfig                       |   6 +
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun6i-r.c                 | 209 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun6i-r.h                 |  27 +++
 include/dt-bindings/clock/sun6i-r-ccu.h            |  58 ++++++
 include/dt-bindings/reset/sun6i-r-ccu.h            |  54 ++++++
 8 files changed, 368 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-r.h
 create mode 100644 include/dt-bindings/clock/sun6i-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun6i-r-ccu.h

-- 
2.11.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
