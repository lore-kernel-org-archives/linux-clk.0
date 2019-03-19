Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724C1C10F03
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 11:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4557520857
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 11:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="rtOVdzy/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfCSLzB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 07:55:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46451 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfCSLzB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 07:55:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 81A3925B7CA;
        Tue, 19 Mar 2019 22:54:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552996495; bh=UkdM7a+H29AQeAYLbvpF0HmoVlR9beKrf8Nz4fnUigw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rtOVdzy/ysM3/6/ojf/XdtLCDh6sYkaWN4RTEO4nGnxiPpVPsGfJNsWzIBJ5c4Ruy
         Ab8+0m6JN56gqVcOQmUP5ugMFf/GEpLVZ/59Ot43jxl8mLpVJhSblq/DbB4YuUDvBG
         fmGhjUQf3rGPoJXmjdJrrwgg6qqtV5MHtiBfaykc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 553CC940663; Tue, 19 Mar 2019 12:54:50 +0100 (CET)
Date:   Tue, 19 Mar 2019 12:54:50 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to
 CAN nodes
Message-ID: <20190319115450.4ez7e4sajzanszr6@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-11-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117120541.slymsz47fjkzz3kg@verge.net.au>
 <20190128130238.gork4cep3qonghwz@verge.net.au>
 <TY1PR01MB1770DDAB8A6FBC79DF91F600C0400@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770DDAB8A6FBC79DF91F600C0400@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 19, 2019 at 11:12:33AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 28 January 2019 13:03
> > Subject: Re: [PATCH 10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN nodes
> > 
> > On Thu, Jan 17, 2019 at 01:05:42PM +0100, Simon Horman wrote:
> > > On Wed, Jan 16, 2019 at 06:37:53PM +0000, Fabrizio Castro wrote:
> > > > According to the latest information, clkp2 is available on RZ/G2.
> > > > Modify CAN0 and CAN1 nodes accordingly.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > >
> > > Taking your word for the motivation for this change,
> > > this patch seems fine to me but I would like to wait for review
> > > from others.
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > I am marking this as deferred until R8A774C0_CLK_CANFD
> > shows up in an rc release.
> > 
> > Alternatively I'd be happy to take a version that uses
> > numeric values, followed up by a patch to switching to R8A774C0_CLK_CANFD
> > once it is available in an rc release.
> > 
> > Please repost or otherwise ping me as appropriate.
> 
> It seems like this patch still applies without conflicts, do you mind taking it now
> as R8A774C0_CLK_CANFD is finally available?

Thanks, I agree this should be ready now.
I've applied it for v5.2.

> 
> Thanks,
> Fab
> 
> > 
> > >
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > index 3970aaf..326ab3a 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > @@ -809,8 +809,10 @@
> > > >  				     "renesas,rcar-gen3-can";
> > > >  			reg = <0 0xe6c30000 0 0x1000>;
> > > >  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> > > > -			clocks = <&cpg CPG_MOD 916>, <&can_clk>;
> > > > -			clock-names = "clkp1", "can_clk";
> > > > +			clocks = <&cpg CPG_MOD 916>,
> > > > +				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
> > > > +				 <&can_clk>;
> > > > +			clock-names = "clkp1", "clkp2", "can_clk";
> > > >  			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > >  			resets = <&cpg 916>;
> > > >  			status = "disabled";
> > > > @@ -821,8 +823,10 @@
> > > >  				     "renesas,rcar-gen3-can";
> > > >  			reg = <0 0xe6c38000 0 0x1000>;
> > > >  			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > > > -			clocks = <&cpg CPG_MOD 915>, <&can_clk>;
> > > > -			clock-names = "clkp1", "can_clk";
> > > > +			clocks = <&cpg CPG_MOD 915>,
> > > > +				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
> > > > +				 <&can_clk>;
> > > > +			clock-names = "clkp1", "clkp2", "can_clk";
> > > >  			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > >  			resets = <&cpg 915>;
> > > >  			status = "disabled";
> > > > --
> > > > 2.7.4
> > > >
> > >
> 
