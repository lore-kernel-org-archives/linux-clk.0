Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: Scott Wood <scott.wood@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>
Subject: RE: [v6, 2/5] soc: fsl: add GUTS driver for QorIQ platforms
Date: Fri, 25 Mar 2016 06:44:33 +0000
Message-ID: <HE1PR04MB0889420582187F850129D3D0F8830@HE1PR04MB0889.eurprd04.prod.outlook.com>
References: <1457518131-11339-1-git-send-email-yangbo.lu@nxp.com>
 <1457518131-11339-3-git-send-email-yangbo.lu@nxp.com>
 <DB5PR0401MB1928302BB0DDE8D9B47E4361918C0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
In-Reply-To: <DB5PR0401MB1928302BB0DDE8D9B47E4361918C0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 Zhao Qiang <qiang.zhao@freescale.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Jochen Friedrich <jochen@scram.de>,
 Yang-Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Claudiu
 Manoil <claudiu.manoil@freescale.com>, Kumar Gala <galak@codeaurora.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Scott Wood
> Sent: Saturday, March 19, 2016 6:55 AM
> To: Yangbo Lu; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-clk@vger.kernel.org; linux-
> i2c@vger.kernel.org; iommu@lists.linux-foundation.org;
> netdev@vger.kernel.org; linux-mmc@vger.kernel.org
> Cc: Rob Herring; Russell King; Jochen Friedrich; Joerg Roedel; Claudiu
> Manoil; ulf.hansson@linaro.org; Bhupesh Sharma; Zhao Qiang; Kumar Gala;
> Santosh Shilimkar; Yang-Leo Li; Xiaobo Xie
> Subject: Re: [v6, 2/5] soc: fsl: add GUTS driver for QorIQ platforms
> 
> On 03/09/2016 04:18 AM, Yangbo Lu wrote:
> > +#ifdef CONFIG_FSL_GUTS
> > +u32 fsl_guts_get_svr(void);
> > +int fsl_guts_init(void);
> > +#endif
> 
> Don't ifdef prototypes (when not providing a stub alternative).
> 
> -Scott

[Lu Yangbo-B47093] Ok, will remove the ifdef.
Thank you very much.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
