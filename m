Return-Path: <SRS0=Z7Th=RR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB554C43381
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 15:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EAE72184E
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552578356;
	bh=VrEeyG/2ic1d+xc3Z6NpPPnT1+32K3iUIB5ZVSPenGs=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=As5UK/5FkW77FwtNGWXRAd+4HkJ89GqNY7BVteOjqtKsLv6CJYCGbEOlD89WyK1Ro
	 6myIJ6NrYQqbbbJIHLbeKPgcGNoEZbl5zmenTt4ApCa9Rw467eSaJw988qxYlPS+Fg
	 5fbm6vf2KUGgrDnbnCNhvYI6HZF99EnmXWawuuNk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfCNPp4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Mar 2019 11:45:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfCNPpz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Mar 2019 11:45:55 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E948820811;
        Thu, 14 Mar 2019 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552578355;
        bh=VrEeyG/2ic1d+xc3Z6NpPPnT1+32K3iUIB5ZVSPenGs=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=Al0n8OyCn6As8u7pOYS0XtVfZq0kvR7xqASF70c4a+2szuCDF3Tm7X68cqcP42Qeu
         +VDKhWBFXXOzzZTmfvtA0OggpSPvkYL152UuKHdGZsYQMQT+KRl69kvK9uuyOY5/X5
         ipTMZ7Tvu5sWizU2Cm3EIiq+ku0UyMIYxoUd72XQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190314093836.6a70abc7@litschi.hi.pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de> <20190312110016.29174-2-m.tretter@pengutronix.de> <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com> <20190312182546.24e46c5c@litschi.hi.pengutronix.de> <155249424471.20095.16028115604342624987@swboyd.mtv.corp.google.com> <20190314093836.6a70abc7@litschi.hi.pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Message-ID: <155257835410.20095.18419234559322879166@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 14 Mar 2019 08:45:54 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-14 01:38:36)
> On Wed, 13 Mar 2019 09:24:04 -0700, Stephen Boyd wrote:
> > Quoting Michael Tretter (2019-03-12 10:25:46)
> > >=20
> > > However, this merely sounds like a workaround for an issue in the ATF,
> > > which should not define and use this flag in the first place.=20
> > >  =20
> >=20
> > What is ATF doing with these flags? Hopefully ATF and the Linux kernel
> > aren't using the same numberspace to describe these things. For example,
> > I would be concerned if ATF was looking at the CLK_SET_RATE_PARENT flag
> > and passing that value from firmware to the kernel, blindly assuming
> > that the kernel wouldn't change those numbers to be something else.
> > Obviously that type of kernel change would be invasive but it's not an
> > ABI that we've ever published so we're free to do these sorts of things.
>=20
> You mean that the ATF defines macros like
>=20
>         #define CLK_SET_RATE_GATE       BIT(0) /* must be gated across ra=
te change */
>         #define CLK_SET_PARENT_GATE     BIT(1) /* must be gated across re=
-parent */
>         #define CLK_SET_RATE_PARENT     BIT(2) /* propagate rate change u=
p one level */
>=20
> in plat/xilinx/zynqmp/pm_service/pm_api_clock.h, sets the flags in the
> response to the Linux driver, and the Linux driver copies the flags
> that it got from the ATF to clk_hw::core::flags like
>=20
>         init.flags =3D nodes->flag;
>=20
> where nodes is the response from the ATF? That's exactly what is happenin=
g.

Yes, that looks like a strong coupling between firmware and OS
implemented in a non-obvious way.

>=20
> So instead of only translating CLK_FRAC, the driver should actually
> translate all flags in the ATF response to proper clk framework flags
> instead of blindly copying them, right?
>=20

Sure. The CLK_FRAC will have to be filtered out anyway it sounds like.

