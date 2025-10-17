Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B432D0E8
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698991; cv=none; b=eFa7BuKVg3wvx89Y079V0B+4qqRcicwE12vz8Wdj3KksFniHMBS5i+YLK4HZwFYtOG5GFX98c/YeR7fPl5fGFm7eQP4FvXBw5sgMTLx9zapSrdcSkNFVE86pFvBD+cWo7F4nByHvCMQaIBlj3zdiYqyzavfJDcrTkr60xdH88nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698991; c=relaxed/simple;
	bh=LrniXy6ZCFM530ZMtcnDRQn9pcEmCEynLCDVJ3AMIhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRPDc0opRV4Tbc7lpSRTS5bLkT5VyH/tP+0XAoAb4i80J3BME5HeoEWBUmA5GGrANHR/qA074aCKRM+6puQ87Lt4DSJoGvHE/R1TaK/KsGLZEJC3UaXvRITpS1EwQPy89+XsMmuqo5GE/wfDBtKz4OPfUQ/yAcTG+A2c5NPyooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-88f86727622so274508385a.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698989; x=1761303789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCpfZFAx3hiLnczCJXcXTR7Dek411X8RRc+fD4xQf5M=;
        b=hQB//OTsnWsdj+V/nWzueiBz+RxNa+r20COPRJJ5ateOc/I6Y9/EQ7ENk1ZVVdKiym
         xUMCjMZJRUf64CV4zgvAWsUGFH3FgaB7jFywLKIy44FFMznhuT3Li5XmOR2RRAoZqby4
         BHh6kJIFdChiizjv421wK+e3BEAYoks+XhJ0YafDUfwgbYxaH28yvPx3J6tTBBzKFANc
         kA3U+zIY/vxgngogfv65Idq3fx0U3R1WLUxtyiDBtfLaAaacoF9vJ+7OUmeg68ocePHX
         50Uhe6PyDvK1ltzhnhHG2Gm5akLZ/YYvegzXITZ48xBLZs+qY8+JFbktJrGtiaZSJZFj
         9Ijw==
X-Forwarded-Encrypted: i=1; AJvYcCXBnJQwmHlAXPNGaShHdrFLG1gqLp/XzuqK2JOXs0kwZNxaRTd4vmBUnTGUw7JG8dJzyJWeYylmejI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfB2QU/ruMAW+S7kB447+RG8YNDH7jHcLs0TuEWEvz886DaIh
	OV6rgsg35FY9bRK9fCLpgP1Al0wdial9ZBsRr4XU+dP6U16bD9oLgjLBsWjLoyZh
X-Gm-Gg: ASbGncumo99Z4fd1luUhSdZ3ZQx0hU6tMCXVSqIYyLP8mJcLMPR3Y6B8cOLJY7weGpa
	KR3EuvlJtJAvGTUmH8UrU1/5tYvAiYjR6vDaOvUiGxW9V5FvcLZ2t9hYPmfOYnjBFLuj5Pz2+G3
	DthN8kaZM9Qym18NNWgrElOEZpLxlO8fcfeKGkwENvbTOplaAs3DRiXFFzJmoWIWfCEyvvalB8M
	AQPUOBV1oc7DW2WK4LTdirIHMy8l3L/F0UncA/mm1Z5m+Bsz3JZSXSL0Qn2N+8wXMEA0h49NRH2
	v4/ltO4IdemDRxOHv4rrnAVh7SrsbhxepXqDvA141nXsH3gG6m6p4GOe9d1buijaxLlZQCz1+z1
	1MZYpkAy07PeWSsxPUCRXmCcYK9Ygb53c6gYlFdfe6GFxEsDL+SGBFaErZd2661RGMdKSwQaz3A
	2YF30KZEHNlylzKjiPLaSUOXpQN2vZZ3DgkSmGUW3A33/GBe5J4pi4
X-Google-Smtp-Source: AGHT+IGpcIZ/Saj1uf+BbIQT1qKD0MVLXt4F0oMeb/34I3JJ7k4rkHn4OtyWDfhHQmA0lJqsm/bbzw==
X-Received: by 2002:ac8:5a42:0:b0:4e8:8ca9:10a with SMTP id d75a77b69052e-4e89d41f4c0mr48301091cf.84.1760698988960;
        Fri, 17 Oct 2025 04:03:08 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e891035919sm43400091cf.15.2025.10.17.04.03.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:03:08 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-88e1a22125bso250025685a.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2VB4vAYK4/HyHiR8vRtGbUtbdhoYgJ0bcRfxN4ve/JJxZsYWEMtQpEO9S+kd9w1JE/irNkmy7mFk=@vger.kernel.org
X-Received: by 2002:a05:6102:c49:b0:5a1:f09f:524e with SMTP id
 ada2fe7eead31-5d7dd59bcd6mr1313646137.16.1760698511065; Fri, 17 Oct 2025
 03:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org>
In-Reply-To: <20250214073402.0129e259@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
X-Gm-Features: AS18NWCjFk9wo7Q1aPnnkBYJzaq6xcQVQAXawyeid30N8a2RlJlAbXrKkziomTs
Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
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

On Fri, 14 Feb 2025 at 16:34, Jakub Kicinski <kuba@kernel.org> wrote:
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
> I really really think that people should just use the static inline
> helpers if the field is not constant. And we should do something like
> below so that people can actually find them.
>
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..e02afcd7aeee 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -156,6 +156,80 @@
>                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
>         })
>
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
> +}

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
