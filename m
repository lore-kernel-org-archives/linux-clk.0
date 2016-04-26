Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-db3on0072.outbound.protection.outlook.com ([157.55.234.72]:47744
	"EHLO emea01-db3-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751170AbcDZCnO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2016 22:43:14 -0400
From: Yangbo Lu <yangbo.lu@nxp.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	Scott Wood <scott.wood@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Russell King" <linux@arm.linux.org.uk>,
	Jochen Friedrich <jochen@scram.de>,
	"Joerg Roedel" <joro@8bytes.org>,
	Claudiu Manoil <claudiu.manoil@freescale.com>,
	Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	Zhao Qiang <qiang.zhao@freescale.com>,
	Kumar Gala <galak@codeaurora.org>,
	"Santosh Shilimkar" <ssantosh@kernel.org>,
	Yang-Leo Li <leoyang.li@nxp.com>,
	Xiaobo Xie <xiaobo.xie@nxp.com>
Subject: RE: [v8, 1/7] Documentation: DT: update Freescale DCFG compatible
Date: Tue, 26 Apr 2016 02:43:10 +0000
Message-ID: <HE1PR04MB0889A68C6D275D3102382D8BF8630@HE1PR04MB0889.eurprd04.prod.outlook.com>
References: <1461306464-19521-1-git-send-email-yangbo.lu@nxp.com>
 <1461306464-19521-2-git-send-email-yangbo.lu@nxp.com>
 <20160422131151.GJ10606@leverpostej>
In-Reply-To: <20160422131151.GJ10606@leverpostej>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Mark,


> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Friday, April 22, 2016 9:12 PM
> To: Yangbo Lu
> Cc: linux-mmc@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> i2c@vger.kernel.org; iommu@lists.linux-foundation.org;
> netdev@vger.kernel.org; ulf.hansson@linaro.org; Scott Wood; Rob Herring;
> Russell King; Jochen Friedrich; Joerg Roedel; Claudiu Manoil; Bhupesh
> Sharma; Zhao Qiang; Kumar Gala; Santosh Shilimkar; Yang-Leo Li; Xiaobo
> Xie
> Subject: Re: [v8, 1/7] Documentation: DT: update Freescale DCFG
> compatible
> 
> On Fri, Apr 22, 2016 at 02:27:38PM +0800, Yangbo Lu wrote:
> > Update Freescale DCFG compatible with 'fsl,<chip>-dcfg' instead of
> > 'fsl,ls1021a-dcfg' to include more chips.
> >
> > Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> > ---
> > Changes for v8:
> > 	- Added this patch
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.txt
> > b/Documentation/devicetree/bindings/arm/fsl.txt
> > index 752a685..1d5f512 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.txt
> > +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> > @@ -119,7 +119,7 @@ Freescale DCFG
> >  configuration and status for the device. Such as setting the
> > secondary  core start address and release the secondary core from
> holdoff and startup.
> >    Required properties:
> > -  - compatible: should be "fsl,ls1021a-dcfg"
> > +  - compatible: should be "fsl,<chip>-dcfg"
> 
> Please list specific values expected for <chip>, while jusy saying <chip>
> may be more generic, it makes it practically impossible to search for the
> correct binding given a compatible string, and it's vague as to exaclty
> what <chip> should be.

[Lu Yangbo-B47093] Thanks for your comment. I will list the possible chips.

> 
> Thanks,
> Mark.
> 
> 
> 
> >    - reg : should contain base address and length of DCFG
> > memory-mapped registers
> >
> >  Example:
> > --
> > 2.1.0.27.g96db324
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree"
> > in the body of a message to majordomo@vger.kernel.org More majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
> >
