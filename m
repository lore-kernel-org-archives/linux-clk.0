Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1on0142.outbound.protection.outlook.com ([157.56.110.142]:47264
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753054AbbJOUB5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2015 16:01:57 -0400
From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
To: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"olof@lixom.net" <olof@lixom.net>, Li Leo <LeoLi@freescale.com>,
	"Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	Stuart Yoder <stuart.yoder@freescale.com>,
	Scott Wood <scottwood@freescale.com>,
	"bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>
Subject: RE: [PATCH v3 09/12] dts/ls2080a: Update Simulator DTS to add support
 of various peripherals
Date: Thu, 15 Oct 2015 20:01:53 +0000
Message-ID: <BY1PR0301MB130398142AA4A4DAEDB08CBB823E0@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
 <1444891672-32117-10-git-send-email-bhupesh.sharma@freescale.com>
 <6141791.soHsjI1RN1@wuerfel>
In-Reply-To: <6141791.soHsjI1RN1@wuerfel>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Thursday, October 15, 2015 7:49 PM
> 
> On Thursday 15 October 2015 12:17:49 Bhupesh Sharma wrote:
> > +
> > +&esdhc {
> > +       status = "disabled";
> > +};
> > +
> > +&ifc {
> > +       status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +       status = "disabled";
> > +};
> > +
> > +&i2c1 {
> > +       status = "disabled";
> > +};
> > +
> > +&i2c2 {
> > +       status = "disabled";
> > +};
> 
> The more common way to do this is to turn off all optional HW blocks in
> the .dtsi file and then overide the ones that are connected on a
> particular board by overriding the status to "ok" there.

I kind of remember it the other way around. But this will not be a huge change,
so will address it in v4.

Regards,
Bhupesh
