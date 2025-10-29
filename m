Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6816262FFF
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748970; cv=none; b=CadStNAtcblnoipdZQuOUPzccX7B07YafXeuPb9qP47CqAc8duZR59K4wk/k+Fhu2yqs2hTyvHr6bty80fJqoFog2+IClD2Zlr13BvuK3Ux9AIxvWCiqr9GqqtS1eFngKLTo0QnBqzwuiB75ABPC86ND7UluoQn1APK0crCE6Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748970; c=relaxed/simple;
	bh=QXFJ9Wye89l5k56IzhXHnCZ5vP4dVOGIaGxaTnibrdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2K3pfPNj6W3eGIGTY+sKW3e46Fcb3sXwS+HSPTA7RgHl2PFFQYYv6SZ8GawsE/qUcHK4kkmqUo3b0UTL0kIki6QwQGGETeH1wv92L6LGqW2pzsZaqA7XjHivM3cTeTFQS/5+uJMMXThhz+HJ6Jbl2VcsgoR9DrPtaBBQU8+9K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-557d71a96f3so807864e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748967; x=1762353767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohi/8MFIs+pUNYTuSKDH5KUVpFMJO5wn0YyhdMa7QIc=;
        b=XLPCnzD3kgvxfuOQWuKl3A1chQfx13svn/6+KsIrU0o2uIUGV0rU6WYdXAw4Gt8pk7
         LSbqXVQ5m96eTKMGYykaEW0Hf2dud/VjyPH2RNI6zN4q3PZQyfl95oihbr1lUJbI39TX
         2kW4UcGw9r/vqr/ClMrjxRYt2h9XjXwZI3PRL6qVATStMZKoHCYj9ljbRGv6TTXGEAOw
         PtocpIutQDmL4Wi5uEFtnfquRyG5iZn4igkYcKG1ufMaQavSoJNvLXD6OEUZIHrh1rcQ
         mVSWjx4yzasi9SfCwQcYKaMJOTDE7gWnqprP5Khg37GtNP/Ku4ER90oxWhAL9ivM/Nzv
         lMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmtTqF04RRLBtS14/7i2BTvrZai1zIx0KoyLtgsq8XIzsmDV1UMp5DCReiMVYevCU5jgNrIDk249g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8h6Hczb/FIRJ0HFJkY4qGUjTtaiNiXXPTfeIdpOvI/dBsOMn2
	D+G3hr2OBAkGvWBt62qe9EEbxJTk3ZUH60JOFUgrDZeJvkazkoBfSo6ECS1fPbA0
X-Gm-Gg: ASbGncugdjpqJo6EW4UWk2Q9QU95gPiOwuRNm8YEOqAFZ2ZOITm0+QP8/9n1fuxqnJJ
	pvj6VIjBLKoP6LgnWp/zhx3tm2RHkQjTGuYNNloIHC1ulyO8NGULIgK5q8fEf8YtZYgmZbcPSmK
	q9VJ+ZvsqJzbCNlJPH6btcACdHeuyR597ImvLkDZ+QVRioqxUlxT/b63pgrjfOQ0J3baHgzT0bd
	0OusxmlAOQOrXvVqMLlggTmmkJJTnXrOQjWjQD1ASbTG8EPxohWwnYD/VOA079zU3rTjeVSoQm0
	29YQkOvaCytEsCPkvxKJprODyJpTWSiDLu4h8Ok0Gj4IVOxLLeei6TGCQp3oFht8oQs7NZoAbSI
	7qSCW0heaLRkRadrdmcemlA/V5SmvUZ4p0s8ELJLTiFpNZaaIupp3O0k2L92kuDyanoOtDy6fOW
	tZUR4I2kcU/vtjiFECcWUhposD43hVzDisj4ZqzFKlTYWp9DiHd8duUJZBNcCkqQs=
X-Google-Smtp-Source: AGHT+IFsXeSWa5zC7nELxKZKhsOEfG9Wm2H14xMdQlADDXSVDu4fFgXqGJWF6PSD3Aw3IqU5InQpRQ==
X-Received: by 2002:a05:6122:901:b0:557:c538:699e with SMTP id 71dfb90a1353d-55813ce857dmr1256159e0c.5.1761748967361;
        Wed, 29 Oct 2025 07:42:47 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb5b68bsm5438956e0c.15.2025.10.29.07.42.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:42:47 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d96756a292so1312145137.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:42:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWebwhmhP50OgZKWxWrok+sJmALy6wiqMY3fzwa50jXsGSsnPnxa7XS4BJ7+5Z4fdkfGszUPuRUHOk=@vger.kernel.org
X-Received: by 2002:a05:6102:2acd:b0:5db:9b88:1fec with SMTP id
 ada2fe7eead31-5db9b88219emr535412137.9.1761748503547; Wed, 29 Oct 2025
 07:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
 <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
In-Reply-To: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:34:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
X-Gm-Features: AWmQ_blZ8dUVr2aBwtWAAkAOaE93AtUSPNFDpslgvmXepFfW4tMWIOUWnRJkksY
Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
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

On Wed, 29 Oct 2025 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Drop the driver-specific field_get() and field_prep() macros, in favor
> > of the globally available variants from <linux/bitfield.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5:
> >   - Extracted from "bitfield: Add non-constant field_{prep,get}()
> >     helpers".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> I guess this needs to go with the rest of the patches?

There is no hard requirement for that, but if 07/23 goes in, why not
include this one, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
