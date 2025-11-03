Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EC32FD1B1
	for <linux-clk@vger.kernel.org>; Mon,  3 Nov 2025 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164983; cv=none; b=i728S41NkB7XCEU8im6suzwPF90w5GvLgmAHVWyF0sDXp4yR5rCsz3QzX1nh1s8qIuf+ivhbIqZj1zqrxru2TBQMSSlvWe2bjbxlWxlpcw6p9/7WG/olTA9gOrbk50D/oEuVKUEdR3JS6bSaSOMJhhNBY8ihchahXXXq59tJFvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164983; c=relaxed/simple;
	bh=mTHQRbPtXcLW9RC24UimP00dT4bpQ240D8TduWco7Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHwfwBcpxPUAdns51SNAseL49a0Dkp7G+yOHBg5Fp2V8psuOwkNBB6Zf5RqfBGJ303Yp9H4sO7x+3TvB9qe6cIbwFiIhidjgzT6iS5YSA6N+kNHYT6JDUH1+eLSlt/KaAIbHkloSJcR4eqitdnONSFxbkkFe+5Nu77j7OVIM+jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so1620873b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Nov 2025 02:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164981; x=1762769781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN9rH9/69UaI2zM1r1sL3pcOf4U1LH9TZ13cniByZO0=;
        b=h1cPgEFELONwtwRk+zNfF9VSXmTlWtFHNxUIfL1s9LEvxTPOHD4ze8oZJzHnmrYycW
         W2CPWBV/HP8itdwtksAutsy8ArL959zk0vR+2E4VNja8zePg+98C31YkcX2DEQiobqfA
         iN4ubo1ZCC47nm3rn5Pjw84w+6KFzM4IEQ11DTDIyrx7CFiXJNTaDYo8Bp63c/3VaRSI
         FW5dSQ/8DMBF0L5rT8Za+sXRvRvGaBeWtUijtvW0XT00L/gqc6Jsl44yH74LopHdMNbt
         +g5CNzwsii9OzLC0drJIpW494qRcu2NyQDnkSmdRTKfRaQKhT/XX5gzGSlVfSS8wQ6X2
         3Hwg==
X-Forwarded-Encrypted: i=1; AJvYcCU/c794dllgCGDBhW0SMNuuWp2G/5a7Ujyal5bQz6bHNa3lEgJef0hXsSZgLljXfApJDJT/tY2g2Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6JfceIG/r1WL2swsBiU+cRel4EOD2W9RCkMdYeY1NRgxHiRf
	WbC+eJkWST6xRI1Uf+ugjz1kpzZFcOmZ/gXUX5sGgshze8nFlxLv6OUPiz9W51O9
X-Gm-Gg: ASbGncuU6wqqAfWhh7fpa6w1k0XjBtly5xq/kk1YLdiGUFofHOCKC/U3qKW8+aQ/Q4C
	ZBVrpkyYXNWn+IJ4IiE5a3vd1fHm2kxoPVISYGmYs+Mi/+QiLRfDW9Y7MPVh0pMaJ+YmSKUYw7o
	h9kBWDSChKRblXu/0WpYJWN4+R3lEVqnHqrVDWlk/d5gjuNC1IAlvpsPL2Ba3bPZ/1x+0vze+Gi
	gAd+va5WMl06DW/n/AC6DDFiNokc8mkuACP838EYhicGXZ4kSi+XGdHx7HNhRwyPw+j90PH1JRA
	G913s5LHK/iSDdXDHk9UXi002nPw0iCnFGFWdhVGJqXUb6j3Vej+uwDnECPHBesDYS2s1oLZ2vT
	PRFr1ZTcWIOeWHv3Gqp6fiBRezHhm9hRV94yJ4SobWq7/y7v0GHp79lTWfCRJq/UNWFuNJAZ3WK
	XQscE6ofhDKx+25LZWKSCS/khol9z6MbjXszWd7CFywm7oOlGr5snpSdyH6hmIk8Y=
X-Google-Smtp-Source: AGHT+IHUz/ZFAKgplII//My7xXtHnL6iCsC/fBfb5Tfj3tXAdR29DmTGzxTiRm1EAdCLlypHjJjldQ==
X-Received: by 2002:a05:6a20:9392:b0:340:d065:c8c0 with SMTP id adf61e73a8af0-348cab83bb0mr14877239637.20.1762164981102;
        Mon, 03 Nov 2025 02:16:21 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b9a87ad1022sm4105880a12.8.2025.11.03.02.16.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:16:20 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34088fbd65aso3298357a91.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Nov 2025 02:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkypsEFNam6PcnEhP06gTMt038APYn9BbExDgTOFvB1/RoKINGhT4zZC6MD3t644mi4OhuNRvTOuk=@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-5dbf031902dmr85155137.29.1762164587067; Mon, 03 Nov 2025
 02:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei>
In-Reply-To: <20251102104326.0f1db96a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Nov 2025 11:09:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmxzzzgoIljXMDy5wJmHF15bg4ZKICGjY8c2_gWom3ME9XAPzMw0ghLXn4
Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 27 Oct 2025 19:41:44 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So this is going to make a mess of merging your series given this is
> queued up for next merge window.
>
> I can pick this one up perhaps and we loop back to the replacement of
> these in a future patch?  Or perhaps go instead with a rename
> of these two which is probably nicer in the intermediate state than
> undefs.

Renaming would mean a lot of churn.
Just picking up the #undef patch should be simple and safe? The
removal of the underf and redef can be done in the next cycle.
Thanks!

> > --- a/drivers/iio/imu/smi330/smi330_core.c
> > +++ b/drivers/iio/imu/smi330/smi330_core.c
> > @@ -68,7 +68,9 @@
> >  #define SMI330_SOFT_RESET_DELAY 2000
> >
> >  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > +#undef field_get
> >  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > +#undef field_prep
> >  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >
> >  #define SMI330_ACCEL_CHANNEL(_axis) {                                        \

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
