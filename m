Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1753C49ED7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 18:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 871D1214D9
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568659449;
	bh=pbTap0qQESXbY2wcTrAFWEhhJ5izJs0ygVfo35DBPjU=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=c34f+PXFhITvTPfFMLLzZ9Haf2IrunSk81wGv81Amr0SYJ+dfsoXr8Cr6BoXtmlwM
	 u5EiWuwn+bpYBWsbOjmsRRW8rqOxYLRYN+7bHJXpgCT7pcySi2jFiDCd4bCt3Aga32
	 l36MI8YtiMaeDUuqxZabBJlm30qWK5Eyg2SwqY8Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730090AbfIPSoJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 14:44:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:49026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730088AbfIPSoJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Sep 2019 14:44:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A55720665;
        Mon, 16 Sep 2019 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568659448;
        bh=pbTap0qQESXbY2wcTrAFWEhhJ5izJs0ygVfo35DBPjU=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=Kqn8UbqrH9ON5pkKL491zhG6FHe75och86calYcDDJgBJ/X2G5zDTwrKELX8cWyDB
         WUS8YJcmp3lwhIx3pMhqptM5YaixggRIAI0Oziezj6/dwBYvWT5eHyrQJxBvZ8rUKS
         a9Lc6TsCVa9nw62xHdj6fWNtvE+PLFHTo+mqyK2Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA+hA=QoZFFb_EVfxcDuJB-9VobVd-1-RyhWeNTSePxW50P8Eg@mail.gmail.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-4-git-send-email-aisheng.dong@nxp.com> <20190906170643.B310F20578@mail.kernel.org> <CAA+hA=QoZFFb_EVfxcDuJB-9VobVd-1-RyhWeNTSePxW50P8Eg@mail.gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
To:     Dong Aisheng <dongas86@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V4 03/11] clk: imx: scu: add two cells binding support
User-Agent: alot/0.8.1
Date:   Mon, 16 Sep 2019 11:44:07 -0700
Message-Id: <20190916184408.8A55720665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-09-09 03:23:25)
> Hi Stephen,
>=20
> Thanks for the review.
>=20
> On Sat, Sep 7, 2019 at 5:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dong Aisheng (2019-08-20 04:13:17)
> > > diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8=
qxp.c
> > > index 5e2903e..1ad3f2a 100644
> > > --- a/drivers/clk/imx/clk-imx8qxp.c
> > > +++ b/drivers/clk/imx/clk-imx8qxp.c
> > > @@ -134,7 +134,12 @@ static int imx8qxp_clk_probe(struct platform_dev=
ice *pdev)
> > >                                 i, PTR_ERR(clks[i]));
> > >         }
> > >
> > > -       return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get=
, clk_data);
> > > +       if (clock_cells =3D=3D 2)
> >
> > Can you just read this from the DT node again instead of having a global
> > variable called "clock_cells" for this?
> >
>=20
> I tried thinking about it.
> One problem is that we also need this information in the exist clk
> registration API to
> keep the backwards compatibility:
> e.g.
>  static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
>                                          u8 clk_type)
>  {
> -       return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
> +       if (clock_cells =3D=3D 2)
> +               return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_=
type);
> +       else
> +               return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
>  }
>=20
> Parsing it for all clocks seems not good.

Can you parse it once for the clock controller and then pass it to the
registration function as the number of cells? I dislike the global and
the name of the global.

>=20
> In the future, i planned to totally remove the legacy binding support whi=
ch
> is a premature one and missing continued support.
> Then we will also remove this unneeded clock_cells.

Ok sure.

