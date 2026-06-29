Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D0423A6B
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747460; cv=none; b=tmQ6LJQOm/JfdD4HFiDc0FvQYbQToKExQXAaUBQN5+dyVYYNTRkT436RsD5NMBqPABlMY1QLGlW8hOMVfTAl9TyVUXa5mkHGG7e06aJJxH0zfRRlWjxDztWtm46E0pUGRO7gDMoSDrrATxtpmZgqppI91nmN2ZBm6CGTIu+71PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747460; c=relaxed/simple;
	bh=Ww+pHKZg74DUFG6ncydDQKKCwcpR6a+00OV8GPhy5PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCKFmDl9GlxVxG1f9+Q8PoH4cDM9QbgrPmVxyis7lXJXNOwvPP64dON9w7XI55g6XNcRpxqTlPce1PlKdbmcJlVqGvYKSBDag7YJUg1UQqrG1GBsP41gOHbiqDLO+F2gE+UKnPySZ2oxrryCJtFPI/xX0iQMx5/waA6q9z6GI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4bo1/NS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4bo1/NS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9BF1F00ADB
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782747459;
	bh=Ww+pHKZg74DUFG6ncydDQKKCwcpR6a+00OV8GPhy5PI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=S4bo1/NS6LVLt5l47pmDWhy7nNPQkUumHquEuongQIuqIhcd0m26CxdETJ9yztM0u
	 edKF4Fb5m9z8JVhHO1QocawGXc/p8+zXptZkHYSvAS3QWel/xYrIkY9wZUNSHBmawl
	 HvUH52/1UJhxSo2klJYMiEsw4rOpIre7iRfUuY7Kdd0T6JmLjkqa7p+X1WK40ChBVC
	 2MCgTsKC4QKW5rerwlBjtFrWvu638DkXbt08mgE6pC44LJv0Edrm/D2HHEA7bN9iMC
	 hdvZxly1QJepLYDgJ+JPWd9uNQ3ut+L1vqBsuYAdcMxsBqt05ZmyxzTQI+qet6//py
	 C6h1ToSdTwurg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b14cf91b9so5415911fa.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrrYA2v4Xi/eCAuIX4/4d3+UgtOajQjAwSkqVS7zhjb2UlTuoM2rwoTvdM8wgxF2IQkoeWcsZQ1P1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuishNqLYTFBCPGoko2JE5ln3PWi73wDQrN3NqljKNUXG8n64
	cJoey7XFqyW+1FtS6dZZW0/X/TuSDTBgvLbOpanE2hKE9Yw8rWtw5fyOypeyvtYYtDFlnWS1TOy
	xeUpwaSYQiALof06IuoXlPOmP5xBmocg=
X-Received: by 2002:a2e:bc20:0:b0:39b:14c5:968f with SMTP id
 38308e7fff4ca-39b14c59b59mr7009611fa.16.1782747457276; Mon, 29 Jun 2026
 08:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com> <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 29 Jun 2026 23:37:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64axqUmObk1XSEQSvGHSSvHP=T5gMOkfo8ae05Qb7HB5g@mail.gmail.com>
X-Gm-Features: AVVi8Ce8qbicWoJYXojluhV5Day0h0aZX_ul2VgZck3W_NUcJMBDtHnhi2_S0Y0
Message-ID: <CAGb2v64axqUmObk1XSEQSvGHSSvHP=T5gMOkfo8ae05Qb7HB5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: sunxi-ng: sun6i-rtc: clean up DT usage
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 8:42=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> With sun6i-rtc compatible devices, the "ext-osc32k" clock input
> is optional for the devices that support this input (r329 and onward).
>
> Probably preparing for older SoC support, the driver does something funny
> when parsing DT. It check if "ext-osc32k" is present in the clock-names a=
nd
> if it is not, it uses the first clock as "ext-osc32k". This clock will
> actually be the rtc bus clock so what the driver does is wrong.
>
> At the moment, the driver does not support the older SoCs that would have
> an external 32k clock provided on index #0 so just remove this quirk.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
