Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FECC282CF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 13:01:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A701B21738
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 13:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="eN44m3cL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfA1NBR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 08:01:17 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60303 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbfA1NBQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 08:01:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C305125BE02;
        Tue, 29 Jan 2019 00:01:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548680474; bh=sPBdcPKaH1IQEBaN3wTVZMEh0T00GKdEggx3yuxjB68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eN44m3cLH0Wjv6Oo+cJdx9mJJZUwYzsrG0YpeaZzsXsoZv6rQj1G3wez3ZSGOhicC
         SFqAjz8hAYiMbnkqaJwWHlzzBE8y/S9ui2i5ju95ul5O5vTxxm5V2GhHYpRGPAWO4s
         ImI5BNzxpi21KyxRCkjSWih10wc7iL9OuvmyH/LI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 396C99403E0; Mon, 28 Jan 2019 14:01:12 +0100 (CET)
Date:   Mon, 28 Jan 2019 14:01:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to
 CAN nodes
Message-ID: <20190128130111.t54jbcyx35fiymq6@verge.net.au>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au>
 <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
 <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
 <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <CAMuHMdVkFJ7Cy-+tNHsOcYaxDj82WjMynuFuPRXa4k=DH2fGCQ@mail.gmail.com>
 <TYXPR01MB1775B75CED683E38B9171EA8C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20190124100123.a2gvucnnwrxibulf@verge.net.au>
 <TY1PR01MB177085C4C1DF3D9827EB769BC09B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177085C4C1DF3D9827EB769BC09B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 25, 2019 at 11:33:41AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 24 January 2019 10:01
> > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
> >
> > On Wed, Jan 23, 2019 at 12:18:45PM +0000, Fabrizio Castro wrote:
> > > Hello Geert,
> > >
> > > Thank you for your feedback!
> > >
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: 23 January 2019 12:08
> > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
> > > >
> > > > Hi Fabrizio,
> > > >
> > > > On Wed, Jan 23, 2019 at 1:01 PM Fabrizio Castro
> > > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > > From: Simon Horman <horms@verge.net.au>
> > > > > > Sent: 23 January 2019 11:38
> > > > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
> > > > > >
> > > > > > On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrote:
> > > > > > > On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wrote:
> > > > > > > > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Castro wrote:
> > > > > > > > > According to the latest information, clkp2 is available on RZ/G2.
> > > > > > > > > Modify CAN0 and CAN1 nodes accordingly.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > > > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > > >
> > > > > > > Thanks again, applied for v5.1.
> > > > > >
> > > > > > Sorry, I was a little hasty there.
> > > > > >
> > > > > > This patch depends on the presence of R8A774A1_CLK_CANFD which
> > > > > > (rightly) is added in a different patch in this series which is to
> > > > > > go upstream via a different tree.
> > > > > >
> > > > > > I have dropped this patch for now. I think there are two solution to this
> > > > > > problem.
> > > > > >
> > > > > > 1. Provide a version of this patch which uses a numeric index instead of
> > > > > >    R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is present in an
> > > > > >    RC release provide a patch to switch to using R8A774A1_CLK_CANFD.
> > > > > >
> > > > > > 2. Defer this patch until R8A774A1_CLK_CANFD is present in an RC release.
> > > > >
> > > > > Yeah, my personal preference is solution 2.
> > > >
> > > > Note that solution 2 will probably defer the DT patch to v5.2.
> > >
> > > Yeah, my understanding is that even if we chose solution 1 we would still
> > > need to be waiting for v5.2 for the patch to switch to using
> > > R8A774A1_CLK_CANFD to appear in a rc, therefore I think solution 2 is
> > > fine.
> >
> > Your understanding is the same as mine.
> >
> > I do seem some slight value in option 1 in terms of getting the change,
> > less the minor issue of using an index rather than a symbol, upstream
> > earlier. But I do not feel strongly about this.
> >
> > I am marking this patch as deferred. Please repost or otherwise ping me
> > when you would like to revisit this topic.
> 
> Thank you. Will do.

Thanks.

I believe "[10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN nodes"
falls into the same category. I have marked it as deferred accordingly.
