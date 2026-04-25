Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BD30F52B
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777151996; cv=pass; b=XaLUfG8NO73cEhxB22e90ZhhgA3eLj9uvIulatUSAi4uuUzcKrOZrtOGWw8CJqNlaAFB3KPM5cfvWJvtncpBxmkYtMgw5ZzPQCb2kL0aOgYnbjPUrUGr8iQV4x5btgj1uRJlHBU+inn5vDIpzoVsIGicsdeYAfMNJSVVG81Eqpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777151996; c=relaxed/simple;
	bh=hz7ggHAfuMnrQt4F8zKfEW9da6zFb+L8KnFy+/KdK4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjTTWZTin7+tdRtffsTEkGoBT2av4/DTrY1KSbY+Uso2f+KklOs34BuyvtDm8vih166n0UeGH6Ejb037NdYDgkSH6/RGD7ZHFp8nHVZF3cBZfTO97rdr1rkyEToYIHnSGO/zCWnmOtZy6JSiQCm8Vw4+OdolKKXtmZDPIguBdnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VW8mzyTu; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VW8mzyTu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so111972915e9.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 14:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777151992; cv=none;
        d=google.com; s=arc-20240605;
        b=N/fVjjzo51KxbjrPaQ0o9/bw7CtGH8asSs+4wDssaQwfqU8rxab+Znj0W25K2I0TNr
         yOz/KG53PpstyPhsqyQJkXT2XdcmNgvk7tEGreSNbhqPH+q/HYyki/P9bruJ9BI9mgbZ
         CfCrDVpVsug6RAIBcwedPG9wzXJ+2yviiA6FI2u4Bij7QbxnPNT0c7NAw2Bo8Skz359s
         DrdZJ4WQwrxK/rM2Wr9nb4g0zms+jSODqasAgW/dO7gijmtlPZQKATEjsbGuXECu8uFy
         yI3VlFMf1orHimzPyfnc+6tTFbsHdNMfaSLBbl8QdeKFwYhpR+y6e2XPk3MGEewHivTN
         peTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pUInAKZD6kP0cQWmuy0f0Hf0XJXz8R8qx4tVrtctuEU=;
        fh=XFkUkAT2nyqmPv3Zjnj2QwP1NQan6kQNDOlEHpwUKVU=;
        b=dJSacHhYCoRpH842XLALIi+yua6SzqOwyPLplEjByhee2V7mHuSEPB/C3tk+8iICW9
         xLhT9f9pav+hmZVj3tWgdZIN4gEllZSwRduonAnQP+H9LOgQ2PTAefs/UcFZQaAi4hYe
         5WhGX3eEk/mgfg8iDgm+d4/NToEBxwhBzIIYRJ4ruNYNXTqkB8mQuOdn7H/i5LLRK6b4
         pR+uSJhNaJUIwe1Hoqu0gKzak/6lizSkv4K2v17XuOVO0+VUBg0lWmJbh/2Ife46kF0H
         +jrMDejAOZGBC4DFxE95cPLiAgu4xh4JRcMEVGQL+bat5nOeLamyr7Om9BAGBMQd6dsV
         xdNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777151992; x=1777756792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUInAKZD6kP0cQWmuy0f0Hf0XJXz8R8qx4tVrtctuEU=;
        b=VW8mzyTuuqQ+uXw0MMb21a2/6KVR33ndjm038nbCDmlRQkOmFUtURxFGZ/x5vLE4Bq
         FWjfBHZuR1QeyXxzcUQNgusMvvDzyaAPwcVbOx8DCEkk9n7j4Ta67eEnZgL88dlsCM4n
         VZU3zzistd4XSxvOwYfJ5j0MMX4p0q33kmyqrv1GOLR5H/b6BRGkKTHlqXO3hW3eOTuK
         s/yfmrSqTRW0ogd3lnoX0Ap+5ruquTLGgBW8AIt3BRRuDJsi6GinHEPFsp0udnAwzx+f
         vg3YGYOMB5eUT+7CV1pTIdHcdQvTV8t588hd4FOZDZ8kKVkc8NX/RS05ryn9lPNlF7Lc
         kVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777151992; x=1777756792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pUInAKZD6kP0cQWmuy0f0Hf0XJXz8R8qx4tVrtctuEU=;
        b=ZHizVTzXNHpVokpPkaoY0a8K7rkqUiMbuU36yVW6L/rYzqM99DH8uRZBoXUDfL+qau
         zETptNDHWf5sVOLU0Y21rcZ40726fJK2vjV73f/RoglBiuEy6ypL7Xz7I1VR3TPZSk8Z
         88vO/dicG/BdbKQvraI/1ospTC953rBH9I+5jqBlj41a0+06mrzLSVjPXenCGYzE85aq
         QbiKWrxfEbbGYFnnnhW32zZI+OLBoO+4Tzku1B9BmBoKCxT4U4OGhVcrz8qZTeLPLEqX
         OeREk+EzJ6k9RMZdaf4s+qcMVqLLhvzRD/JtNeRY6lyRsWu2OVvNBJLUzO9jiZ2zj4z1
         EzTg==
X-Forwarded-Encrypted: i=1; AFNElJ+kgsFQNLahKL4QXwvIdAsmRz35CFJ6zRP4l9lSgLJUy7Hw5k6pi1JmhcUuwQRa0B+IWjhLrRlvAeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGV2Kk+NL7eZhjtsZy2VbOWXM/sYZLPLZWc+dc9JmNLUaHLmt
	7s+e6fcvN7vWIzqU8cqFICGZb++eVOlI+YFf1EikDzMMFxKw9S1fqeBiXga8P/4VO0v6PFkn2mK
	wnuJCE8UXv/xP9M/gd+QD2rqxKOrUvVQoUhGuXZw=
X-Gm-Gg: AeBDietuouX32CA1DB4RXReXbqzw42J/p8BPksjJmbJMMnpnu77+XuWsaBJSLfDnQCy
	2RepUv3ldHzbcUJyohwDyodJGpVSXxkcHxZFjVH+zODREh4PvXfubBke7CAGswi5bBi+wss0gIX
	f8ZlbfOY5exTqVbzbyoJLp6tNePGWHXYWSdQIZxsXHMWx+RxiTdmDQhBr16Zt2o+SsmEblMGbgu
	SFXNFhuj46Tlg7pawAfXs/j51CpOBauvkbbC14Ga2NPnFRQo/0tU7kq4I+gzaF26CdeOFS6/OBO
	hUjHTNudqRG/9X9vYbBoSUa8quQA7RvGe8atq2tmfwgbgSckFcugVKrBQidSJ4nv1sINm5i6/wx
	LWKjG/to8nD2n
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id
 5b1f17b1804b1-488fb7880camr522886875e9.23.1777151992198; Sat, 25 Apr 2026
 14:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260421182529.3055114-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <aevF-aA0FMp00wHW@redhat.com>
In-Reply-To: <aevF-aA0FMp00wHW@redhat.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 25 Apr 2026 22:19:26 +0100
X-Gm-Features: AVHnY4LSEHhBER5AZ4eO1p9xk0BN-QR4NWW5Fsn1ELiPevMM9MRVtQ8IvZmu2-A
Message-ID: <CA+V-a8u-Une88F2=sc=psYJC7e9KDhsJgYZJT_BchUNk2roj7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: divider: Add KUnit tests for
 clk_divider_bestdiv() ULONG_MAX handling
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Thank you for the review.

On Fri, Apr 24, 2026 at 8:35=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lad,
>
> On Tue, Apr 21, 2026 at 07:25:25PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
> > clk_round_rate() is called with ULONG_MAX, which is the canonical way
> > to probe the maximum rate a clock can produce.
> >
> > Two test cases are introduced:
> >
> > - clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
> >   fixed-rate parent driving a table-based divider whose smallest entry
> >   is div=3D2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_=
MAX)
> >   and checks the result.
> >
> > - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-inpu=
t
> >   mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead o=
f
> >   the same table-based divider to verify correct parent selection under
> >   ULONG_MAX.
> >
> > Both tests use an explicit clk_div_table with a minimum divider of 2 so
> > that the pre-loop maxdiv clamping in clk_divider_bestdiv():
> >
> >     maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> >
> > clamps maxdiv to 1, causing _next_div() to return 2 on the first
> > iteration and skip the loop body entirely. This makes bestdiv fall back
> > to the maximum divider, returning the minimum rate rather than the
> > maximum.
> >
> > The expected values intentionally reflect the buggy output:
> >   - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
> >   - test 2: 0                      (invalid, loop never populated bestd=
iv)
> >
> > These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / =
2
> > respectively once the fix to clk_divider_bestdiv() is applied.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Added false positive expected values
> > - Updated the commit message
> > - Added dependency on !S390 in Kconfig
> > ---
> >  drivers/clk/Kconfig            |   8 ++
> >  drivers/clk/Makefile           |   1 +
> >  drivers/clk/clk-divider_test.c | 158 +++++++++++++++++++++++++++++++++
> >  3 files changed, 167 insertions(+)
> >  create mode 100644 drivers/clk/clk-divider_test.c
>
> CONFIG_CLK_DIVIDER_KUNIT_TEST=3Dy needs to be added to
> drivers/clk/.kunitconfig.
>
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index b2efbe9f6acb..fdeb87ff8fd9 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -573,4 +573,12 @@ config CLK_FD_KUNIT_TEST
> >       help
> >         Kunit test for the clk-fractional-divider type.
> >
> > +config CLK_DIVIDER_KUNIT_TEST
> > +     tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TEST=
S
> > +     depends on KUNIT
> > +     depends on !S390
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       Kunit test for the clk-divider type.
> > +
> >  endif
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index a3e2862ebd7e..dc653b458f56 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -21,6 +21,7 @@ clk-test-y                  :=3D clk_test.o \
> >                                  kunit_clk_hw_get_dev_of_node.dtbo.o \
> >                                  kunit_clk_parent_data_test.dtbo.o
> >  obj-$(CONFIG_COMMON_CLK)     +=3D clk-divider.o
> > +obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) +=3D clk-divider_test.o
> >  obj-$(CONFIG_COMMON_CLK)     +=3D clk-fixed-factor.o
> >  obj-$(CONFIG_COMMON_CLK)     +=3D clk-fixed-rate.o
> >  obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)      +=3D clk-fixed-rate-test.=
o
> > diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_t=
est.c
> > new file mode 100644
> > index 000000000000..3087c77fb157
> > --- /dev/null
> > +++ b/drivers/clk/clk-divider_test.c
> > @@ -0,0 +1,158 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit tests for clk_divider_bestdiv()
> > + */
> > +#include <kunit/test.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/limits.h>
> > +#include <linux/units.h>
> > +
> > +#define PARENT_RATE_1GHZ     GIGA
> > +#define PARENT_RATE_2GHZ     (2 * GIGA)
> > +#define PARENT_RATE_4GHZ     (4 * GIGA)
> > +
> > +static const struct clk_div_table bestdiv_table[] =3D {
> > +     { .val =3D 0, .div =3D 2 },
> > +     { .val =3D 1, .div =3D 4 },
> > +     { .val =3D 2, .div =3D 8 },
> > +     { /* sentinel */ }
> > +};
>
> Is it possible to drop the table like I suggested in v2? You can use
> CLK_DIVIDER_ONE_BASED. (See docs in include/linux/clk-provider.h).
> You can also use CLK_DIVIDER_POWER_OF_TWO if you want the divider to be
> larger.
>
When using CLK_DIVIDER_ONE_BASED/CLK_DIVIDER_POWER_OF_TWO I dont get the is=
sue.

For example for a parent of 1GHz and when using
CLK_DIVIDER_POWER_OF_TWO, Im getting expected result of 1GHz for
`clk_hw_round_rate(div_hw, ULONG_MAX)`

Note with CLK_DIVIDER_POWER_OF_TWO flag Im using
    div_hw =3D clk_hw_register_divider(NULL, "bestdiv-div",
                     "bestdiv-parent",
                     CLK_SET_RATE_PARENT,
                     (void __iomem __force *)fake_reg,
                     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);

Case #1 With bestdiv_table
_get_maxdiv() --> walks table, finds max div =3D 8
maxdiv =3D min(ULONG_MAX / ULONG_MAX, 8) =3D min(1, 8) =3D 1

_next_div(table, 0) --> first table entry --> i =3D 2

Loop: 2 <=3D 1 --> FALSE, never enters

Fallback (!bestdiv):
    bestdiv =3D _get_maxdiv() =3D 8
    *best_parent_rate =3D clk_hw_round_rate(parent, 1) =3D 1GHz  <-- fixed
rate ignores request

return 8 --> 1GHz / 8 =3D 125MHz

Case #2 With CLK_DIVIDER_POWER_OF_TWO

_get_maxdiv() --> 1 << clk_div_mask(2) =3D 1 << 3 =3D 8
maxdiv =3D min(ULONG_MAX / ULONG_MAX, 8) =3D min(1, 8) =3D 1

_next_div(NULL, 0, CLK_DIVIDER_POWER_OF_TWO) --> 1 << 0 =3D i =3D 1

Loop: 1 <=3D 1 --> TRUE  <-- enters because min div is 1, not 2

    rate * i =3D ULONG_MAX * 1 =3D ULONG_MAX (no overflow)
    parent_rate =3D clk_hw_round_rate(parent, ULONG_MAX) =3D 1GHz
    now =3D 1GHz / 1 =3D 1GHz
    bestdiv =3D 1, best =3D 1GHz

    next i =3D 2 > 1 --> loop ends

return 1 --> 1GHz / 1 =3D 1GHz

> > +
> > +static void unregister_fixed_rate(void *hw)
> > +{
> > +     clk_hw_unregister_fixed_rate(hw);
> > +}
> > +
> > +static void unregister_divider(void *hw)
> > +{
> > +     clk_hw_unregister_divider(hw);
> > +}
> > +
> > +static void unregister_mux(void *hw)
> > +{
> > +     clk_hw_unregister_mux(hw);
> > +}
>
> Can these 3 wrapper functions be dropped, and you just call the inner
> function in the call to kunit_add_action_or_reset()? For example,
> instead of:
>
>     static void unregister_fixed_rate(void *hw)
>     {
>         clk_hw_unregister_fixed_rate(hw);
>     }
>     ...
>     KUNIT_ASSERT_EQ(test, 0,
>                     kunit_add_action_or_reset(test, unregister_fixed_rate=
,
>                                               parent_hw));
>
> You should be able to do this:
>
>     KUNIT_ASSERT_EQ(test, 0,
>                     kunit_add_action_or_reset(test, clk_hw_unregister_fix=
ed_rate,
>                                               parent_hw));
>
> I think we should just drop the wrappers completely if they aren't
> needed. If more functionality is needed in the future, then the wrappers
> can be added then.
>
Ok, I willl need to cast and use it like below:

+       KUNIT_ASSERT_EQ(test, 0,
+                       kunit_add_action_or_reset(test,
+                                                 (kunit_action_t
*)clk_hw_unregister_divider,
+                                                 div_hw));

> > +
> > +/*
> > + * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achiev=
able
> > + * rate for a divider clock.
> > + */
> > +static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kuni=
t *test)
> > +{
> > +     struct clk_hw *parent_hw, *div_hw;
> > +     u32 *fake_reg;
> > +     unsigned long rate;
>
> Reverse Christmas tree order.
>
OK.

> > +
> > +     fake_reg =3D kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> > +
> > +     parent_hw =3D clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
> > +                                            NULL, 0, PARENT_RATE_1GHZ)=
;
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test, unregister_fixed_=
rate,
> > +                                               parent_hw));
> > +
> > +     div_hw =3D clk_hw_register_divider_table(NULL, "bestdiv-div",
> > +                                            "bestdiv-parent",
> > +                                            CLK_SET_RATE_PARENT,
> > +                                            (void __iomem __force *)fa=
ke_reg,
> > +                                            0, 2, 0, bestdiv_table, NU=
LL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test, unregister_divide=
r, div_hw));
> > +
> > +     /*
> > +      * ULONG_MAX is the canonical way to probe the maximum rate a clo=
ck
> > +      * can produce.
> > +      */
> > +     rate =3D clk_hw_round_rate(div_hw, ULONG_MAX);
> > +     KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
> > +}
> > +
> > +/*
> > + * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximu=
m rate
> > + * when a mux clock sits between a divider and its parent candidates.
> > + *
> > + * Topology:
> > + *
> > + *   [fixed 4 GHz] --\
> > + *                    +--> [mux CLK_SET_RATE_PARENT] --> [div {2,4,8} =
CLK_SET_RATE_PARENT]
> > + *   [fixed 2 GHz] --/
> > + *
> > + */
> > +static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct =
kunit *test)
> > +{
> > +     static const char * const mux_parents[] =3D {
> > +             "bestdiv-mux-parent-a",
> > +             "bestdiv-mux-parent-b",
> > +     };
> > +     struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
> > +     u32 *fake_reg_mux, *fake_reg_div;
> > +     unsigned long rate;
> > +
> > +     fake_reg_mux =3D kunit_kzalloc(test, sizeof(*fake_reg_mux), GFP_K=
ERNEL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_mux);
> > +
> > +     fake_reg_div =3D kunit_kzalloc(test, sizeof(*fake_reg_div), GFP_K=
ERNEL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_div);
> > +
> > +     /* Higher-rate parent: the mux should select this for ULONG_MAX. =
*/
> > +     parent_a_hw =3D clk_hw_register_fixed_rate(NULL, "bestdiv-mux-par=
ent-a",
> > +                                              NULL, 0, PARENT_RATE_4GH=
Z);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test, unregister_fixed_=
rate,
> > +                                               parent_a_hw));
> > +
> > +     /* Lower-rate parent: should not be selected. */
> > +     parent_b_hw =3D clk_hw_register_fixed_rate(NULL, "bestdiv-mux-par=
ent-b",
> > +                                              NULL, 0, PARENT_RATE_2GH=
Z);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test, unregister_fixed_=
rate,
> > +                                               parent_b_hw));
> > +
> > +     /*
> > +      * 1-bit mux register selects between the two parents.
> > +      * CLK_SET_RATE_PARENT allows the divider's rate request to
> > +      * propagate into clk_mux_determine_rate().
> > +      */
> > +     mux_hw =3D clk_hw_register_mux(NULL, "bestdiv-mux",
> > +                                  mux_parents, ARRAY_SIZE(mux_parents)=
,
> > +                                  CLK_SET_RATE_PARENT,
> > +                                  (void __iomem __force *)fake_reg_mux=
,
> > +                                  0, 1, 0, NULL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test, unregister_mux, m=
ux_hw));
> > +
> > +     div_hw =3D clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
> > +                                            "bestdiv-mux",
> > +                                            CLK_SET_RATE_PARENT,
> > +                                            (void __iomem __force *)fa=
ke_reg_div,
> > +                                            0, 2, 0, bestdiv_table, NU=
LL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test, unregister_divide=
r, div_hw));
> > +
> > +     rate =3D clk_hw_round_rate(div_hw, ULONG_MAX);
> > +     KUNIT_EXPECT_EQ(test, rate, 0);
> > +}
> > +
> > +static struct kunit_case clk_divider_bestdiv_test_cases[] =3D {
> > +     KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
> > +     KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite clk_divider_bestdiv_test_suite =3D {
> > +     .name =3D "clk_divider_bestdiv",
> > +     .test_cases =3D clk_divider_bestdiv_test_cases,
> > +};
> > +
> > +kunit_test_suite(clk_divider_bestdiv_test_suite);
> > +
> > +MODULE_DESCRIPTION("KUnit tests for clk_divider_bestdiv()");
>
> KUnit tests for clk divider.
>
> I have another tests that will eventually be added to this file.
>
Ok.

Cheers,
Prabhakar
