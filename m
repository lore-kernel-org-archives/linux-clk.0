Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267280;
	b=jP8SVEhierJQ6ZKj3AOdkgWhagD0TUKG/OMnD9cSw7G9h+7l8u8lTbpq5iZmuNwReiME
	 6KfYvKH3dP9yZo2MjKj68yHa8fAxVK6F9QNdDUx9rIC5U8VFuuhGM78crNdJ0pA52mqAs
	 Iv4s8ByGNHw2EuWyHFniRIBhJjrZfGwBs6RQ+gb3TbAAZtkZYC+cUUa2qyAlAJ03vTrB1
	 B6WubJjvm9o2qbfYGxj6aZV+sRAZVY/WOChnCx2kG2mXqucfsXYLIlPm3usYXjUWbg6n3
	 UdiN7r5B7OQaa4x3WVErt7Jf5loSur6LjWVpjbCwsVGsE9shmdHBTD1Fykr0TcqRD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267280;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UjLjVXM6U5fVosWAJcB4A6hS+HhndwNJfoGvMMyXioY=;
	b=UucsARPWRrqvVm1J/R/AimOugfqbBMBc3mx5KPqcltrqwXCYOfR1rifzzH9LLXSXlMNk
	 OjP5HCoE3X9FcFrJjDaUaYIwXZCrpQuu5+/DLLkZBC5kKx+GFH3s9ENq7C9vqkYS0w4Wq
	 j7pRGt4TN6a11dY3JplMGpTTiWmw+Bb3w9kCMygmtOlqjWa/vO2A0AbKUUu8HReseM3pj
	 xu94/Z1QZnyT8CXWRpYyBKTIYEz7g4hoMRN85X/bVR7ICXBqqwU8UQ45BOrh+8+V+qEWe
	 p2w8skUYIfZWR8GgFhvlfVR80WSyI008Ygh8Aidn3IdfVdd6vLfeZEyxQzMuCADaqyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4O0z+w0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09576606A32A;
	Sat, 21 Nov 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4O0z+w0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5800F1F000C0;
	Sat, 21 Nov 2026 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267279;
	bh=UjLjVXM6U5fVosWAJcB4A6hS+HhndwNJfoGvMMyXioY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4O0z+w0qmwbUSlx7Cu4XTwG4DQFS33Esawwn0bDGUi6Sr/NHV4QI397gPULp05ZE
	 raVpn6WPnsdu8i+uSpBGXxU6rQHRosVdiXCfXzoO7PY9sQipWUTLHao1BTxfhnsZDW
	 Y/WCr7xQNqNSzj0b+Xe7x378/s1RgdVsKkj44Uku+O8WwPzXkAR+77Cn3fyWB47FGP
	 UsPEsnthV00lnuMZABfyHos2Q00cQUdBIbrUIBrR1eQ/nOQRmjwetf9el665ej3S2a
	 XPnztINRj1HlYfPeK+b3wbBeujaWjxWiVI+0kGG8OTNGOhaxk09/KedB8ReEEh/Ne3
	 KF3ltGHN+GoxA==
Message-ID: <sashiko-outbox-227063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] clk: gpio: Add driver for GPIO-signalled clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-feature-clock-guard-v10-2-5d449739bb8c@bruker.com>
References: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
 <20261121-feature-clock-guard-v10-2-5d449739bb8c@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:21:18 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] clk: gpio: pass pointer to clk_gpio_enabled_ops in
  CLK_HW_INIT_PARENTS_DATA()
--

commit 89b7f5ec0fd3e779dce65c804661263ec21d8ca2
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

clk: gpio: Add driver for GPIO-signalled clocks

This commit adds a "gpio-enabled-clock" driver for clocks controlled by
external hardware whose running status is reported through a GPIO line.

> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index df0856a39c8d2..33f251b209a01 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c

[ ... ]

> @@ -241,6 +242,112 @@ static struct platform_driver gpio_clk_driver =3D {
>  };
>  builtin_platform_driver(gpio_clk_driver);
> =20

[ ... ]

> +static const struct clk_ops clk_gpio_enabled_ops =3D {
> +	.prepare =3D	clk_gpio_enabled_prepare,
> +	.is_prepared =3D	clk_gpio_enabled_is_prepared,
> +};
> +
> +static int gpio_enabled_clk_driver_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	clk->hw.init =3D CLK_HW_INIT_PARENTS_DATA(clk_name, gpio_parent_data,
> +						clk_gpio_enabled_ops, CLK_SET_RATE_PARENT);

[Severity: High]
Should this pass &clk_gpio_enabled_ops instead of clk_gpio_enabled_ops?
CLK_HW_INIT_PARENTS_DATA() initializes struct clk_init_data.ops (const
struct clk_ops *), so passing the struct by value fails to compile.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-feature-cl=
ock-guard-v10-0-5d449739bb8c@bruker.com?part=3D2
