Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546EDC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 14:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3764760F5A
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 14:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhKCOfu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Nov 2021 10:35:50 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:19518 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230527AbhKCOfu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Nov 2021 10:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1635949993; x=1667485993;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pJAsKtNWJZ+3fuNEDZ1Kmz6SYBd89CM0v2sSHcQlJEw=;
  b=Os9Tk9unTHIcVLWx/+IXHlvph5C4JRB2FvGB4z5lZ389QcUXZAFOd9x4
   p1AenSbRg4gX+xq+QPjd1398d+AlaNaZiIesZmzZ/eIMqBGFEFzYfopfg
   ATdTHwPggq4lRp9vJXbySHs7+XKz0aQvz2H24/XaBaE+it4AajV8VYKCC
   lP335RM/lkrUz5+lRvVURk5YT4l7Owzl3XbUWajsV6wRH9ztTNoocVZVN
   qmqestcLrjMjitwutoH+6FdS3R0BKfiThnc13Gj2qJWupToj894CedcrJ
   QAvvyHnbxi6xZlgahtq17jFZ5AyHZzCGQr4NAYx4SIRCpZwCicCG6FvIj
   A==;
X-IronPort-AV: E=Sophos;i="5.87,206,1631570400"; 
   d="scan'208";a="20326900"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Nov 2021 15:33:11 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 03 Nov 2021 15:33:11 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 03 Nov 2021 15:33:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1635949991; x=1667485991;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pJAsKtNWJZ+3fuNEDZ1Kmz6SYBd89CM0v2sSHcQlJEw=;
  b=BFtD4qL3i2YeLHCy16pev6cLxY/mmLdBQa0AMlHMfxn2blvOFhAloCjX
   sDPx+holsqeMO1vOe9fEmvV1Y7OZdmOWSf6TID/IVOSP0UFCiLmRFk23r
   8W/9nqWukrs6TCo0WQpyuiZ1OSGbkZNlp5c0rr8xxPIW7BHT6Y9fHhc0h
   UskMZMBIQyCPGyZWDj2IznyDXeC1svQpunLDbHtp4eMaCncABRdAZKj4F
   8pOzOPJyU71tW716o5/JjvIKB8GcTA7xPDirKE30UbJWd9rNDXABj0qkm
   U8CGtQpk6TvGN4rvsFC5ovuggFfSVGm8HtUSU2+c1/kbSCe0cmWs3NvGV
   w==;
X-IronPort-AV: E=Sophos;i="5.87,206,1631570400"; 
   d="scan'208";a="20326899"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Nov 2021 15:33:11 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 93497280065;
        Wed,  3 Nov 2021 15:33:11 +0100 (CET)
Message-ID: <58a9758565f4cd6d7afd2c781fa51f2afe4d2ca9.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE
 for non-regular composites
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>
Date:   Wed, 03 Nov 2021 15:33:09 +0100
In-Reply-To: <CAHCN7xJw02XxfWYt_DCKX0p02sPxTMgghYCLaVMJJ4mJXpsKMw@mail.gmail.com>
References: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
         <CAHCN7xJw02XxfWYt_DCKX0p02sPxTMgghYCLaVMJJ4mJXpsKMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Mittwoch, dem 03.11.2021 um 09:25 -0500 schrieb Adam Ford:
> On Wed, Nov 3, 2021 at 7:41 AM Alexander Stein
> <
> alexander.stein@ew.tq-group.com
> > wrote:
> > Only imx8m_clk_hw_composite_core needs to set this flag.
> > 
> > Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite
> > wrappers")
> > Signed-off-by: Alexander Stein <
> > alexander.stein@ew.tq-group.com
> > >
> > ---
> > This is from clk_summary on a imx8mq custom board where you can
> > clearly
> > see the before the divider is limited to 8 (core composite)
> > 
> > before:
> > video_pll1_out        2        2        0  1031999997          0   
> >   0  50000         Y
> >    dsi_phy_ref        1        1        0   129000000          0   
> >   0  50000         Y
> >    lcdif_pixel        2        2        0   129000000          0   
> >   0  50000         Y
> > 
> > after:
> > video_pll1_out        2        2        0  1031999997          0   
> >   0  50000         Y
> >    dsi_phy_ref        1        1        0    24000000          0   
> >   0  50000         Y
> >    lcdif_pixel        2        2        0    68800000          0   
> >   0  50000         Y
> > 
> >  drivers/clk/imx/clk.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> 
> I attempted to apply this against linux/master and it doesn't apply.
> What branch did you use?

The referenced commit a60fe746df94 is not in Linus' tree yet, but in
linux-next. My patch is based on linux-next/next-20211101. Sorry missed
to mention that.

Best regards,
Alexander

> > > 
> > index 819949973db1..7d220a01de1f 100644
> > --- a/drivers/clk/imx/clk.h
> > +++ b/drivers/clk/imx/clk.h
> > @@ -391,11 +391,11 @@ struct clk_hw *__imx8m_clk_hw_composite(const
> > char *name,
> > 
> >  #define imx8m_clk_hw_composite(name, parent_names, reg) \
> >         _imx8m_clk_hw_composite(name, parent_names, reg, \
> > -                       IMX_COMPOSITE_CORE,
> > IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
> > +                       0, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
> > 
> >  #define imx8m_clk_hw_composite_critical(name, parent_names, reg) \
> >         _imx8m_clk_hw_composite(name, parent_names, reg, \
> > -                       IMX_COMPOSITE_CORE,
> > IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> > +                       0, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> > 
> >  #define imx8m_clk_hw_composite_bus(name, parent_names, reg)    \
> >         _imx8m_clk_hw_composite(name, parent_names, reg, \
> > --
> > 2.25.1
> > 


