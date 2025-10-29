Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72132F77B
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748641; cv=none; b=blIc7kF+o9xTMm46Wr90KswaVkijVL1Vgp20eVVbPTN+i5O5MSXM9IP/BMl3uJbQ29qWhaeotoygpt+qZMw5GzFt0SsPnIlWCqMMnlsswmBf2emvjAsFFw7mMsjgVVrH9uG1jRp/IX3Tbk9O/nLFWqggWeC2JJdBdglCfLMfUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748641; c=relaxed/simple;
	bh=RiCdWEkCDNsJiKATmU0RbHd3Kb5B/0yb//UgjVnVdPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8ks8OfXL0iyWrgMzMhrldG1zbpHf2BGp4YhqAkLm5CZYV3IcRx/ZwPyXIQJqtpGDxuPId/pmnNPTUfP5wAqaN1LEp7ZU70ChRTfaCajXII5i/9KtbH3lc8OCBCGWlygtvGTekzMAGkBwD3JW5q6ndEeYONuaxjsaTFQFVUE+eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-81efcad9c90so85975116d6.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748639; x=1762353439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmTxX9Lp/E6iQMSfd9sSFodFiE1yd68ZDUJdx86zE5s=;
        b=XQcTW0Dxem9quENuGXDA230jz4UCXZvQk4ARPyyC7s8b7qgowTAUfOIhQkghhhrLor
         MogD7GFFI2LyKSZeMBGtQk25RMb+SlHu9mj5IhaflcxHRojmwf/i8KQHz+TZmDakIv+o
         ghN2qZUtR2DFk5j/9z9WMuwfBom9iVyAdt841gxtbTmNmK3E5Z3IMP1NylIbnRJIg0ui
         o1dyc2Q8Gw06vuLhmgnsxUQAKRxFJDUyaxdQFYPF2KsVcweyE97nRH3U+j6jfH+iqs3c
         zpcPX3Bh2WQwM8FxkXE9DRgbFrwMBcLPZS6+/wWVVIkXs51gEfWkcR3NCCPrVQtpMtMJ
         Z8vw==
X-Forwarded-Encrypted: i=1; AJvYcCUiT/O/cO6czEq4AeqATzqFRULPt08gGMmawYL+93r2Fgt8r7+RelTFhkVzSK7dJMEnD1VXY5NLzUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycPONFEz5v18TY9ci5zkCgQmQicdo7xLTGR/cPdkTXgYFtPt7P
	0CsHf1EXiZammp4xnf8TkmXABd7OAC+HIrvE0ppSWzc8edEOYpY1uqUgLv30yNm4
X-Gm-Gg: ASbGnctJSAj/VSQ8VatI1fqDxyPBISJwfi2r8qzoRnV4WdJwjkgFQZBs9SqUV69CF5y
	n0T0IW0w+zKlhuTkRCckqs3lgGAPfPua3o68/2WWI3UlTFcDOugwduM8cEuhqpbTFxaefcxnlAV
	K6IVt6Sr9tewd+ls6xfnm5ac4FD6PkOn3XcWfWRbZCa52PFq+rnRG6opZZtbqCC8+vgTOer3oF3
	FuKB7gqWWsM68hbftRQ+gnXTdlzy0zkGbCn/ZRCnzUegXzvtFxjz/UHJxYyc61u/z1bgZLWf7mL
	ucXVZmFAcoeFONsPj+lqUuMZ9+wQXLLQ0rf++FZg5BjvrdQoKf3xPbJ9SUMyEXFIGGqI1RJ2/pI
	f6tixuzpWFt+tCIPx9byJx/DOwaaUDtS40R//8g2SpE/PIwlUiW6xm73Gt6BvLAWB+3v8ACG4sp
	YGgpSS4e0MOWuPr+UANEb4fZy4uPTge+gP52jjap1AG8b55tX6qRSrKjSr
X-Google-Smtp-Source: AGHT+IFNbHaptBDLorUeMsfs6MHfo7ZXvIXuhJarWxroONabWgg3ZKbEXsNaEqRK5ow8nJiCrkYOLA==
X-Received: by 2002:a05:6214:2023:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-88009b34e02mr39609266d6.29.1761748638037;
        Wed, 29 Oct 2025 07:37:18 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a8a10sm103302876d6.10.2025.10.29.07.37.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:37:17 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-89048f76ec2so810020185a.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXPafvknGnUaiLO4yVeNvri02byIilLoulC8elb6LRAVkGvGKhaJYr7fM/i8Eza0hiQ3dcLmQ6wic=@vger.kernel.org
X-Received: by 2002:a05:6102:3e95:b0:5db:38a1:213b with SMTP id
 ada2fe7eead31-5db90656011mr932905137.27.1761748238614; Wed, 29 Oct 2025
 07:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:30:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
X-Gm-Features: AWmQ_blleyKJMjc4oETFxToQhJJ0bdzSdD1fdMmRWAHt71coVgn8wIHcAFgDdM8
Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Do you want me to just merge this patch to the pinctrl tree or do
> you have other plans?

My plan (cfr. cover letter) was to take it myself, as this is a hard
dependency for 11/23.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
