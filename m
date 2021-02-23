Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43143C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 01:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E04A664E4A
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 01:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhBWBCn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Feb 2021 20:02:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:34840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230179AbhBWBCm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Feb 2021 20:02:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 381BC64E2E;
        Tue, 23 Feb 2021 01:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614042121;
        bh=lv0YbuJHNgCGE7yojRyC3RU2ldeJzKDTfRZQ2c7tVLs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N8Xv70N/W6WCR/Ux/r300sdmBBHOC+hSExhL7/qHvXictwKxa/Ntn8f6IBoio7Dlu
         NLgx91fb1c5tl6nIDOqxuU35DfsNj3XIVXFK3Kmkjve58c6sIVQLD7QccCrQ9YRjEs
         fJp16Fny31gUYwYsSQIBO9hOJus3AOYN7YqSgy+jeT/93Kj52FGMr6mVvi4+Ribr3S
         fK5i5JeqAR09sPQwRgjt4vck+1HbbFCeMyl5seK/13Xzb8GQkhRYyG6HMLt+BVHJDh
         gLxxxismGH3lEBopceJH2dfXFZVbTW4L7gqmF/s0ykhYPhkhTWzf3O2wBadKwvFZ8c
         zfNIpxlwnwK3A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKfKVtHVRT-8-yCwAt8+8RkS5Mi7v2RHSFg8wMNw75VkmUa+tQ@mail.gmail.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com> <20210218093715.7fdc27ee@xps13> <161369795774.1254594.6203789110347055936@swboyd.mtv.corp.google.com> <CAKfKVtHVRT-8-yCwAt8+8RkS5Mi7v2RHSFg8wMNw75VkmUa+tQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] clk: clock-wizard: Remove the hardcoding of the clock outputs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Mon, 22 Feb 2021 17:01:59 -0800
Message-ID: <161404211975.1254594.9689445473737784408@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-02-21 22:47:26)
> Hi Stephen,
>=20
> On Fri, Feb 19, 2021 at 6:55 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Miquel Raynal (2021-02-18 00:37:15)
> > > Hi Shubhrajyoti,
> > >
> > > Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 F=
eb
> > > 2021 10:19:50 +0530:
> > >
> > > > The number of output clocks are configurable in the hardware.
> > > > Currently the driver registers the maximum number of outputs.
> > > > Fix the same by registering only the outputs that are there.
> > > >
> > > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > > > ---
> > > > v4:
> > > > Assign output in this patch
> > > >
> > > >  drivers/clk/clk-xlnx-clock-wizard.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-=
xlnx-clock-wizard.c
> > > > index ed3b0ef..d403a74 100644
> > > > --- a/drivers/clk/clk-xlnx-clock-wizard.c
> > > > +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> > > > @@ -473,6 +473,7 @@ static int clk_wzrd_probe(struct platform_devic=
e *pdev)
> > > >       unsigned long rate;
> > > >       const char *clk_name;
> > > >       struct clk_wzrd *clk_wzrd;
> > > > +     int outputs;
> > > >       struct device_node *np =3D pdev->dev.of_node;
> > > >
> > > >       clk_wzrd =3D devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_=
KERNEL);
> > > > @@ -541,6 +542,7 @@ static int clk_wzrd_probe(struct platform_devic=
e *pdev)
> > > >               goto err_disable_clk;
> > > >       }
> > > >
> > > > +     outputs =3D of_property_count_strings(np, "clock-output-names=
");
> > >
> > > A check on outputs validity is probably welcome.
> > >
> > > Also I usually prefer noutputs or nb_outputs for such variable name,
> > > which implies a number rather than an array, but this is personal tas=
te.
> >
> > Ideally we get rid of clock-output-names and generate them at runtime
> > instead based on some combination of device name and something else.
>=20
> Makes sense. However it may break the current binding.
> Do you think that shoud be okay?

I think it is OK given that the current binding is for the staging tree.
The assumption is those bindings aren't stable.
