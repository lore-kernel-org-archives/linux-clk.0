Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BFC26AF4
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918504; cv=pass; b=NwFRtxNWKvkgwwKJu7inno7+O3FVvzQlltGMrfp0rhZvXt3JvpLZqLyKfhDVBNAscyBcYPDSM72wvn5D+saE1w7SDB1WSpj+dF2AjVhtIfzhY2joXAXHWuzRlcc1R6eg3xjpPKgtsTSFngyiG5mdXOLREt+NudO5wjoLtPZvXZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918504; c=relaxed/simple;
	bh=38QQWQLrsPBd2ktneJp4BKITE72zohw3hH4lsAvgEKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6Xv2ZbsnPUSSfC9pPr2b9Z+P/E17zRD+T6M+NxrVr1yizmO0JT7fKX5TtLYvAu6aRXI+9wqHZ4E0hRoI5t9mQu+KRTa/Ta6lUxqlnGagPfUq/6PjCto7M1PAWPKRlm7HYEJOHosMxCwicKWQnY8stitew69wFlv6DPHgmcIsOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cWBe2mCo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mX9XHUiM; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cWBe2mCo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mX9XHUiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773918501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7VoH2U2NtMwyH2GzRhVhXOIKcWJBsXZGj+RlRJcAoA=;
	b=cWBe2mCo/fb/uowqnbUUWZeDIboleIVBX20Gz1YRS3zPJSAi8o/1GALo4sFaH7iu9sFfTK
	+eq87+RcoIZPxbOCDjLPulzSdjKNyZPcRiASxVO4lpnUaMuKAbSn5Mh+IlST3OHy+0mUf7
	dDFw3pSbBaNWd8l1TRv7YmFHZd2nurU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-mQ4kW2_0MyyJKArG3rQ2Xg-1; Thu, 19 Mar 2026 07:08:20 -0400
X-MC-Unique: mQ4kW2_0MyyJKArG3rQ2Xg-1
X-Mimecast-MFC-AGG-ID: mQ4kW2_0MyyJKArG3rQ2Xg_1773918499
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b982536b5cbso22830066b.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 04:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773918499; cv=none;
        d=google.com; s=arc-20240605;
        b=Z0MRkPMaPUl8NWW8X9sO6g29JmbUI2lrLtfKKMmHTqHG0qe1fncWsiR7FGqVMZkW72
         2KfeoQz/+jkSpcUWVsHNsguJA4JF6USnWhFZ5vT+BAiwYnBzzEUW2Dp6NvvUivnbW8ut
         +44rj5M8c+XjIxkw4Yj34YCZQjhqAMW4u+Gn3kJXZXD69Zsd+yG55YIeMhznlDKK9iPV
         k48l9nxzOtgRmdt9+XbyD3RaufXys18mdC0ULMKuk1WWFtv2Fw2UgtBrEcVPhU1QOTT9
         eAkCUgHyeNnGnFdHJ+IKS+Y/3RKN1mBDx6hO2bnD45IsII1bXHYNCUjcUCoFzf1+a7LB
         vsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7VoH2U2NtMwyH2GzRhVhXOIKcWJBsXZGj+RlRJcAoA=;
        fh=zqGwUir/JFu4kZxrnxamLHG6/yB74Cs+36CgRWmDh0E=;
        b=WlJC4Lf7tN0q7itkyUxpmjhgbsNanzkojC/VsXXglU/5qDC/WyACK1nHSOJ01PmFGO
         rQRsz72gxHHhMr1vxM8sZTMUY9lwcy02mF2yRlRjUUvD9m5PPTWlyZI6WmpG7rxoQRqX
         DpKR3szUV+X3kiAB2yn5CPLY+oi/1ER7RX0jM/fToUT3G2JQSKlDUM7H/eZXjXOc3U9i
         qU0rfelbBCEXKi/7gaWv5smTE68VyCg4cXowBR1+/4bMBz8MV4d6O8fN0nvLmQiMhks8
         RZ64fFGFa9oG0NdrUWMz5ZMqqFJQlOVezTwlXfHKn1LaP0WVSIpFeiGS0+TZ/5SZPCs2
         ENrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773918499; x=1774523299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7VoH2U2NtMwyH2GzRhVhXOIKcWJBsXZGj+RlRJcAoA=;
        b=mX9XHUiMz8cLQ+g4qr+4GIr12b3+6F19B8z9uGjmx9Lyqjqgesx9tS7M1IehPa9PqV
         Yhr7owlfdn0y3Pt4ZbS2/wFhDG7uCnjTIkZ/evCdWuK1oNRMCi8gNL211HrbiDCDOqum
         urhVs/ulaOKxLDrkQJQQNzk3z/OofTl0fo9zWNpHyNIEufeDoH8/7xD8RT6fvqbyUvAk
         oXzprDzaN5seWeLrotn2PQnSksVlmKn+njg8W9iGxEs6CZ3lwBl/Ba0PG5ohWUX3/zu+
         IaQEziDVDaOsat/K9SCRGv2A8UKNqHTDDNKkYUwA/aD/rbiOVMTlV1FskLNRQPJEw5Ig
         tbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918499; x=1774523299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7VoH2U2NtMwyH2GzRhVhXOIKcWJBsXZGj+RlRJcAoA=;
        b=QpX21fP77srskyePGxt0EyQYl9Gz+/UBjLoI4Yrpl2b4qnjerblQDhzJDo+YgR8MaH
         GyH4dhuQgUFcOy9AHiwnFjIu+blqCxkCxXTy5xMQO6nelu897vhDTQJZ/hQci/S0QjlY
         v+0otUYWlmzBDYDlEznBIP//YVmkl22d0HzYrlcXLppabwm/vV2VFM5I3o2EcZ8Eb+48
         aUDH8V+LYVEXb8/DfM/VC1gzvjdQJMaCqi6ECOjImNkXJcfU7lW73y9jI7DFUTnasaar
         m791WSCYH38+0hY0teY94Z0przf6Oq+/vTEKb+Q5s8B7pmWU+ZEsXtS1FeboWrX21yp3
         5zTw==
X-Forwarded-Encrypted: i=1; AJvYcCU0MHdltXVZkjM2k8hWqtYz1Er+zbr1xQxgL+Axi8SYCDRmhzrYYr08vV+3/W0M3mtLyj0srXj4Ep4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtrKT19Jaz2CGg9IFBeRk+g8Qguf7uFGH0BhV2uc3PaYfoEYI
	ekGa8/vIVPE4VJ+TotGP2gzRQYcBuchaniKati1+xqsaF/QNwn1gHJPmhQOW2VYmAMmRdtZodh7
	Fxsknj0IV65/dEGwh5oo81e1pIWmXaZa++0y3V2q6pfB616Q7ri4TaMFU8jeFaAwf+LFluEGfBW
	DaKO7gorY+jwD4673UPT2sWrnMpwDby75avMe7
X-Gm-Gg: ATEYQzxlv5o/GRdmiH1yCDia9O3Vzu+jD5WKB1xv8pVrWsPNFkdx8AwujqVhOj/h8Sg
	FQxNTz2kGgiqrhlfhc3bWPgeMr3vir3OHDUvySONRr047b77sEhW2Caz/4f1MzFEdP41xTejvE/
	F29vfMk4LXQ+ULrRdjGWkLnUQtLMR4yB2h18VC/fMeqiCBwHenRL9MQ4PelQv9Sk96Z7sefqRxu
	l5gWw==
X-Received: by 2002:a17:907:8e96:b0:b97:acca:fcf4 with SMTP id a640c23a62f3a-b97f4796681mr396990566b.11.1773918498861;
        Thu, 19 Mar 2026 04:08:18 -0700 (PDT)
X-Received: by 2002:a17:907:8e96:b0:b97:acca:fcf4 with SMTP id
 a640c23a62f3a-b97f4796681mr396987966b.11.1773918498311; Thu, 19 Mar 2026
 04:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com> <20260319-spry-incredible-dinosaur-e2d9da@houat>
In-Reply-To: <20260319-spry-incredible-dinosaur-e2d9da@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 19 Mar 2026 07:08:07 -0400
X-Gm-Features: AaiRm52GyCxU04Gj7t9McMhJEVcDCf7Nf_JLHIIIxQv05Bz0k-YsDQSPIFUG4Lw
Message-ID: <CABx5tqK7TyshCZR0zPDBp=c6+DvcRE4tOearf=GGT1EB8uWNOA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:10=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Mar 13, 2026 at 12:43:09PM -0400, Brian Masney wrote:
> > Introduce a kunit test suite that demonstrates the current behavior
> > of how a clock can unknowingly change the rate of it's siblings. Some
> > boards are unknowingly dependent on this behavior, and per discussions
> > at the 2025 Linux Plumbers Conference in Tokyo, we can't break the
> > existing behavior. So let's add kunit tests with the current behavior
> > so that we can be made aware if that functionality changes in the
> > future.
> >
> > The tests in this commit use the following simplified clk tree with
> > the initial state:
> >
> >                      parent
> >                      24 MHz
> >                     /      \
> >               child1        child2
> >               24 MHz        24 MHz
> >
> > child1 and child2 both divider-only clocks that have CLK_SET_RATE_PAREN=
T
> > set, and the parent is capable of achieving any rate.
> >
> > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > Link: https://lpc.events/event/19/contributions/2152/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/clk_test.c | 146 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 146 insertions(+)
> >
> > diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> > index 88e35f4419c958983578750356a97c0a45effb55..325da7c84ab2ecdcf6b7a02=
3ce4c2c4ef2d49862 100644
> > --- a/drivers/clk/clk_test.c
> > +++ b/drivers/clk/clk_test.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/clk/clk-conf.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/units.h>
> >
> >  /* Needed for clk_hw_get_clk() */
> >  #include "clk.h"
> > @@ -652,6 +653,150 @@ clk_multiple_parents_mux_test_suite =3D {
> >       .test_cases =3D clk_multiple_parents_mux_test_cases,
> >  };
> >
> > +struct clk_rate_change_sibling_div_div_context {
> > +     struct clk_dummy_context parent;
> > +     struct clk_dummy_div child1, child2;
> > +     struct clk *parent_clk, *child1_clk, *child2_clk;
> > +};
> > +
> > +struct clk_rate_change_sibling_div_div_test_param {
> > +     const char *desc;
> > +     const struct clk_ops *ops;
> > +     unsigned int extra_child_flags;
> > +};
> > +
> > +static const struct clk_rate_change_sibling_div_div_test_param
> > +clk_rate_change_sibling_div_div_test_regular_ops_params[] =3D {
> > +     {
> > +             .desc =3D "regular_ops",
> > +             .ops =3D &clk_dummy_div_ops,
> > +             .extra_child_flags =3D 0,
> > +     },
> > +};
> > +
> > +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_op=
s,
> > +                    clk_rate_change_sibling_div_div_test_regular_ops_p=
arams, desc)
> > +
> > +static int clk_rate_change_sibling_div_div_test_init(struct kunit *tes=
t)
> > +{
> > +     const struct clk_rate_change_sibling_div_div_test_param *param =
=3D test->param_value;
> > +     struct clk_rate_change_sibling_div_div_context *ctx;
> > +     int ret;
> > +
> > +     ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > +     if (!ctx)
> > +             return -ENOMEM;
> > +     test->priv =3D ctx;
> > +
> > +     ctx->parent.hw.init =3D CLK_HW_INIT_NO_PARENT("parent", &clk_dumm=
y_rate_ops, 0);
> > +     ctx->parent.rate =3D 24 * HZ_PER_MHZ;
> > +     ret =3D clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctx->child1.hw.init =3D CLK_HW_INIT_HW("child1", &ctx->parent.hw,
> > +                                          param->ops,
> > +                                          CLK_SET_RATE_PARENT | param-=
>extra_child_flags);
> > +     ctx->child1.div =3D 1;
> > +     ret =3D clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctx->child2.hw.init =3D CLK_HW_INIT_HW("child2", &ctx->parent.hw,
> > +                                          param->ops,
> > +                                          CLK_SET_RATE_PARENT | param-=
>extra_child_flags);
> > +     ctx->child2.div =3D 1;
> > +     ret =3D clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctx->parent_clk =3D clk_hw_get_clk(&ctx->parent.hw, NULL);
> > +     ctx->child1_clk =3D clk_hw_get_clk(&ctx->child1.hw, NULL);
> > +     ctx->child2_clk =3D clk_hw_get_clk(&ctx->child2.hw, NULL);
> > +
> > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_=
MHZ);
> > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_=
MHZ);
> > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_=
MHZ);
>
> I think we should move those expectations (assertions, really) to the
> drivers. It will make it much clearer what the individual test relies on
> and why it makes sense.

Agreed. I will do that in the next version.

>
> > +     return 0;
> > +}
> > +
> > +static void clk_rate_change_sibling_div_div_test_exit(struct kunit *te=
st)
> > +{
> > +     struct clk_rate_change_sibling_div_div_context *ctx =3D test->pri=
v;
> > +
> > +     clk_put(ctx->parent_clk);
> > +     clk_put(ctx->child1_clk);
> > +     clk_put(ctx->child2_clk);
> > +}
> > +
> > +/*
> > + * Test that, for a parent with two divider-only children with CLK_SET=
_RATE_PARENT set
> > + * and one requests a rate compatible with the existing parent rate, t=
he parent and
> > + * sibling rates are not affected.
> > + */
> > +static void clk_test_rate_change_sibling_div_div_1(struct kunit *test)
> > +{
> > +     struct clk_rate_change_sibling_div_div_context *ctx =3D test->pri=
v;
> > +     int ret;
> > +
> > +     ret =3D clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
> > +     KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_=
MHZ);
> > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER_M=
HZ);
> > +     KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
> > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_=
MHZ);
> > +     KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
> > +}
>
> That's not something the clock framework guarantees at all.
> divider_determine_rate does, but I'm not even sure it's something it
> guarantees. It's not documented anywhere at least.
>
> Plenty of drivers do not work that way though and will just forward
> their rate request to the parent if CLK_SET_RATE_PARENT is set. Maybe
> that's a problem of its own, idk.
>
> Anyway, what I'm trying to say at least is that, at least, we shouldn't
> frame it as a guarantee the framework provides, because it's really not
> the case.

I see what you are saying, however these are divider tests, and this
is the way that clk-divider works. I want to demonstrate that the clk
core is being called, and that ultimately the correct dividers are
computed. For example, on patch 7 of this series:

- Parent, child1 and child2 all start out at 24 MHz.
- child1 requests 32 MHz.
- Parent is changed to 96 MHz, child1 at 32 MHz, child2 stays at 24 MHz.

Child2 keeps the same rate, however the tests show that the clk is
actually updated since the divider is changed from 1 to 4 after this
operation. This is to simulate what would be programmed into a
register for real hardware.

I can drop the expects for the dividers if you really want in the next
version. Personally, I see value since these are divider-specific
tests.

Brian




>
> > +/*
> > + * Test that, for a parent with two divider-only children with CLK_SET=
_RATE_PARENT
> > + * set and one requests a rate incompatible with the existing parent r=
ate, the
> > + * sibling rate is also affected. This preserves existing behavior in =
the clk
> > + * core that some drivers may be unknowingly dependent on.
> > + */
> > +static void clk_test_rate_change_sibling_div_div_2_v1(struct kunit *te=
st)
> > +{
> > +     struct clk_rate_change_sibling_div_div_context *ctx =3D test->pri=
v;
> > +     int ret;
> > +
> > +     ret =3D clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> > +     KUNIT_ASSERT_EQ(test, ret, 0);
>
> Going back to my comment about the init assertions, here for example
> this whole test only makes sense if the original rate wasn't equal to
> 32MHz, but it's not obvious if it is.
>
> Maxime

