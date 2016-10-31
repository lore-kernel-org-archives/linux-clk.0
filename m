Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: "Y.B. Lu" <yangbo.lu@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [v15, 3/7] powerpc/fsl: move mpc85xx.h to include/linux/fsl
Date: Mon, 31 Oct 2016 09:35:33 +0000
Message-ID: <DB6PR0401MB2536B1B2E6AC36BDC8FC540DF8AE0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <1477637418-38938-1-git-send-email-yangbo.lu@nxp.com>
 <1477637418-38938-4-git-send-email-yangbo.lu@nxp.com>
 <2723366.1bJeJ7SKI6@wuerfel>
In-Reply-To: <2723366.1bJeJ7SKI6@wuerfel>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "M.H. Lian" <minghuan.lian@nxp.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Qiang Zhao <qiang.zhao@nxp.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar
 Gala <galak@codeaurora.org>, Scott Wood <oss@buserror.net>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "X.B. Xie" <xiaobo.xie@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Friday, October 28, 2016 6:53 PM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Y.B. Lu; linux-mmc@vger.kernel.org; ulf.hansson@linaro.org; Scott
> Wood; Mark Rutland; Greg Kroah-Hartman; X.B. Xie; M.H. Lian; linux-
> i2c@vger.kernel.org; linux-clk@vger.kernel.org; Qiang Zhao; Russell King;
> Bhupesh Sharma; Joerg Roedel; Claudiu Manoil; devicetree@vger.kernel.org;
> Rob Herring; Santosh Shilimkar; linux-arm-kernel@lists.infradead.org;
> netdev@vger.kernel.org; linux-kernel@vger.kernel.org; Leo Li;
> iommu@lists.linux-foundation.org; Kumar Gala
> Subject: Re: [v15, 3/7] powerpc/fsl: move mpc85xx.h to include/linux/fsl
> 
> On Friday, October 28, 2016 2:50:14 PM CEST Yangbo Lu wrote:
> > Move mpc85xx.h to include/linux/fsl and rename it to svr.h as a common
> > header file.  This SVR numberspace is used on some ARM chips as well
> > as PPC, and even to check for a PPC SVR multi-arch drivers would
> > otherwise need to ifdef the header inclusion and all references to the
> SVR symbols.
> >
> >
> 
> I don't see any of the contents of this header referenced by the soc
> driver any more. I think you can just drop this patch.
> 

[Lu Yangbo-B47093] This header file was included by guts.c.
The guts driver used macro SVR_MAJ/SVR_MIN for calculation.

This header file was for powerpc arch before. And this patch is to made it as common header file for both ARM and PPC.
Sooner or later this is needed.

> 	Arnd


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
