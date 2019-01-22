Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01805C282C4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C413A21019
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ls+A81qG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbfAVOzh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 09:55:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35258 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728915AbfAVOzh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 09:55:37 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BD51125B827;
        Wed, 23 Jan 2019 01:55:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548168932; bh=bPv4nPAB5McuSgwnHiY3pqxAgJTN4iNZlKghgGqhdXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ls+A81qGDhX7Lab9PC4bPoN8q4VIaplA919mOw+Av3fQKQ3M0vLM3owhXAAgeKoRL
         1rWgCz32yEdmt9udzGTmaLsTt9zzrmyTTxrSnEPDZ8kz2IHAoUGgJB/EB9N8taez+l
         UHpNNSG77ZP223XfBq9ps7uwohWh8DF+txHIg79I=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 85677E2146E; Tue, 22 Jan 2019 15:55:29 +0100 (CET)
Date:   Tue, 22 Jan 2019 15:55:29 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
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
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: Re: [PATCH 07/11] arm64: dts: renesas: cat875: Add ethernet support
Message-ID: <20190122145529.zuxpni2klc4lxdxn@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117115945.bmlaoeoqvsmdqqot@verge.net.au>
 <TY1PR01MB1770241D7A553184ABB589DAC0830@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190120082845.4apq3ylk4i6zbhlx@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190120082845.4apq3ylk4i6zbhlx@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jan 20, 2019 at 09:28:45AM +0100, Simon Horman wrote:
> On Thu, Jan 17, 2019 at 01:27:51PM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> > 
> > Thank you for your feedback!
> > 
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 17 January 2019 12:00
> > > Subject: Re: [PATCH 07/11] arm64: dts: renesas: cat875: Add ethernet support
> > >
> > > On Wed, Jan 16, 2019 at 06:37:50PM +0000, Fabrizio Castro wrote:
> > > > From: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > This patch adds ethernet support to the sub board.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/cat875.dtsi | 30 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
> > > > index a41d0d8..805ffa7 100644
> > > > --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> > > > @@ -7,4 +7,34 @@
> > > >
> > > >  / {
> > > >  model = "Silicon Linux sub board for CAT874 (CAT875)";
> > > > +
> > > > +aliases {
> > > > +ethernet0 = &avb;
> > > > +};
> > > > +};
> > > > +
> > > > +&avb {
> > > > +pinctrl-0 = <&avb_pins>;
> > > > +pinctrl-names = "default";
> > > > +renesas,no-ether-link;
> > >
> > > Is the renesas,no-ether-link required?
> > 
> > The AVB_LINK pin from the SoC is connected to the PMEB (Power Management Event, B stands for
> > active low) pin on the  PHY, which means it is not a link signal. The PMEB signal is active when a magic
> > packet or a wake up frame are detected. As a result, we need renesas,no-ether-link and we can't
> > specify avb_link with avb_pin either.
> 
> Thanks for following-up. In that case I am fine with this patch.
> 

Thanks again, applied for v5.1.
