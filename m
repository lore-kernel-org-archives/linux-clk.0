Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DA9C49ED7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 20:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59893206C2
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 20:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568664798;
	bh=VqTApZB+W2BAABhT/1pGOKJALF3Ws1MQqDPBAxpRMYc=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=KS9C94Ojwz0YE/RjtKYy8CYsHjLB3tCqAreV1flcgeXhxBYtxQFSeStZ1UGmxhzJH
	 u6zPkuFbf4cY0Zltnq3fwWXr2o8reoC2XovWXjrYYRAhw+tPygovxaCjZxaR6m/Yl/
	 iyC70kgLCqC0DJK7cQoUIWtKomc9DEimaWsAKcGw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732938AbfIPUNS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 16:13:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:46408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732909AbfIPUNS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Sep 2019 16:13:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED7EB20665;
        Mon, 16 Sep 2019 20:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568664797;
        bh=VqTApZB+W2BAABhT/1pGOKJALF3Ws1MQqDPBAxpRMYc=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=r3dTk6P8zjAg6TkEa80bWORIo8VXLlBjcQtZrmcNitoDS84MFu36aaRSXI9RqoNjR
         bBoX3MYs/3q3LKOx6YmuCmwoMQ09u4V7C3NFPt4o/MsefWqLNsFmAaDIpDI6I0JwT3
         xC0mSdRIUff+GJLyK0YsC0iSHbmYAA+kUKeQGssA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190911174948.sblu4qn44sfh3cyy@pengutronix.de>
References: <20190823100315.2148-1-ada@thorsis.com> <20190911160648.6F88D2075C@mail.kernel.org> <20190911174948.sblu4qn44sfh3cyy@pengutronix.de>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
To:     <u.kleine-koenig@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
User-Agent: alot/0.8.1
Date:   Mon, 16 Sep 2019 13:13:16 -0700
Message-Id: <20190916201316.ED7EB20665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

(Sorry my MUA fails at utf8 encoding emails)

> On Wed, Sep 11, 2019 at 09:06:47AM -0700, Stephen Boyd wrote:
> > > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.t=
xt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > index b646bbcf7f92..1d4942380918 100644
> > > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not follow=
ed by any non-zero entry.
> > >          compatible =3D "fsl,imx-uart";
> > >          reg =3D <0xa000 0x1000>;
> > >          ...
> > > -        clocks =3D <&osc 0>, <&pll 1>;
> > > -        clock-names =3D "baud", "register";
> > > +        clocks =3D ...
> > > +        clock-names =3D ...
> >=20
> > I don't see the need for this change.
>=20
> <&pll 1> is mentioned below. But it is not this instance that is
> relevant. So I suggested to get rid of it to not be a source of
> confusion. (But I guess you understood that.)

Yes.

>=20
> > >          assigned-clocks =3D <&clkcon 0>, <&pll 2>;
> > > -        assigned-clock-parents =3D <&pll 2>;
> > > +        assigned-clock-parents =3D <&pll 1>;
> > >          assigned-clock-rates =3D <0>, <460800>;
> > >      };
> > > =20
> > > -In this example the <&pll 2> clock is set as parent of clock <&clkco=
n 0> and
> > > -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> > > +In this example the <&pll 1> clock is set as parent of clock <&clkco=
n 0> and
> > > +the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A pa=
rent
> > > +setting for <&pll 2> is omitted (end of list) and rate setting for <=
&clkcon 0>
> > > +is skipped because set to <0>.
> >=20
> > Maybe you can comment that the "clocks" and "clock-names" properties
> > don't matter for assigned clk rates and parents.
>=20
> Sure, a long text can explain this, but a maximal simple example is
> very beneficial, too.
>=20

The paragraph at the start of "Assigned clock parents and rates" already
explains how these properties work. This patch isn't going to help if
the reader hasn't read that paragraph, so reordering things isn't
providing more clarity. If anything, I would clarify the description of
the example by indicating what parts of the example we're talking about
when explaining, i.e.

	In this example the <&pll 2> clock is set as parent of the
	<&clkcon 0> clock because the first clock specifier in the
	assigned-clocks property is <&clkcon 0> and that matches the
	first clock specifier in the assigned-clock-parents property.
	Similarly the <&pll 2> clock is assigned a frequency value of
	460800 Hz because the second frequency in the
	assigned-clock-rates property is 460800 Hz and that matches the
	second clock specifier in the assigned-clocks property <&pll 2>.

