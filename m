Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283134B663
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446463; cv=none; b=J+xSIcNeqfcuiNoIO2lFaIJXbswsSYhGYGkNdfMUX6e4mP/XVEDvfkjG84HCDx/3oHTQzv+jCflrnCSzR0y8D+PB2LQItiX7s1SSHfQq86WwgmkF+M2Hc3P7DOM9pdhXoMFWhkc8VHAkyMTzoCupIOgyMV8B1ICLY+WLBYNIcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446463; c=relaxed/simple;
	bh=3N1qJZ6LWFBTfpoRaZzcBCl8k2fr4s1S594WsHSwxm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jX7QEGNxb4v1RFJgUtC8ZF4xs9ZVt88QQwzh0r1I7M5DukNjq+napUOJLhntC1TbUV//GYfnO2tljBFm3FeT9SDaV1uw4CjauiVnJkhRY6IPjkoTiP8Kp7VReZWUFB5rauyhCjjcO70C8x5oO1AZimT9BJfzUTvC1oDbiUFaeuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-591c98ebe90so1098700e87.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 08:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446460; x=1763051260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plp2F71zo3wke225yJ4Ea1I1OPDOMxgAH1RlngZdvGo=;
        b=KCUH7MMKTKZiRy7bA5Fsk0NXlIbORX9d7/gRvSImu0N/wNhbmxaXsnaD+5H+y0UGlU
         9AAwt8OMtOFrpEmOSyX3cwdyh+usyvtaecpfHWS7FatBdLXqyGzLvn1LlJavbDboFsRB
         J4t5OgX+83XQoOIDMUDSG8sEPetf/fH6qBgZbmRkqY9YxxaM5rXbg8snDyFuesDarqYc
         wZ2s+nU1OTI/AVakMqkEvpULtx5vxzi3/LnEwaIZGGkxLqREDjgm7tbeFnrdcNq+Se6U
         2sN6beYZo/eOIpvYrGsVbhQblE1MgjmUAqBX1jbzugkGfU4LHVrq7vyABtwNqijjMgAi
         X+RA==
X-Forwarded-Encrypted: i=1; AJvYcCUT4UJMJNXf23OeRQlDFyJIOg08x9tgRN3VvIol/qDK1B2cXpJ3yiW5c20knabfdMLr2Qx3i6rCFUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OdZWqXJ4PdMl5MllU7toEBL4i+z23qV7mXYkS3V8iPKacyHt
	9uGpt0y9oG8Ebabj1s7EUHyCwP+xjiIpwsvMpA/cdHxGhSAmPoIPQEnytRB6fWPn2RE=
X-Gm-Gg: ASbGncvtwA/4jSIICyscuqJgAUK0EUuClFr7RGdwWLfqAzPKAqSu9Vi9oUkd5UoSKwU
	79Sv0/z8c7Cds7UDLq85jVzOK54btvhSI+97+NylJgT4v6pP8lHSruti6VewLAtdh3KblM8IGuh
	IkpfPDYCDH0NYgcdi8y/vQu1KCmo/5brqRuVwgMn5EllH9/TwK80o0sCuAObyXPJiffdf+Xaz2z
	US7s1OcZyila0/PuUFnPgHBs8aGaOR9n6QFC1CUi2dqhgCbZ6+cAJcs91dQ8byV9u5GDVGwZV/x
	nDabJTowmWjNlb2W5/LfxhJprNNCjPA1cWXGL7Y2fDBx6ksbIQ7ro0zkF8oF+0A5DXXXlDq39k+
	++/NFoWruMbXbe3QSQAd+aqBQZTpVGZMwh5DDFcMYcRBsTW8uBipmNA0BaxsEWjzkPs3H0yhYSD
	mptNNGHItBGUEDKovvrFtbMglBWVghC7mafxARaeTVcllyCZ95
X-Google-Smtp-Source: AGHT+IHPYSFhLxuaNZJYNGBLaNpp8sbMNRS8yFE3R0CVGmgltqrAwcgwhrbPLs31v4+SCdR796EtLQ==
X-Received: by 2002:ac2:51d0:0:b0:594:49ed:3cf0 with SMTP id 2adb3069b0e04-59449ed403fmr1447968e87.36.1762446459550;
        Thu, 06 Nov 2025 08:27:39 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b77b8sm812371e87.65.2025.11.06.08.27.39
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 08:27:39 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592ff1d80feso1194317e87.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 08:27:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoShJsZSk7Mn/5jZYUmywjzuGamdLOjrfsj6fHEpeWtOwvRFC0qdCnHn/3r4G3/Qwq55hDc+dUSWQ=@vger.kernel.org
X-Received: by 2002:a05:6402:3590:b0:640:fa38:7e4a with SMTP id
 4fb4d7f45d1cf-6410588d45bmr7763851a12.8.1762446022573; Thu, 06 Nov 2025
 08:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com>
In-Reply-To: <aQzIIqNnTY41giH_@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 17:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
X-Gm-Features: AWmQ_blD_P8L06tcYy5Zd39ODOkLvksucIxy1SkcdgHAnKwygGve4Lbclr5ZO9k
Message-ID: <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
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
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 6 Nov 2025 at 17:09, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 03:49:03PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > > > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > > > (long) long" _mask types.  For constant masks, that condition is usually
> > > > met, as GENMASK() yields an UL value.  The few places where the
> > > > constant mask is stored in an intermediate variable were fixed by
> > > > changing the variable type to u64 (see e.g. [1] and [2]).
> > > >
> > > > However, for non-constant masks, smaller unsigned types should be valid,
> > > > too, but currently lead to "result of comparison of constant
> > > > 18446744073709551615 with expression of type ... is always
> > > > false"-warnings with clang and W=1.
> > > >
> > > > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > > > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > > > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > > > used in the fully non-const variants later.

> > > > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > > > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > > > +                      pfx "type of reg too small for mask")
> > >
> > > Perhaps we may convert this (and others?) to static_assert():s at some point?
> >
> > Nick tried that before, without success:
> > https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com
>
> Ah, this is unfortunate.

Of course, it might be an actual bug in the i915 driver...

The extra checking in field_prep() in case the compiler can
determine that the mask is a constant already found a possible bug
in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():

    rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.rx_fltr);

drivers/net/wireless/realtek/rtw89/reg.h:

    #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
    #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)

so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
this operation...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
