Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [v10, 7/7] mmc: sdhci-of-esdhc: fix host version for
 T4240-R1.0-R2.0
Date: Thu, 5 May 2016 09:41:32 +0000
Message-ID: <HE1PR04MB0889B52134A43C0E7A452B7BF87C0@HE1PR04MB0889.eurprd04.prod.outlook.com>
References: <1462417950-46796-1-git-send-email-yangbo.lu@nxp.com>
 <1462417950-46796-8-git-send-email-yangbo.lu@nxp.com>
 <4448030.Zs8fVnr3nm@wuerfel>
In-Reply-To: <4448030.Zs8fVnr3nm@wuerfel>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Kumar Gala <galak@codeaurora.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yang-Leo Li <leoyang.li@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Claudiu
 Manoil <claudiu.manoil@freescale.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,


> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Thursday, May 05, 2016 4:32 PM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Yangbo Lu; linux-mmc@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> linux-clk@vger.kernel.org; linux-i2c@vger.kernel.org; iommu@lists.linux-
> foundation.org; netdev@vger.kernel.org; Mark Rutland;
> ulf.hansson@linaro.org; Russell King; Bhupesh Sharma; Joerg Roedel;
> Santosh Shilimkar; Yang-Leo Li; Scott Wood; Rob Herring; Claudiu Manoil;
> Kumar Gala; Xiaobo Xie; Qiang Zhao
> Subject: Re: [v10, 7/7] mmc: sdhci-of-esdhc: fix host version for T4240-
> R1.0-R2.0
> 
> On Thursday 05 May 2016 11:12:30 Yangbo Lu wrote:
> >
> > +       fsl_guts_init();
> > +       svr = fsl_guts_get_svr();
> > +       if (svr) {
> > +               esdhc->soc_ver = SVR_SOC_VER(svr);
> > +               esdhc->soc_rev = SVR_REV(svr);
> > +       } else {
> > +               dev_err(&pdev->dev, "Failed to get SVR value!\n");
> > +       }
> > +
> >
> 
> 
> Sorry for jumping in again after not participating in the discussion for
> the past few versions.
> 
> What happened to my suggestion of making this a platform-independent
> interface to avoid the link time dependency?
> 
> Specifically, why not add an exported function to drivers/base/soc.c that
> uses glob_match() for comparing a string in the device driver to the ID
> of the SoC that is set by whatever SoC identifying driver the platform
> has?
> 
> 	Arnd

[Lu Yangbo-B47093] I think this has been discussed in v6.
You can find Scott's comments about this in below link.
https://patchwork.kernel.org/patch/8544501/

Thanks.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
