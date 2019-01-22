Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01A6C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B3E721019
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="G6cWp4zN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfAVOzG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 09:55:06 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35224 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728778AbfAVOzG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 09:55:06 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1DA1E25B827;
        Wed, 23 Jan 2019 01:55:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548168902; bh=WcEK9gzEMgC6qnRnaTlY8SC8t9ErnqmjxzuVRJfuDXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G6cWp4zNK70p6xumC4B8uNQrbmT9padP1N36ENRuuV2xfgLyZgbS70d9ajTFCcOfL
         5RbT5KggbZK+qidvfl+l/k7AgZ1T2iClNmjj53M9iE075speDFeYCrwZS4XpkvtGyA
         Qec+wr5fEgabrdzmaZUCURf7g19JVc547QhmOVjM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 06396E2146E; Tue, 22 Jan 2019 15:55:00 +0100 (CET)
Date:   Tue, 22 Jan 2019 15:55:00 +0100
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
Subject: Re: [PATCH 06/11] arm64: dts: renesas: r8a774c0-cat874: Add uSD
 support
Message-ID: <20190122145459.4iswbo77rjlszm3b@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117111147.vb3lkdmgx24zusjx@verge.net.au>
 <TY1PR01MB1770A5603DE648612A5CA15EC0830@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190120082759.xywno5wjiehmmjr4@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190120082759.xywno5wjiehmmjr4@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jan 20, 2019 at 09:28:00AM +0100, Simon Horman wrote:
> On Thu, Jan 17, 2019 at 01:19:06PM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> > 
> > Thank you for your feedback!
> > 
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 17 January 2019 11:12
> > > Subject: Re: [PATCH 06/11] arm64: dts: renesas: r8a774c0-cat874: Add uSD support
> > >
> > > On Wed, Jan 16, 2019 at 06:37:49PM +0000, Fabrizio Castro wrote:
> > > > From: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > This patch adds uSD card support.
> > >
> > > Can I confirm that SDHI0 is wired up to a uSD slot?
> > 
> > Yes, it is wired up to a uSD slot
> 
> Thanks for the conformation.

I have now applied this for v5.1.
