Return-Path: <SRS0=1SIp=RQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42C5C43381
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 16:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D9B62077B
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552494247;
	bh=/ZmvsKjpEWJJ4zAr3XbjzZMc87BlSrdPZQbEkOzcXV0=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=s3d7Y50+7nRzhac97pkKs+G5rwqODRL6nvtCjj2hksaeQM49llP7inyEbKiy6VWif
	 5wDxpa79QZeGuPKfHwM4YKQRs37bJdcWzwhJvW5tmi0Nf4CgwQuP8QlcHx5VLILLdD
	 OA+Z70MnGCXeDrdmsUIuRZmHTOAt0ZnaCR6Ap9HU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfCMQYH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:24:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbfCMQYG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Mar 2019 12:24:06 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2F5A2075C;
        Wed, 13 Mar 2019 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552494245;
        bh=/ZmvsKjpEWJJ4zAr3XbjzZMc87BlSrdPZQbEkOzcXV0=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=QL2Dujf9zVpRDwhiJT2QyJloApkbJYNJiTRw7MhImiFtJFSczoAlqJVO4YzXhKk3j
         ermq83P4vxJ/XpAEb6LMWEPQHb8O9H2RCWTELlhxdwxlgv3FdpznSL5jFz5MKaftlq
         nNqblc1v3lKt1h64k9rzln//X7XKlXE2jfeFi5Ds=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190312182546.24e46c5c@litschi.hi.pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de> <20190312110016.29174-2-m.tretter@pengutronix.de> <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com> <20190312182546.24e46c5c@litschi.hi.pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Message-ID: <155249424471.20095.16028115604342624987@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 13 Mar 2019 09:24:04 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-12 10:25:46)
> On Tue, 12 Mar 2019 09:49:21 -0700, Stephen Boyd wrote:
> > Quoting Michael Tretter (2019-03-12 04:00:12)
> > > CLK_FRAC is not set in the divider->flags, but in the hw->flags.
> > >=20
> > > The firmware sets CLK_FRAC for fractional clocks in the clkflag field.
> > > When registering the devider, these clkflags are copied to hw->flags.
> > >=20
> > > Moreover, divider->flags field is a u8 type, but CLK_FRAG is BIT(13).=
 So
> > > this check would never work.
> > >=20
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  drivers/clk/zynqmp/divider.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divide=
r.c
> > > index a371c66e72ef..fc70950c1e24 100644
> > > --- a/drivers/clk/zynqmp/divider.c
> > > +++ b/drivers/clk/zynqmp/divider.c
> > > @@ -117,7 +117,7 @@ static long zynqmp_clk_divider_round_rate(struct =
clk_hw *hw,
> > >         bestdiv =3D zynqmp_divider_get_val(*prate, rate);
> > > =20
> > >         if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
> > > -           (divider->flags & CLK_FRAC))
> > > +           (clk_hw_get_flags(hw) & CLK_FRAC)) =20
> >=20
> > CLK_FRAC shouldn't be set in the struct clk_hw::core::flags field. It's
> > not a clk framework flag so it shouldn't go there. Please fix the user
> > of this flag to place the CLK_FRAC flag somewhere else. Even adding it
> > into divider::flags is not a good idea because that numberspace is for
> > dividers, and this flag seems to be zynqmp driver specific, so maybe
> > just add a bool to the zynqmp_clk_divider?
> >=20
>=20
> Thanks. The driver sets the clk_hw::core::flags based on a response
> from the ATF and this response includes this flag with other clk
> frameworks flags. I can test for the flag when registering the clock
> and set another flag or a bool for the zynqmp_clk_divider and will do
> so in v2.

Cool. Thanks!

>=20
> However, this merely sounds like a workaround for an issue in the ATF,
> which should not define and use this flag in the first place.=20
>=20

What is ATF doing with these flags? Hopefully ATF and the Linux kernel
aren't using the same numberspace to describe these things. For example,
I would be concerned if ATF was looking at the CLK_SET_RATE_PARENT flag
and passing that value from firmware to the kernel, blindly assuming
that the kernel wouldn't change those numbers to be something else.
Obviously that type of kernel change would be invasive but it's not an
ABI that we've ever published so we're free to do these sorts of things.

