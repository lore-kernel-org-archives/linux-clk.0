Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC92C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3E8821019
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ah7CtPZR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbfAVOxw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 09:53:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35148 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbfAVOxw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 09:53:52 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2FB6B25B827;
        Wed, 23 Jan 2019 01:53:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548168828; bh=Gk8OHvwdgsS1W5Iq1sPjoORarHSGY5s0FQ1cE3scc6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ah7CtPZRb9udHtP00JY833uapssoOG1hIYlINb2IAX1YoAnh7mO2hNejDLzX33Rnu
         TIyxjem3f4NHGo5sAnnbB4LVWErKnmfhfQRpdnL0athSu8MjvAu+mBjJz+EPBD45A0
         /N9VQl6OomYvTXS4kemTm8SX01D0acPHqppEHLNM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id D4482E2146E; Tue, 22 Jan 2019 15:53:45 +0100 (CET)
Date:   Tue, 22 Jan 2019 15:53:45 +0100
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
Subject: Re: [PATCH 04/11] arm64: dts: renesas: Add Si-Linux EK874 board
 support
Message-ID: <20190122145345.lqwymtx65zgc4tgo@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVvMZWNrPfWrOmyFoK+oBu69N_G8s1U4mdAQdt_uj+N2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVvMZWNrPfWrOmyFoK+oBu69N_G8s1U4mdAQdt_uj+N2g@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 17, 2019 at 12:05:59PM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 16, 2019 at 7:38 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> >
> > The EK874 development kit from Silicon Linux is made of CAT874 (the main
> > board) and CAT875 (the sub board that goes on top of CAT874).
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> Pending acceptance of the DT bindings
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1.
