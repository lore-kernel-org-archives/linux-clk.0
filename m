Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF02F1FD8
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255931; cv=none; b=A4uxgi7mgFAOGdbpz3/qHpTHGa2GKLUVSqwQDTd+oE8DXZBtwn/CcyONfcYjfPu8lWaSuQs6rk2jS3zpvQvYduYZXCm9FjnI/vCajMVA+02ZKSvjdafk+oKzpKCb6QC8yCj/vn02YabxGgyd1RaYEL2kB7YUsFSXgs0v2x4VBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255931; c=relaxed/simple;
	bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJZ8dtl+GiJwfv6955ZcttpKAAaOPLMqkieg3M5+dX91NWty8EAHHdKRT/HSslD43+IdIKxQGFw7B5qlHjbYnQhNnAZzW8SYPPRwweHYcxV1kjVEKXvGrvenninNGsDmXAq+np45TS7QpdKDA2BScXeLhuCUD+E3ZL1ffXajCuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsAOHhhN; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsAOHhhN"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-555024588b1so2664527e87.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255927; x=1752860727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
        b=DsAOHhhNfQWrOBSodqloZZkx+mrGk42CQf1xlp4MCnECgkYK/bzxIWTsy1ZoqqRJAd
         4d5vdX1r5W6NkUrDoHlXlvHhi8jfwjzikBLRB8PrA1w6yNdU3yQYktvWe+hAcJ5yOc7e
         Oqei/L5WS4binn/957lvfGqiXlxj5gcJ1rHUEcL7UPQ5XgqfcTAO5dqiwFGpweopO8oW
         3r1UTY4kV7vwGqhZkw9BqMgBn0Kn3raaNvLT2xY5n6kM+Q6k6KGqdrJcEbtDMwdC8dbi
         j6us6x0LP7vM6nIDXKLtpFLAQSdN9Jy5pFNsR/ULb8lZxkL5+rLQRyXOLcnj1UdGfhW2
         kRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255927; x=1752860727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
        b=J9ISd/Sk6Fb+m18Sy4lQLXcjs8qR2raryZzjgdxvMCQXnGEqGeHWIBSvopmEy+qzIF
         dF4j2PkIGfymtGT5rYMhbuPb+y7OL9odj4KJM/7njBFG4u5N43KWjJHeuwFUTWNH4lCH
         tIzl2PJsBRcBwm3uCdbfBDGwysQJasXb98Aa5yMDBqiCU9/sq+PvQxwVAd68NMYUQ58N
         n3oikXhQ4mQNVNLMqsvrTq9F113O5CoSrJtbu/w15Wg7+7/hU+jE4foRoTAVj/FnRjpZ
         +VI55+osAkY+DLkm3tqn1zYD1xsxfiYpmBiQ6cy9cs5Z/n6B54YJRecJFzan8hcY8O1P
         +cUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4tud43p6D4pXU1Y0jHVQ8ufB1Q8ot8+zl2ZBTJACDUf7vcdjs+KBKNEz5wZiJI6vayJh7rnH89Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyg/lgSZb8Bm63viezmc8DF4J0Fy8fzYiw3QpKOYM56X7T8n3O
	Gio726eroakRbtRIbydXrCBU9AfeXcPqT+5BPBvgNRcn9WVSeIqgEn97Zos1AmVpNcdtq6WU2fF
	5UyQV0VY0R0JWxOSlfCBaVTn6DJuPYpRmzMh9jse71A==
X-Gm-Gg: ASbGncvN8QvIhkAhMFC2Nrr61tHfGKkxgdQFUpvmMBmkaCP5hnnAxDEKN6h7U5MTryB
	iSa0kor9XiL1XyLnDSG411bofJ+pIGuwZqRXbbeUo0jYratm+Gn9MGe46fRZGcF78tUcxdGCRAS
	75vrV+8igTFdylFSu4Im9WVGBNz7QGJRCaGceMGq0pN6eVuCxJ55l7TSbCqDiTK0UP2soSsN1wH
	CNo1WJw/wLK9w3p4w==
X-Google-Smtp-Source: AGHT+IFZDCZTlE6gWaEB19mO+GckYjvcVz7Jadiih65ETG/CCRys4RjtiQYLjKpiBNN+Zotnz3hQQ0D3S79xjWv4t0M=
X-Received: by 2002:a05:6512:32d1:b0:553:24b7:2f6f with SMTP id
 2adb3069b0e04-55a0464f653mr1135322e87.51.1752255927288; Fri, 11 Jul 2025
 10:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com> <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:45:16 +0200
X-Gm-Features: Ac12FXxij1ZPhhWO-gI9e94mzHRwj1K4FxFxtD7flD8pQuiwVzPSrPB2LvZpGlg
Message-ID: <CACRpkdbpXPXFgRTyAG2MeZvDp7wj32yQO6eRRMp4rQ3sCbQ+Sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 1:42=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
