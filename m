Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA21DC985
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440902; cv=none; b=k8sc7yJcz1LVv1LeBABrsKTJYl3kqNNb3PveQ5ZCGd56VJZsBkkDCP7lWTyQGVV3YiO9fnlptQiSEVI67giKFQRtBepbNYgMljPxDutThm7hKuWZdiQOzZRf7qgW3uo6AwsVb/Qgk8Olo2eRigy0B6YQUI4NESVSKQA/mmeRnDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440902; c=relaxed/simple;
	bh=HaefBq/9gx/xpe6H9SR+jXE6I2U49/Bi4dkyZMOckp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8ZBlyXj0OLS8skN6y7FHYZLpRpvNspEn40OG44jfqdvfjxY8Q5+3sedxyr36jVqVM58M0RwyAK2HX0TzbjZ7Ov2TpS7AOlOQh3WmecVFFJx+NqqfeRN5kkNCbhN74jUk5cKT0vb6AY2HHhtdkXlpvfEM7RejVUQHDzlqfE3wDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3737d09d123so11166801fa.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 06:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440899; x=1763045699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxZVtMOHoNocoyXPFvfejRTHivuCeFc8a9lYqiVNw1Y=;
        b=FMUZ5s0b/OR0v5+iYomrBfwaSVxoP/UyApCqsetdfLPFBA96XXrPXFMn8F/MFXOfWz
         K4Gy1v9jBU3IRTf6rjTI8fEyvvcrZ2EdVH1NeIFh6zswjjjkoynjZgQvyoWTv0AOqlmM
         KcjLfFaBfebAF+hYlJ7boPSVlihUITf64w0XhdujYldJ/7QRq7xHKFt3/He2iRHvcZ+C
         eTLkLdFvgGYg3daNJimOSkwNXkWUfEsuEOHt0Pbyqdpez54auvPvmff5sEixCIthR0zV
         LlnHJAK/pETQ4JvSbKr2w0GUt8MgZUeh1qd5wXgnRkcX1YEcrAgfTIve9dsAKBBJCSyB
         Dhhg==
X-Forwarded-Encrypted: i=1; AJvYcCU5myoFo0FGzmmKhTsKdm6wIld2MBYy1tylxUSBXHePxiEVZJblsd6NoYbZbUECT4ZN6vYJ+jmhgPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1OzXXxwSIb0+JprTQ9vjGuGWvgXFIFSQ8Rp8aZgoGegu1w1O
	W7XiaZ+Dx4adBchbr3lsBG5c2bK2WM6BMwjggdJRqExVDuOixOcF/IeB9VXYcKFthRs=
X-Gm-Gg: ASbGncsUVJn+R5i1qrySrQ95vyKAAQcDQyLJQ7V692XG8gA8FLHwiAaFECRmfXGFv+Y
	yt4KoSllRUJ8k9QGBCYJON0mYyABIEW6NaHUyT1J8JLcRrNCid1qim2pdjVh+3Ub7/Fas2W7M37
	tKpmQkI+Iq1zz1VZG7h70GsiDUhVt8T+UMCvIwgq8SsjGDR87863c7x+ATuCW2Q/gibU8JQBQjR
	y3x/d6UI7E15F+G0z/N+Jsjj8w7RtkOTfPDTtnpJ8kGDpajeWzLFlmn5aQBqQrrBE0RnDU/WYjK
	gmpxEf6sIfWutu80Py0Of//XMNQRIy7MDjNkxTot/IZZ0hEMK5dbX/IxWTvQqgheSMbiYvtg0W6
	91xGs2N3FeNMs27Q68ujnIh3irG26kpKYYgWHYWlfHlvk9WMjMLVh/dEM0J6TD7g0Ubxb3j3H/b
	7PaecFTrhbC2vvoyGRDTfRxbxkZWCQzjde4qX5WQ9cX0QMddStCdnx
X-Google-Smtp-Source: AGHT+IFwhlZ2Ke7y4dViiIUvdkuWI9foIGEsFGnN04f5glrgRkCl+9RwSqx9qLAhOmd88jktMJ0syA==
X-Received: by 2002:a05:651c:1617:b0:37a:43fb:3ab7 with SMTP id 38308e7fff4ca-37a51488541mr19583671fa.36.1762440899127;
        Thu, 06 Nov 2025 06:54:59 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dc502sm6728621fa.31.2025.11.06.06.54.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:54:58 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378d50e1c77so7871821fa.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 06:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrNXAoOwpB7KcNVnRqT+w5Ubd7mbexwk27rq5p8Ey3z/dnsm0G4m6HOdWlx+jpVLwf9zG/pMlS9nY=@vger.kernel.org
X-Received: by 2002:a05:6402:1ed5:b0:640:b643:f3c5 with SMTP id
 4fb4d7f45d1cf-641058cf323mr7301623a12.16.1762440555932; Thu, 06 Nov 2025
 06:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
In-Reply-To: <aQy0T2vUINze_6_q@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
X-Gm-Features: AWmQ_bnZOzLGAFcWzxKh1EIKjH4MNs7moeVCtN8xGb6mN65nYBliBYrABdUBf0M
Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > (long) long" _mask types.  For constant masks, that condition is usually
> > met, as GENMASK() yields an UL value.  The few places where the
> > constant mask is stored in an intermediate variable were fixed by
> > changing the variable type to u64 (see e.g. [1] and [2]).
> >
> > However, for non-constant masks, smaller unsigned types should be valid,
> > too, but currently lead to "result of comparison of constant
> > 18446744073709551615 with expression of type ... is always
> > false"-warnings with clang and W=1.
> >
> > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > used in the fully non-const variants later.
> >
> > [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
> >     HWM_FIELD_PREP()")
> > [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
> >     warnings from clang")
>
> Also can be made as
>
> Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]

Nooooh... torvalds might click on it, and complain ;-)

> > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > +                      pfx "type of reg too small for mask")
>
> Perhaps we may convert this (and others?) to static_assert():s at some point?

Nick tried that before, without success:
https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
