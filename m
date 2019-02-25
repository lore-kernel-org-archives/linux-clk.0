Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAC2C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43E052087C
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="YjidqOXW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfBYJ1N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:27:13 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfBYJ1M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Feb 2019 04:27:12 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D0C7825B784;
        Mon, 25 Feb 2019 20:27:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551086831; bh=ZkzSMiFsx+9/GsfzDRGY88+mQ6EyLFDCQUDLSaaZZdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YjidqOXWRIUDWtC+qJ42Co7u7R9LcziZxgozRDpPLMFivDzFu2zoU/ZjGRcDGqb/P
         Kk7s3/PzzYeoXKJt+cBu6LhU5PoArqzuoG0oXQyIhh+r8NVaxCGwew/lhJsNCjg8w6
         rpn60xM05MHqzYbfL+E2nbML6TF/agboRToXK+FY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F0E9C94056F; Mon, 25 Feb 2019 10:27:08 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:27:08 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Message-ID: <20190225092708.cwormmuqdm3g4umy@verge.net.au>
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 22, 2019 at 12:01:21PM +0000, Chris Paterson wrote:
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 22 February 2019 12:00
> > 
> > Enum LAST_DT_CORE_CLK needs updating as R8A774A1_CLK_CANFD
> > was recently added and it's the core clock with the highest
> > index.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

I think this needs:

Fixes: 9d034e151b40 ("clk: renesas: r8a774a1: Add missing CANFD clock")

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> > ---
> >  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > index 5fcd6c5..8e7bb43 100644
> > --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > @@ -21,7 +21,7 @@
> > 
> >  enum clk_ids {
> >  	/* Core Clock Outputs exported to DT */
> > -	LAST_DT_CORE_CLK = R8A774A1_CLK_OSC,
> > +	LAST_DT_CORE_CLK = R8A774A1_CLK_CANFD,
> > 
> >  	/* External Input Clocks */
> >  	CLK_EXTAL,
> > --
> > 2.7.4
> 
