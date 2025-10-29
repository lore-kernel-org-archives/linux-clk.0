Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C625BEE8
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747708; cv=none; b=BnAzvosF1FJ5JPo36+wjZRROAb17W0ead/7oy2PxYVKjUw8Ggbv6qATXNbKFwha57XFjT7MHX7N975xJaVMJpVxTJzbmptqY3QKfxXrY1kD/+6dLkNbZTeFIcOLY8RRJWSTcI+22Ki16+2qtcV/xj4gyhk7Y+9XePr4PYhRPbvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747708; c=relaxed/simple;
	bh=W2MmcX2vCweI9Q0W0BLZEPy3CkT01KpRkvvdhb0j4RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfgSwpSlkEuvf7RrZXKHFC/kBtpFgF+iS/SdX8SPnv7xXO3EUiPprmISUQE9RHiKF6nmvQaXvd11hRQnMiwnYsBTa3IIlvRlchrUXWnMr7IspbywsdFt9g8Q4VFLcX7B3chTk9bCrnQMiKRz7QnjJb3nmsMBQUlkZKbjIAp0adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iPmuKBsz; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iPmuKBsz"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso9232262e87.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747705; x=1762352505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=iPmuKBszqzRuJQbXmV7ZqrHkGQ7zzFPI5fCiy2pzoDtPjlRPUxn/iBGENRd/ptR9K7
         3VBKIZJP1O0yUFj7/fCcbOwJ6Jrfg+aPV8Qe6xEI+yJbt3zW5MFm2vbkHPWUEusZbsG9
         9pDt6yHUt7It5usEE7V6f8zm2g/wPOsuVhT8wJtzZZCpNR5pe56ZlKHI8y6UiF8K+aW0
         6QnQ2mRi0kkStXvJzZuY7GofiTxN0n9PLm4/uCs5Swf6Aq4grVIHoojnEHTsOwvkPK9h
         byUFAKzmTHWTLC+KE+CJwCtlAzXP6ZbY547Jy05lqxEPqw1USDxJedUjrktORkWq++Nc
         KPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747705; x=1762352505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=TUv8HfQTRrCfVfZrI3OtlWrb/c5G4tJpiKmrDuHpxjn69dt3g/bL4aZsNTXoyTyvw6
         5FZXgbtn+kfHxnlsFLoacAbdOIzO/fJteEQPDQ3ZjOeyuFpFpN/4tixmhsLwuI0nau6t
         nyBSqU5l9GtIH1LqfqpXqxhA5hp229hK7yU/WyS+589rPWiNdeKs25BIxKPYnXrSI4xr
         FVDIBT6/hLWwxkmBus4IHLwZ/72YSz4w8q44DvL95jnyPPqgCWRVO0KRMaeGrp2/T/JH
         +S0f+NvVHDfyb+vXaxH+IVK0WJ8B2ytC/ZL3WdebeSucgT+X3AvtrdjvOuftgTp2Mk2u
         IKUw==
X-Forwarded-Encrypted: i=1; AJvYcCW8w9vEz92i4zfPStzShyQ5J1OTtXL2oXbS00UOnJFq7jShQm1Y5m0QP5VX7dWoBZjPYaeCmvkDKzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCVnv2KqDwM5DhRTIyDUE2acR0vwCWdd2ZHAIS7R7CeGUqz+c
	F8sgscL/r2LoOKwh8a1zDRLrWNKJOvkf3SevHDDmEmX8/GhUDNQgad8NegXUzgr9/GZMVzUxo1l
	os+EOtI1zZ9L5+M3fjzd60LFHMd7wYXrUmMCzQ0BdYw==
X-Gm-Gg: ASbGncsLFBRdlK8kzA8GGlwIzRkSXYVbIvigE05pl51HKCLzKRggxwIjfFbQ/QafJb8
	tCSGHT0KWnOUj4f822lHgoWuummaPufwozjVf74LGPq36OdS1l3TLoy/BPSkmIsmJQH/3br5TEO
	t9MAAbydLDOSaCCe5O6su+hvupqFIkIcRC4zQIgK96OK+mJWvAdRqOswzyzlvVudF3j3nBDpeTc
	Z7xjXDaplLd9WWSvJBNYLiAC0FY10A3pvYjZ36SDgawzM+6WrvGIsCaeQKP
X-Google-Smtp-Source: AGHT+IH/WV9TTRDue/YlQPKqZJ/rOmSLCumqELYgQ//HXfU7luOPdKKEVQrj3vn51BUY/zZkRojEs9B5VMPxZwJpOnE=
X-Received: by 2002:a05:6512:238f:b0:592:f814:3852 with SMTP id
 2adb3069b0e04-594128b7bd8mr1157709e87.20.1761747703432; Wed, 29 Oct 2025
 07:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:21:32 +0100
X-Gm-Features: AWmQ_bn0qj1HdhGI-E5owVSGvqmNxBgXc48MF5-9CHRtkVWKXcvNelNuCdps5kE
Message-ID: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
To: Geert Uytterhoeven <geert+renesas@glider.be>
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

On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Extracted from "bitfield: Add non-constant field_{prep,get}()
>     helpers".

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to go with the rest of the patches?

Yours,
Linus Walleij
