Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C8486E4D
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355491; cv=none; b=h8aR7qcozGsv9UrTXoRkOgJ/ReISeFdEKYmWX2SEmr2VftCOmgDkRjCo5as5/HeKU7hGLcf5YZP8cvUeJkBIxTbx2i1Uw9tj/JmQ9AIYib/dXUJaxjM64WzwWwDITTIjKPGMdQjpZtV9PFjy7aM2SPkWjw9gvVEOR4tcVXN9yVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355491; c=relaxed/simple;
	bh=p4cqvaDK+7g1t1n8Daz9GFsd0RQrOw2NEQEp4FqFxQU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfsisYcGDJIeZSVHZi+Wui4bYSW+OieEhhY6eArZfbym0HRC98CmQ2+qKOi65ZGkVxNJM0YsvNaFiwaqC0incLa266V97dvPL2IIPXOpchK0wLBKcecQPbOXifWifAB26sxmN/M5m0PH9yIZzMDkGR7BKADRCrLfJjsiqb3/tCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmgjSWMA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmgjSWMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCD71F00A3A
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788355489;
	bh=p4cqvaDK+7g1t1n8Daz9GFsd0RQrOw2NEQEp4FqFxQU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nmgjSWMAIlKtQp9EfRwaUJqKsnuj3KrITOVqz0dEvr0RNOzXj1rZdWaX6oMXZruAY
	 NS8+U5ENG+rbq38HnCpOvaX9YYDLcqpogNuK4ZQgab9fgCB86IaqxBQcgVQbHaSKEc
	 V1wRLVYNnHNDM17nmKtgIiJ1Qj+CFMHUtvq0ZThgO3wc3Q2tUajvj8nXKmEH5Gj+0G
	 4XMqkgexyRYUrB5EghLx9yGHfMtagn09buJEn3Z3FwkxK8pmBOWwMuPDWs3Un3v2Yd
	 TmS4Q44ukoEeNjs0rm7oCi+tNVp0JRJBftXkQEFm13VKF+haXrFppBdKbBacpDjmlm
	 Dbz7cJmaMfJKQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1981228f8so9763641fa.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 06:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwv9I2q7Xrwv0FM1qZ9fVH7vqAPa/qTEFjPa9IBzRHm/FJWc/WktPhahtwFNFW50EaWgwnDT2eIwGo=@vger.kernel.org
X-Gm-Message-State: AFuF++nUi0BJ3wU6uLDbF17LjVNpH2gExPrv/eEl8TelOXaYG2Hvhcsh
	yPT0TC2vL74H/cd2pn+YBm12MXn6Yc9hjnsdPBJRAXNSiE7lGnjBK2BsEeay0bsPyNDdiiSuAX1
	kMS0jqDaUKNclb6b9+DovYShjZH766+IgM5rWJQAU6g==
X-Received: by 2002:a05:651c:a211:20b0:3a3:2a41:c0c4 with SMTP id
 38308e7fff4ca-3a34ffdf928mr8237171fa.14.1788355486730; Wed, 02 Sep 2026
 06:24:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 06:24:45 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 06:24:45 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <d48b55173c74410389ca5c863220370e38e4fc49.1788346553.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788346553.git.mazziesaccount@gmail.com> <d48b55173c74410389ca5c863220370e38e4fc49.1788346553.git.mazziesaccount@gmail.com>
Date: Wed, 2 Sep 2026 06:24:45 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfBxYGZK1NRefb8MDhgouxkn1G5Qp18OjbWnKvaspTNFA@mail.gmail.com>
X-Gm-Features: AcwNN1W18o5pkYxzSwFuL_cj4YP-roXYm9ppEat9QNbwOir598GlWvNoB-rXZmY
Message-ID: <CAMRc=MfBxYGZK1NRefb8MDhgouxkn1G5Qp18OjbWnKvaspTNFA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] mfd: Support for ROHM BD73800 PMIC core
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2026 13:04:55 +0200, Matti Vaittinen
<matti.vaittinen@linux.dev> said:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The BD73800 integrates regulators, ADC (intended for accumulating current /
> voltage / power values), a real-time clock (RTC), clock gate and GPIOs.
>
> Add core support for ROHM BD73800 Power Management IC.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Lee Jones <lee@kernel.org>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
