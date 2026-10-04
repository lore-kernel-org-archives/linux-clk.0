Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DB46F48D;
	Sun,  4 Oct 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147353; cv=none; b=NI8Uv/BdiAFZ3s6+AdUbzpSvQ1mjOQwAwS1DkCld37GFCi+HwD04wiirWbCe9fM+7YDtZgycjgHUVmzC1lZnlgaEPZScX6s4yiVM7JaWZOfbPfxrzIU9mznrDDlJ9qRyCS1hufjtYcbzqPZ2+rxWTYbmKHI+EBxKdWAoHsj0rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147353; c=relaxed/simple;
	bh=w+ooKPjJFs3FKWTvNKh+T0LT4FiF4kxXywiRU6eIvSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nB4h+bs7OL+5Ud4a/svaD0FxejWYODdKE6ZwS9fv7FeQF4M4ciLTI9Rut9QVJ/sKWOhNURhREkdXdViMq/aoLSMnH/n6GDweCzGcywT+QfUhgWqeaLmXUajx8U71lfpV+IJma9mrzVCAShiyLLEuWluc+DNKgJPuIF/bqZ7UhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIHkPpT2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIHkPpT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6279C1F000FF;
	Sun,  4 Oct 2026 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791147351;
	bh=B8LUWvu6s4SdaafqHqjXFhN13k8QixcOmifvNTK5f3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LIHkPpT2bDHUJQ+BYMJNMIvFFoXlQWfyr/TsoueF0LfQry2gJmtDyNts2PVQWrZKY
	 W8QZKXnQT7lfFPjjb7g3Lawmw4amIatnI4SPTQsbMv8m5ddKtl6ril70J22ajHvYtQ
	 dJfc5mkV1X761d7KHrJ7DU5liyt/ECKL8ZAGJgdiZMFaWNJw3tfMS67GX1TQ9lbAUB
	 4k5qnxZKo7Y7VgcrMMSFYTDG4Q/bAj37QfYtDdH9537t4DrqZP9FPkMp24+d6Yukah
	 WG/8zVP2D0LNtDVkY8ta9K2I0cx8ihW/weiprrRw+VeNROjt7icBKOhz3GD/1m66Lm
	 DC/hIc8ApCqpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 20:55:50 +0000
Message-Id: <20261004205551.6279C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: nuvoton: ma35d1: Modification of global static state during pr=
obe
--

commit ee5a5a1eb9fdc7516949d10347d8380f083a7848
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Reparent SYSPLL correctly

This commit reparents SYSPLL under HXT_GATE to properly define the clock tr=
ee
topology. It also reuses a devm_ helper for fixed clocks to make them
device managed.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 2e6e1c65d01e5..6763f0fddc944 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -73,6 +73,8 @@ static const struct clk_parent_data lxtg_parent_data[] =
=3D {
>  	{ .fw_name =3D "lxt", .name =3D "lxt" },
>  };
> =20
> +static struct clk_parent_data syspll_parent_data[1] =3D {};
> +
>  /* Mux parent selection, by index into the controller's clock table */
>  static const int ca35clk_parent_idx[] =3D { HXT_GATE, CAPLL, DDRPLL };

[ ... ]

> @@ -275,22 +283,26 @@ static int ma35d1_clocks_probe(struct platform_devi=
ce *pdev)

[ ... ]

>  	hws[CAPLL] =3D ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
>  					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
> -	hws[SYSPLL] =3D ma35d1_clk_fixed("syspll", 180000000);
> +	syspll_parent_data[0].hw =3D hws[HXT_GATE];
> +	hws[SYSPLL] =3D ma35d1_clk_fixed_parent_data(dev, "syspll", 180000000, =
syspll_parent_data);

[Severity: Low]
Is it safe to modify this global static array in the probe function?

In drivers/clk/nuvoton/clk-ma35d1.c, syspll_parent_data is declared as a
global static array and then modified here in ma35d1_clocks_probe() by
assigning it an instance-specific dynamically allocated hardware pointer.

Since the clock framework copies clk_parent_data during registration, could
syspll_parent_data be safely declared as a local stack variable inside
ma35d1_clocks_probe() to avoid modifying global state?

Modifying global state here violates device model isolation principles, whi=
ch
could lead to data races or dangling pointers if multiple driver instances
were to exist.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-perso-ma35=
d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com?part=3D5
