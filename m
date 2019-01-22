Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8474BC282C5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54AD821721
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RF8VFkf1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbfAVOwO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 09:52:14 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35100 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbfAVOwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 09:52:14 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2E9A825B827;
        Wed, 23 Jan 2019 01:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548168729; bh=v/t1Jd48yCbSMeVh7//g21kR+f40KHE2J9tTCxXSJWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RF8VFkf1gwPNn4g1jaU5DDMTKc0fvDJhaQ3e2dkKwh1fCx2nRgZdZH6NwZ/aXfCwp
         Vgsyp4jox4srXOjMS3OkFOkiljBjF8+JB+3hzY4lDpmWkW6O07QzEguSaVHyo0VfJr
         KlurmZ5MFktbOUp+NqlfF3Ze5Zu8XDI9jOmKhdhs=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 1A971E2146E; Tue, 22 Jan 2019 15:52:07 +0100 (CET)
Date:   Tue, 22 Jan 2019 15:52:07 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
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
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH 03/11] arm64: dts: renesas: Add Si-Linux CAT874 board
 support
Message-ID: <20190122145206.ijjwzffwbazsnvrs@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWhcH2=FS62jawZrMeSc_qKBS_SpDTMoVvhP2o736wtgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWhcH2=FS62jawZrMeSc_qKBS_SpDTMoVvhP2o736wtgg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 17, 2019 at 12:04:51PM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 16, 2019 at 7:38 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> >
> > Basic support for the Si-Linux board based on RZ/G2E:
> >   - Memory,
> >   - Main crystal,
> >   - Serial console
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> Pending acceptance of the DT bindings
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I have applied the binding patch locally and intend to include
it in my next push. With that in mind I have also applied this patch
for v5.1.

> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> 
> > +       chosen {
> > +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
> 
> FWIW, the root and ip parameters won't do anything, until you add network
> support.

True, but I don't think that warrants a respin.

> 
> > +               stdout-path = "serial0:115200n8";
> > +       };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
