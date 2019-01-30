Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF36C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 10:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 709BE2184D
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 10:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="SaIOdiZ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfA3KLx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:11:53 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39215 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbfA3KLx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 05:11:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D88AB25B74E;
        Wed, 30 Jan 2019 21:11:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548843111; bh=4cpE5/etLvjF8fFIzOYAdEN5q13NeSmbD4SK4X5ig2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SaIOdiZ/qwciBF+wm2kjx4Nxc4UZvMTsPibp1aWuyOykiqakuhE8PiWad2N5VUwCX
         qucUt21VG2nPJkLduQVYJtZqOosTNtmoQfUNEywHKD6Z9dSD0WFYoJBsRyKJlUdRdj
         ze9AWY4V3PM44Eb4YIKUJVVLGXksDW0yKnJtOx/U=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1E34994043D; Wed, 30 Jan 2019 11:11:49 +0100 (CET)
Date:   Wed, 30 Jan 2019 11:11:49 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a
 variable clock
Message-ID: <20190130101148.xjtulgx2zhx3n2e5@verge.net.au>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
 <20190130094029.9604-7-horms+renesas@verge.net.au>
 <OSBPR01MB2103B656FF9DCBCC2F48E9A3B8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103B656FF9DCBCC2F48E9A3B8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 30, 2019 at 09:46:35AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the patch
> 
> > Subject: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a variable
> > clock
> >
> > On the RZ/G2E (r8a7745) SoC the Z2 clock is not a fixed clock.
> > Rather it is a clock with:
> 
> RZ/G2E SoC id is r8a774c0.

Sorry about that, somehow I got confused.

> > * A parent of CLK_PLL0 running at 4.8GHz
> > * A fixed divider of 4
> > * A variable divider controlled by the Z2FC bits of the RFQCRC register
> >
> > This can be described using the DEF_GEN3_Z with a clock type of
> > CLK_TYPE_GEN3_Z2.
> >
> > This change is made with reference to the User's Manual v0.61.
> >
> > Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  drivers/clk/renesas/r8a7745-cpg-mssr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c
> > b/drivers/clk/renesas/r8a7745-cpg-mssr.c
> > index 493874e5ebee..f2ea72d9d663 100644
> > --- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
> > @@ -53,7 +53,7 @@ static const struct cpg_core_clk r8a7745_core_clks[]
> > __initconst = {
> >  DEF_BASE("qspi", R8A7745_CLK_QSPI, CLK_TYPE_GEN2_QSPI,
> > CLK_PLL1_DIV2),
> >  DEF_BASE("rcan", R8A7745_CLK_RCAN, CLK_TYPE_GEN2_RCAN,
> > CLK_USB_EXTAL),
> >
> > -DEF_FIXED("z2",    R8A7745_CLK_Z2,CLK_PLL0,    1, 1),
> > +DEF_GEN3_Z("z2",   R8A77990_CLK_Z2,     CLK_TYPE_GEN3_Z2,
> > CLK_PLL0, 4),
> 
> Looks like wrong file name.  it is supposed to be r8a774c0-cpg-mssr.c
> 
> >  DEF_FIXED("zg",    R8A7745_CLK_ZG,CLK_PLL1,    6, 1),
> >  DEF_FIXED("zx",    R8A7745_CLK_ZX,CLK_PLL1,    3, 1),
> >  DEF_FIXED("zs",    R8A7745_CLK_ZS,CLK_PLL1,    6, 1),
> > --
> > 2.11.0
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 
