Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: "Y.B. Lu" <yangbo.lu@nxp.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [v12, 0/8] Fix eSDHC host version register bug
Date: Wed, 19 Oct 2016 02:47:07 +0000
Message-ID: <AM5PR0401MB2529BA70C6E7AF7C71631A47F8D20@AM5PR0401MB2529.eurprd04.prod.outlook.com>
References: <1474441040-11946-1-git-send-email-yangbo.lu@nxp.com>
 <CAPDyKFoit0sTPpfi2=AHcdZsDwOJxbBX68O-1jBFL=5JN0m6_w@mail.gmail.com>
In-Reply-To: <CAPDyKFoit0sTPpfi2=AHcdZsDwOJxbBX68O-1jBFL=5JN0m6_w@mail.gmail.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 "X.B. Xie" <xiaobo.xie@nxp.com>, "M.H. Lian" <minghuan.lian@nxp.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Russell King <linux@arm.linux.org.uk>, Bhupesh
 Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Jochen Friedrich <jochen@scram.de>,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Scott Wood <oss@buserror.net>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Kumar Gala <galak@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

+ Greg

Hi Greg,

I submitted this patchset for a MMC bug fix, and introduce the below patch which needs your ACK.
> > Arnd Bergmann (1):
> >   base: soc: introduce soc_device_match() interface
https://patchwork.kernel.org/patch/9342913/

Could you help to review it and give some comments or ACK.
Thank you very much.



Best regards,
Yangbo Lu


> -----Original Message-----
> From: Ulf Hansson [mailto:ulf.hansson@linaro.org]
> Sent: Tuesday, October 18, 2016 6:48 PM
> To: Y.B. Lu
> Cc: linux-mmc; Scott Wood; Arnd Bergmann; linuxppc-dev@lists.ozlabs.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-clk; linux-i2c@vger.kernel.org;
> iommu@lists.linux-foundation.org; netdev@vger.kernel.org; Mark Rutland;
> Rob Herring; Russell King; Jochen Friedrich; Joerg Roedel; Claudiu Manoil;
> Bhupesh Sharma; Qiang Zhao; Kumar Gala; Santosh Shilimkar; Leo Li; X.B.
> Xie; M.H. Lian
> Subject: Re: [v12, 0/8] Fix eSDHC host version register bug
> 
> On 21 September 2016 at 08:57, Yangbo Lu <yangbo.lu@nxp.com> wrote:
> > This patchset is used to fix a host version register bug in the
> > T4240-R1.0-R2.0 eSDHC controller. To match the SoC version and
> > revision, 10 previous version patchsets had tried many methods but all
> of them were rejected by reviewers.
> > Such as
> >         - dts compatible method
> >         - syscon method
> >         - ifdef PPC method
> >         - GUTS driver getting SVR method Anrd suggested a
> > soc_device_match method in v10, and this is the only available method
> > left now. This v11 patchset introduces the soc_device_match interface
> > in soc driver.
> >
> > The first six patches of Yangbo are to add the GUTS driver. This is
> > used to register a soc device which contain soc version and revision
> information.
> > The other two patches introduce the soc_device_match method in soc
> > driver and apply it on esdhc driver to fix this bug.
> >
> > Arnd Bergmann (1):
> >   base: soc: introduce soc_device_match() interface
> >
> > Yangbo Lu (7):
> >   dt: bindings: update Freescale DCFG compatible
> >   ARM64: dts: ls2080a: add device configuration node
> >   dt: bindings: move guts devicetree doc out of powerpc directory
> >   powerpc/fsl: move mpc85xx.h to include/linux/fsl
> >   soc: fsl: add GUTS driver for QorIQ platforms
> >   MAINTAINERS: add entry for Freescale SoC drivers
> >   mmc: sdhci-of-esdhc: fix host version for T4240-R1.0-R2.0
> >
> >  Documentation/devicetree/bindings/arm/fsl.txt      |   6 +-
> >  .../bindings/{powerpc => soc}/fsl/guts.txt         |   3 +
> >  MAINTAINERS                                        |  11 +-
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   6 +
> >  arch/powerpc/kernel/cpu_setup_fsl_booke.S          |   2 +-
> >  arch/powerpc/sysdev/fsl_pci.c                      |   2 +-
> >  drivers/base/Kconfig                               |   1 +
> >  drivers/base/soc.c                                 |  66 ++++++
> >  drivers/clk/clk-qoriq.c                            |   3 +-
> >  drivers/i2c/busses/i2c-mpc.c                       |   2 +-
> >  drivers/iommu/fsl_pamu.c                           |   3 +-
> >  drivers/mmc/host/Kconfig                           |   1 +
> >  drivers/mmc/host/sdhci-of-esdhc.c                  |  20 ++
> >  drivers/net/ethernet/freescale/gianfar.c           |   2 +-
> >  drivers/soc/Kconfig                                |   2 +-
> >  drivers/soc/fsl/Kconfig                            |  19 ++
> >  drivers/soc/fsl/Makefile                           |   1 +
> >  drivers/soc/fsl/guts.c                             | 257
> +++++++++++++++++++++
> >  include/linux/fsl/guts.h                           | 125 ++++++----
> >  .../asm/mpc85xx.h => include/linux/fsl/svr.h       |   4 +-
> >  include/linux/sys_soc.h                            |   3 +
> >  21 files changed, 478 insertions(+), 61 deletions(-)  rename
> > Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt (91%)
> > create mode 100644 drivers/soc/fsl/Kconfig  create mode 100644
> > drivers/soc/fsl/guts.c  rename arch/powerpc/include/asm/mpc85xx.h =>
> > include/linux/fsl/svr.h (97%)
> >
> > --
> > 2.1.0.27.g96db324
> >
> 
> This looks good to me! I am not sure which tree you want this to be
> picked up through, but unless no other volunteers I can take it through
> my mmc tree.
> 
> Although, before considering to apply, I need an ack from Scott/Arnd for
> the guts driver in patch 5/8 and I need an ack from Greg for patch 7/8,
> where the soc_device_match() interface is added (seems like you didn't
> add him on cc/to).
> 
> Kind regards
> Uffe
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
