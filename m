Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>, Scott Wood
 <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [v14, 0/8] Fix eSDHC host version register bug
Date: Fri, 28 Oct 2016 13:45:13 +0800
Message-ID: <1477633521-7391-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 Qiang Zhao <qiang.zhao@nxp.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Jochen Friedrich <jochen@scram.de>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, devicetree@vger.kernel.org,
 Yangbo Lu <yangbo.lu@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Leo Li <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

This patchset is used to fix a host version register bug in the T4240-R1.0-R2.0
eSDHC controller. To match the SoC version and revision, 10 previous version
patchsets had tried many methods but all of them were rejected by reviewers.
Such as
	- dts compatible method
	- syscon method
	- ifdef PPC method
	- GUTS driver getting SVR method
Anrd suggested a soc_device_match method in v10, and this is the only available
method left now. This v11 patchset introduces the soc_device_match interface in
soc driver.

The first six patches of Yangbo are to add the GUTS driver. This is used to
register a soc device which contain soc version and revision information.
The other two patches introduce the soc_device_match method in soc driver
and apply it on esdhc driver to fix this bug.

Arnd Bergmann (1):
  base: soc: introduce soc_device_match() interface

Yangbo Lu (7):
  dt: bindings: update Freescale DCFG compatible
  ARM64: dts: ls2080a: add device configuration node
  dt: bindings: move guts devicetree doc out of powerpc directory
  powerpc/fsl: move mpc85xx.h to include/linux/fsl
  soc: fsl: add GUTS driver for QorIQ platforms
  MAINTAINERS: add entry for Freescale SoC drivers
  mmc: sdhci-of-esdhc: fix host version for T4240-R1.0-R2.0

 Documentation/devicetree/bindings/arm/fsl.txt      |   6 +-
 .../bindings/{powerpc => soc}/fsl/guts.txt         |   3 +
 MAINTAINERS                                        |  11 +-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   6 +
 arch/powerpc/kernel/cpu_setup_fsl_booke.S          |   2 +-
 arch/powerpc/sysdev/fsl_pci.c                      |   2 +-
 drivers/base/Kconfig                               |   1 +
 drivers/base/soc.c                                 |  66 ++++++
 drivers/clk/clk-qoriq.c                            |   3 +-
 drivers/i2c/busses/i2c-mpc.c                       |   2 +-
 drivers/iommu/fsl_pamu.c                           |   3 +-
 drivers/mmc/host/Kconfig                           |   1 +
 drivers/mmc/host/sdhci-of-esdhc.c                  |  20 ++
 drivers/net/ethernet/freescale/gianfar.c           |   2 +-
 drivers/soc/Kconfig                                |   3 +-
 drivers/soc/fsl/Kconfig                            |  18 ++
 drivers/soc/fsl/Makefile                           |   1 +
 drivers/soc/fsl/guts.c                             | 238 +++++++++++++++++++++
 include/linux/fsl/guts.h                           | 125 ++++++-----
 .../asm/mpc85xx.h => include/linux/fsl/svr.h       |   4 +-
 include/linux/sys_soc.h                            |   3 +
 21 files changed, 458 insertions(+), 62 deletions(-)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt (91%)
 create mode 100644 drivers/soc/fsl/Kconfig
 create mode 100644 drivers/soc/fsl/guts.c
 rename arch/powerpc/include/asm/mpc85xx.h => include/linux/fsl/svr.h (97%)

-- 
2.1.0.27.g96db324


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
