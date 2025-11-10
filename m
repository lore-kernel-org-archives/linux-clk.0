Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E52FF172
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815868; cv=none; b=jfAXvigM/NNT3JSFf9nDbwmLcUVF6+bQ2JIYk9EqYeO2QF1U3zcJq4CczeJw0UZYMrfJkbQg+pVlJOJ48jB7ArnT/Bm+TR3NtIaMYZrExShxqO+deGEeQp4pb5QtlPxKPKZU4EGy7mYp8nhFg72sE7knDc5ZpWDKsDq6nBWc95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815868; c=relaxed/simple;
	bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrDdyDmCiLNHF+EXMNOc3pwYLm7Pb+3iREKJz/vnTwvgTHvZf4ETomSPWiyRD1B+EOjEEvvndgcaAuBUriI5xbR52Z4BBxkn7srGyL1vXL3PcgWntTzxGC+vu/TDHmBHC2iFfS0YPX2xlBtkqlkIMiL69lO+HNfNQ2G+KVmircQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhQ1D1Km; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhQ1D1Km"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7869deffb47so35045877b3.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815864; x=1763420664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=UhQ1D1KmPSyna4F/76ZCUiG8KhIv95nF4dhc49qrIM3p2GzZR8fl4PtKw6Yk5uaenr
         Jxo6B1MPDizlQu/eAzhlHvAjPysa3NgZUqffrBat8sUZCey95AmWJHKnSMiP9zRpfVwn
         yDf7hD9zPMNJY5K/TDMfIBp874x/FBBHi88+dxfp8g2/um8X8UHQj372t+OGfbo82eR1
         O1hbOAThw5oCk4Sy/TkWbTHXa+HDjeRny+D/HCyIsPlxXxKrnhIkL79zMZOuophqGxN7
         HEm1Hqzly5dxGv5sdqIOUUxBQAtVaiVswEfsuQw5gUpO4MhmxEB5Nma4Cgn7+HcHKITN
         65kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815864; x=1763420664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=udmWsa5RCR1BSilmecYhvLWZoxPACExhbAjMvMkB8LbhCi5bdF/fVTc0umAbZK3GSH
         h1aJDS7i2Csc2Oj1paoA5cNcgmbZ8ArpGDCTCXE7EFQm/dZ/+sfaRpaa9CD66T54uQCt
         uXka4NQxjnq2VRR6Qeb2IrF0uVw++h/RDIrFXtGI0BMx3Wz/33hP7tkfwJHT5Vv/05pl
         3axjHvjQ/9AEUloTBBGcFydIAwvqk728ff6IIglK5EfyUFNnP0SPxN9769aUUR/NXCZP
         vanHlS9ufglWGb3pO7fjHg7UgUnICozY4YHQgqEoJA8lwMoBRCfead5/KIP2bts+QXua
         813w==
X-Forwarded-Encrypted: i=1; AJvYcCVmfa0Ut00FsYXQmNjVUH/M08dkgdyhvBqgB3nlQCDLQLHFVRgovxu6CNMbkdZRxfkcqp66S6GSVEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAA/tQXOBvd5HwBU31Jt3isi5JcN7iZKRAhLSlTiNCdXckDDte
	cdSQRU+40qVJfO9f8pSPFgAINQ4gwZC0kY6bUb+7EYWykcIRqD3qxHcJ1ezuSv9ew8TFbv0BH+z
	0/SXenV/cnEJm/I9rv2Sq6sd3TmfItH57nqqTAqa4QQ==
X-Gm-Gg: ASbGnctSLagIjJP7rpsV12Gw+9V7YqTAnK0D9ld3jrWKD0eF0Rw0egBos04C+R01tFe
	pEyUjeBC7lXZcUfr4rfYGV9WyalviG+gMojRpoGKXgZlpNSszpqh72KViuxmMuTIpxOxhEkw0y4
	0I9QaLV8/K5ob5ZO9jTSfLNh4bx38Z0t0q0jpVcFR+9yM4sRcleZT0AMIObohjFZA63UgJHBWE0
	dSRT2sm0bXGylqIlAOxNdJAfVa4mzUMNl/WEc9LbjC9t9piuMGB1GW4eAIdvu0GIDFy6eU=
X-Google-Smtp-Source: AGHT+IHoC/R8TGWkSsRmVYTrTznpjr4STw1JDCmsU2sbR9qoad5PnTy6Rrlwiey4S9ikwN3xlZNQtXBlBuI95lMoqZY=
X-Received: by 2002:a05:690c:6385:b0:786:4fd5:e5cb with SMTP id
 00721157ae682-787d541b7f3mr90568307b3.35.1762815864323; Mon, 10 Nov 2025
 15:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762327887.git.mazziesaccount@gmail.com> <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
In-Reply-To: <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:04:09 +0100
X-Gm-Features: AWmQ_blNtjThswk7W8THjiE7tdsgu2zFtwGMw_ARgVxMcfWy78tjHu1U0YBhMO0
Message-ID: <CACRpkdbP-GZXtj_-AuZ=q8zUKwt0qWQ1L6v7WsoQ50JwTs6JUA@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: battery: Clarify trickle-charge
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:36=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The term 'trickle-charging' is used to describe a very slow charging
> phase, where electrons "trickle-in" the battery.
>
> There are two different use-cases for this type of charging. At least
> some Li-Ion batteries can benefit from very slow, constant current,
> pre-pre phase 'trickle-charging', if a battery is very empty.
>
> Some other batteries use top-off phase 'trickle-charging', which is
> different from the above case.
>
> The battery bindings use the term 'trickle-charge' without specifying
> which of the use-cases properties are addressing. This has already
> caused some confusion.
>
> Clarify that the 'trickle-charge-current-microamp' refers to the first
> one, the "pre-pre" -charging use-case.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
