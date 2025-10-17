Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401830F53E
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 18:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760727104; cv=none; b=Xf3CPpqf2Jo1dqRDliIH3BI9bz/7GV6LXsh34GtM3O6Vr4BFO1VPdU0dYO7Cr6bEv+bzWhM/Di5bfuPtedJ9XXSqcHl3gBqp1wXXHszYxi3kbv+GcY5GfyN6wBVzvFQMLp+J262OQmB+cHhv8SsH55JXVpaM2lRjsjjh4IcbsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760727104; c=relaxed/simple;
	bh=gXqMz+CcZKPeGt9WvOXq76EJR6tDE24GCMGXdrKpDu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E49VT3YFgWFyKstKnLBbc0Yj5iHSVxAXCTvv9SxBbMbyFp6hUI4dlApTNGxHzEoXfO9+Ve8ti/Youau2+OEmCs5N5UJyN19Fx5GKDg70vXzT78RWQ3xwryQPTMOVDXvIHRK8DADQUniH8C8+Odx7hk2T7lkwQtZ+qLZ3InWTH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlifDMN/; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlifDMN/"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-87c167c0389so34212166d6.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760727101; x=1761331901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcMHrjvb7aW8dOEyGXLP26k9PcHppfS2rsN7ygfXW0s=;
        b=YlifDMN/c6vzWfG76u/120EPvwuMWFthOAow4pFmcd4wRErr+JpLRZql/RdI3ZFvcB
         i/kn+nu5cNXXW48slMOD4L6lHLVy3FA4mmGcR3j7sUmM/LE4seQpds7VwSE9vlLwVh3o
         X1HTtMLfOIpOJyJOjUCEWK8GwEwrWZX/JQPe4/ixsO1syLpRFZhVfUI0Ov235fj/Q76A
         WJZ59va+96A/5qkKYYeqeNYf62Q9XkdErfCxy9xNt6llZj9JDoLeCM2K0Ze4Yd+TiJPv
         A6K/xxN5jA/qgnJr3ePqiE3FHyhC5XCOvqxac3E8yeWImyX2jvnjQPJXoRM1N0UQNxHH
         rODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760727101; x=1761331901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcMHrjvb7aW8dOEyGXLP26k9PcHppfS2rsN7ygfXW0s=;
        b=JiY65eW2vU+Pia4gdNBp0GRCGdLurrPv8M+px1VSYeGLk9NpvQLHh21nhKADGkC9Zd
         e/zAPOZ2jpKH1MFpz++Dz03FZ+2NA+WAWT9sGPQ3NrN4DVjHFYRpeRH60p8ufjZVt8rA
         hIi2ouWsmw5KKBpFq0e3OvsAq9tN85HcrdLDW641Wt+V+nOKn+UqiB9AOF2Ijea9bZi9
         jMyexLplvdCMKOF9eNvaEJ/vluAjXjId0C/3/My013UVAZJjlRoACgat16Z5PUyMZyS5
         104yjxXOxG9MxPtcfpnPfiDEAuh3vJZa9OBmp2V7YcMz+S2X3a0YN74qbZ0g+zZiz+FQ
         d3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbrmWEE6cXm3Ihe/SbdlowKx6PTqHSgvbIhtJ2q4CJ1r3B/iaNujSyC5eJCDMJja5Mm/zP+JdFquQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtAIAyDfaMCJ8TKDZdpmUxSpBjJf4ow5TVOu3IeIDKR5NYpYJ
	5diCUQQRVFZNFJrLMUjhjB9cYvno7PjCMkhJbkjdvyzD3BCJIPgl22/Z
X-Gm-Gg: ASbGncuwmViA3U35Y2MS9W6zp4HyqFCpWjqlwcMEoFP+lJNOn1oM3lm/Qzr7NTJ651f
	EQi78VuoamRQP/+yefh5Ai9WL5bQSo4F0iLK/q6tvHj2Cdu6MRLmV0U+Muw4/o/sTW0yPtFhseC
	VDy3I3FJq7kOGp5RVp3LIvjv9AyWCXe5WsC0YM0GFXiOd5T0emylVhVItvkMoH/WqrOq4/VTaba
	215ExN9JEqO8hoYZBaFwgkXAuAaSLfALEZh9xJW2e4uyjcGDwO9gYnJmqHK/4QQV16O9TFL+2tG
	SnspuBxAYZ3zq8i71sSaVOex4v6Acc6+ydCBH8pw1MfrjZPSUV5F8AGVJ2IRPRLrZZglR/M5qnL
	LZy3VaaXbuU05YXyOUW4wJjOFuRkNyU1qUkOtJLbvqvKH7o6rncXXE1iOZWfJnD/DMn9MS2X5QD
	zSVic71kQ=
X-Google-Smtp-Source: AGHT+IGgZXVqJ39mGvceINRef9aDCQGOzv3U5h5nFkBRWec10RvkxHjWCypd6ooOxs18G5q6X1BFng==
X-Received: by 2002:ac8:7f48:0:b0:4e8:910a:ad95 with SMTP id d75a77b69052e-4e89d20f6cdmr65322091cf.6.1760727100900;
        Fri, 17 Oct 2025 11:51:40 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8aaf87ecdsm3689291cf.16.2025.10.17.11.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:51:40 -0700 (PDT)
Date: Fri, 17 Oct 2025 14:51:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}()
 helpers
Message-ID: <aPKQMdyMO-vrb30X@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>

On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 
> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
> 
> This is deliberately not merged into the existing FIELD_{GET,PREP}()
> macros, as people expressed the desire to keep stricter variants for
> increased safety, or for performance critical paths.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Crt Mori <cmo@melexis.com>
> ---
> v4:
>   - Add Acked-by,
>   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
>     power management debugfs helper APIs") in v6.17-rc1,
>   - Convert more recently introduced upstream copies:
>       - drivers/edac/ie31200_edac.c
>       - drivers/iio/dac/ad3530r.c

Can you split out the part that actually introduces the new API?

...

> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 7ff817bdae19b468..c999fe70076f6684 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -220,4 +220,40 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>  
> +/**
> + * field_prep() - prepare a bitfield element
> + * @mask: shifted mask defining the field's length and position
> + * @val:  value to put in the field
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> + */
> +#define field_prep(mask, val)						\
> +	({								\
> +		__auto_type __mask = (mask);				\
> +		typeof(mask) __val = (val);				\
> +		unsigned int __shift = sizeof(mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(__val << __shift) & __mask;	\

__ffs(0) is undef. The corresponding comment in
include/asm-generic/bitops/__ffs.h explicitly says: "code should check
against 0 first".

I think mask = 0 is a sign of error here. Can you add a code catching
it at compile time, and maybe at runtime too? Something like:

 #define __field_prep(mask, val)
 ({
	unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
        (val << __shift) & mask;
 })

 #define field_prep(mask, val)
 ({
        unsigned int __shift;
	__auto_type __mask = (mask), __ret = 0;
	typeof(mask) __val = (val);				

        BUILD_BUG_ON_ZERO(const_true(mask == 0));

        if (WARN_ON_ONCE(mask == 0))
                goto out;
        
        __ret = __field_prep(__mask, __val);
 out:
        ret;
 })

> +
> +/**
> + * field_get() - extract a bitfield element
> + * @mask: shifted mask defining the field's length and position
> + * @reg:  value of entire bitfield
> + *
> + * field_get() extracts the field specified by @mask from the
> + * bitfield passed in as @reg by masking and shifting it down.
> + * Unlike FIELD_GET(), @mask is not limited to a compile-time constant.
> + */
> +#define field_get(mask, reg)						\
> +	({								\
> +		__auto_type __mask = (mask);				\
> +		typeof(mask) __reg =  (reg);				\

This would trigger Wconversion warning. Consider
        unsigned reg = 0xfff;
        field_get(0xf, reg);

<source>:6:26: warning: conversion to 'int' from 'unsigned int' may change the sign of the result [-Wsign-conversion]
    6 |     typeof(mask) __reg = reg;
      |                          ^~~

Notice, the __auto_type makes the __mask to be int, while the reg is
unsigned int. You need to do:

        typeof(mask) __reg = (typeof(mask))(reg); 

Please enable higher warning levels for the next round.

Also, because for numerals __auto_type is int, when char is enough - are
you sure that the macro generates the optimal code? User can workaround it
with:
        
        field_get((u8)0xf, reg)

but it may not be trivial. Can you add an example and explanation please?

> +		unsigned int __shift = sizeof(mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\

Can you use BITS_PER_TYPE() here?

> +		(__reg & __mask) >> __shift;	\
> +	})
> +

When mask == 0, we shouldn't touch 'val' at all. Consider

        field_get(0, get_user(ptr))

In this case, evaluating 'reg' is an error, similarly to memcpy().

Thanks,
Yury

>  #endif
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 828af3095b86ee0a..6eee89cbc0867f2b 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -3311,10 +3311,6 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
>  #define RME_DIGIFACE_REGISTER(reg, mask) (((reg) << 16) | (mask))
>  #define RME_DIGIFACE_INVERT BIT(31)
>  
> -/* Nonconst helpers */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u16 mask, u16 val)
>  {
>  	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> -- 
> 2.43.0
