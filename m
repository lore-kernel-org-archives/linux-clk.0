Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bl2on0146.outbound.protection.outlook.com ([65.55.169.146]:36932
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752389AbbJOT6N convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2015 15:58:13 -0400
From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"olof@lixom.net" <olof@lixom.net>,
	"bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
	Li Leo <LeoLi@freescale.com>,
	Scott Wood <scottwood@freescale.com>,
	"Stuart Yoder" <stuart.yoder@freescale.com>
Subject: RE: [PATCH v3 12/12] dts/Makefile: Add build support for LS2080a QDS
 & RDB board DTS
Date: Thu, 15 Oct 2015 19:58:09 +0000
Message-ID: <BY1PR0301MB1303114E40DED290D699792A823E0@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
 <1444891672-32117-13-git-send-email-bhupesh.sharma@freescale.com>
 <6113441.JKoMX6G60g@wuerfel>
In-Reply-To: <6113441.JKoMX6G60g@wuerfel>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Thursday, October 15, 2015 7:50 PM
> 
> On Thursday 15 October 2015 12:17:52 Bhupesh Sharma wrote:
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> b/arch/arm64/boot/dts/freescale/Makefile
> > index 932001a..57b41c7 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -1,4 +1,4 @@
> > -dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
> > +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb fsl-ls2080a-
> rdb.dtb fsl-ls2080a-simu.dtb
> >
> >
> 
> Please use one line per dtb file here, for consistency with the other
> platforms
> 

Ok, will address in v4.

Regards,
Bhupesh
