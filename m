Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E535DA4F
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083303; cv=pass; b=ULIWHJ+tVdU+92PTgK6KxZPf3zTUIF0ed2+n9vAG+SNgw976hRwabOiPcNkDaPi6aL3kHn7ephpzedkth0XnwFNEfTq2t2GQiE5gsSv4Aw9lmuXsvPYXiI3nIqmntw74AUcOVu09ZN/z4h2P+tgq1nBfA9MMNKstK8vGJusxX6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083303; c=relaxed/simple;
	bh=xsHSmBrP8uAAlVjNBz77G4uhcSS+CwO8tygFMXbTWBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy5+qDlZBgXFP2Z4v6o81eaoJ51uD51cPHj5mnhhRmdefQkKCKNrPxttjXC06hLTJzA9WeEf7cngLi/t0dApzX2bdO40ra0P3x2a766eJQjGWP1ZVdDw+RMEVfnspcnlB65szg+zp86lfRM4Rb2fDabPfL0E7Cxwb1Cb+pq9O5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVVAM0rh; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVVAM0rh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so759739f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 05:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776083299; cv=none;
        d=google.com; s=arc-20240605;
        b=QBjdZc/t+56TPo1FATnhGQNxRwKmNfkzkqe9sXqciztLsfZ3JLpM+PGl3jcRRoElNP
         eA5cQi+ScF/9XQ5FJ29TAxtP39DU8e4mfBKr0V301RUxi6aRYXkzJ5mz3RPU/VVXsCwj
         cbFipBFfFmH398vzbkvV44DLs1sIVQBaE8TEJjPL1pdWc2ARsE7GcXbW3w9mBuwNJL2/
         FPWq31zAZZ848oy1uHHe6rNFHw5kJh50sFvXaR8OgvRs23UP97WHKzo2W3Kzp7cf90JV
         pctgkH97enH+bToiVQFZNtpt7LjT2YDtMjogibuRkI15t02a/gLi7m8ZXHn8FM8h08NI
         tS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AfR7ekTVJM91N24iXqkZ230dnYTXWreR7I5vB/E9sQk=;
        fh=5z/dU8IBH2iJd23PppzTkNTMVOOHTT5xNfocHJCcnas=;
        b=cEchLxnoCtqX7B7n4b4CAwDOyqHJ/oght0cKfbg6+8bChEumtjx1yP5JdV0owlen6C
         szOw8vcZ9r5/VAg0pabaJIOq+Y+fxW2utgtDoOLGEDkOPu+YNEMh6XRuYMREUJSGQjwt
         F8uAB0RY/akVbeTJ6g0QJvD5K/t7UWB/ojKD09ncNyC7+MxaaVG8sgSlMLmUnMh7PAGN
         81GxhMQ2+Mod3fmPMCLBxKASpePZCObY7bbWF7z0DDYMC/iPTA+2fEBf4i6a/U4DcPU6
         g0pUqnZNZ3iy+9GEpolqqgRrVymYqqi9mU8+OfusaK1nDBUZcWP6Dus1XvSVRqPE2PCR
         Enmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776083299; x=1776688099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfR7ekTVJM91N24iXqkZ230dnYTXWreR7I5vB/E9sQk=;
        b=RVVAM0rhSCeho9yGJRfOHkjS/hBIsLDhfeYwf5o1Q0Rey2HBPTPa9spdbHbcBzQ2aD
         4kS9ZyAFgP4bMkqRfVqUWulikOvJg8rYXfNU628zan6joGikarhwjI+lRBuGXtfM2UaN
         VqH65C7oRApZvPpOyhOLs5lEbwHYp7EMKK5DK5ACg+oZ9rMf3DkTadvOHtFRgFgSj4wC
         a52BQu9saKqnlQy3SMqxA3Xy4cC8uUgLoetvKEzZJW5BeIiqUHWpN46oBf5aI2Pd1baF
         GF7zo1PjT04O53j2F9g0EnflLi4XNcaHtRthGngXV3kLrJAahpHD1fes60gQUHsSK7LS
         9nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083299; x=1776688099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AfR7ekTVJM91N24iXqkZ230dnYTXWreR7I5vB/E9sQk=;
        b=orSrEy/OO7HPWUWBqyLVAUG82qXCLo5dvmCBsZJAvnWmbIqWUjNTOuJlO/tCdyFGSp
         3WCAiDNvCWpvSqCpOQaCpVY4Xc+KP/qwf5i5q4ntHvpTWjkdSRLP01WNHIozxbQycfDw
         wHPfAPZjNDFZAqPicsSlHpLQIYeUH0hBLIcwZp4nmZ+xBg2vRAwilm1/1yUgwk1R1D5D
         rVpwQlmHcbdbdyXExbhmNobGEKwod28ROloKg9P8kVDUFDFhZHsWvFn9wcPIncYW0mIJ
         LnIwxjMEUJCYUrmbZKTZBogFjb8boY3KftPWviwvrLabjwtVXmhgslh7s8lCE4vFOJGc
         TBbA==
X-Forwarded-Encrypted: i=1; AFNElJ9m5/SS7571Fzd8r8HPIyqJiSSxvsyG/13hn6TG0GfZgrAAP0WnKE15v09f8wCCzkvoTJIcVYXHjsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjY9ykqBZrodDN5gVQJJQx4P84LwLoF6qMVL14Hd9p1HUPyH6V
	uoLn0SrQy5rNTvxc3HJ5xjV0N2Xpc9mUmnEH8G7UeCxMQC3l6mM6iDscyHe0PwQmq3qqqu1G+QG
	k7rKet4Of08T2jCbUs24jRPCP5zRCCkw=
X-Gm-Gg: AeBDieuYAh2QwVRVEAE6x6vXmwCfprdpmhQZlnfL4yWTuMnnp/jguWXohEA2MBr6e6n
	8qPb/z/CkhTBdtuKnm3B34jKJu+XmleaHc6iQyWR6FJ/FH9BH5dNRa4GfM0YtaQLrtsjcl67iL7
	BtYrmY/vzuiqH3nS2nV3Wn/LVmsuoJKNm5ETiqtLS2JelaPoX7CfpcUfdELP4HXxYRk+6cjX+nE
	ICJUx2CYmOTrfR8cCDcuBNdi8+FYiG11ajI2lXWFbXcPSnuu/xVPZZAfafPkGqnWoqyk9mHfq5a
	jatcooUSRyyhqzMTx372cfHJd7n29+29oHGU2LSVY13Mv27SS7ftvEaAc8yyuhUgpf0mT3epTVW
	IUARW+g==
X-Received: by 2002:a05:6000:24c2:b0:43d:1598:2d6e with SMTP id
 ffacd0b85a97d-43d6497b76amr19100204f8f.20.1776083298413; Mon, 13 Apr 2026
 05:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408094814.321072-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <177595505293.5403.10549666544609254028@lazor>
In-Reply-To: <177595505293.5403.10549666544609254028@lazor>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Apr 2026 13:27:51 +0100
X-Gm-Features: AQROBzC0PYE3EO5g6wnqK62bLxgGOY1Qxb098X6a24DD3mFd7tUNfPeu0EnDhKE
Message-ID: <CA+V-a8vO-sq2CBiJFC_UuU5=Mm730qz3Ga_Ze=3sboV3gzQHuQ@mail.gmail.com>
Subject: Re: [PATCH] clk: divider: Fix overflow in clk_divider_bestdiv() for
 large rate requests
To: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Thank you for the review.

On Sun, Apr 12, 2026 at 1:50=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Prabhakar (2026-04-08 02:48:14)
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > clk_divider_bestdiv() clamps maxdiv using:
> >
> >     maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> >
> > to avoid overflow in rate * i. However requests like
> > clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
> > supported rate of a clock, result in maxdiv being clamped to 1. If no
> > valid divider of 1 exists in the table the loop is never entered and
> > bestdiv falls back to the maximum divider with the minimum parent rate,
> > causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimu=
m
> > supported rate instead of the maximum.
> >
> > Fix this by replacing the maxdiv clamping and the unprotected rate * i
> > multiplications with check_mul_overflow(), clamping target_parent_rate
> > to ULONG_MAX on overflow. This allows the loop to iterate all valid
> > dividers regardless of the requested rate, and clk_hw_round_rate() with
> > ULONG_MAX will correctly return the maximum supported parent rate.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/clk/clk-divider.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
>
> Please add kunit tests to show the broken behavior that you're fixing.
> Make a clk-divider_test.c file for this instead of adding it to the
> clk_test.c file.
>
OK.

> >
> > diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> > index 45e7ebde4a8b..dc486c2aa946 100644
> > --- a/drivers/clk/clk-divider.c
> > +++ b/drivers/clk/clk-divider.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/err.h>
> >  #include <linux/string.h>
> >  #include <linux/log2.h>
> > +#include <linux/overflow.h>
> >
> >  /*
> >   * DOC: basic adjustable divider clock that cannot gate
> > @@ -301,6 +302,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, s=
truct clk_hw *parent,
> >         int i, bestdiv =3D 0;
> >         unsigned long parent_rate, best =3D 0, now, maxdiv;
> >         unsigned long parent_rate_saved =3D *best_parent_rate;
> > +       unsigned long target_parent_rate;
> >
> >         if (!rate)
> >                 rate =3D 1;
> > @@ -315,15 +317,11 @@ static int clk_divider_bestdiv(struct clk_hw *hw,=
 struct clk_hw *parent,
> >                 return bestdiv;
> >         }
> >
> > -       /*
> > -        * The maximum divider we can use without overflowing
> > -        * unsigned long in rate * i below
> > -        */
> > -       maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> > -
> >         for (i =3D _next_div(table, 0, flags); i <=3D maxdiv;
> >                                              i =3D _next_div(table, i, =
flags)) {
> > -               if (rate * i =3D=3D parent_rate_saved) {
> > +               if (check_mul_overflow(rate, (unsigned long)i, &target_=
parent_rate))
>
> Please add some sort of comment above this if condition to tell us what
> a target_parent_rate of ULONG_MAX means and why overflowing we set the
> rate to that.
>
Ok, I will add a comment for and send a v2.

Cheers,
Prabhakar

> > +                       target_parent_rate =3D ULONG_MAX;
> > +               if (target_parent_rate =3D=3D parent_rate_saved) {
> >                         /*
> >                          * It's the most ideal case if the requested ra=
te can be
> >                          * divided from parent clock without needing to=
 change
