Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B6CC282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 11:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FF4920870
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 11:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="rXsMO+lp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfAWLiR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 06:38:17 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52268 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfAWLiR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Jan 2019 06:38:17 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BF1ED25BEAC;
        Wed, 23 Jan 2019 22:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548243495; bh=9N5TCO70gccBYBO3vzM6N72L4b0qbM07DzdXc8nwamk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rXsMO+lpI6DSamLOSKoEGuopb50ZnRo9ddBrcqQCu2uNJFn2OtOrWMsZAVprI8Uow
         wKsSnAjFmWstvJfHOxarBiWkH5RuLfaWA+m3WCZhTiUp5ImQ3JhiYz8cweGXCDNpAk
         4vB+P8NjemLgNPvmhOrhr4U7JzCvYuaVMrHZB4UY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 03C8E940483; Wed, 23 Jan 2019 12:38:12 +0100 (CET)
Date:   Wed, 23 Jan 2019 12:38:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to
 CAN nodes
Message-ID: <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au>
 <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrote:
> On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wrote:
> > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Castro wrote:
> > > According to the latest information, clkp2 is available on RZ/G2.
> > > Modify CAN0 and CAN1 nodes accordingly.
> > > 
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > 
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks again, applied for v5.1.

Sorry, I was a little hasty there.

This patch depends on the presence of R8A774A1_CLK_CANFD which
(rightly) is added in a different patch in this series which is to
go upstream via a different tree.

I have dropped this patch for now. I think there are two solution to this
problem.

1. Provide a version of this patch which uses a numeric index instead of
   R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is present in an
   RC release provide a patch to switch to using R8A774A1_CLK_CANFD.

2. Defer this patch until R8A774A1_CLK_CANFD is present in an RC release.


