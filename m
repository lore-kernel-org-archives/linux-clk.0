Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Scott Wood <scottwood@freescale.com>
To: Mike Turquette <mturquette@linaro.org>, Tang Yuantian
 <Yuantian.Tang@freescale.com>
Subject: [RFC PATCH 0/8] clk: qoriq: Move chip-specific knowledge into driver
Date: Thu, 18 Jun 2015 21:49:10 -0500
Message-ID: <1434682158-7243-1-git-send-email-scottwood@freescale.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Liberman Igal-B31950 <Igal.Liberman@freescale.com>, Scott
 Wood <scottwood@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bucur Madalin-Cristian-B32716 <madalin.bucur@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The existing device tree bindings are error-prone and inflexible. 
Correct the mistake by moving the knowledge into the driver, which
has more flexibility in describing the quirks of each chip.  This leaves
the device tree to its proper role of identifying a programming interface
rather than describing its individual registers.

For more detail, see the commit message of patch 4.

Scott Wood (8):
  ARM: dts: ls1021a: Fix clockgen node
  cpufreq: qoriq: Don't look at clock implementation details
  powerpc/fsl: Move fsl_guts.h out of arch/powerpc
  clk: qoriq: Move chip-specific knowledge into driver
  clk: qoriq: Redirect legacy clock nodes to new clocks
  cpufreq: qoriq: Remove frequency masking and minimum
  clk: qoriq: Expose OF clocks directly from the clockgen node
  powerpc/fsl: Use new clockgen binding

 .../devicetree/bindings/clock/qoriq-clock.txt      |   57 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |    3 +
 arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi         |    4 +-
 arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi         |    8 +-
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi           |   15 -
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi        |   18 -
 arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi         |    8 +-
 arch/powerpc/boot/dts/fsl/p3041si-post.dtsi        |   18 -
 arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi         |    8 +-
 arch/powerpc/boot/dts/fsl/p4080si-post.dtsi        |   70 --
 arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi         |   16 +-
 arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi         |    4 +-
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi        |   18 -
 arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi         |    8 +-
 arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi     |   50 +-
 arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi     |   33 +-
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi        |   16 -
 arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi         |    4 +-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi        |   44 -
 arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi         |    8 +-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi        |   22 -
 arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi         |    8 +-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |   61 -
 arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi         |   24 +-
 arch/powerpc/platforms/85xx/mpc85xx_mds.c          |    2 +-
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c          |    2 +-
 arch/powerpc/platforms/85xx/p1022_ds.c             |    2 +-
 arch/powerpc/platforms/85xx/p1022_rdk.c            |    2 +-
 arch/powerpc/platforms/85xx/smp.c                  |    2 +-
 arch/powerpc/platforms/85xx/twr_p102x.c            |    2 +-
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c         |    2 +-
 drivers/clk/clk-qoriq.c                            | 1191 ++++++++++++++++----
 drivers/cpufreq/qoriq-cpufreq.c                    |  139 +--
 drivers/iommu/fsl_pamu.c                           |    2 +-
 .../asm/fsl_guts.h => include/linux/fsl/guts.h     |    6 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |    2 +-
 sound/soc/fsl/p1022_ds.c                           |    2 +-
 sound/soc/fsl/p1022_rdk.c                          |    2 +-
 38 files changed, 1107 insertions(+), 776 deletions(-)
 rename arch/powerpc/include/asm/fsl_guts.h => include/linux/fsl/guts.h (98%)

-- 
2.1.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
