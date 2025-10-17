Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E324DCE2
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717216; cv=none; b=nYiYJaCrrKahPTCfHdq67BiLqcsA8c+nImOVZN+6FT8EZaHiJU0mLpv84pk9A+M20Doj3JM5GQd6eLk8iMGFIE+eA9KWc7BjWLYBGNdjtZmQw/0vbldEKQwWVpKZ2Imk6ZHUhLsSQ04nGZ40/nIhKp+R/QPwrShTaaSLMN7TNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717216; c=relaxed/simple;
	bh=5UuF/HjwkQMRQp3toEpBUcYrHBj825aq+Tc6Itk11zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGqnNjtxn25blg276NbBrTdO9gYAsPqov83o8g21ub25On4+xXkwLPHp5/FItkgr1XDdEfyJnQGxW/GdwmRp0t8uuduVDkq3mlmx2/Ac1kJfsVPJUICt/x/97rI9SuDUqOEWQc7E61GW1NkGZwpoxZv0BSKl8CxcZsK3fa/iOjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-74572fb94b3so1420227a34.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 09:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717214; x=1761322014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=;
        b=OBnoKj8eW7BVbp6yUpexsy9+U8+0sUcxy7vg9qneNoTeicrciulkxTNMEu25+UjcqB
         7t5vHTjqDt6uzm0yL1FViQLDTtscbKrZS1HNeYjVjpj0ZA6RJsn/y4uP34iGTMxIppya
         gz8sE2eipgkseJ3hXGXzuUSv/Edza5xGjvY+4pU7EY3BBn0xUVBB204hPEL36bTXhCHE
         fc/+JPpeOTG9RjgZJ9kiXPXUT65Go1QgS9NXBmlxpNbQwQsNKrw8RWfVftP4PCFXowZf
         AFL4HQsLbVvEVgqBMftI2W1bHUup+Lrc5az0/6rI57jWhVHaO5ra/6qoDj9ueNtIi/1e
         7Ytw==
X-Forwarded-Encrypted: i=1; AJvYcCW0DLn2CzpIWSIm6vF/tF/zc3yO63GWYkdgXKBKyT5CDH6LhGZDX1GwOD/y1D1YyL9acMAxbEBI+AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxedIJRxG0JIg1Bu/a5QyGpprhTUvl+d2BhC28e80uI6fEvC4aH
	eOT+qKysAPojvg6x/Fs1MFbuIalJl0v1J0gLFGPrLS9Q6sJbF4O6FnuhU8W0HkYw
X-Gm-Gg: ASbGncvvy1hP3FSfMtEtuDbTyAhdb1caRTWMyBYVPV6qyWKCozoSOC5gzi7DTtt/MJC
	thKqlFjitlHrOG/4v2fLdrwpGFJ97SvVvBrXtmK+mqe1ix1Q6cbwQdkQT6EP82axHLCwX9yJhHZ
	o4DGsJUU8yI7oqz4xESdU6RVCT7DPxn1gDZQ89s4JM+fE63bgQ+jUuXgObfVtiwfkLKgA0+FL0h
	WXSqBgkM5TLTN2bmw0xNUUVsaKIWgG1llOR+sst+nZx6i0REh2UW197/FCtNixIhkJfoZSC82X0
	SFkvTrvl3O4EkOj+5gVvpZie4vp+zL0w/wnyX5u8MFs1A9JIa9ljfkGMXs2WdibBPXRsJenvNKg
	cjsvAgYk8u7L9ee5rAU2VQOY3acgIxzIA2lbIElH7EcCKgWiF/NLDxXmLmf5k/IKvFyuYWrjmm1
	voTSefKAj5W7u8BmFHf5Ljh4T5w5n/lOOjZJVJjDWROw==
X-Google-Smtp-Source: AGHT+IFiQ5THHk7rR8FKHvEyF5vFgLcSS0NQ/oTF/RycLX1Hu8RIbDBgLzFhxx/Ep04BSyzDhre7FQ==
X-Received: by 2002:a05:6808:178a:b0:438:bdb0:89ba with SMTP id 5614622812f47-443a2ec72cbmr1622304b6e.3.1760717213549;
        Fri, 17 Oct 2025 09:06:53 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-651d3a9adb3sm8442eaf.1.2025.10.17.09.06.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:06:53 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-443a7490a54so481452b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 09:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLggQb9SzNB1ervHU2CB89VOL/3viyzFOANavLnmFxynLR30kd7pZZWEWjh8XgjfXe6UDNzUwTMuc=@vger.kernel.org
X-Received: by 2002:a05:6102:40c6:10b0:5d7:dec6:389a with SMTP id
 ada2fe7eead31-5d7dec64177mr1309355137.9.1760716852567; Fri, 17 Oct 2025
 09:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20251017081912.2ad26705@kernel.org>
In-Reply-To: <20251017081912.2ad26705@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 18:00:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
X-Gm-Features: AS18NWD4CQztq7yi6j63q-9XtnW0otWo2wOw8z0_Fp7R-6z_qrlZWB5IqFYEbBg
Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Fri, 17 Oct 2025 at 17:19, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
> > To avoid this limitation, the AT91 clock driver and several other
> > drivers already have their own non-const field_{prep,get}() macros.
> > Make them available for general use by consolidating them in
> > <linux/bitfield.h>, and improve them slightly:
> >   1. Avoid evaluating macro parameters more than once,
> >   2. Replace "ffs() - 1" by "__ffs()",
> >   3. Support 64-bit use on 32-bit architectures.
> >
> > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > macros, as people expressed the desire to keep stricter variants for
> > increased safety, or for performance critical paths.
>
> We already have helpers for this, please just don't know they exist :/
>
> The "const" version of the helpers are specifically defined to work
> on masks generated with BIT() and GENMASK(). If the mask is not
> constant we should expect it to have a well defined width.
>
> I strongly prefer that we do this instead and convert the users to
> the fixed-width version:
>
> ---->8----------------
>
> Subject: bitfield: open code the fixed-width non-const helpers so that people see them
>
> There is a number of useful helpers defined in bitfield.h but
> they are mostly invisible to the reader because they are all
> generated by macros. Open code the 32b versions (which are
> most commonly used) to give developers a chance to discover them.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks, but this is more or less the same code which you suggested
before [1], and to which I just replied[2] after looking at the
generated assembler output on various architectures.

> @@ -188,6 +193,81 @@ static __always_inline u64 field_mask(u64 field)
>         return field / field_multiplier(field);
>  }
>  #define field_max(field)       ((typeof(field))field_mask(field))
> +
> +/**
> + * u32_encode_bits() - prepare a u32 bitfield element (non-const)
> + * @v: value to put in the field
> + * @field: shifted mask defining the field's length and position
> + *
> + * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
> + *
> + * Note that the helper is available for other field widths (generated below).
> + */
> +static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
> +{
> +       if (__builtin_constant_p(v) && (v & ~field_mask(field)))
> +               __field_overflow();
> +       return ((v & field_mask(field)) * field_multiplier(field));

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

So I don't think this is suitable as-is.

> +}

[1] https://lore.kernel.org/all/20250214073402.0129e259@kernel.org
[2] https://lore.kernel.org/all/CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
