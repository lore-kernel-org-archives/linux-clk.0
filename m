Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3052B3E1D1D
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933263; cv=pass; b=APKVNDAW7mu7LbbQlVhUkQYXeQfUjCCIiSZyiorm121wuHLXmVTEwUG5pBeKQm5WMPnSTHtR3NmZ8UVOJnIh4QSllKuogBC9RvCkmwjQe3OrLcdu7I6SlJzIGUrSGWO+PGHinI0gxjFSC7+LlUPG2ZvWfD16QdBgVbnA0Y5cLXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933263; c=relaxed/simple;
	bh=I898rEATnFJRZS8oK0l9dCsoQhuFpbMF0Gjd9wIK6C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iANzXn/yeR2Wyn2UK7RZQyNkYos2AR2a/j2ip0vyUWFyDyGXAU5Pr30PqyhBj89mALtThk16ic37RhpSOdi50n845DHtJuvJW03bVDQrGgp2WFvEWI8+or15iNvMxTn0+ObQwaBAy2T1FCMH4nbvTKUF7FyPkUHy/2PON7L/3Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NhpQnd1m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MXdVuGOc; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NhpQnd1m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MXdVuGOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773933261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5r2eIqy8oBN5f5Ennk2OirN5lzwt2lI82tQuecsqsY=;
	b=NhpQnd1m3Ggtg3T8GE8ZntcABnaLyjDlwjlyANXf6dhH7FmxBZGK+pKC7EjGEXJCUKJ3r6
	C+eJmofWbSj7YqSSnVOr5ccOFnkGXcHSWRLWSj9TVNGElkCay/Eu9u12E23L8iMu5+xVnq
	DWCdTTvOTEVa3nEckq/kX/ccPbZQs+w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-uxY1EqReNeqAKNVxW2UPHQ-1; Thu, 19 Mar 2026 11:14:19 -0400
X-MC-Unique: uxY1EqReNeqAKNVxW2UPHQ-1
X-Mimecast-MFC-AGG-ID: uxY1EqReNeqAKNVxW2UPHQ_1773933258
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-65a11b5f24dso2675033a12.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773933258; cv=none;
        d=google.com; s=arc-20240605;
        b=SIQbmsKFccOfvm/5mXYURGcObt183hrozcrEQIjRp47Ur+UpIiqwcjczOuW2gHPwGl
         Q/nbflVvcktJz8bNlB66Pzh1NWNIC07Nyd+NanngJHkQU/vYnLIg7TqVfqaB126DbUKJ
         svbiNDUzmGFDb+ee8F3jRGNShZkXJv5XCJnp7HM3LJuA/6bdhD3jvv7qZoZBu+7r5bwX
         UvOMdf551Nmw6Q1k7rW7R0c2GsowwUfkL8hD1+mp+TRxRLvM4LH+zxT/I54Qo8wUM4gK
         7QuMNRxStlmeaWZX02GSZbJnhO+76BzOQ7zo0oXmkREM7+0PxJra8HL1rIRlOpjK5j6m
         C7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5r2eIqy8oBN5f5Ennk2OirN5lzwt2lI82tQuecsqsY=;
        fh=GyZtGVpL4UNB9rlXKgp5GlO4fNeS4ug7fm2d1jQBxpU=;
        b=Ux2gD44eDTQyfU3ycDwQ5FNZP4KzML+q9BvmlCn+w+aq8znIlnHPHkJQ2B9IUANH9c
         5Bq43cqhAPUmChnym0+Q1ojPDWpsIqa7OQZEMkO3lbDw8Ou/eTADCO1CX+gV7Tdu9HFo
         aKpTxyH2nOWW+mF28QcVzIGejrIq2xyqUYpWxvkzgLWtusQ6vF9Rj/v6UUAloJx9Wr7b
         BJF4NqHpfsatfi39E6dfj59N/kivg6s40OAch+zrsSYjQGjSZ4T+IwvWNXS6Vpp6T5uC
         zBWE6sHKN6am8i67L/S1NpUsRYXhgv2bKdFhAnvl1agh8NWByjO/4kzdtAksscIyBqWe
         m/PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773933258; x=1774538058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5r2eIqy8oBN5f5Ennk2OirN5lzwt2lI82tQuecsqsY=;
        b=MXdVuGOcTo9e73UNjgLo04wqPBX5BCB1v6a5/TNXw4TB9eTMH5nVuzo7cqInY3NxiN
         iTQauthsQelKmJRLiuhjDn79LWOLx8TSKDlHgSEo3KXwI8yyCqoLpZGzEhFsh1LWY31r
         IeiSniyxheOC+d6BWer9zVlzlsYA6X3tikiZshKVkw5veUDRs6l7iOg+H9aBuB8eHpsu
         r0zf5e3buTXOJoa+0E8yb9mVMPFqXIV1gpAn4mWuPP6HR2o3CX3gIU8kxHIQrzsET0N6
         wJeeg6foGvZUTn1ubGgeN8JuJHIUXGqUpBMpNcUSH/fr5VA0aWYh8llHEUi2mk578a/b
         juxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933258; x=1774538058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5r2eIqy8oBN5f5Ennk2OirN5lzwt2lI82tQuecsqsY=;
        b=TunqAPmJiU/m8hVN2AT9pDj5PxJecafHJYCkW72Rmc5TXSkt84nacYQrm/ByujuxVV
         ktEPfVk0EtXwZfZgegzJ0JIx0zvvIGP2kBlRR3viD5SGAeFFNvbVMKwDO6hDD+XDpHL6
         YtiQX+A/X1M2niu47IMq+z72KZFOs7G3Ey/ciIhbHRc8tJOnwhkzbqbYXHJkVAJCnB50
         wyKyajnY7fAMaejMFgfWV1rSUYwSDkz75XyWQCmdeq8zOn0grev5MvDE9CbwYWykqXce
         ExvD7rD4Q4CmCXr+a8wTR2l0KVzk3NpNJWXJcEl5G9O0n4wscCC89hCLNO3h7kfQr0H+
         7v6w==
X-Forwarded-Encrypted: i=1; AJvYcCXNMSQRRHVStdEQEA8JVxorrg8Uw4ZBVAZasejXosXlPnVxsw4Oxxws+BeCfsvcnr+QokMmPP0X8N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwq2efCyO1SEvQ1x5xmJCz5Y+a5q+q9dlyGh/f+W3ipMdo+kI
	njk9PKP3TMSZ/RjBDQtYPWFe88xr6+FjQNrcQqJgNjxorqTzJtkdYELVMEJK/1LyZnHpg4OobuO
	6bpOR0AZUG+SMRSNsz2ZbUJgTPIUqE/h8gy/O8H7sIErxg8u3/C8OyTBapG43BK3lFEv86MqRtn
	3S6bVLsftjclZxqcXD2H784XZ+1pjPmxkYggOj
X-Gm-Gg: ATEYQzxY0SXh7KF1yXWs9JINDFzJ9QIsj1UmbmmRjs9V1Nxqu3iKOOLBrexDZAUyxUx
	hnbW8tuQKzSq3XyWK47n5JRmTtY11SfQQbOktUf0fES8qHGxzHIjfRXo2Yb+2n4KTEU9NFMvSxw
	c73iHYqgJSiDyerDduyvcdgLcAWvGqtGMohm7vX/AlAEj9fmoKLfqYuLMjkobUuot6+BnEP/yDD
	G13Mw==
X-Received: by 2002:a17:907:3f14:b0:b97:ea19:341c with SMTP id a640c23a62f3a-b980f955e2fmr284791366b.7.1773933258381;
        Thu, 19 Mar 2026 08:14:18 -0700 (PDT)
X-Received: by 2002:a17:907:3f14:b0:b97:ea19:341c with SMTP id
 a640c23a62f3a-b980f955e2fmr284789066b.7.1773933257865; Thu, 19 Mar 2026
 08:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-4-ce89968c5247@redhat.com> <20260319-enchanted-flying-sparrow-5a6446@houat>
In-Reply-To: <20260319-enchanted-flying-sparrow-5a6446@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 19 Mar 2026 11:14:06 -0400
X-Gm-Features: AaiRm52w9Qb_tMhAykKjYgdNYKlBo0X5b471-vgAZuPWkrdW8NOkGu2nw1GrLUA
Message-ID: <CABx5tq+Tsui72GkktpY=ZxKw5nvrQhgXe9gKF8B3ugjbK-Eb=Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] clk: test: introduce additional test case showing
 sibling clock rate change
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:22=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Mar 13, 2026 at 12:43:11PM -0400, Brian Masney wrote:
> > Add a test case where the parent clk rate is set to a rate that's
> > acceptable to both children, however the sibling clk rate is affected.
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
> > child1 requests 32 MHz, and the tree should end up with the state:
> >
> >                      parent
> >                      96 MHz
> >                     /      \
> >               child1        child2
> >               32 MHz        24 MHz
> >
> > However, child2 ends up with it's parent rate due to the way the clk
> > core currently calculates handles rate changes.
> >
> >                      parent
> >                      96 MHz
> >                     /      \
> >               child1        child2
> >               32 MHz        96 MHz
> >                             ^^^^^^
> >                             Incorrect. Should be 24 MHz.
> >
> > Let's document this behavior with a kunit test since some boards are
> > unknowingly dependent on this behavior.
> >
> > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > Link: https://lpc.events/event/19/contributions/2152/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/clk_test.c | 61 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> > index 325da7c84ab2ecdcf6b7a023ce4c2c4ef2d49862..40bc01a0259d8d49ca4c198=
3b6c10a3684a95f0b 100644
> > --- a/drivers/clk/clk_test.c
> > +++ b/drivers/clk/clk_test.c
> > @@ -181,6 +181,26 @@ static const struct clk_ops clk_dummy_div_ops =3D =
{
> >       .set_rate =3D clk_dummy_div_set_rate,
> >  };
> >
> > +static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
> > +                                         struct clk_rate_request *req)
> > +{
> > +     struct clk_hw *parent_hw =3D clk_hw_get_parent(hw);
> > +
> > +     if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_pa=
rent_rate < req->rate)
> > +             return -EINVAL;
> > +
> > +     req->best_parent_rate =3D clk_hw_get_children_lcm(parent_hw, hw, =
req->rate);
> > +     req->best_parent_hw =3D parent_hw;
> > +
> > +     return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH,=
 CLK_DUMMY_DIV_FLAGS);
> > +}
> > +
> > +static const struct clk_ops clk_dummy_div_lcm_ops =3D {
> > +     .recalc_rate =3D clk_dummy_div_recalc_rate,
> > +     .determine_rate =3D clk_dummy_div_lcm_determine_rate,
> > +     .set_rate =3D clk_dummy_div_set_rate,
> > +};
> > +
> >  struct clk_multiple_parent_ctx {
> >       struct clk_dummy_context parents_ctx[2];
> >       struct clk_hw hw;
> > @@ -677,6 +697,18 @@ clk_rate_change_sibling_div_div_test_regular_ops_p=
arams[] =3D {
> >  KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_op=
s,
> >                      clk_rate_change_sibling_div_div_test_regular_ops_p=
arams, desc)
> >
> > +static const struct clk_rate_change_sibling_div_div_test_param
> > +clk_rate_change_sibling_div_div_test_lcm_ops_v1_params[] =3D {
> > +     {
> > +             .desc =3D "lcm_ops_v1",
> > +             .ops =3D &clk_dummy_div_lcm_ops,
> > +             .extra_child_flags =3D 0,
> > +     },
> > +};
> > +
> > +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_lcm_ops_v1=
,
> > +                    clk_rate_change_sibling_div_div_test_lcm_ops_v1_pa=
rams, desc)
> > +
> >  static int clk_rate_change_sibling_div_div_test_init(struct kunit *tes=
t)
> >  {
> >       const struct clk_rate_change_sibling_div_div_test_param *param =
=3D test->param_value;
> > @@ -777,11 +809,40 @@ static void clk_test_rate_change_sibling_div_div_=
2_v1(struct kunit *test)
> >       KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
> >  }
> >
> > +/*
> > + * Test that, for a parent with two divider-only children with CLK_SET=
_RATE_PARENT
> > + * set and one requests a rate incompatible with the existing parent r=
ate, the
> > + * sibling rate is also affected. This preserves existing behavior in =
the clk
> > + * core that some drivers may be unknowingly dependent on.
> > + */
>
> This description is identical to the one for
> clk_test_rate_change_sibling_div_div_2_v1(), so it's not clear to me
> what the difference between those two tests are.

I put this test here to demonstrate that there are actually two
separate items that need to be addressed in order to fix the clk
scaling issue. So basically in the series:

- Patch 2 demonstrates the current behavior of the clk core with
today's behavior with the v1 scaling.
- Patches 3/4 (This patch): introduce LCM for the parent rate, and a
test showing the current behavior with this one change. This
demonstrates that this change alone is not enough since the sibling
rate is squashed and set to the parent rate.
- Patches 5/6/7: add the v2 negotiation flag, along with a test
showing how the two changes together give the desired behavior.

I'll update the test description here.

Also, thank you for all of the feedback.

Brian


Brian

