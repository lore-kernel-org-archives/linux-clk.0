Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228F32E7391
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134595; cv=none; b=L9fUNhkQOGpr0OUj4dQbsvm+Ipju/3JmxfbJxsVcyHq5QL2IMhGHCUeoTKzp5o8kyWjvsJVEszUpPmb7dIgKEpYP2Ee360Ce819tSCimpMQOkEmi0iVNwNzQUAoSrXrNzo9QL+s/yBiUZpI/nOyteqQHwJG+SHmlQiHxigsR1Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134595; c=relaxed/simple;
	bh=7kcrtJ8j+vZ43z9CeSYPxhIzZu+b2hH+4cPJzBtMKDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVAbz4t0MiV+m90910MF5soi9jWQ/xNxfHkhjTUeQUMGirWTvhWleYYGh5WrobTEgc6TD7rgiX290VcWW/wYkzzpmGcjBSS9FxZKnImgaX5Hb7039PTCZbzvW8Ck/zeP5NLDx5B/WcJGxptIr+JnKdbf3KxhVnebQhM7Nads1O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKvdMvRP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKvdMvRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA41C1F0155A
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786134594;
	bh=7BBfG8gvn0wfloVrzuTpVHpGFkIlfRzmb5mJzr8wSag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lKvdMvRPkDrFgJWtpzOr8PDgtp9PPrzoVNhyFyPsqx4QgBNKZ/vMgP+Fl1wMjAIFx
	 jZ3BX75znWkJCBTUTXNmePC6GhPCVVexypl4W7k9jq011ZwsYm5A5ZQCP+WEK/4can
	 f7XI0KDvRDzHZI2JGADkSFM04p7KQOAollzJR6aGQQ9RqLps63O3QNrY27m2cKPaZS
	 xg58dWu59Pp1EMTySpD69jvxOk2yWzj/RrAwpcSgG6ASB2+Ct1/vYxObsVzUFf/LcJ
	 RC5RYlstTKU7dZia5zPs8MDyJph/VXrqy1xbpNzawzVAXpXR1AhJFV2FEZmJCDnNVW
	 +4i0PInEAht2g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39faaf1efd3so27078821fa.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 13:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ron4SMPFnQbgNLnJhJfipvSgpWVH4FLvkb0tCbzBiV8HezMxqOuUwKjSJjmtVio4oJXn/qLGfYCi/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2BIgVIaa/C1k1NXS+2LY4ng7ygKB149P0g4WMRxWEwZ8oECZ
	UuAI1Yn6gbczdW4/9TdBPmXdstAsb7H23m/47eYD9/s2uzpUDtVE0d0L3oLmfvYvts1/25O5yKD
	5htkqwfWc9RWU8vN36FwyHt8/AkfylRc=
X-Received: by 2002:a05:651c:b12:b0:39c:6fad:2bc4 with SMTP id
 38308e7fff4ca-39fdf4c8d15mr7787011fa.16.1786134592653; Fri, 07 Aug 2026
 13:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785838584.git.mazziesaccount@gmail.com> <9774b8d6663ea55b1682b32f825ec5689be3e1d8.1785838585.git.mazziesaccount@gmail.com>
In-Reply-To: <9774b8d6663ea55b1682b32f825ec5689be3e1d8.1785838585.git.mazziesaccount@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 22:29:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
X-Gm-Features: AUfX_myHYbPtrP3S5L3hInuuhbJn2ygvTZZS9m3nHbXN6_wSEyPEOm43kiA3AKw
Message-ID: <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch!

On Tue, Aug 4, 2026 at 12:23=E2=80=AFPM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:


> +static int bd73800gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct bd73800_gpio *data =3D gpiochip_get_data(chip);
> +       struct bd73800_gpio_pin_cfg *pin =3D &data->pin[offset];
> +       int ret, val;
> +
> +       /* Only pins configured as GPI via OTP can have their status read=
 */
> +       if (pin->state !=3D BD73800_PIN_GPI) {
> +               dev_dbg(data->dev, "pin %d (%x) not input. State %d\n", o=
ffset,
> +                       pin->mask, pin->state);
> +               return -EINVAL;
> +       }
> +
> +       ret =3D regmap_read(data->regmap, BD73800_REG_INT_5_SRC, &val);
> +       if (ret)
> +               return ret;
> +
> +       return val & pin->mask;
> +}
> +
> +static int bd73800gpo_set(struct gpio_chip *chip, unsigned int offset,
> +                         int value)
> +{
> +       struct bd73800_gpio *data =3D gpiochip_get_data(chip);
> +       struct bd73800_gpio_pin_cfg *pin =3D &data->pin[offset];
> +
> +       if (pin->state !=3D BD73800_PIN_GPO) {
> +               dev_dbg(data->dev, "pin %d (%d) not output. State %d\n",
> +                       offset, pin->mask, pin->state);
> +
> +               return -EINVAL;
> +       }
> +
> +       if (value)
> +               return regmap_set_bits(data->regmap, BD73800_REG_GPO_OUT,
> +                                      pin->mask);
> +
> +       return regmap_clear_bits(data->regmap, BD73800_REG_GPO_OUT, pin->=
mask);
> +}

These can probably be handled by the latest version of gpio-regmap
helpers (the version in linux-next).

We now support both input-only and output-only in gpio-regmap.

Latest <linux/gpio/regmap.h>:

 * @fixed_direction_mask:
 *                      (Optional) Bitmap representing the GPIO lines that
 *                      make use of the @fixed_direction_output list to
 *                      enforce direction of the GPIO. If this is NULL
 *                      and @fixed_direction_output is defined, ALL GPIOs
 *                      are assumed to be fixed direction (out or in).
 * @fixed_direction_output:
 *                      (Optional) Bitmap representing the fixed direction =
of
 *                      the GPIO lines. Useful when there are GPIO lines wi=
th a
 *                      fixed direction mixed together in the same register=
.

It seems you can set up the fixed_direction_output mask from OTP
and just use the library, right?

Yours,
Linus Walleij
