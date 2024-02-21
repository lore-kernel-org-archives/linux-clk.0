Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415DD7BB16
	for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522898; cv=none; b=LQBTFenrNyK7aSgpRZ6hPW2rk3SqCplFrjGvKa6amBp/ocQVaMLWJMZVieYiPU3ygpGcOQeNenzqiqlWxhTk8crItt5gvM6tRDgIC4nt2Mn4dY8HeZlojVgW8PxuIkwXsG9ima2MkhU8gAjMvdG7Iaz8MQaTVN+MvrN3UgRo0Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522898; c=relaxed/simple;
	bh=ivEmiAr+W+JzNPOKebOhQImKyAB+5/Dd8FUTrPTjvb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoI8WCMt0HwUwhp4qLAZS4yE2R+Eh6GA7F5ONH7/r5aod7SETm8EW4u43yPRiQ0uK8VXjFAR/ULUK3RepeElsPhHDT6zrNn+6lUsPWf6E3N9ibpHTy0QPvsqM3jg0kIeksXd1SEMpkcdAocsbIJynqBCRNbWUEt6zucL2E9/dfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AUtAHWmb; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUtAHWmb"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso626854276.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 05:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708522896; x=1709127696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsroNQtXczuhO6RxPh93TLxPT7U01/nSu3oEduu5kHY=;
        b=AUtAHWmbHwdf4giB9ucVqcKGp+edWClPLBk2cQTFElp03WG3qLeLnAU0RbaAhoWBGj
         eNLgtRUtuI/b2iSp1FWXb8jITvP0iN6fP5WJ7tHyDCjvw7DnimHFLrhgYNHiF0xV1lmk
         jwq4oVNN3NmqspxPCcx+zf5uFabWY0PhXXfnGX64xg/hsQqms7VAZ/4VeNAAM32lQRgP
         5xH/GVwqpITvpvBj4X7HXEFEjXgtg1vsoJmPYh1k/wZHJY0fZLZsZ1E3yAuCzZHXpNZq
         1OLQ820o/siTichuo5qMsu1eVRW03u00TJn+mKmbFM+5yPWjJOGlwzc6bjlmFw8pmp16
         2aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522896; x=1709127696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsroNQtXczuhO6RxPh93TLxPT7U01/nSu3oEduu5kHY=;
        b=LKdBGd1IAzBxVMJc04IY9Sb8rBVghto9oGE7PsdpPPiFE1sp7+zUZXcRu2HW5O5xbx
         xXxCTYnZieocYJEJQle4rNKcpHYv6Ptpx2k7o2smpoaUEJB7ytL6ynjAr3TgaxHNhzFV
         xha01eaBMTE5A8f4N8dw3BtvSEYeY7dmCLOaT74l6fPCf8vcJj7TCL+vRLHEdvxCQjH6
         NUnd+fOQwsWbgOOykMdR21aTF5JtBpJgQ7gsXcWFCgXg4jDSsJDmmn6p5dMeiqEi/rl9
         RLc3LvYlYSPO9OWTNkcX9r3x2KwzAJ5K+FPeMDGyRqzqIuNUF+QG/iBuqv76PF84ZzaR
         Bqgg==
X-Forwarded-Encrypted: i=1; AJvYcCWNUryLsnwn5fJcrhAsINvNwjB08kxzhxnUzc61QYkLt6QDHRzwn6YcY9QFsRWpWIWEY1vejMUTTCccEfM2YRSQt0+Zn1Mnatim
X-Gm-Message-State: AOJu0YxmCWcYHmgf85v3UZMFhxxcKRk3nbz8UikUnvJN5mNZEjSw+lOk
	RUS0GOoWIloE3QK+ChcOUn3nl6b61pNRTOS05vX+hhrqpx012/HBKezLX5ojUGKmJFa6VgVCbuQ
	0XP8/ltZG9YKfOL7EcfxprsQ3GhR0Ear2abgA5g==
X-Google-Smtp-Source: AGHT+IEJpCGtngBPvgznu8+LoESbYa1WxKXKDsrmisskNRJN3Bk05zgsO9QYV0HD1o9AhHdb4QExyWdBMbsGK8a+K3E=
X-Received: by 2002:a25:ec0e:0:b0:dc6:b8f5:50ae with SMTP id
 j14-20020a25ec0e000000b00dc6b8f550aemr19933910ybh.32.1708522896187; Wed, 21
 Feb 2024 05:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-mbly-clk-v6-0-c46fa1f93839@bootlin.com> <20240212-mbly-clk-v6-9-c46fa1f93839@bootlin.com>
In-Reply-To: <20240212-mbly-clk-v6-9-c46fa1f93839@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 14:41:25 +0100
Message-ID: <CACRpkdY5QgdtsHLs9QsVQ_zYRZBqdkCiWdkfTvNcw8WgyAfTbw@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] pinctrl: eyeq5: add platform driver
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:44=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add the Mobileye EyeQ5 pin controller driver. It might grow to add later
> support of other platforms from Mobileye. It belongs to a syscon region
> called OLB.
>
> Existing pins and their function live statically in the driver code
> rather than in the devicetree, see compatible match data.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +       ret =3D devm_pinctrl_register_and_init(dev, &pctrl->desc, pctrl, =
&pctldev);
> +       if (ret) {
> +               dev_err(dev, "Failed registering pinctrl device: %d\n", r=
et);
> +               return ret;
> +       }
> +
> +       ret =3D pinctrl_enable(pctldev);
> +       if (ret) {
> +               dev_err(dev, "Failed enabling pinctrl device: %d\n", ret)=
;
> +               return ret;
> +       }

You could use dev_err_probe() here which suppresses -EPROBE_DEFER
messages, but I'm not picky, just mentioning it.

Yours,
Linus Walleij
