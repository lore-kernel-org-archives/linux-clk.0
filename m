Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8D8C49ED7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 18:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 657C920830
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568659506;
	bh=GuCx8CbzJWU7fsB5PLSGwh7YL/SIJdzE0AFcQ+lRqIU=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=HonmzrqJzSAIg/KSw1i46CNUN2Gv9Js+4gfV8XbwyL0OlvWbzGpS/7FV1iZRBPjDV
	 QBct8jw8gXVORw2ab9Jz0cMnBtbxAC+tIjAwa6ZHZseiMZiOgq36Fy0CBlPGHv1chA
	 T6FwNe2+jX6aHjKGczkLf+ipA/dXoklrNP+pmC6w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730088AbfIPSpG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 14:45:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730015AbfIPSpG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Sep 2019 14:45:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 256CB20665;
        Mon, 16 Sep 2019 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568659505;
        bh=GuCx8CbzJWU7fsB5PLSGwh7YL/SIJdzE0AFcQ+lRqIU=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=NgjThRYrSkBw0Hk9jyFUNFvDJXkJakVGdDGftQw+53bo/6/PV6mtYkfigz1sZBEye
         UFLn4I4TBGWAe603yhyC8+yFNukHrvUhEvOgO4pkw/iPec7fVaCQinXpiRK29yffYZ
         mKYVPeAniMDgCIJReeXdk17CpXz6czGyoS0l+xbA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA+hA=QJwfHsRA+G2oT2awLxx659qXLPsiECV6VYcJ181c6D8w@mail.gmail.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-9-git-send-email-aisheng.dong@nxp.com> <20190906171323.8847820640@mail.kernel.org> <CAA+hA=QJwfHsRA+G2oT2awLxx659qXLPsiECV6VYcJ181c6D8w@mail.gmail.com>
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
Subject: Re: [PATCH V4 08/11] clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
User-Agent: alot/0.8.1
Date:   Mon, 16 Sep 2019 11:45:04 -0700
Message-Id: <20190916184505.256CB20665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-09-09 04:23:14)
> ]On Sat, Sep 7, 2019 at 5:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dong Aisheng (2019-08-20 04:13:22)
> > > Add parsing clocks from device tree.
> >
> > Please describe some more here.
>=20
> Will improve.
>=20
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       base =3D devm_ioremap_resource(&pdev->dev, res);
> > > +       if (IS_ERR(base))
> > > +               return PTR_ERR(base);
> > > +
> > > +       count =3D of_property_count_u32_elems(np, "clock-indices");
> > > +       if (count < 0) {
> > > +               dev_err(&pdev->dev, "failed to count clocks\n");
> > > +               return -EINVAL;
> > > +       }
> >
> > Is 'count' expected to be equal to IMX_LPCG_MAX_CLKS? Because later on
> > in this function we set the num of clks to the MAX instead of the count
> > from clock-indices.
> >
>=20
> No. Here is a tricky to ease the clk getting.
> For example, one LPCG supports up to 8 clock outputs which each of them
> is fixed to 4 bits. Then we can easily use the bit-offset/clk-indices
> parsed from DT
> to fetch the corresponding clock by hws[clkspec->args[0] / 4].
> And the cost is very limited with only a few pointers.

Ok. Can you add a comment into the code to explain this?

