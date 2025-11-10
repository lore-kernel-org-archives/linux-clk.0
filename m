Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9B2FD66A
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765533; cv=none; b=Z2dyAe4C1hG5gUo14zFr93J+gYqqkw41eXzkMU/7BU6Pkok1Cag0Z4fgWC+Wur9hf7uZZv1FQIAj3hOw9hUTwV6L1UMHJA1neKTePG9suVvtGykTQmUZ73GBRtL9y4LCFiuVhPHVr8XNILgLgv9cJw0ZzvxnOtwz128Ax9YGDDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765533; c=relaxed/simple;
	bh=JRmjklDdMnXYPa/YzcCMj4xR0iBgS1Ed7pmHd076aaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN8UdSzboNJM9mdDyGYYEyZjGkNUWNdkQJRGbLIOVnn/Oiqv2a5m3Hiq4f/oFY0tz+bEv0fWoeVgJigETnhSz6MCip29IeiFPEdV25+nBEcT3LBSWWYNCnU8aT8syVhOea3gJXhiziO01gLuMNwsBhjeDIH14XUBJsClkYomUek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a59ec9bef4so3099002b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 01:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765531; x=1763370331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuaR1c68u39/qbD5w07qCJ9IxeheIz5/8CL8hB/l6OE=;
        b=DXCZtkT/YhPbewHK3Aerx44FGLnJpI3sdSR5gTwY3RZ8ZJ0HzYgTIOzI1Opp6zRoM1
         0ydW7gTq/LRX42t7AZ4qvSA2yrEClhyugJa4YGAnnpDR8P8eZaJbTh+RD6LNmUK0KsGS
         hTpWGXMXUlZreN5hxozExs3sAasWoFuEBVOLkTJgJqga2xwH+cDQBhP1Cxkq4RHzZjgb
         WEFF6Mw3AkTZJLYkgg45o4B0m4KO6kW6BTnBY/aHYeqIJBW2wYYrP9/1KOjMCU61FQXh
         o8XnAgU2RxXiRg5SNhFLCjdy4FwS+YmKSuBMa48rKJLXGIrUm/+37BIAdNvYYnjNBjzl
         HF8A==
X-Forwarded-Encrypted: i=1; AJvYcCXG4kXnbETn9Cut4oLCvrX7im6mrmf8wftmkD5p4gg3oHIUZAO+VfdKZEHPx3R2SIMI7jp3DY9tO0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKridGOpdCewDFPLp1gVO3Ig208DZKB4cX7zb5eUzNl3qjD2yL
	PGalDjz4B08qG4heoBjic8ZPjn6dbMK7tJvzpUpE5630afpYN2erwltbQ0hI2C7Y
X-Gm-Gg: ASbGncscmz7sWjwrGO2kTTEr5z1pcETD/bW6VJyi5CIVejXO5kDYjTs9xh2CY/5CxLU
	DRiju7mSppZkB8lpnzpizwMrS17ocC0SQ2LTQGuVrvQjbWo8x7kKSf1kDFAEhIP6nHD88MmIhhr
	yZYe/Vd0Be0PawhW+ai9lJC5aFLx0PWe8jcsWJ3EomBGWm2PRLI2QUcs7q0hLHa0JnOVPWgKX/f
	PEEaVrUsO9Xy3WrDnpFxuXF72mbEwxtops/4tUzniByKySSn0v6w76PzYT9KHBPO0k3w2W/9xSA
	dq7BpBrOCF7aMnIGwWtQSOckWdGZYX/5NdkCT8UQKA/MekNEP8vjYVFrZlWXExHxnyyE2hGZMmH
	4xPmeoqx4jZx8gvTqcw5EjRfrkzKmgx1bXTaFIY862sjxkn6sMhHEDFwyJNeqHMoadTILZjFxlj
	tkqPCg9lymX73WVU12NCIPO7OgBsl6KsKJr55ObdRIoA==
X-Google-Smtp-Source: AGHT+IE6erN1+xc2GviIpuXUchazJf66dhgGJ/l3PfoXwLx9zobJWs3AJxUzIRoBYZ8ikbT9GaHw9g==
X-Received: by 2002:a05:6a20:3d86:b0:343:3d3c:4685 with SMTP id adf61e73a8af0-353a1de1402mr9464595637.18.1762765531137;
        Mon, 10 Nov 2025 01:05:31 -0800 (PST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e2a4sm11319704b3a.6.2025.11.10.01.05.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:05:30 -0800 (PST)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so2011345a91.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 01:05:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVO7g9Qnh9Dt34dJMuJ7gC5SR0Eb6FNvatQl21nFTFh3Z5pDmaRfIPeKTvCrgxFQuxhHU6bLTO1Iro=@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:5db:fb4c:3a89 with SMTP id
 ada2fe7eead31-5ddc471358fmr2304047137.19.1762765185596; Mon, 10 Nov 2025
 00:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei> <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
 <20251109125956.106c9a1a@jic23-huawei>
In-Reply-To: <20251109125956.106c9a1a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:59:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
X-Gm-Features: AWmQ_bmD7LCstBufqr7pTwqKUhf3WnheTdaFZy-l1C13xKAmQ3xomq2Nqy5MxZo
Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
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

On Sun, 9 Nov 2025 at 14:01, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 3 Nov 2025 11:09:36 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> > > On Mon, 27 Oct 2025 19:41:44 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > Prepare for the advent of globally available common field_get() and
> > > > field_prep() macros by undefining the symbols before defining local
> > > > variants.  This prevents redefinition warnings from the C preprocessor
> > > > when introducing the common macros later.
> > > >
> > > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > So this is going to make a mess of merging your series given this is
> > > queued up for next merge window.
> > >
> > > I can pick this one up perhaps and we loop back to the replacement of
> > > these in a future patch?  Or perhaps go instead with a rename
> > > of these two which is probably nicer in the intermediate state than
> > > undefs.
> >
> > Renaming would mean a lot of churn.
> > Just picking up the #undef patch should be simple and safe? The
> > removal of the underf and redef can be done in the next cycle.
> > Thanks!
>
> Only 1 call of each of these in the driver, so churn is small either way.
>
> To avoid a bisection problem if your tree merges first I need to modify
> this stuff in the original patch or leave it for Linus to deal with as
> a merge conflict resolution which is mess I'd rather do without.

If you add the #undef, there won't be any bisection problem?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
