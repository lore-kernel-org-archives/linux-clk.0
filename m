Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [v7, 0/5] Fix eSDHC host version register bug
Date: Wed, 6 Apr 2016 06:12:58 +0000
Message-ID: <HE1PR04MB0889D75DC56E180D3508E7A1F89F0@HE1PR04MB0889.eurprd04.prod.outlook.com>
References: <1459480051-3701-1-git-send-email-yangbo.lu@nxp.com>
 <CAPDyKFqgMCvbqMYZ-uM-rTnVvfJkCYbhv2kucCRyNyc9FWoR=Q@mail.gmail.com>
In-Reply-To: <CAPDyKFqgMCvbqMYZ-uM-rTnVvfJkCYbhv2kucCRyNyc9FWoR=Q@mail.gmail.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Zhao Qiang <qiang.zhao@freescale.com>, Russell King <linux@arm.linux.org.uk>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, Bhupesh
 Sharma <bhupesh.sharma@freescale.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <scott.wood@nxp.com>, Xiaobo Xie <xiaobo.xie@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Jochen Friedrich <jochen@scram.de>, Kumar Gala <galak@codeaurora.org>,
 Yang-Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Ulf Hansson [mailto:ulf.hansson@linaro.org]
> Sent: Tuesday, April 05, 2016 7:28 PM
> To: Yangbo Lu
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-
> clk@vger.kernel.org; linux-i2c@vger.kernel.org; iommu@lists.linux-
> foundation.org; netdev@vger.kernel.org; linux-mmc; Rob Herring; Scott
> Wood; Russell King; Jochen Friedrich; Joerg Roedel; Claudiu Manoil;
> Bhupesh Sharma; Zhao Qiang; Kumar Gala; Santosh Shilimkar; Yang-Leo Li;
> Xiaobo Xie
> Subject: Re: [v7, 0/5] Fix eSDHC host version register bug
> 
> On 1 April 2016 at 05:07, Yangbo Lu <yangbo.lu@nxp.com> wrote:
> > This patchset is used to fix a host version register bug in the
> > T4240-R1.0-R2.0 eSDHC controller. To get the SoC version and revision,
> > it's needed to add the GUTS driver to access the global utilities
> registers.
> >
> > So, the first three patches are to add the GUTS driver.
> > The following two patches are to enable GUTS driver support to get SVR
> > in eSDHC driver and fix host version for T4240.
> >
> > Yangbo Lu (5):
> >   ARM64: dts: ls2080a: add device configuration node
> >   soc: fsl: add GUTS driver for QorIQ platforms
> >   dt: move guts devicetree doc out of powerpc directory
> >   powerpc/fsl: move mpc85xx.h to include/linux/fsl
> >   mmc: sdhci-of-esdhc: fix host version for T4240-R1.0-R2.0
> >
> >  .../bindings/{powerpc => soc}/fsl/guts.txt         |   3 +
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   6 ++
> >  arch/powerpc/kernel/cpu_setup_fsl_booke.S          |   2 +-
> >  drivers/clk/clk-qoriq.c                            |   3 +-
> >  drivers/i2c/busses/i2c-mpc.c                       |   2 +-
> >  drivers/iommu/fsl_pamu.c                           |   3 +-
> >  drivers/mmc/host/Kconfig                           |   1 +
> >  drivers/mmc/host/sdhci-of-esdhc.c                  |  23 ++++
> >  drivers/net/ethernet/freescale/gianfar.c           |   2 +-
> >  drivers/soc/Kconfig                                |   2 +-
> >  drivers/soc/fsl/Kconfig                            |   8 ++
> >  drivers/soc/fsl/Makefile                           |   1 +
> >  drivers/soc/fsl/guts.c                             | 119
> +++++++++++++++++++++
> >  include/linux/fsl/guts.h                           |  98 ++++++++-----
> ----
> >  .../asm/mpc85xx.h => include/linux/fsl/svr.h       |   4 +-
> >  15 files changed, 219 insertions(+), 58 deletions(-)  rename
> > Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt (91%)
> > create mode 100644 drivers/soc/fsl/Kconfig  create mode 100644
> > drivers/soc/fsl/guts.c  rename arch/powerpc/include/asm/mpc85xx.h =>
> > include/linux/fsl/svr.h (97%)
> >
> > --
> > 2.1.0.27.g96db324
> >
> 
> I was about to queue this for next, when I noticed that checkpatch is
> complaining/warning lots about these patches. Can you please a round of
> checkpatch and fix what makes sense.
> 
> Kind regards
> Uffe

[Lu Yangbo-B47093] Sorry about this, Uffe...
Should I ignore the warnings that update MAINTAINERS?
Regarding the 'undocumented' warning, I will added a patch updates doc before all the patches, Ok?

Thanks a lot :)
 
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
