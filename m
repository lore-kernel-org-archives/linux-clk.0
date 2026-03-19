Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8A3ACF16
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918616; cv=pass; b=gAsP7pHohVzf4XiLwN83e/+Dw9apYQqMe9df4wv3qi4XW6fyrnXogdjJIyKU+aQGDmlCHC6xhHx8yNHJSWTPOxdZ1NexmaCpj4jJDohXNaoE092oHbnuQ+oTlUpNTOgMyqZ1Cma6DJ6lTKgVNlM+vE4mBj3i62lbqxAtJ4622AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918616; c=relaxed/simple;
	bh=6eMAHKxPqpQ9EDYrQX5ke/DY1++qcIsbQiYgFBrfh5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHE5EdlCnwAz85jrG+HRMQ8VIUX7lpdE/LcE+4TO0ADNq7w4Y1EZJfnrDu/5/nHXbT5GyUF6K5MKEaTRTGPeZUbUNw1qpCpiuufy1XxbjxWPH9LnKw574kI/UdRUU+jb2fNSNqfLSKrCvB+gEmKgBFFk8v3h1cUv50H2Dp+gx8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQFEbgW+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCW0QlmM; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQFEbgW+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCW0QlmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773918614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLWBcototkeo4OIleMx3l0Y9FfIppHrNjzTnSPFsMcU=;
	b=dQFEbgW+FTmSSuZjlYQjJgGaFNsvH7VXYHOHVngOZCVEvP8MbNOzKvwWnVm9tRtmF65y+d
	82RrCscZ3EXuqq3nYDgWPH9B7aTZMOqwpme/7BjDllzqVR6R1lGNaYlpwmG9b7Pd6wD9Sg
	9J0f2f26oewS0MrVEKZiTbe0cUKQWj8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-pbNlL0u8M2CcEZrycSIRRQ-1; Thu, 19 Mar 2026 07:10:12 -0400
X-MC-Unique: pbNlL0u8M2CcEZrycSIRRQ-1
X-Mimecast-MFC-AGG-ID: pbNlL0u8M2CcEZrycSIRRQ_1773918612
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b982051b914so81941166b.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 04:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773918611; cv=none;
        d=google.com; s=arc-20240605;
        b=P00ec1wqzCDDOzUIDFuOEX6XvRZrsKJjnrnvHn2TPNv582MdeDR00NqbY2zm3VCwVw
         Q3aqCdCdlKrdoq/UeVnbCnelsYEzHihERY4M0/83tQtq7Ou6O8Nj4h1Q09RLgSy5f7K5
         zGu41J/yTuYYl9YD3k9hTpvsuFaMIvmVlVaXGcU89DV3W7/ne4uW3cL9T6azupPCPkLu
         1iL9vpGOe9dFoC/w6aBAdhxfU+gQiD/X6c9D2LbTAQrG4ywQTaPsFypHumK8tjWsuxHR
         pGtOzV1XsuhOzODapdalrD7OKrKJcsvrN7AgWOhbKZuIGMxapGLK5jVPa/vbuVylopd1
         H2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLWBcototkeo4OIleMx3l0Y9FfIppHrNjzTnSPFsMcU=;
        fh=LwIRcZOTY6QbW2d9EoUsXYfntRl1bVVj5UPIHhfwWPE=;
        b=edr0rN4hKKjjGXTf1bfwyE3P1h6GtiAJnKbnQS92pj8SWHatMPoV+KQYYe7qLKjJrF
         O0doHuY1ybfa+HYbTMClCROpM4AJCXFx04SCLrh/BAKbbwUl1mnFCIfRdFJ7hOZiG473
         23+gQBxMlTFWssJ0V2Ryf/EaSeYUKSCDzek/HO6FqSwfMdmZz+UbGhvgi2tZKTJS7tq8
         8Ik3cPtqcmKZj78HUsNa4I+CHBrIyMB3xaf177gP3Og/2AA20ZcDCYxyNsGaxLW1U8ou
         esAYDUyWg9zmRZOeGr0x7/vWsdxyWMx0QpiQxGci65nPDvGg2AwH/+ckmKxdKaKSm3hY
         R0jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773918611; x=1774523411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLWBcototkeo4OIleMx3l0Y9FfIppHrNjzTnSPFsMcU=;
        b=SCW0QlmMdWyE8e5mRl1P8sHyOKxm4ZeXq3vaYOnc7XYuGkvMk+ZlEF8zsldtq7k5s3
         dlRZtqhe1D5WNXvfThhIJF5WLsBqLu190/9I3/DIXabQQF8uWs+nw8c+nxyQ/bxd/xN/
         e/ud47OZnaD19m+cEtZtq79nrNLsZtqq+KFYs6DuFbwUxM2mTs2MewGzqgiQ4t6oVpwS
         ri2Mc5iuSQJcPApkXalQwP8EMWmXqBp3MCyG6BtiHv9eJt0F/uonFSmEu+xroh9G60MQ
         TI0eshnEtzvtiH4SxkhP8DtXuxm6vE3ba+TDrdBc6PySlTWYb/SN4uNpL5jqnBBbgAFc
         SeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918611; x=1774523411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLWBcototkeo4OIleMx3l0Y9FfIppHrNjzTnSPFsMcU=;
        b=DdKnJbx00bPKuo8vf1CzLrIc5nWlki7MdBw8nr8r9w8civfs7SibLR5nFw90wm4sX0
         1hV408mMF3atID16nb9L7TkSy6r1umqTmRJYdT52orYNSAWxoeMxA0teurErminrFyyJ
         qCigbbYprULLDUzAoQQL2eZ6vvCr/uPl9jfM47pVgercU7Q4J1tGgOVTjtYaB+gwVX1o
         cK9wLCufFvgjUWD3ZJJ0QdEJe0XEGfq5dnIDjHCwSV02wdGFri4lI4yck/kU3xEPu2cT
         UVKl9Pi6ycLX0KyqswhdtLs69MkBPwoCYH4Vf084+RBugVPdoA3/CA8gXCN98UO449TJ
         YBbg==
X-Forwarded-Encrypted: i=1; AJvYcCVIGFL0yohxYrkxmUJ/pNW2+iAWMYzAEW+B2ZNxQbnNa8lfhEV4/7lO797UBAwY5sYyLrcOtGNhz4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsG7E1ojadWyQzURakWaJzi7OrS8Ze69P3GN/63bOmDIBm6PEn
	BDy6qy6zdubWDOwefEtA2jRQrviAdWoS/SL9kcPtZFgyKAO+KSmWsWvhW50451To+3Qk1c+1nR6
	BnThYHi6o+1pGajjWnhswbuz3I5YYzMAe5I8QZtozV8oGtoBSvV1+10MH3Kqb/EDmVR+2w8FChB
	4j2liOeJZClpzdOVB1fgY/ounVx/mu5YEklHdn
X-Gm-Gg: ATEYQzxS9Eqmp3QtPyd4Du6Y5geRiO3VqrhktvHhATDxN9f8adT1Pes3t+DWoVQu2Py
	DGjTd7NWJsrbn9nc9TYMJ6o/ev5wWOO4WAti/kPEWQpAb9+MeXvSZbKzpcftZpxc82MobMQlDzs
	2gJ5uvbUkQ2o63s6/uJupmPP/nheFg7gbFfKW9n5qqjzb47R/2kyhung66zX2jJcXJvgQUDtHVj
	t1o2Q==
X-Received: by 2002:a17:906:d14b:b0:b96:eb7e:bc55 with SMTP id a640c23a62f3a-b97f48855d7mr308377466b.10.1773918611406;
        Thu, 19 Mar 2026 04:10:11 -0700 (PDT)
X-Received: by 2002:a17:906:d14b:b0:b96:eb7e:bc55 with SMTP id
 a640c23a62f3a-b97f48855d7mr308376666b.10.1773918610956; Thu, 19 Mar 2026
 04:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-7-ce89968c5247@redhat.com> <20260319-mellow-cautious-bandicoot-01de99@houat>
In-Reply-To: <20260319-mellow-cautious-bandicoot-01de99@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 19 Mar 2026 07:09:58 -0400
X-Gm-Features: AaiRm5151oEIUbfOtBFf9-OjZyE3PTEkpW7hUSqP_gIyr7Urbci6f_aABs9BKRo
Message-ID: <CABx5tqLMKzFrT=aYJiQ=eRztR+=cZw5TLKSPb=au1pKfA2SKUA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] clk: test: introduce additional test case showing
 v2 rate change + LCM parent
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:43=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Mar 13, 2026 at 12:43:14PM -0400, Brian Masney wrote:
> > Add a test case that uses the clk divider with the v2 rate negotiation
> > logic, plus the Lowest Common Multiple (LCM) to calculate the optimal
> > parent rate. The test ensures that the parent clk rate is set to a rate
> > that's acceptable to both children, and the sibling clock is not
> > affected.
> >
> > The test in this commit use the following simplified clk tree with
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
> > child1 requests 32 MHz, and the tree ends up with the correct state:
> >
> >                      parent
> >                      96 MHz
> >                     /      \
> >               child1        child2
> >               32 MHz        24 MHz
> >               div=3D3          div=3D4
> >
> > Additionally, add a note about why clk_dummy_div_lcm_ops + friends are
> > still needed.
> >
> > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > Link: https://lpc.events/event/19/contributions/2152/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/clk_test.c | 49 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> > index 40bc01a0259d8d49ca4c1983b6c10a3684a95f0b..00511afe5faa8b2631633ab=
796ece1bfe6944fb5 100644
> > --- a/drivers/clk/clk_test.c
> > +++ b/drivers/clk/clk_test.c
> > @@ -181,6 +181,14 @@ static const struct clk_ops clk_dummy_div_ops =3D =
{
> >       .set_rate =3D clk_dummy_div_set_rate,
> >  };
> >
> > +/*
> > + * drivers/clk/clk-divider.c has support for v2 rate negotiation, and =
setting
> > + * the parent based on the LCM, however we need to be able to test jus=
t setting
> > + * the parent rate based on the LCM, and not set the v2 rate negotiati=
on flag.
> > + * This is to demonstrate existing functionality in the clk core, and =
ensure it
> > + * stays the same. That's why we need to keep clk_dummy_div_lcm_ops, a=
nd can't
> > + * just use clk_dummy_div_ops.
> > + */
> >  static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
> >                                           struct clk_rate_request *req)
> >  {
> > @@ -709,6 +717,18 @@ clk_rate_change_sibling_div_div_test_lcm_ops_v1_pa=
rams[] =3D {
> >  KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_lcm_ops_v1=
,
> >                      clk_rate_change_sibling_div_div_test_lcm_ops_v1_pa=
rams, desc)
> >
> > +static const struct clk_rate_change_sibling_div_div_test_param
> > +clk_rate_change_sibling_div_div_test_regular_ops_v2_params[] =3D {
> > +     {
> > +             .desc =3D "regular_ops_v2",
> > +             .ops =3D &clk_dummy_div_ops,
> > +             .extra_child_flags =3D CLK_V2_RATE_NEGOTIATION,
> > +     },
> > +};
> > +
> > +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_op=
s_v2,
> > +                    clk_rate_change_sibling_div_div_test_regular_ops_v=
2_params, desc)
> > +
> >  static int clk_rate_change_sibling_div_div_test_init(struct kunit *tes=
t)
> >  {
> >       const struct clk_rate_change_sibling_div_div_test_param *param =
=3D test->param_value;
> > @@ -836,6 +856,31 @@ static void clk_test_rate_change_sibling_div_div_3=
_v1(struct kunit *test)
> >       KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
> >  }
> >
> > +/*
> > + * Test that, for a parent with two divider-only children with CLK_SET=
_RATE_PARENT
> > + * set and one requests a rate incompatible with the existing parent r=
ate, the
> > + * sibling rate is not affected, and maintains it's rate.
> > + */
>
> I assume that's only true if the v2 negociation is enabled?

Correct.

> > +static void clk_test_rate_change_sibling_div_div_4_v2(struct kunit *te=
st)
> > +{
> > +     struct clk_rate_change_sibling_div_div_context *ctx =3D test->pri=
v;
> > +     int ret;
> > +
> > +     ret =3D clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> > +     KUNIT_ASSERT_EQ(test, ret, 0);
>
> If so, we should have an assertion here

OK, I'll add that in the next version, and update the description.
I'll also add a similar assertion to the other tests.

Brian

