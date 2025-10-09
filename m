Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2C230D0F
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 03:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759980277; cv=none; b=T7Rtcob3GWulSpA+G7QRGeqTYzlRho482RPWSQFpVb74xnwt+R7WbtmHzeXP7fIG7XqMbsdWEFzu+/TPVkucxWWnB19flWvhx9m7CVvy+Q3qm5zldi0jAOzHIlpFEOe1y/cOPKyaNgoz6iAWOHN+aRgxb2/HV8f61LzwRC5AdBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759980277; c=relaxed/simple;
	bh=wuy3By0Y2Tg+b7ZCa7mieVDm5ZYxL2laIBVprF635AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7b7/P5MeTdkoEUgewXaYpLr29c0RH1az00BomvqkSLjHsBTxd43SP7BwoXBCsp0UfkTqYAjfGOOhsFfIStuqn4kWpLXgRbCv2sHKUbmijQHGTY76Sm5TBRoN3CIJF+oK7hBE5eB5aB9NfVp7eVPz4iUuLms8DEGRg2Xw85AYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GYrFrQm3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GYrFrQm3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36527ac0750so3619781fa.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 20:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759980274; x=1760585074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsJEEsv3A5O4v+d0q0gbe7mKpNJ5lsVKHfbN1hMU8aU=;
        b=GYrFrQm3fi3pGBJKPS+qGpuA3qOFL6L16bTF+eguk8lzNkVfKM37rzPLXpTSwSxkQT
         KMujxl2GTdtN6yBSSs+COtObM64ZfRl2pS2f4Pb/2JfwEukxSLAYpjYilNAYHCVOeDuC
         I4ij7VliPlT3+HYicqFf6pO/ksdQf3uKsMwZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759980274; x=1760585074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsJEEsv3A5O4v+d0q0gbe7mKpNJ5lsVKHfbN1hMU8aU=;
        b=QF28TdnBm0PyWAeC9qAfvTnnL7bXFyJq4p6bbUAUM6MkT/8zaTx/ZO4nEo099yBH2o
         /RiFBuVN6M4nMA52MHJofeZ/58EAgCkypJJWjE/fC9lzzflmI3i+KMvpR5g3bUMGJnUj
         mCC9iUPqqo3OSQBejpgl+pPlfAp5iIeLTcgLyobFNr9PKCDPKBC7OEGx7lFbeqnxikQB
         vtaaLABpZjQDl2GQSnjE8nXW33RshxVP8uss8F+13b5Jsed2mLfF9UiKhmQpYv5MDm8h
         9i5GTW7qt5K3rhzQPTMDp2O0NlIqGpPw0tnVxAAKkRait+I9lCWeyoFlLox0SL6MALeY
         bJKA==
X-Forwarded-Encrypted: i=1; AJvYcCU5L5LO4oHN6RzkE3y3RXBn92kPB+Fs9YeWC5hGJZrEsxTKftyhR/W5RNSWYyDWzuoO1zy0aklh0PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cWTQ6k3AlviKrIwmBJmufbgaw267Gyn0tOXnDpDWlIKyIRJW
	ruPRPZ1nMhPXfMF45PgEZ876uixhMuPPsg+wrJDXyccIzKoCR4HlpvnrCLFH3HVE2+zso193taj
	2Mw5we1XU5v+oc6EBZcSMnMD9VA+9mVYCTLeKygJud1l0OJp5LlU=
X-Gm-Gg: ASbGncuWPcYZRTdvk9hefpTnDCPrfnrkoltw2TiVlP+jXHIbJWwvrnwGqN7JWQVBZyD
	KR4krxrDYKADgNU9vsBmfD0kzzZ5qjTPS4Smhyj13NGMGMZ+fULreMv5TUL0bkAiC8hII7m5Drf
	6ZFZ06lraPYrNdwTg454eU1dwPtBbOQUyG47WEN9jDvE3t59BOt8cdfn0VyV3CwjRm8PexL2R52
	z+afW9x//NM6+mS1E69pDgeXFvp+136rsTJ9DlUk4deI5V9iOSsA6ydwhnn7Q==
X-Google-Smtp-Source: AGHT+IG+QPrYaBQEcc1m0DbO6LG5DEjR0TPM5uYoLtJqrCmn8hGuxLighHMEr0XBvn54MH/J/Jg3LC3BrvSJqr9grVc=
X-Received: by 2002:a05:651c:2125:b0:36a:925e:cf3c with SMTP id
 38308e7fff4ca-37609e92df7mr13074921fa.31.1759980273543; Wed, 08 Oct 2025
 20:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002092036.2504858-1-wenst@chromium.org> <aOb6iNR9T4R9Hp3R@redhat.com>
In-Reply-To: <aOb6iNR9T4R9Hp3R@redhat.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 11:24:22 +0800
X-Gm-Features: AS18NWATwDeEXLQ-tcqHs03KqOOqKmAvfXttBG9nKH4eO_votAHmlfrLRfdR9ao
Message-ID: <CAGXv+5HPjEnYh+zUi67+Y=nmFfdRFw0xd=rT7L_-GNxouga4Ow@mail.gmail.com>
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 7:58=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> On Thu, Oct 02, 2025 at 05:20:35PM +0800, Chen-Yu Tsai wrote:
> > Clk lookup (by name) recently gained some performance improvements at
> > the expense of more complexity within the lookup code.
> >
> > To make sure that this works as intended and doesn't break, add some
> > basic tests for this part of the CCF.
> >
> > A new "clk_hw_lookup()" function is added purely for running kunit
> > tests.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/clk/clk.c      | 11 +++++++
> >  drivers/clk/clk.h      |  4 +++
> >  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 80 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 85d2f2481acf..a17d0070d11f 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
> >       return !core ? NULL : core->hw->clk;
> >  }
> >
> > +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> > +/* This is only provided for kunit tests to test the core lookup funct=
ions. */
> > +struct clk_hw *clk_hw_lookup(const char *name)
> > +{
> > +     struct clk_core *core =3D clk_core_lookup(name);
> > +
> > +     return !core ? NULL : core->hw;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> > +#endif
>
> Use EXPORT_SYMBOL_IF_KUNIT instead for consistency with the rest of the
> kernel. In clk_test.c, you'll also need to add:
>
> MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Didn't know about this one. Thanks!

> Since clk_hw_lookup() is only used by kunit, why not just put this new
> function in clk-test.c, and use EXPORT_SYMBOL_IF_KUNIT on
> clk_core_lookup?

Then we end up sort of exposing clk_core_lookup as well?

I believe Stephen wants to keep things contained as much as possible.


ChenYu
