Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12351C282C6
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 12:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBBF520870
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 12:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfAWMIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 07:08:09 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45244 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfAWMIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Jan 2019 07:08:09 -0500
Received: by mail-vs1-f67.google.com with SMTP id x28so1107946vsh.12;
        Wed, 23 Jan 2019 04:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXlsE8e4gnJEagoeqnX/n9nKd6PZhbGpEDE/5T34nBI=;
        b=euRaMPg4+/U/TKZX+I6LIuJfC6aE3HxrWKXV2GxEUqEyoHjyw8fVML7dv+ZsYnF68r
         srzhdRplvG3nlFdFBCcqkwBVu7yssSa3tHT67a8Fb12/JOWM4bh80pBEtfIRKHS04NVu
         EzQY264QtuqH4vE13cI5If/1Od+EBqBjyws6NewdZHcvQxpLZYKj8uqHDYBKFBy1gT44
         TiCf3SH6Imx9foi/9lc+2XCY9OMakPN4IGzLyaIHqvIzX6Y3iv3WL6vrElWXWo1gq5Cm
         r3m4BNsqrcPPdGMbvpmLTvflmcDB4ko2/geCMb0KebjXk6gGgcWAMnN3YVUU6k5YI+gE
         xB1Q==
X-Gm-Message-State: AJcUukfnzq9kQUE15M4j6/DaV6HtYDkrm5TJvz6ApOZxQFkXKe0Yb5tS
        9ZSmTopyGft6Bl5ffFoAr7vHdS/qXJcQNrrpa/Y=
X-Google-Smtp-Source: ALg8bN4uCqUOUFfw475Pcyj0A0w91QqUx087cSrBbXEBZUumneLq5iLKb6wv/XlhWiU0/Ec0R08PUE35VSYoPtGFjr4=
X-Received: by 2002:a67:f43:: with SMTP id 64mr746534vsp.166.1548245287510;
 Wed, 23 Jan 2019 04:08:07 -0800 (PST)
MIME-Version: 1.0
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au> <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
 <20190123113812.e3nojtxjxywmg4gn@verge.net.au> <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jan 2019 13:07:55 +0100
Message-ID: <CAMuHMdVkFJ7Cy-+tNHsOcYaxDj82WjMynuFuPRXa4k=DH2fGCQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Fabrizio,

On Wed, Jan 23, 2019 at 1:01 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 23 January 2019 11:38
> > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
> >
> > On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrote:
> > > On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wrote:
> > > > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Castro wrote:
> > > > > According to the latest information, clkp2 is available on RZ/G2.
> > > > > Modify CAN0 and CAN1 nodes accordingly.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

> > > Thanks again, applied for v5.1.
> >
> > Sorry, I was a little hasty there.
> >
> > This patch depends on the presence of R8A774A1_CLK_CANFD which
> > (rightly) is added in a different patch in this series which is to
> > go upstream via a different tree.
> >
> > I have dropped this patch for now. I think there are two solution to this
> > problem.
> >
> > 1. Provide a version of this patch which uses a numeric index instead of
> >    R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is present in an
> >    RC release provide a patch to switch to using R8A774A1_CLK_CANFD.
> >
> > 2. Defer this patch until R8A774A1_CLK_CANFD is present in an RC release.
>
> Yeah, my personal preference is solution 2.

Note that solution 2 will probably defer the DT patch to v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
