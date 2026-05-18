Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41C481A99
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111271; cv=pass; b=ah6KP/b+NDsIp2MbPVLYLPipksnY68TJ3duIaw+GkpRfitO58zouEsMomEp14RLnboX+LbjmnHtJwOH7CCMn5DEC1WielkPYPzEJh/3liL+ADFTF05hftcq+Rj17A+4ySl4GASn0klP9UmpI5sOclwY7WI4lvTwhQUgxd10KsFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111271; c=relaxed/simple;
	bh=z3O36u+1b+IAPq+P97n6YQpv3bWFUjR/X3CZcUG8b1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qS3/XeHkIcMGgDssvWhc8PN/anTnabDtc5ERhzutXq330NlrMv/XqQnYHr0gNbLm1lsJEYWvOnyKx6PaXV0pWWN3F/G61hFeggTp9bQGxEpFucgMX9ZP8X85SZ8F5LQpY/1OMz0Xre1mHmG0eJpxWfE5jOxq79dNohJSotEZUbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbFLJ/j7; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbFLJ/j7"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso1214945a34.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 06:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779111269; cv=none;
        d=google.com; s=arc-20240605;
        b=JHl79AOKV/mTLFOaLgZncoMLX2rwRa4uSsVwVjMh3VItVtlkPKS8fQ4NA2SbIbDg2E
         peFlHuWrxEE2UNa0fMIxtg6LFJEc5DvUvCYYh7xRgFKmSwcnz6hqGE+a/WuSvNz0w/PT
         xxOTmkZ8vdA1F7p1ozGgZhFV4+/6NjPfqb/+P+Hoj3Z2LltnyW1Oku48fD4t+iVqqz4z
         SUer3Izvsg/4Qe6oqjEb0ld4HCRQyyvJNUQbfCGBn95glaYv3MU1hAzoG3P5SgGaqXjm
         jQKKrVM6GVIo8NeW7cPku7Qy5tCaz2lOpj7lMP/dgrTjCKd5HC/kzuurVvE5muFRebBg
         8DTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XgQseJF+oxDvBgSzJJ/E2+2aBFCQqIVmbjkj8SIzS9s=;
        fh=OeIeaEX+F3t00XquXlNUKNjIs5Rtb410yYDy+g6LMEU=;
        b=KwGVOJA2J5bJ9RBCK77WzDn0WF4YZkX8zGxK3LlwJyHGUeoYrTxaz9gHbP6PtW0J1F
         Z2wU06vtC8c9Msm433hB0XQeJVInuvPSTNdDXQHHPsVl7fvM3MUlIBxo4mGBam1JSJxV
         VV1Y8mMOetvJLcLQSMsrkf2hBclZmT7GhOxf7N+iOM0GYqRA9dw0F2POIYWySqVIW/sI
         Wo0mqzKhml8OGZJ4XxVD4vIB7ahpTJwpmGyIwZDyorLUTsKtzAh4++jULrV+/G3vioX7
         e4bbIwSel1EmeqvqMbuFMVnLzq6GAtbxDCQ3duL7ixsWUi4VWXcpkUZJdCYJ8XilxX/H
         O3ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111269; x=1779716069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQseJF+oxDvBgSzJJ/E2+2aBFCQqIVmbjkj8SIzS9s=;
        b=HbFLJ/j7CoxTKh7uFHPAblIPKL1tKUHvPcR8xcEEPhMEnQIQWoQSGBUwZyOHm4w1Kx
         hFmSGZBPr6CBYyxS0368FZNRUrAnQydmxDUo/cIXc/4ei/eUsDJacEcC60qbGt8OoMou
         13FSvlFmdbxxP2cuzOF1r4nmzeoFjwdZWbDxnTjnN8vJu9VZEWRLEEEHHdyfJUUpB0nM
         ZFVBLHswkg37AUSZZC/EJ1wmIrNxfbeXS+IwgO3ej3oKG7VznQ0D7e1UXUQHQ9GBsmtn
         gPvABaUEGX16BvDiN7reJh2feF6xf4NLY81HpC5YfUNz+ilyrwjLmNVEYiR9RhlNZ6FO
         H8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111269; x=1779716069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgQseJF+oxDvBgSzJJ/E2+2aBFCQqIVmbjkj8SIzS9s=;
        b=lGrMG93LFGbZKkiilGsQxRFalAvr6K7p9fsUzxfqcrPinEPRpxGRMhRn0iokEhL0wd
         Z23b+NbLQOY0yJyxF4RH679dmOA67De+rNkraf6oZTvHHjBCfhUY09+QmLvS9hqa2Hzg
         OaGrsLeJI+/C2Wyao7RQHct6ELzRQ6cDEuXexuFdq+ijJv6V4BRnMUQoNrJwnzWCQPMS
         ORxRV5IGIG+tLqWqG8GChE53WXrzFJuo8pa4e8oCeMErHBQGWfF0rj7Hse7+ekuI0ygW
         3ITSN31tiSHeNqxIsNZA+jZjyBuFBVHAfW2vpjNbdexjfqdgqaG70aFPpXwHh+M7+8A5
         Wpzw==
X-Forwarded-Encrypted: i=1; AFNElJ9LROlvnDzj2trgUv6mOwM53hJpm8t9Rn6bTG7l0Q7IoMzyPMZZQLpurn9VKc2z7RMVxKKxsVTZKBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLkKcnLPzLdhxBmpY534uaQLbqBRlhv7shtiLH4FF6YwZyBgdj
	5NyckHyIS2SijovDVBk9WJ9SHSsz9vztc7flmu04emdF9/1ALZTOcujUSWnQT6PZpkger2s6+OM
	Gh0o7XzAFnfesE46UbiykILf+7+JwXJY=
X-Gm-Gg: Acq92OENyWK6Rc6WsWtU3r5q58GIaQ3uTfcv30DGhDpgczZPvF8ygej2b+TuvWeS2UW
	+E9qKH4dPWpzYNe96iKAkxhzlIch9ip9ax2aU5Wp5lOjNF6jujU8lHsAM6ZdCs4jsaYnpG77Wrz
	Vs2sewN5WefXKJb1Yef2qCxEFr/BymLirsIXKC11ueRozpu8VeVRl6k7haj5Q+YVpbsxUI5DtzV
	U6lj5J0IMO2N95nVMe1EAyGSSBpUgM0y6wq0VBLfiDtnOuxM2+4KyrCM/kOQ7x9qD6pPr3Qz8Py
	KV44j7js
X-Received: by 2002:a05:6820:1614:b0:68e:3db1:bdb9 with SMTP id
 006d021491bc7-69c942ffb21mr9159893eaf.22.1779111268655; Mon, 18 May 2026
 06:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com> <agsEWo_mo5rzUAAH@pie>
In-Reply-To: <agsEWo_mo5rzUAAH@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 21:34:17 +0800
X-Gm-Features: AVHnY4I5sSmQgBKO7momsT0lZsmCackvIx5qq7CrFTzGpgqPMjlELJHpw6fANVQ
Message-ID: <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, May 18, 2026 at 8:22=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Sun, May 17, 2026 at 10:12:58PM +0800, Chuanhong Guo wrote:
> > This commit adds a driver for the Toplevel clock and reset controller
> > found on Siflower SF21A6826/SF21H8898 SoCs.
> > This block contains control for 3 PLLs, several clock mux/gate/divider
> > blocks, and a reset register for on-chip peripherals.
>
> It would be better if you could split out the reset code into
> drivers/reset, and initialize the reset controller as an auxiliary
> device, like what has been done for SpacemiT platform
> (drivers/{clock,reset}/spacemit) and AMLogic platform
> (drivers/clock/meson/axg-audio.c and
> drivers/reset/amlogic/reset-meson-aux.c).

It seems pretty common for these kinds of combined clock and reset
blocks to have a single driver. (There are 32 "select RESET_CONTROLLER"
in drivers/clk.) I deliberately chose to merge the clock and reset
together since it's named "clock and reset module" in the datasheet
and is a single block for both clock and reset on this chip.
I think syscon is usually used for those registers with a bunch
of miscellaneous control fields instead.

>
> I am neither clock nor reset maintainer, thus this only serves as
> a suggestion, with which it ends up in better code structure.
>
> > There are also two registers for enabling PCIE clock output in this
> > block. They aren't covered by this patch because I can't test those
> > without a PCIE driver. These will be added with the PCIE driver
>
> s/PCIE/PCIe/g which is the formal spelling.

Sure. I'll fix this in v2.

>
> > patchset later after I get that working.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  drivers/clk/Kconfig                    |    1 +
> >  drivers/clk/Makefile                   |    1 +
> >  drivers/clk/siflower/Kconfig           |   22 +
> >  drivers/clk/siflower/Makefile          |    1 +
> >  drivers/clk/siflower/clk-sf21-topcrm.c | 1053 ++++++++++++++++++++++++=
++++++++
> >  5 files changed, 1078 insertions(+)
>
> ...
>
> > diff --git a/drivers/clk/siflower/clk-sf21-topcrm.c b/drivers/clk/siflo=
wer/clk-sf21-topcrm.c
> > new file mode 100644
> > index 000000000000..7d4c5e370d6d
> > --- /dev/null
> > +++ b/drivers/clk/siflower/clk-sf21-topcrm.c
> > @@ -0,0 +1,1053 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/rational.h>
> > +#include <linux/module.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/platform_device.h>
> > +#include <dt-bindings/clock/siflower,sf21-topcrm.h>
>
> Consider sorting the headers?

OK.

>
> ...
>
> > +static int sf21_cmnpll_vco_determine_rate(struct clk_hw *hw,
> > +                                       struct clk_rate_request *req)
> > +{
> > +     unsigned long fbdiv, refdiv;
> > +
> > +     rational_best_approximation(req->rate, req->best_parent_rate,
> > +                                 BIT(PLL_CMN_FBDIV_BITS) - 1,
> > +                                 BIT(PLL_CMN_REFDIV_BITS) - 1, &fbdiv,
>
> FIELD_MAX(PLL_CMN_{FBDIV,REFDIV}_BITS}) would be simpler, with which it
> should be possible to get avoid of PLL_CMN_*_BITS.

Oh, I didn't know this is a thing. I'll change it in v2.

>
> > +                                 &refdiv);
> > +     if (!refdiv || !fbdiv)
> > +             return -EINVAL;
> > +
> > +     req->rate =3D (req->best_parent_rate / refdiv) * fbdiv;
> > +
> > +     return 0;
> > +}
> > +
> > +static int sf21_cmnpll_vco_set_rate(struct clk_hw *hw, unsigned long r=
ate,
> > +                                 unsigned long parent_rate)
> > +{
> > +     struct sf_clk_common *priv =3D hw_to_sf_clk_common(hw);
> > +     unsigned long flags;
> > +     unsigned long fbdiv, refdiv;
> > +     u32 val;
> > +     int ret;
> > +
> > +     rational_best_approximation(rate, parent_rate,
> > +                                 BIT(PLL_CMN_FBDIV_BITS) - 1,
> > +                                 BIT(PLL_CMN_REFDIV_BITS) - 1, &fbdiv,
> > +                                 &refdiv);
> > +     if (!refdiv || !fbdiv)
> > +             return -EINVAL;
> > +
> > +     spin_lock_irqsave(priv->lock, flags);
>
>         guard(spinlock_irqsave)(priv->lock)
>
> might simplify the code (especially the error handling path in this
> function), this applies as well for other places where
> spin_lock_irqsave() involves.

Oh, that macro is cool. I'll use it in v2.

>
> [...]
>
> Besides field/register offsets, the only difference I could tell between
> cmnpll_postdiv and pciepll_fout is that pciepll_fout clocks could be
> gated.
>
> Would it be a good idea to describe the gating function separately as a
> clock, and merge the common part of pciepll_fout and cmnpll_postdiv? In
> which way you could save a lot of mostly duplicated code.

I don't think so. Since the majority of the existing code are register
operations, and the register bit layout are completely different,
there isn't much to share between these two PLLs.
Writing a struct to describe both register layouts together seems
unnecessarily complicated and harder to read.

BTW the CMNPLL and PCIEPLL are actually different hardware.
The former is an integer PLL while the latter actually supports
fractional operations. I didn't add support for the fractional part
due to the lack of use cases and documentation. PCIE and GMAC
clocks are fed by this PLL and require exact clock frequencies
which can be achieved using only the integer mode.

>
> > +     .recalc_rate =3D sf21_pciepll_fout_recalc_rate,
> > +     .determine_rate =3D sf21_pciepll_fout_determine_rate,
> > +     .set_rate =3D sf21_pciepll_fout_set_rate,
> > +};
> [...]
> > +
> > +     spin_lock_irqsave(cmn_priv->lock, flags);
> > +     if (index)
> > +             sf_rmw(cmn_priv, mux_reg, 0, BIT(mux_offs));
> > +     else
> > +             sf_rmw(cmn_priv, mux_reg, BIT(mux_offs), 0);
> > +
> > +     spin_unlock_irqrestore(cmn_priv->lock, flags);
> > +     return 0;
> > +}
>
> I believe besides the divider reloading part, clk_mux_ops,
> clk_divider_ops, and clk_gate_ops have already provided the logic
> you implemented here. So it might be a better option to composite them
> together to implement your clocks instead of building from scratch.

The divider reloading is the exact reason I chose to not compose them
with the function you mentioned. The reloading bit need to be set on
both clock divider change and clock enabling, because the clock divider
loading only happens when the clock is running. Since I already have
to write two of the three parts you mentioned, trying to reuse
clk_mux_ops doesn't seem to reduce the code complexity here.
It's just trading get_parent and set_parent call with one more level
in the clock tree for every clock and more code to wire them together
in the probe function.

>
> > +static const struct clk_ops sf21_clk_muxdiv_ops =3D {
> > +     .enable =3D sf21_muxdiv_enable,
> > +     .disable =3D sf21_muxdiv_disable,
> > +     .is_enabled =3D sf21_muxdiv_is_enabled,
> > +     .recalc_rate =3D sf21_muxdiv_recalc_rate,
> > +     .determine_rate =3D sf21_muxdiv_determine_rate,
> > +     .set_rate =3D sf21_muxdiv_set_rate,
> > +     .get_parent =3D sf21_muxdiv_get_parent,
> > +     .set_parent =3D sf21_muxdiv_set_parent,
> > +};
>
> ...
>
> > +static SF21_MUXDIV(muxdiv_cpu, clk_periph_parents, 0, 1, 0, 0, 0,
> > +                CLK_IGNORE_UNUSED);
>
> If it supplies the CPU core, shouldn't it be CLK_IS_CRITICAL instead?
>
> > +static SF21_MUXDIV(muxdiv_pic, clk_periph_parents, 0, 3, 3, 16, 1,
> > +                CLK_IGNORE_UNUSED);
>
> Do you have any information about purpose of the clock and why it's
> marked as CLK_IGNORE_UNUSED? It's better to have a comment explaining
> this since it's not very obvious...

This one is Platform Interrupt Controller and it feeds PLIC + CLINT in the
C908 core complex.

I copied these from the vendor driver.
I'll make them CLK_IS_CRITICAL in v2.

--=20
Regards,
Chuanhong Guo
