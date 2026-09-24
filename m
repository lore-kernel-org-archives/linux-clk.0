Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFE735AC33;
	Thu, 24 Sep 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233184; cv=none; b=WZtqMPLiIu/OY7a1nRbgmp6hnnVgavuA8bQBCpnKCqGRitE0XemDGEpbgTYtkxCdAVhx5hvCbcitvbD4Kv1xqm8RQ0eCoQgc9EgwgToOeb66a4lkXT/6/uiyHgvN6q8ojBpORgVNrSBcw/7HfAicFdZr6BCVMpEDsBS9wa/raao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233184; c=relaxed/simple;
	bh=YHr0dnZ4DkdP5OsnRDTK952N33BeT0+O2Zw+kHc670Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfaHVZyxjPIwOkFiSvMKF5GJMUTfb92ty4pEbb0H7DnziVrmsMIshd4odGfhx+BVV4k/iojHtvtHBcznfx73s6wj0iuJhe4S/wKSeoKNnUioS2DHZMLwEDoVthqvIW9FjbcCgTwvT7VyY6JDkqQIgQoNsplwWnmJUVTw66Oj9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OJmFpQPw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OJmFpQPw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A3101516;
	Wed, 23 Sep 2026 23:59:24 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E925D3F86C;
	Wed, 23 Sep 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790233167; bh=YHr0dnZ4DkdP5OsnRDTK952N33BeT0+O2Zw+kHc670Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OJmFpQPwGPzvj5wq7IEMJ3FA2qjJ2RzWVw2uO6c9VFk0VT6NGzyjuiJT9XatnD0ZQ
	 rdHJXjtkTErlFT6NFkrAiZS36VYVv6+jqh9PqwSbVl2sFnQUEPczfAtojSpix00Jc3
	 aEwe29CpewHXq7ltQOxJG6OVpJcHqP9yp4GUFu0E=
Date: Thu, 24 Sep 2026 08:54:38 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mp: support clocks with just a
 shift register
Message-ID: <20260924085438.3edce740@ryzen.lan>
In-Reply-To: <CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
	<20260917223913.1855301-3-andre.przywara@arm.com>
	<CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sep 2026 11:51:19 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> On Fri, Sep 18, 2026 at 6:39=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The "mp" clock models a mod clock with divider and a shift field. At
> > least one clock in the Allwinner A523 features just a power-of-2 divider
> > field, so support an initialisation of the clock without providing an
> > actual divider field.
>=20
> Please just use the single divider clock type instead. It properly suppor=
ts
> power-of-2 dividers.

Ah, indeed, there is SUNXI_CCU_P_DATA_WITH_MUX_GATE now, will drop this
patch then.

So when using that macro it looks like this:
static SUNXI_CCU_P_DATA_WITH_MUX_GATE(pll_cpu_l_div_clk, "pll-cpu-l-div",
                                      pll_cpu_l_hws, 0x060,
                                      16, 2,                    /* P */
                                      0, 0,                     /* no mux */
                                      0,                        /* no gate =
*/
                                      CLK_SET_RATE_PARENT);     /* flags */

There are still some unused bits, does that look OK or shall I add a
macro that allows to skip mux and gate?
static SUNXI_CCU_P_DATA(pll_cpu_l_div_clk, "pll-cpu-l-div",
			pll_cpu_l_hws, 0x60,
			16, 2,			/* P */
			CLK_SET_RATE_PARENT);	/* flags */

Cheers,
Andre


>=20
> ChenYu
>=20
> > Add a check whether the "width" field is 0, and skip the divider
> > handling in this case, as the GENMASK macro will not work with a zero
> > length.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_m=
p.c
> > index 7cdb0eedc69b5..3896cb94bf733 100644
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
> > 2.43.0
> >
>=20

