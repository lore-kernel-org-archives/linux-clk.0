Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75EC350A2A
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748786; cv=none; b=mv3IkY5Ww0eIvjimrhc6amcTM7z4dI+Tzpr2BhQ464XYycZV/gheZgvVu2PjOYUiUOXW6AmPamDtAyizr+spMiEDfievCb+hMzuKjuwR8BAycy1epufHwLUHt/emPAsOKmVRnd/Dohfo6zgl1DH6FpaQWMTsDuPjD2B5cFjNfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748786; c=relaxed/simple;
	bh=FbqavNtq8VJC+dwAXLJIaCG9l+pt4WVO7NOuPi3OYaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwuiiDp4aO3j1iCZ4nguEKypFOewROD/GqCglXq3J1FXzW7/71G8vEw77CjnJzLPpETbJAq9I+ujT6aYAIHwse4SCphuqrjbX8TnXP8QeMQEX2ltaDHGnf3e0GEXCpnudcp6lCR4arsmo2uoUh0ikF2fr0ZwFL7lerjFthv56So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-88f2b29b651so740589185a.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748783; x=1762353583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNDkhDDabcFgtYSzLRibzijDMaquJ035sDb5A+sIiAE=;
        b=MNr3vD9GkNnxK05gIlO67qIfxtlGxtKiizCcxH0P+D/JXNY1g7x7I6yomgCgedc35R
         veCk+Uxp9pKZ4C7BoUoQqKqG+cQh+OJ6JYW3qyxqFKJLBlpO66XbcUspymhvl1n7aAnr
         SkiXE/Auz6nrks/Cuz+Qg2CV+mxBSAiEAVaJ49XzWGexlsF2jZ7aerevucT8CDgAL+yv
         YzA7aZHVXCgsB/Asl3v4WXSj4lp1VtMd9kUNpb75gZ8ZS6cGlXlbjLy6V4TkGyz/rEla
         6SSVqV/iPzYWgqnq3V/8l6UcUSGxVxRS69m8O5fyEQN5AKREIFylpKq9ORIpFRmQTA+8
         Jnew==
X-Forwarded-Encrypted: i=1; AJvYcCWgA1cMOKj1N4h21EK619Inte7ywE1TCqv8lvLi/XOLhsLer1+29DpT6VNsMrOoKJROYIy5B0sR7bM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFzPLmTrsfd+rjQpB/n29JO7KKRqmXFcdqCVSil7JoABZaS5W
	zzlk22b7d17oXScAskr8n0vLfbQJF+ZKLLWjMXuvhrIX8HKeQoB8r4w5ilh9DFx5
X-Gm-Gg: ASbGncsUPQF9TscC4gnAwlXy/GIbx7GeIwewlbebSiO+RKnhnzkJka2jkea8bMv/NdC
	r9U45lWVjWqx4DZd/P/isFStNlGYKcnviXBRsAFEqGFsLPnfgCPaEij+Tn4S24hVw4lGWYtdSj1
	0AId7Hf72pjFmrjOnSAvZP1zxauWyRLp5j94F6u58mRY4PlWQAHn6RaK/HoLCDrC+kGCQPU7w3l
	76h9DVq4++RN+ekbaMWGU0/eTQqdYVok8nBqziDojiUAk4jF5aStME4zMy1G/DSEs+JhE3Wmw1r
	HjaBH3WPxR2RVmswBsmmoQy2yYh3HmYAPupmtXBsgf/b6ogsFfAdoiHaS/GRHdcommjEAn+4nUT
	mHF8fc+8H3Dd/RjavMBqlLX7a64EMFuEtELOVtF4KLm4XyCfgYrxEef/OgUtNeNWL6JzyBzp+Nf
	wN1z5moTY0waOQgxNItP9oA9XG8eMOVyHej3NYd7j97A==
X-Google-Smtp-Source: AGHT+IEtiDJs/Zm2weVodKUU3JxVU1ds99sIkkAKgRmYuOUT3o9712Y7wwvD1DN/icJfRlFIO6rh5A==
X-Received: by 2002:a05:620a:28d4:b0:8a2:624a:44bd with SMTP id af79cd13be357-8a8e4171de4mr325879485a.38.1761748783260;
        Wed, 29 Oct 2025 07:39:43 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8a8025fc8cesm348979385a.23.2025.10.29.07.39.43
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:39:43 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-78f30dac856so84960776d6.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlOPJvRAmf/gezdeuAABgreATcLz6/TztgXSyz1vxpGamdNNRz54fWhYX/Im7CzaqqOW3vX7Zefqo=@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:5d6:156f:fedb with SMTP id
 ada2fe7eead31-5db90694687mr933346137.36.1761748440676; Wed, 29 Oct 2025
 07:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <aQIlB8KLhVuSqQvt@yury>
In-Reply-To: <aQIlB8KLhVuSqQvt@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:33:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
X-Gm-Features: AWmQ_blqiXGJheNiHtKi_cJSwq0gfFP8sAonrx_tsjN_f5pUMr0aiWqvAOsiPck
Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yury,

On Wed, 29 Oct 2025 at 15:30, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocesso=
r
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to just merge this patch to the pinctrl tree or do
> > you have other plans?
>
> There's a couple nits from Andy, and also a clang W=3D1 warning to
> address. So I think, v6 is needed.

Indeed....

> But overlall, the series is OK, and I'd like to take it in bitmaps
> branch as it's more related to bits rather than a particular
> subsystem.

OK, fine for me (if I can still get an immutable branch ;-)

Note that as of today there are two more to fix in next:
commit d21b4338159ff7d7 ("mtd: rawnand: sunxi: introduce ecc_mode_mask
in sunxi_nfc_caps") in next-20251029
commit 6fc2619af1eb6f59 ("mtd: rawnand: sunxi: rework pattern found
registers") in next-20251029

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
