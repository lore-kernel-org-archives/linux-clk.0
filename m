Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC53EC834
	for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 22:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789941788; cv=none; b=mddue4TFWWOrh+PhTsv1/UmaIwfEXZ+i8Wk8iGld2oOZ8YDxhXjOi4Logzr52A6gMHDt/9ariVkcn1VVUGAFz69g5vRGQZszG3SX7g14gsGygYh6LS1MHFNyKoBWqZ95JlUAkm5MQ4iBtkh2IlEYLC4pKnjOECSIqAkjy6OXVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789941788; c=relaxed/simple;
	bh=w9PyPvHqvQlU5tUctmkjZAK8hcqetTA3tQ6r+T/tHxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTb7bHyBEy+2OQiadqqr1t+bUIEHGGq2GJstyZr6CGa+ZQMTbJY3RrvAJcB2GJwxvzCsKc9KC3tPxtmgk8YmI01WKmT2dwoReQUN5QV+qsgRJEOd8zA2eOaFYMXTJiLkM+MgNlSTiMqFhYNrxnnaqbNUKWZ/F5s8GEIGzvVoctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpnihlfY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpnihlfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69491F00899
	for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 22:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789941782;
	bh=EazSi67AnEMmbq7ZltUkvWuYuiRsVKn0Z1eUsxsbxC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PpnihlfYYJqzvHoMnhYmLzlmbf6Sv/BB1OmUKiANmc9ppQe2DcEKQHJxTbcNRTSUd
	 wef5g4AoR0jPwO3N2mBNwb3OiuHUUWzYlurjSFJA0eYu20MDD0oIEx4ndvF9h3WhaA
	 uCUqBfj4FIJWieJkuOiBi8eUfg7VN3DP6AEy06k1xWXrt63d8aK2yezeOYTxgUxfrp
	 yLbz2jJx5+DoyS+97bqtFAWTVIgHKfMkoPbVuy7Td934NCTRrLd4KznaPshmhFL2U1
	 dtMaT8hqb5yfxuNVn8RQerQikcSWgIB3PZ1Zcnh37y2Ln9hY625LmI/ssS+RwYaNro
	 cSRvBW7eCbXug==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso2330980e87.2
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 15:03:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy32fwFGC81XSxe9H5IzJrBFb6er2rCXxpRmZdJ8pPOfMQVkuNWiGw8mRHLTf6pcYCytr9M4Ga3jJM=@vger.kernel.org
X-Gm-Message-State: AFuF++lL6i4x0NjaD3opQ6BL1kFQ3hEHqdk00MFG6nW80pPRCzJnarU8
	w859jReIj+S4xK9uJcDWJWne+2QSdcZNJHpcO1a0vW/3Z3PGYFKJiJHpOnlec4F14rYfHA5IQkB
	smst9hlblDQJSSJcCalPRCrUh9evbkOc=
X-Received: by 2002:a05:6512:12cd:b0:5b1:5fb6:5cf6 with SMTP id
 2adb3069b0e04-5b8c17ffa65mr2546885e87.17.1789941781599; Sun, 20 Sep 2026
 15:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com> <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:02:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHfgu_V8i_fhE1WQe+qwJ=ictQSONWPq1fPuYYb8tSRA@mail.gmail.com>
X-Gm-Features: AcwNN1V2pdLiyksjZ1x3Z_llNdAeXu21UqDUc6FoZVDqEvbXB8LwaNWdrYSQU-A
Message-ID: <CAD++jLkHfgu_V8i_fhE1WQe+qwJ=ictQSONWPq1fPuYYb8tSRA@mail.gmail.com>
Subject: Re: [PATCH v7 08/15] gpiolib: regmap: add write_data_after_dir quirk
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

thanks for your patch!

On Tue, Sep 15, 2026 at 1:15=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:


> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

OK I see.

(...)


> @@ -271,9 +272,22 @@ static int gpio_regmap_direction_output(struct gpio_=
chip *chip,
>                         return ret;
>         }
>
> -       gpio_regmap_set(chip, offset, value);
> +       ret =3D gpio_regmap_set(chip, offset, value);
> +       if (ret)
> +               return ret;

if (!gpio->write_data_after_dir) {
     ret =3D gpio_regmap_set(chip, offset, value);
     if (ret)
             return ret;
}

There is no point in doing something you know will not
work.

> +       ret =3D gpio_regmap_set_direction(chip, offset, true);
> +       if (ret)
> +               return ret;
>
> -       return gpio_regmap_set_direction(chip, offset, true);
> +       /*
> +        * gpio value is set again, because pl061 doesn't allow to set va=
lue of
> +        * a gpio pin before configuring it in OUT mode.
> +        */
> +       if (gpio->write_data_after_dir)
> +               return gpio_regmap_set(chip, offset, value);

Then there is Andy's comment as well.

The rest looks good.

Yours,
Linus Walleij
