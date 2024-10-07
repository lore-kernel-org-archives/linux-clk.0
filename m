Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B81C2324
	for <linux-clk@vger.kernel.org>; Mon,  7 Oct 2024 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728305501; cv=none; b=oglCigeWdtW5KIWw2hgFqApAb3k2ty2oN1gF8HgNS+f78ifi3RABQD8+KO4w3MZUxGWsGBu9uNBjm4RP63+cfRO0SAH30/OrhLg55uhGCFAHl3pXVvI7he74ScLUETkC8IqlouJYDlgH2Tehi8GvIVRh6TDrhB06F6K3NWlRask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728305501; c=relaxed/simple;
	bh=ZY+AJobU3VtP9in1HQBCcNFt78s3OC/b6dpOI+pPkOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4zhJePtVINwvbp9qMAlANM50PW/egid1rnw9VyjafcbPJ/p6qOaapCnlotB9zS9mz9OigVgGqf3DbMIvUHWkYkvpexPr+NpDrl2p2I/Fwu5zWmFxqc2faztj53FW+C7+WMrVvvJv8kiPj4MW9cDfFGlJ5qOnw7DI23IB4sKtF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vtw9P60G; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vtw9P60G"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53994aadb66so3868384e87.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Oct 2024 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728305497; x=1728910297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJZZqjDavpDNqoX3Dnp0JT4YOd4jBjyk18gDUm32hk8=;
        b=Vtw9P60Gsgv3KcNOVhtMZ4Qn28kREb+RxkFmejjQVmd12dRRQENJjySaT2BqEQHdIN
         FshiLxz1Vzqes4l5hbOXzD4wgH8d5bs7iAwgcDeEQf6+7OThsbfN3+vd+wZZPjnyW35O
         4mxUOcXtLRLdd87si+yBmgbvhMRbAl6NILVITo9q3CNMcSrcow/5IWqdqZoVsFe0+gik
         3B4mCzgcwoW9jekg7QffS2JytEJC23dIeaIxOH52TOqA/l+N2sD4VUoc3tAq4YQBptkV
         FejQgrtGpfK724fKpTTjTBJmeJ4z4GEbzxAXRWWzt62aLXzz3thF7qxobuXw6WdxM1ce
         TOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728305497; x=1728910297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJZZqjDavpDNqoX3Dnp0JT4YOd4jBjyk18gDUm32hk8=;
        b=v8vY1PwMo1VCKdV7CxM152RtzoI7GpmjnK90lrmx5OnZgszK6ApsJ2JSBHLX1q7MKi
         mLz1NSHICILS//vhedABeh+WOuQ7nMuOisKGpEJNdY+vKRdlB+hQ8SCk+SYliss5sbZX
         xy8CUz/4j5Wab3K6ntRE8wxI+wPJodlh67otA0a761wZw8vINorVBYNPMJVfrebgMVJY
         yyvLREP+nQgy4qKOQIQXqd3bMOeFLYwKxphmNVpx1oCb9d4lHMLaNrUJD+CJ1Io1j1gJ
         P0c4atly3qMsCj4PsTFzuox4oPVjtc4LjnfcSISdsxInxoe76TMpI2LotojWZx6gpX85
         e/9w==
X-Forwarded-Encrypted: i=1; AJvYcCXTxyzJ824GH1cY//0CB0HBAMWKmCiRnFkp7cPhqZDeVYX1jcgVp2+hQjKITVAd7fAHCF1sBW4SSl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQCNBnG0mAdkRk6U7ej29rzjEKAsEB0QCNypQ3mKhf52lh73p
	K3A6lXtyQDVl7uXbzpuYns1ZLmT7hTPhXsJ9NjVrmnz9xLK9FUACbymSZcCsrENfMja/hwyqhSZ
	1ekjWUBT6MJAiNJlfabcyM/Om7NCX/6DwRo9H0A==
X-Google-Smtp-Source: AGHT+IH7G05Oq1wAPLX81gHtA6qQkBSJyJ5ZrwLIgA5etwfjuE+nckfvQey36fZR1usFS8D2Bkq3YweS9u4X4KFlv6g=
X-Received: by 2002:a05:6512:3088:b0:52f:368:5018 with SMTP id
 2adb3069b0e04-539ab8adce3mr5552359e87.43.1728305497097; Mon, 07 Oct 2024
 05:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728300189.git.andrea.porta@suse.com> <c9a7d48fefd310941330a4c9892f7218b235e0c5.1728300189.git.andrea.porta@suse.com>
In-Reply-To: <c9a7d48fefd310941330a4c9892f7218b235e0c5.1728300189.git.andrea.porta@suse.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Oct 2024 14:51:25 +0200
Message-ID: <CAMRc=MePbYdanhMH4FfHN4PRXT2HAcVyCgKndfthi0hJiSxo8Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] gpiolib: Export symbol gpiochip_set_names()
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 2:39=E2=80=AFPM Andrea della Porta <andrea.porta@sus=
e.com> wrote:
>
> Being able to assign gpio line names dynamically is a feature
> that could be used by drivers that do not have the exact naming
> (e.g. through the DTB/DTBO) at probing time.
> An example of this is the RP1 driver that populates the DT
> at late time through a DT overlay. In this case a custom overlay
> can be loaded from userspace with the gpio line names.
>
> Export gpiochip_set_names() to allow refreshing the gpio line
> names from the driver module.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/gpio/gpiolib.c      | 3 ++-
>  include/linux/gpio/driver.h | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index c6afbf434366..a2aa3560094a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -522,7 +522,7 @@ static void gpiochip_set_desc_names(struct gpio_chip =
*gc)
>   * names belong to the underlying firmware node and should not be releas=
ed
>   * by the caller.
>   */
> -static int gpiochip_set_names(struct gpio_chip *chip)
> +int gpiochip_set_names(struct gpio_chip *chip)
>  {
>         struct gpio_device *gdev =3D chip->gpiodev;
>         struct device *dev =3D &gdev->dev;
> @@ -589,6 +589,7 @@ static int gpiochip_set_names(struct gpio_chip *chip)
>
>         return 0;
>  }
> +EXPORT_SYMBOL(gpiochip_set_names);
>
>  static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
>  {
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 2dd7cb9cc270..6e4cd7b7e47e 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -679,6 +679,9 @@ bool gpiochip_line_is_open_source(struct gpio_chip *g=
c, unsigned int offset);
>  bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int offs=
et);
>  bool gpiochip_line_is_valid(const struct gpio_chip *gc, unsigned int off=
set);
>
> +/* Assign gpio line names from device property */
> +int gpiochip_set_names(struct gpio_chip *chip);
> +
>  /* get driver data */
>  void *gpiochip_get_data(struct gpio_chip *gc);
>
> --
> 2.35.3
>

gpiochip_set_names() is definitely not ready to be used after a GPIO
chip has been registered. Please take a look at how we handle
synchronization of struct gpio_device and struct gpio_desc. You'd
probably need to rework that first.

Bartosz
