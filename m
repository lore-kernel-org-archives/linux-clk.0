Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1ECC10F05
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8256B21773
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="jpeCf79r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfC2JTw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:19:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46753 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfC2JTw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:19:52 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 92D2425BECC;
        Fri, 29 Mar 2019 20:19:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553851190; bh=v6mGgzy65Okq8Y3A8OWFrmgUWJ46gQQd3jph4kapfqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jpeCf79rQpE1BR5qOvVIdJj29OzcP9MmstNGNpE1YwdjFIGqC8uSXb7nKdtd1Rp4c
         B1hM0HScUS70K3CuycwV8ZSXK9qjedu8+gUYz+NhQYbwnqJZcJyynX507YkIi3eosV
         z6W4dksNhvyJUoVFIcfRUCYDSvjbXOOydhJeJUM4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 97108940381; Fri, 29 Mar 2019 10:19:48 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:19:48 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/5] clk: renesas: rcar-gen3: Correct parent clock of
 EHCI/OHCI
Message-ID: <20190329091948.4tvoarengqlojege@verge.net.au>
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-2-geert+renesas@glider.be>
 <20190329090242.wzprrwttm77sgmtg@verge.net.au>
 <CAMuHMdUgh1wcfM7AnzG8N+k57Eh688kisw6sCae-FNWVBXuL=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUgh1wcfM7AnzG8N+k57Eh688kisw6sCae-FNWVBXuL=w@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 29, 2019 at 10:07:13AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Mar 29, 2019 at 10:03 AM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Mar 27, 2019 at 01:41:36PM +0100, Geert Uytterhoeven wrote:
> > > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > >
> > > According to the R-Car Gen3 Hardware Manual Rev. 1.00, and the RZ/G2
> > > Hardware Manual Rev. 0.61, the parent clock of the EHCI/OHCI module
> > > clocks on R-Car Gen3 and RZ/G2 SoCs is S3D2.
> > >
> > > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > > [takeshi: Update R-Car H3, M3-N, and E3]
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > [geert: Update RZ/G2M and RZ/G2E]
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > During my review I saw that R-Car E3 (r8a77990) is already using
> 
> D3 (r8a77995)?

Yes, my bad.

> > the correct parent clock. And with this change all R-Car Gen3 and RZ/G2
> > SoCs do so.
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
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
