Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EBE2E8B9C;
	Wed,  3 Sep 2025 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894864; cv=none; b=U73KxYTuI0phoAaC/gZdCO5pVz/pOBRs1ELslgAmEhq1U9F2SQnSDf5nAvuYvUH6Ae/UakCJdzhP8FuAo0zLU96PAypFgx2uRyV5rS+ukpUEQOlYhsCfOTnRhJIWdKsP4l3rOAOX3EnMF8VGjFvigUELyiogxMxEt1afsbuiZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894864; c=relaxed/simple;
	bh=L3vddjUU1jpt8BxPZ+4MbL520RZhTPPHok7S2N8mXFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Og2eTdMmI/2p2nyz891KJxp1O/fEfNfAIVJAykOu8h+HEwnnpdu2hrLFGtdD3e4+Oc+KR3o015tMSiJ9GCB96si9R6hrnqCAtru7uEIUGRkjCm7vG2YvUuohDZkfoLZoO4JqP8ZBwZPbchPyAFNWrPpZyLhCDAxG0Er3UFG/an0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D0121688;
	Wed,  3 Sep 2025 03:20:53 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 088923F6A8;
	Wed,  3 Sep 2025 03:20:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 11:20:54 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift
 register
Message-ID: <20250903112054.173fe7b8@donnerap>
In-Reply-To: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
	<20250903000910.4860-4-andre.przywara@arm.com>
	<CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Sep 2025 12:20:55 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > The "mp" clock models a mod clock with divider and a shift field. At
> > least one clock in the Allwinner A523 features just a power-of-2 divider
> > field, so support an initialisation of the clock without providing an
> > actual divider field.
> >
> > Add a check whether the "width" field is 0, and skip the divider
> > handling in this case, as the GENMASK macro will not work with a zero
> > length.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > --- =20
>=20
> In my series I have a patch that adds this to the divider clocks,
> thus adding a P-clock type to the M-clock bits.

Yeah, I saw that, but wasn't convinced this would be better. Hence wanted
to post my version as an alternative.

> Maybe use that instead? I prefer we use actual matching types instead
> of disabling one part of a complex clock type.

Good that you bring up that topic: when looking for matching clocks I saw
we have a lot of them, though often one is just a subset of some others,
with some code duplication. And we use the pattern of "use type A, but
without feature X" already, for instance for "NKMP without the K".

So I was wondering if we should revisit this and clean this up. IIUC those
clocks were all modelled after the H3 and earlier generation, and the
clocks have changed since then. For instance I don't see PLLs with two
multipliers (NK) after the A64 anymore.

So what about we consolidate the various types into just a few distinct
ones, like NKMP for all PLLs, for instance, and provides macros that
disable fields as needed? This could ideally be done under the hood,
leaving the per-SoC drivers mostly alone, hopefully.

What do people think about that?

Cheers,
Andre

> >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_m=
p.c
> > index 354c981943b6f..a03dac294d048 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsi=
gned long rate,
> >         spin_lock_irqsave(cmp->common.lock, flags);
> >
> >         reg =3D readl(cmp->common.base + cmp->common.reg);
> > -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift=
);
> > +       if (cmp->m.width)
> > +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp-=
>m.shift);
> >         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift=
);
> > -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > +       if (cmp->m.width)
> > +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> >         if (shift)
> >                 reg |=3D ilog2(p) << cmp->p.shift;
> >         else
> > --
> > 2.46.3
> > =20

