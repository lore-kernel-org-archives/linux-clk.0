Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA211A9FBA
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 03:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785987443; cv=none; b=tDlmk+IGJ5Rn5mT4qXCDKJdtE/Z9UbK+OIfy19wsfCq16j37iinq/OggNL1EtiCssHucSnlp/IbRQF0qjfofPnRDA+AVk2xU4eqagmpVNfS6B8RFqEF/K6Sl+afd3EkI7gvOU+epGWLyYROTjI4TIbimvAm6E86OwSFiavNnzGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785987443; c=relaxed/simple;
	bh=M4ndehrE9TmXKDgpOHrsed1zLUL8Lrggx3BkNF4M+zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drAf8ED+HGeL2Ds6wpBj13DQZtxsFCmM7D+1KAE0kfZXnUDwKZNIktyY8P5Co3rrvalBWrnS9PWM1gf3hwAbJVi3zwsiMJg7Gt/eMmrcW9RDl9ZPINPu30gLJbtSDBFcJ9WX3L0zIVLY0+M+s/P62aI0pihr1tbIWhQd+aVyhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWRM5JWE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWRM5JWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350991F00A3F
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 03:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785987442;
	bh=1pv7X4tXAdMiXPk9/KG3+TCSrWs4tHj9T3C20LOwQwM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cWRM5JWElJVdKKM7wUexYy4Y+tegpsPdBN4gzOVjMZ4dHcr+YXO4B3fLQDyiYedtG
	 p97LrVpw+E6kbfT0dvkHFGgvd8OQP+U1PHdDq3LbYGVZN4QBkRGLqpOjBDuzp/e/v2
	 ygf2wPrRkV0ykgg1ioUYmzJ48O7MfPt/GsG6dcnDNCZHUT+7FYz/hwFxgAiW91VX1F
	 JidrQ3dSkFPrYvFoiVWkuEy44ya5p50NftK6lWiKNdR+IlImU4G7m5qqkpkbM9yRto
	 uHb7r0JwQxT3rRlTwoMKj2EP7Xhbh+J3odfQLjN+u+Dcbow3cI3Hr9wK0w521sxJHR
	 Z9hD/u1lsHywg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso15148371fa.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 20:37:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSgwyuU9eIYC/GwebEi0jj0P4wShZ2BT1Ye52xNjZVxlIQ4EIh54PDzedt9Bm+IVdLCjkOBZ8lVfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYC3nREcJefh3lBpnD3z+ht643y4h2F15ss51nC7xVS8HnYcJ/
	1eaP1YwmbAfTkFz2fTl8Wfpk9fepI7BunxG1MlWvJVMcjGcetRYyk5u1jHTRmElQfKP3JqxH/T/
	VlrornXP+QCEl4N48HKmYM9yA/8bq9iA=
X-Received: by 2002:a05:651c:150d:b0:39b:32b3:b31f with SMTP id
 38308e7fff4ca-39fbb18fc20mr14082301fa.5.1785987440631; Wed, 05 Aug 2026
 20:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624123914.1767374-1-hello@superkali.me> <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
 <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com> <anPCo9nkOjpBUOlq@redhat.com>
In-Reply-To: <anPCo9nkOjpBUOlq@redhat.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 6 Aug 2026 11:37:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64CjU9iELU8ZsPakY9Y2q8XzdDjD6nC9pn2hZBBBZ5Uxw@mail.gmail.com>
X-Gm-Features: AUfX_mw-2XyvMigeHjUQ3cJnAoRV1KCld6aY7Mca-mzvlFEvAHhu48LDF-78D9s
Message-ID: <CAGb2v64CjU9iELU8ZsPakY9Y2q8XzdDjD6nC9pn2hZBBBZ5Uxw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniele Briguglio <hello@superkali.me>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Ricardo Pardini <ricardo@pardini.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 7:09=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Hi Chen-Yu,
>
> On Thu, Aug 06, 2026 at 01:00:02AM +0800, Chen-Yu Tsai wrote:
> > On Mon, Jun 29, 2026 at 3:13=E2=80=AFAM Heiko Stuebner <heiko@sntech.de=
> wrote:
> > >
> > >
> > > On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> > > > No in-tree board references these gates yet. Boards drive the codec
> > > > MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates ar=
e
> > > > managed clocks, clk_disable_unused() turns them off at boot. On a b=
oard
> > > > that relied on firmware leaving the output enabled, that cuts the M=
CLK
> > > > and analog audio stops working.
> > > >
> > > > Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps=
 the
> > > > state firmware left. A board that wants the kernel to own the gate =
can
> > > > reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gat=
es
> > >       commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac
> >
> > In hindsight maybe it would have been a better idea to map the existing
> > clock ID I2S*_8CH_MCLKOUT to the new gates, and add (or not add) new
> > clocks for the internal MCLK gates.
> >
> > Then you wouldn't need to update the DTs, wouldn't need this workaround=
,
> > and wouldn't depend on the bootloader to set the registers correctly wh=
en
> > booting an old DT.
>
> Help me understand for the future: If the approach you describe would
> have been used, then the clocks in the kernel would have been mislabeled
> in the kernel driver compared to what's actually on the SoC, correct?
> That would have been more desirable in order to keep compatibility with
> the older DTs?

Which part are you referring to about mislabeled? The DT part would be
mislabeled, sure, but you can rename the macro to a more suitable name
without changing the ID, which is the binding part that cannot be changed.

In the driver, we would change I2S*_8CH_MCLKOUT to point to the gate,
while a new I2S*_8CH_MCLKOUT_INTERNAL or something, points to the original
mux.

Depending on the clk driver (library) design, it might not even need
a clk ID if it's only internal.

And IIRC clks don't even have to be registered in order. They can be
registered, be added as orphans, and when their parent appears, get
integrated into the clk tree.

> But the older DTs can still reference the mux, correct? From the
> kernel's perspective in this scenario, the important thing is for the
> mux to select the appropriate parent. The end gate will always be left
> on. From a power management perspective, the power will be cut further
> up the clock tree as needed.

Correct, old DTs still reference the mux, not the gate, which is a
problem if the gate wasn't enabled already.

Even with this "fix", the old DTs still rely on the bootloader having
enabled the gates beforehand. The flag added is "CLK_IGNORE_UNUSED",
not "CLK_TURN_IT_ON_BUT_LEAVE_IT_UNUSED". And BTW, the gate is missing
the CLK_SET_RATE_PARENT flag.


IMO this is better than having to carry workarounds for old DTs
indefinitely. Up to you and Heiko though.


ChenYu
