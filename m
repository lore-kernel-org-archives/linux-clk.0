Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC02E32F751
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698935; cv=none; b=pmDIYmIexiRxgncWWjb1E+Tpz9HXVD0g7BqBNEPdp2zgFvMtTcYXgJXzILQARxYwVd47wPzAnrBiQAIU8RnYmngf6N5oF6jlURJeAH17tM2Zw/2vyBGt6rmxGQvsrA6DoO64owQrtM1tDUxMLpAPw7DFwHMNeeU+UM8R89ccNfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698935; c=relaxed/simple;
	bh=7roeWK5AtO/7ZwDK0dlN3Uu9wiMocaa5toCTUlYqJaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKBzM/kDKWKFA3Aox7mbdALzYml3GBJ/q2XorkVv8k/iskdxLJQcphsjloGfIBXtmRZV8q3oX9yTLZn9gE0VDWTxtwDCUnA3Aegh3owGl04nLHH/gUhTDXCroPUJbxLO9ivp55HrPicemTOFvkxovKYRyfBN3j/uHI0aA8Wn8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7930132f59aso2477012b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698932; x=1761303732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPE9WHNZsdRI3QmdRcH/wWeYzKksV+R5Ry8aWltKbjU=;
        b=O9tEAOntaKmL9iMEoVlkO3UlIfeNJmqjYVUX+OxCCl0Cz/L+o/FiXUzv3ca2SGS4gs
         u0P7U/VraL/ToKxVHieBoUUoSwKYtfjsIWcc9JYn0QtrPuv8QpzZQ0AP6wAY9q8tgFaH
         /6nOOHz2JKOGGyyB/lqODm2h4dUUK/AUEVKrFzv4viec2EH+oF//LkQ4+ty9QljHUywe
         9/yIIlRnx0CkyuKnAyU4jLr8DpJ6R/cmhBt4yRxPC/FiNN5BCciY0s6bP6DUBBXEkCqo
         ZzoSN/lVJsNkeOwE1zFkPWVeYBf3tElpQL1UalCSxmj3dyf3UC8yxpMncuuIuyuYokFn
         njsA==
X-Forwarded-Encrypted: i=1; AJvYcCXeLhAq5yNBsLNtQRkLjCKXnZ3AW9jCfK7i4dFMLuB41dXMXIlePhEr24fw/UoBiwujbAwSrOabTyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxogAG1r7GyMX+XQ5GK7dKhmMNKa3Bn8cX3TVgythsPNa3APeBH
	aFy+UNTqV1sswu+WekAeDgwadAdJZ+zALWHPhnFXWLMJKPqSKlX92b+7aamtHFlX
X-Gm-Gg: ASbGncsmEix8258Y0Kr5wwj1TXvkq2+/AMJ/m3HqYOHN0+t+Ag0B8TCsARvkKuRVQOU
	deqSUvmjHirbgUeXyD7SJjrx2ToOQoeLeJaNB4njsSGtIJxZ2kubi7Vtf2VoFan8L52FqRNfaWo
	wlxBYGuA2OIeLoLI242zQhrVJoGFKVDPtMDKiJOV7gKuIJl+1sOa+F5ENIyvqN2OBwOJEHEmsX6
	rDeIoKy7vbPvLU1RFllFPOqQXMin2RneoI1LM5wFfcpAj5pykp7u0Wh8P+uvgER61VQvkZitmvX
	9B3f1GXwzoBynIfto/FaUgVHv7eqZ8PyX7gu+oGXXmxBk5089l+XLlv5pRD8PtBX6MW9mFp5kdg
	ly4oG4cKxRB6MmTjdbO09oTjC5ZSXF98MU0ewijufqQvXgF+gswQ4Qx0v4L0Nb56filgrSVL66s
	1qoa+OiRl7ya+jW4DjKQM4nnxCJe9qNPT+4YZAWx5Mci9aiGjdR7vt
X-Google-Smtp-Source: AGHT+IH725wlKCW1f5FBE/LsaSa9KxszjPw0J38br1GyqOWCf3Zw+Wr6zyuoSnoRUeXkL/9Eedm2aQ==
X-Received: by 2002:a05:6a00:9299:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-7a220d232b3mr4188480b3a.16.1760698931398;
        Fri, 17 Oct 2025 04:02:11 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63a03dsm25282293b3a.19.2025.10.17.04.02.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:02:11 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so2463741b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXghG+Pe8kG/+/lNtRz6vsza2IOwJCtWMa0sY3fQgGc8XFym1NIfyK8Kuj1+OGHeKoa9nQ17TLdWmY=@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:5d5:f766:333e with SMTP id
 ada2fe7eead31-5d7dd5934demr1126362137.15.1760698513447; Fri, 17 Oct 2025
 03:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org> <20250214164614.29bbc620@pumpkin>
In-Reply-To: <20250214164614.29bbc620@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
X-Gm-Features: AS18NWAcP6voBjoIoEi-7RxJ0pdmzXqhfe5FdHBNP60R0y-DyUBofdEL44euygw
Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Fri, 14 Feb 2025 at 17:46, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 14 Feb 2025 07:34:02 -0800
> Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> > >
> > > To avoid this limitation, the AT91 clock driver and several other
> > > drivers already have their own non-const field_{prep,get}() macros.
> > > Make them available for general use by consolidating them in
> > > <linux/bitfield.h>, and improve them slightly:
> > >   1. Avoid evaluating macro parameters more than once,
> > >   2. Replace "ffs() - 1" by "__ffs()",
> > >   3. Support 64-bit use on 32-bit architectures.
> > >
> > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > macros, as people expressed the desire to keep stricter variants for
> > > increased safety, or for performance critical paths.
> >
> > I really really think that people should just use the static inline
> > helpers if the field is not constant. And we should do something like
> > below so that people can actually find them.
>
> Especially since you really don't want to be calling ffs() on variables.

It is not that bad, as most temporary architectures have an instruction
for that.

> Much better to have saved the low bit and field width/mask.

While that would allow some space saving (only 10 or 12 bits needed to
store low + width), gcc would generate quite some code to create the
mask (even on PowerPC, where I expected a single instruction would
do ;-).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
