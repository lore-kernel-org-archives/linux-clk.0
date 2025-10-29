Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121C2E2EE7
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743353; cv=none; b=QccA0Ekfo/QuQQ7JaZFB2fQdK4Iysdg0UioPFDhswBfmpDa5J0am2h91aTKSKDB3Nzc4VLSv6OCkEXstDkX0OlTLCq16AUGvJ/Fr3qYU+p86z8dQugQUDeO6NRM9h+r11AgXxyRtnZaSK0WPK3B3iKcMyMWMKL9urmcU3h22pzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743353; c=relaxed/simple;
	bh=fyeNQjPbHba2zQACV1XwHgrmcj9u7mbSw/E0lwVQwQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhixaiLcbRq/kde905ffSnem2/KekVyJhlMVJ6QIG7Ic1/1o5ulsU53a6uTLt9bAy4RmHnIPFHUZbA7cRO+ScqBrO6U17+pyRKKu3P1iwGFGNQgYSqudDmySjRcGVuuXbDvwXLHlUvEbRttCQUSihGFxrDNw/oaoKdKsYr+ILNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSayh/xO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSayh/xO"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592f098f7adso9277198e87.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743347; x=1762348147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpAhRZEcISe/L4obGO6K/aBf0H3CSDRAh1WJSbvQ7BI=;
        b=wSayh/xOnAy3dXi4ntAukqEAHjvP9ucW73ZNIZyHbw2cHQsLL1Szf+DGPNGYsn58u6
         J0lwB0G/6WXg8TK1O1xAu8Frak99gd/QnbDsG5k9aR5NWpMNTDbuTL7oxRWZPWpRSOFx
         xVvP+51Ubm/kNNqZYitAOZdba2XhAhmt56BKrWjh3RH4FNJICFR+nON5Pti46FzTT5X3
         V25xSseaffbJRROIyrMREOd1AAqVkx51lYyblWTF4trc7wR1xEMOfoXA5rLlso0sYxnx
         sgyo4EO5o2qzKCCrqcLaGoGl+Pw64TwIG1bOSVwYd4/QlwFZqZYmuo7DnuaZmUHhVtZr
         9GHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743347; x=1762348147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpAhRZEcISe/L4obGO6K/aBf0H3CSDRAh1WJSbvQ7BI=;
        b=n7L404aM09j2K/JfZQ4/GZ7jNKbaxt6IyCPvqogGXYxcXByL7uxD01W7q0+R7drM9Z
         j2/D8DWgPUZw2lQWj7B9+B1KfVCz/b+QwMn56CJgS9d45GeqZTpq2vV4FXNALZRok/mU
         kb8kcUAssZVsgjU51S46HQUIfgHrV2ZtUBfL7/+9ZokjVAplAYDY61nxEprDqqqufCIZ
         YCgM07NvEgMzG5o0HNUhuCfAI4wNGABCIW3XBsslbbQFcaBGiBLWNuF2dKZZrThO6q9J
         rVm14L1VFIFHWYXHjwJmJhnEvlOpsRfKdadwLXEFEb/cGo9AnJRfoHm/6aEd7IeQ6S83
         vrdA==
X-Forwarded-Encrypted: i=1; AJvYcCWG5xTGesW0AdVN3kMpliYp9xdxVXnK+wQdJByn3IpAPzDCgg+mAaFDR20tlA4zJXzH+/nCCqZ1qSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YqE6S1rOyYqrCqfHpJF6tJ2Mre0frYoMXxjDoZDjGFCPiwfH
	YtxPtKsTw5rqugDALrLuKsfcALeuhiHH5qUDx0fRFpFUQ1hiqy7cw0GSyD9MmnUvlTrGa0+oqzT
	oGRISmeCAMDt271EJ2niptN3B2Bh4KZVBECfXwm2Cgg==
X-Gm-Gg: ASbGncs2vBz16T9WIoHJ1RbCMAtDNsPoTBX2oQYYnfOf4JDd5DvOzxa6ANvuE4Mjjli
	21uxwmMP+u00QEx0djHNBENt3x2rjYChhnAr13uvea1GkSavYFP03xYf7V9fQssgSytmE+eEvwi
	iYsWaHm3RyPbei11x3ZLcFI8kUClCTlJFdtYUNBkMbp+qqofchKl7ERLiFyPD7NcTXeTbWIYgcn
	DEdJVH8UlRBAln7cKxf7i/EKc8UfzHF/ymHiHFvd2rJPVXPzSKZXPeuY0kJ
X-Google-Smtp-Source: AGHT+IHoNXhvs7nAEQT1Pr7YoG6bCNTomzDjqEik5GRK5GTNnbmdXX4kn01zdcQcoosBSkAxyYQ6vANHvlPp3vj1L2g=
X-Received: by 2002:a05:6512:3a8a:b0:592:f449:cbae with SMTP id
 2adb3069b0e04-594128617a3mr1173473e87.11.1761743347041; Wed, 29 Oct 2025
 06:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com> <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
In-Reply-To: <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:08:55 +0100
X-Gm-Features: AWmQ_bmctKf4r03BFEQZEB7--T8kdCIHNsOEFNutvbq6JrwVjRi4Ptn1KMtyXrQ
Message-ID: <CACRpkdaK52wY7MYhnqCqzOAFVu2V=NejDTjAAhkxhf9rmrV8iA@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 1:30=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On 28/10/2025 00:42, Linus Walleij wrote:
> > Hi Matti,
> >
> > thanks for your patch!
> >
> > On Mon, Oct 27, 2025 at 12:45=E2=80=AFPM Matti Vaittinen
> > <mazziesaccount@gmail.com> wrote:
> >
> >> +  rohm,clkout-open-drain:
> >> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "=
cmos".
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 1
> >
> > I think CMOS is the same as "push-pull" ( I could be wrong, but I think=
 I've
> > seen that before) so I would probably try to use the pin config standar=
d
> > names as strings here but I'm not sure.
> >
> > rohm,clkout-bias-open-drain;
> > rohm,clkout-bias-push-pull;
> >
> > Mutually exclusive.
> >
> > Or maybe use the pattern from rohm,pin-dvs0
> > with string enumerators?
> >
> > rohm,clkout-bias =3D "open-drain";
> > rohm,clkout-bias =3D "push-pull";
> >
>
> Hmm. I kind of agree with you. Still, the way it was done in this patch
> is used by the other existing ROHM PMICs (bd71815, bd71828, bd71879). I
> am kind of reluctant to support another way in the same driver - and I
> am also reluctant to change the existing bindings as that sounds a bit
> like asking for a nose-bleed :) (I've in the past worked with some
> devices which didn't update the device-trees when kernel was updated...)
>
> Do you think you could live with using this existing convention? :)

Yeah if there are precedents, either we can reuse that or we need to
change them all, and that invariably involves deprecation and re-implementi=
ng
the parsing in several drivers in that case, which is annoying and
takes time.

It's fine with me to keep like this.

Yours,
Linus Walleij
