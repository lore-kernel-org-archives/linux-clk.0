Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3713DDA1
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006449; cv=none; b=HZn8dQyREgKKJCeek3s1pCiAfKzdV5GSz0PI8ix8MTC2/wII3HK9vkSJlRY6RmCcFYxluQz6pp7DW+knwPUKcTork3OI/ho6sjhed/a1xLNxfSrEmPQRxCSPBYHsAUZHygm/RyNI/5IcpkfyTlKlLlxJc4HwJMdfMh2e5dXTrDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006449; c=relaxed/simple;
	bh=FZENwCduhzMR7HNXX0tAbKbkTMhnOf9iriLhVyWT2uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoF5gC1LWVmJEnsjyPFhD5yKHAR/8hcLv1MSTu6cxChncyIAgsjtxKp8Xyx3vhKnd/i4iT7+K6ZiP9KAJCck5X1Mi+fz4WUlRvU3v9wTlHfNQB35Q2qvU7WU6p9GXzpeZxHc0Fb50RZJN6QkgP46pg1P+LPiYOzhHHxjpm1vQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OV4gZuIz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OV4gZuIz"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52caebc6137so4817652e87.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720006444; x=1720611244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=OV4gZuIzBO4jNQCcCUAkjWPfq8DbpHiadVs7Ug8Lmsv+kTCM4OXFKoq7KluptmDUQo
         9aGehEpdQPeaHrljMWxc2Z9+i46u+8RbWDiJvOrSX7C3G8SV2Da7g+5ZBEI0ufnaxIjH
         kJ+9mdSZKvmHIaKXyAUwIjGj9rh2kf6NKRxl6xy2eOraBeleRSrLV14kHaAJaSh7lx52
         ZLs3YvEgsKJcQgoC62HsecFXE/opvlchPr0fjZVJkN4z+I1bvkaYoEy5mz9iNH4/2UPo
         0rQHCBL3RAXnzMhA+GLp4ZYSbh+0/0CN2ftt1e8RBYATFDVc+zMN/cLi8XGH6YxpO69Q
         E6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006444; x=1720611244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=se4qEee2YsUSF8nLXbg/zdLQz8l0OTsWZoyJhUL5s1CRSXQ7Iory3uqQrSm7vTxYc7
         +GjCe690jt79GM7M948Sr/G2PgYavuYRHLgcHDCFO56ig95M9BpLcO+oT0cKOK6RINZg
         ySoHhIz6HPWsVUn6rQLsaesh6n7SRN+eebUxT07AMZcVB3mdc2DiO17iw/fnxqeYrwST
         DhWCBNG4yJeRnBOSvoX2X8CnhLY9rOrufgSRIhBCagfdqFa3/mGVAumHn+uPt2efim/G
         2BVcI7Ek7LBIkY4mBqJzgxjEsZAiSKiwg/dvcPnRde9zenPxS/VyFsfNJ52gKLxvSQCp
         NTNg==
X-Forwarded-Encrypted: i=1; AJvYcCXCxsPRyC5FYYhW6kui7uobpUNNpbFPsb8DTrjq3rO93Ag8TtyryeaIPjaRiGsBzC2JBui+OIagftYoA+cwJOCtvTjNntUXthBg
X-Gm-Message-State: AOJu0Yw+X3AxTTw5zFcq6pxF4Kvsew/J5D8c+6Uwdw0doutyyKphlceC
	xkDbKRJGGRi1U/DB2BtJBkQO7kzig9Vqt9NTV0EdNpfFeedMMgvk01vKn2TxlO+2OjlnW/HE0eA
	lQOO0ZkKN5JnN+YUmWapdfj6DZsGRq2kO7BHjjQ==
X-Google-Smtp-Source: AGHT+IHvYQvlnz9xSSjxxA0C9+ARDlWBymS0Nc+4OcDhYKcJABqlW19CRkZVdGMg0Rc503nQzevZwF7mryFVzLHp4+k=
X-Received: by 2002:ac2:4e09:0:b0:52c:d8e9:5d8b with SMTP id
 2adb3069b0e04-52e826678a3mr7597242e87.25.1720006444010; Wed, 03 Jul 2024
 04:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com> <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jul 2024 13:33:52 +0200
Message-ID: <CAMRc=MfjdCxbQfthWXcgz2tC+2_owfx73DBq9LqN_4wFvWwgqA@mail.gmail.com>
Subject: Re: [PATCH 09/20] gpio: brcmstb: convert to of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Richard Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 12:38=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 8dce78ea7139..77557bc596cd 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -591,8 +591,6 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         void __iomem *reg_base;
>         struct brcmstb_gpio_priv *priv;
>         struct resource *res;
> -       struct property *prop;
> -       const __be32 *p;
>         u32 bank_width;
>         int num_banks =3D 0;
>         int num_gpios =3D 0;
> @@ -636,8 +634,7 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         flags =3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
>  #endif
>
> -       of_property_for_each_u32(np, "brcm,gpio-bank-widths", prop, p,
> -                       bank_width) {
> +       of_property_for_each_u32_new(np, "brcm,gpio-bank-widths", bank_wi=
dth) {
>                 struct brcmstb_gpio_bank *bank;
>                 struct gpio_chip *gc;
>
>
> --
> 2.34.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
