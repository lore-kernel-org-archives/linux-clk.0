Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273319E99E
	for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980916; cv=none; b=WftY+Bdv+EZoJ2BD4hak7C3MWhSKFfi3kVdfsTpcgPqX5NhY1QCJhZgDnVsZxD6NnJsdpqfyeiHeBoJ0RORrqeokN109/yjtMVTugUxlRvCewHSY7Xysmv6/CvgqRfv82kamTl2XpfX/dJ6VRtqGeipCYqEb4rD0y0uNMkShP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980916; c=relaxed/simple;
	bh=YThTPU6CplV9jQ/lbwTBbsFlbXptUEiqPtga0x9GyOA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KovlGArquY+qJOD6jszjAib1iS8G2HzsLYT/CG4D50GSZQ/nVFyJN82cVk0uCUTLYWa7QtTGjBIR0m0r0DYPhsoQEN+XtIM3dTGxASV13DaUH7GEgvXGsm6kfeUtRQXgi9LT/Z9HIwTMdxC4PmZQaDuGMf11IQGk5jwhJjTNgPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzdzfA1B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzdzfA1B"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso42077145e9.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742980912; x=1743585712; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XzvlZa0RLOwah5/5+7opK/gC/tUL1E7R/7woSm4zxAI=;
        b=MzdzfA1BvwtK2Jbr/mZ3u28LEjCsSdAHXk3UV1ZjsXlTWU+RFDd2M7DZyqOATsz3dr
         wq8MzCCufkLEJmEysy/XIJ1vGqYJfPpDY9dsdY795aML2aazT840KdjO/hggBKj0Q9qQ
         jQ//4cA6TJCkaQecg2J15qcNZ5B5pol3QiGk32ZxSv1FztkiVeqFTWLkTqSiBjWrmYzY
         abQmi7FHaEEiz7gN2vclBFfeQlHp4sqM4GU0YeXIjV8oweDMOHkbPGBTxyCjsF5MQWyL
         h1M6EDKk24jLIyc+qhqlfLoSnqzvtxtOp8GH+HNPuePR7Fq0hDJh/G20xa+hXKpHFbdq
         0fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980912; x=1743585712;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzvlZa0RLOwah5/5+7opK/gC/tUL1E7R/7woSm4zxAI=;
        b=VdllcUYQQvaRZRqalSouYhOlxZvlnuX1c5szwzwdA8XHkSQy76TwYQR+deNt4EOYUX
         AOpq4KR1gIkyxzMSEHoyX1zo0Lp+JZvtts3NxTuOOwVQnIrEsS6eQaB2fuxJvFadEiyW
         Ys2LxHXwj8neF/LBokcxVeBAktIX+BLWt30RDYtLpCT+3ib4bDOlnWs7kT78Tpg1xEDL
         rlBfwLmht5ltwXrntMHFSzIHgisceMndXkrohuo32AqCQNglUYeXX6KThYJedTSH27Pw
         5X8z9zc020pWPmwmAKl+EBV2ZDtD1o19O+DQIUbAFnYu4tLUrUfxYTDylFMzEzI0rd0P
         A1fw==
X-Forwarded-Encrypted: i=1; AJvYcCWiHtJ8ZXYfDradpYl/puMl6Du/SW7Pa/P3/cy3gR6wtKr/geApUlgd/pJrEdZ99tNvKgnOsE5H2fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyISJbdXGzVY0aV6lRQtpQl0QQkRv4fr4PW7DLOzmqJ74GYedFj
	ONZG3ZGelCiJNTXQ/cQBLwiye1iKAkV+GETHFuY+dOjgWtfkZI2/2mCB8+rcYSw=
X-Gm-Gg: ASbGncusiLH2BIwhHQmmOEsZpi6p27S11HLSCC1zuLNye9azprzGTxrqEySb/4yXjpT
	DDOu9DQt+mYpzdV2IMiQkLtT32H4IuWd/h9Aoynd0kkynsnjRSYBMAxbDM/law8BOhhPpnSB62f
	T3ixIuVC+m2zNzK8my/Ue/kb1tGtMfd5pQNZe1hxIMPDmCm5nbd39LrqBVVwbHCAAqhOBKErfTh
	1hpDj2B0RG7dT7xgw+s4oWvNEMePMLm8h0p0qvJdKmF7Q1BSIBe7mw/sI/g1kQiLXDjvtd+OF7K
	lOEKKc91cBP9+Ikh//oBVBQ1yxFtBAdf1C+x0TnwcXDr9/wqNA==
X-Google-Smtp-Source: AGHT+IH/DQkGwgvRuYj69u9dS3vyMOIDJgfTWifdh7zBGB7Ug/fqE/cY+y8J7X5UhPZzF5ii5sTYVw==
X-Received: by 2002:a05:6000:188f:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-3997f932ea8mr20348477f8f.44.1742980912202;
        Wed, 26 Mar 2025 02:21:52 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a50c1sm16436433f8f.38.2025.03.26.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:21:51 -0700 (PDT)
Message-ID: <4eb7800206faeb3bb729e28e7785595e196a12ca.camel@linaro.org>
Subject: Re: [PATCH 08/34] mfd: sec: fix open parenthesis alignment
 (of_property_read_bool)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:21:50 +0000
In-Reply-To: <e91b214f-3198-403a-be61-fcfe5645be61@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-8-d08943702707@linaro.org>
	 <e91b214f-3198-403a-be61-fcfe5645be61@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:06 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > As a preparation for adding support for Samsung's S2MPG10, which is
> > connected via SPEEDY / ACPM rather than I2C, we're going to split out
> > (move) all I2C-specific driver code into its own kernel module, and
> > create a (common) core transport-agnostic kernel module.
> >=20
> > That move of code would highlight some unexpected alignment which
> > checkpatch would complain about. To avoid that, address the error now,
> > before the split, to keep the amount of unrelated changes to a minimum
> > when actually doing the split.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/mfd/sec-core.c | 10 ++++++----
> > =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> > index 83693686567df61b5e09f7129dc6b01d69156ff3..b931f66f366571d93ce59c3=
01265fe1c9550b37d 100644
> > --- a/drivers/mfd/sec-core.c
> > +++ b/drivers/mfd/sec-core.c
> > @@ -276,10 +276,12 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
> > =C2=A0	if (!pd)
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > =C2=A0
> > -	pd->manual_poweroff =3D of_property_read_bool(dev->of_node,
> > -						"samsung,s2mps11-acokb-ground");
> > -	pd->disable_wrstbi =3D of_property_read_bool(dev->of_node,
> > -						"samsung,s2mps11-wrstbi-ground");
> > +	pd->manual_poweroff =3D
> > +		of_property_read_bool(dev->of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,s2mps11-acokb-ground");
>=20
> I don't think this code more readable. The continued line should be
> re-aligned.

Agree, but I've tried to stay below 80 columns. I'll just move the string t=
o
the right in the next version so it is aligned with the '(' (but becomes a
longer line).

Cheers,
Andre'

