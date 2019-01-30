Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D256C282D9
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 10:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44F5B218A3
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 10:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="YgxmRuMd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729050AbfA3KKz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:10:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39191 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfA3KKz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 05:10:55 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 97FA625B74E;
        Wed, 30 Jan 2019 21:10:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548843053; bh=F0CjEfNU7oYPhyaCNhciVlkqvXsCCpwZu4SQIb5QJfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YgxmRuMdsn2TDv2maYtuT3Mo9jO9Ewka9JbMdSW/72sSEZCWnvCPb9rXIK64OEIr7
         MQ3IuRGeeo5Wjk6dQ7lyu/zmo7SNjB11wK7HjYt+8lb1ZsnGe7/bR0rbV+Zn5Tw36n
         rFCdA2PUkWkXCjTrtyua7ryN6r86ZlmG32eMkcJo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CE1BC94043D; Wed, 30 Jan 2019 11:10:51 +0100 (CET)
Date:   Wed, 30 Jan 2019 11:10:51 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2
 clock divider
Message-ID: <20190130101051.pyypubp2fnnxalyr@verge.net.au>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
 <20190130094029.9604-6-horms+renesas@verge.net.au>
 <OSBPR01MB21036AEED543FE6DD9001E0CB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB21036AEED543FE6DD9001E0CB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 30, 2019 at 09:43:31AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the patch
> 
> > Subject: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2 clock
> > divider
> >
> > On the RZ/G2E (r8a7745) SoC the Z2FC bits of the RFQCRC register, which
> > control the frequency division ratio for the Z2φ clock are located at bit[12:8]
> > rather than the more common location bit[4:0].
> >
> > This change is made with reference to the User's Manual v0.61.
> >
> > Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-
> > gen3-cpg.c
> > index d21fdeb520e1..dfd2b9caeaf5 100644
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> > @@ -450,6 +450,10 @@ static const struct soc_device_attribute
> > cpg_quirks_match[] __initconst = {
> >  .soc_id = "r8a77990",
> >  .data = (void *)Z2FC_BIT_MASK_SFT_8,
> >  },
> > +{
> > +.soc_id = "r8a7745",
> > +.data = (void *)Z2FC_BIT_MASK_SFT_8,
> > +},
> >  { /* sentinel */ }
> >  };
> 
> 
> RZ/G2E  SoC id is r8a774c0.

Yikes! Silly me.
