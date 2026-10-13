Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881D5187F3
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908429; cv=none; b=cVXFsTkRiOxEIZDjoBOBKP0vDVr2X6AJlELnARhVhTCpqF0CJ5fKJdsEpJpOifEMDkXyxlBJ+5OAHJlrCVzQUiWw063EeQTJ2L2+yNYE6mOyr0yIQ9tdFa0qOtjGukD1n8aSYinzBj5GSE7CJTydx7i51Vy8VL1NFi/LD1TYgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908429; c=relaxed/simple;
	bh=FplcN07gGqeQHbr39XaXc3ImzeregaqyqBt2gdCvTJo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nUYQEiiGVabd9U/Hzyqcc9lE4Z9Wb7eH6uAJYwxVTTVGHktyXBjsCGEiuhepQxJU8FNqGtba9mW5MlDJsf1ty0Guk6rGKyxf+ANXM77C4wS92KWdrJJ3/5vVdeK6QoDNo+146XJ/VARKngEFyAMS5AGyM2iVHFUlotx6K/eJEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vxi1HOYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vxi1HOYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDA91F000FF;
	Tue, 13 Oct 2026 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908428;
	bh=dnQOt8GB9S6P8mBWxjTzc7sN7ooYt/9HrAQXeH5ctbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vxi1HOYdFIOefDZJFmESp363zSSHIBWV+zi/NuNv5FxozxRyUoFVWFnZ/fptx/RFu
	 Cl2AOuK6UNx8YctgnqkSk2ZKtOR75uhZrb04tQEHSfoEA80N4AgVjEFHNy4nq11ybR
	 HncDv4ty+gktMHfryyvbPXsBsmtl/eXpywZah0AaKVxYt+8GYtAxv4kKX4EUtjQOwD
	 15B/+RS+X3TgYVf+WHhGqU3JHpWIqh683VSZQWc6MhfuytGOI3Lct3bAI7wnEGFYPR
	 Wc+Ib6GTXVrUv0yfV9VdT1MJ9bUFbQX+A9zsCaFNb7I7mljH2o0APIVbD3gJ9/JqkD
	 5Rd0+mkV49CZQ==
Message-ID: <sashiko-outbox-170104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/35] clk: mediatek: mt2712-apmixedsys: Switch to
 common probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-18-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-18-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:20:27 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: mediatek: missing shared_io flag causes redundant exclusive=
 syscon mapping
--

commit c93284125c00a17383c7e9f49de6dd50d3cdc4e9
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers

This patch updates the MT2712 apmixedsys driver to use the common
mtk_clk_simple_probe() and mtk_clk_simple_remove() helpers. It removes the
custom probe and remove callbacks that previously handled PLL registration
and unregistration.

> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt2712-apmixedsys.c
> --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c

[ ... ]

> +static const struct mtk_clk_desc apmixed_desc =3D {
> +	.plls =3D plls,
> +	.num_plls =3D ARRAY_SIZE(plls),
> +};

[Severity: Medium]
Does this descriptor need the .shared_io =3D true flag?

By omitting .shared_io =3D true here, it looks like mtk_clk_simple_probe()
will automatically call devm_platform_ioremap_resource(). This requests
the memory region exclusively, which seems to conflict with the shared
nature of a syscon hardware region.

Additionally, the resulting base pointer from mtk_clk_simple_probe()
doesn't appear to be passed to mtk_clk_register_plls(), which internally
maps the exact same region again using of_iomap().

Could this lead to an unused, redundant ioremap mapping and an improper
request_mem_region() on the syscon?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D17
