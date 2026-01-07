Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C64318B81
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802701; cv=none; b=fG3r4QR8DQlqmUAVb/YxODZM9irDCjfcSAQbTcoMBuqF6QesVVlZ/Nx9q0v/GI/DMzQikeLOgjHtuiyIZ4M+yRfzvgvrPQe7LQf7YYnOQZNaX3PldOzj8mPrSU8Gs3ctZcvpjmSzfnuINgwGhHOcDT4cZ92c9tX0eCiT44NeUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802701; c=relaxed/simple;
	bh=P1Xty01RvQupKmQhHSR0uSMUP7gSJhgKk0CW7HysnfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1tcDL53Wg6TWtF/52IfDbA/TbbmmL6eBbkY6cQxvR1+784AW7CtCEKjgtcK1lRq2Y3v7A4v6aSVLBZTHbndghomd5ZqeJfXrgp/fIrMUWUlq32MXBFLM7H8jVVH+E/dzd+KhV3QWXvS/mwGxFjupbgTM8udFD2d/DtgVGPzXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+zuW7Xo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+zuW7Xo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47796a837c7so16975825e9.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767802689; x=1768407489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub6pcj+LESF7gm6VRMaH4L4JZtSRCvIUNf6ACo2jY6Q=;
        b=J+zuW7XojHykpfESZdGGblZlwJIH3qQcPHrpU/juS9+hacBzAWaBbhPYATOxsvQTHi
         UoPkvwqriO3TWXz5aA2bjY3bIaSvxVoCa9OmLIHgne+qek+gNnMuocW3i1VCUmIqmzWK
         GtfXxOFsPvDATslic099+hvpWzCCrK7gJlETLYmXEYrLk/CAgwxEJts4es0gURdRKbd/
         hbrr1cCyqv8p2TErr47MU9MTov6okYJ3wacd3BEfUTg0WbXaL41gqfkhMeeaXsSpcKUv
         y/bMTyThdMaYiObkFFVvbeK0vWCSMjfNX0EKWW2ywt+YSRdEEDpFaECLgeeVHL6F7rJ2
         nWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802689; x=1768407489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub6pcj+LESF7gm6VRMaH4L4JZtSRCvIUNf6ACo2jY6Q=;
        b=uHaunL+v8pLg78EXEOL8fNzhLdWrfhK5eDPVYWtyrIA0YD1oKjEYK+N7IYEyM4bhgq
         RKhN6dDmsRyllmSSsxnyaotvvWhqPjEhlQo1PQHcERhlR89XvhjzF5HYQ9RpWphdlrcN
         Bd7JEaDc5QjTOXv8/dDkOrsL7Hag+LqW+/uhtcps0QQKHS1sClcHrVA8zfEIaVLE67Mz
         QFrRg2v3QspEWXeZbcevmJ/9G0rtoaoGz7jZTqLgEvD2QP+SVS7Cc4riM5CdX3RpxnM5
         Qom13M3WecN3Cc3QWezr/rGwbpfpbQH/orrL1ez1ggt/bqhnWm2Pdo6kqBV7BI7Ze3Um
         haBA==
X-Forwarded-Encrypted: i=1; AJvYcCUeXeqs7Ihm4SlHWrC2U77jh+PPc/l1vZaHPS7eDzfR2DQK8DOiwkzw9NzbCaXwdwck8EfuSWUYx/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDckZHolQytzRUEgRoaOmKgt7tKrqD+UR9HevX5FroskozqAy
	XD/ER8s5LlPifnGWiRb4UzBwFui5REXumXu61qprANB0LOlaZjM6EB6EggJsEsOCbeP4MFcMzAl
	g4GHoQ33thFsl03/bzjZ4yCw/4Y2Ci20=
X-Gm-Gg: AY/fxX4O38iUQ+sXqFC3nV+FtXOVf1f0DlDtTKmrPfA9UDALn9v5CgmsEvBoQ5tydwb
	Vur830fCMu1rKY1RLXCZuLjk3XgYglEbK0o4xmQRFh4Z5YEZ9SnCuqWgiM/uMzz+YSD1vjUuFOF
	nqwMOZaNdtNnjpzZpxCkRJkxW19QF/LQgMH3bJMa7RsfovyS51PsUzx5CeOTovFgxON/8QD2lsS
	1C+uwl6xvi5jAeb+kuhpq9oobuuobnJxYoaYvsUtc4HZ+JXbplpUce5BRUeWr0c6yQECsjq+N8p
	ZqT2mWX39zdlp/59Vrn0IvLcx4Lhq4V6Z4uyC9coBsiTEQLyB34HNPwG0WLJLnC8RIqYxeIB79J
	kGC+Vb6as2OQDkA==
X-Google-Smtp-Source: AGHT+IGu3w1dZTOB7vC4uPV3KF01IfYjQqaSIB3ic1Bl7p/Pe4T+dKGPTjyVB0Zer4Ju1T2Oo1DgWJNqzxNiDuAOoV8=
X-Received: by 2002:a05:6000:4013:b0:432:8585:6830 with SMTP id
 ffacd0b85a97d-432c3760f78mr4159464f8f.45.1767802688753; Wed, 07 Jan 2026
 08:18:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
In-Reply-To: <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 7 Jan 2026 16:17:42 +0000
X-Gm-Features: AQt7F2pEf7prioPIipdcmgVFBpOq1BcZ2ikqnkNm7GziWlh0pmNM4fAPNlQ-bZc
Message-ID: <CA+V-a8t-2UiV74SvgmcLnWLA3yxdJGOnnjH17ZczY8mfD-90_g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Unlock before reset verification
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Jan 7, 2026 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Mon, 5 Jan 2026 at 15:06, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move spin_unlock_irqrestore() before verifying the reset result and
> > printing errors. The verification condition only uses local variables
> > and does not require locking.
> >
> > Reported-by: Pavel Machek <pavel@nabladev.com>
> > Closes: https://lore.kernel.org/all/aVujAQJSDn6WyORK@duo.ucw.cz/
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.20.
>
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -806,14 +806,12 @@ static int cpg_mrcr_set_reset_state(struct reset_=
controller_dev *rcdev,
> >
> >         /* Verify the operation */
> >         val =3D readl(reg_addr);
> > +       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
>
> I will surround this by blank lines while applying.
>
Makes sense, thank you for taking care of it.

Cheers,
Prabhakar

> >         if (set =3D=3D !(bitmask & val)) {
> >                 dev_err(priv->dev, "Reset register %u%02u operation fai=
led\n", reg, bit);
> > -               spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> >                 return -EIO;
> >         }
> >
> > -       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> > -
> >         return 0;
> >  }
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
