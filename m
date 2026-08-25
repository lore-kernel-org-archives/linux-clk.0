Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518A3CD8B5;
	Tue, 25 Aug 2026 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693920; cv=none; b=ixpeLAWaf9jva8WruJH4Zicql7cp7vc0GN7AyYl5PxYyLeeT6xap9N7fwzVebqy/uM8FRvsCypTHc+nSpBjPT7x/DX7xQhGFzJ8espP4uZUO3rWeQBZSJyQaaMmnPPDpIdGVKXqO7w376EbpZwZXSXub5+ZobRxX1yS7DyUedeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693920; c=relaxed/simple;
	bh=x1SdoFZ3wO5dEb7RDLBkhD3sms0xDnlY98rsbgbulC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jMn6vXOzkT38LAflt4tpSRJD8rqs+OYu0wkL5dUSHizr4iox4ZwmIhz8Hdcff8IPgO5uuAJY6L4mxgOMewa5T2G59my93dbzQd1PBJNRiyBCEONLRkNLa3JgbOb6QZ5/t5pg16W/y1f4pd0Qai/+uOzZl9L5aZaj/S4Oq/Avf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxqpm7af; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxqpm7af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0631F00A3A;
	Tue, 25 Aug 2026 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693918;
	bh=v/63P4nAiP2NZNcJKQv7CfKfHeePcinJWy54FcxyvhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxqpm7af1zJ9HS8eWa8Xt6MJ9odSpbzoZk70yPbsa4WkObkXE9bYsSPuW0deyBRJw
	 mRocvK6Ny/RL5YdsebN0n4Zgr8FBjWqOsF6QMcmbFp1nw6KBHZc/5DcSiUJMFraNpO
	 cuw/R1cbVlEUTyKsJKBaUvCNoPjI5kK43JRiFh4zDlvzkGYy8a4wG3KPoKfC+oy0qq
	 J5PnUqRmkPfsOwIz0da2Wv0NlqjkQi1VN9UB1fFfuiW4Zi+pzTPsvS3CLpnoEeys6x
	 5DQUtzv70NhKa+csyFlvMW7hH70t5Gkue4nH3LSSRKwYle4ZhaemEthabX5BfgtD6I
	 W1tjLFfsGSOmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 09/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260826-zx29clk-v11-9-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-9-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:38:37 +0000
Message-Id: <20260825213838.3F0631F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Initialization of a struct field with a non-constant expression cau=
ses a build failure.
--

commit 1a225b76174b59d250ad8049b72f7978a9dca24b
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a new clock driver for the ZTE zx297520v3 SoC.
It supports the configuration of basic core devices, PLLs, the AHB bus,
timers, and the USB controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..504075590e6d2
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +static const struct zx_clock zx297520v3_top_clocks[] =3D {
[ ... ]
> +	/*
> +	 * "g" is either for "general" or "gigahertz". The VCO runs at 1 GHz. O=
utput clocks are 200,
> +	 * 100, 50, 25, ... MHz. It is used optionally by SDIO and QSPI and can=
 drive a GPIO clock
> +	 * output for RMII, so it doesn't seem very general.
> +	 */
> +	[ZX_CLK_GPLL]              =3D PLL("gpll", clk_main, 0, 0x110, 0),
> +
> +	/* osc26m division for clk_outX */
> +	[ZX_CLK_OSC26M_D2]         =3D FIXED_DIV("osc26m-d2", clk_main[0], 2),

[Severity: Low]
Will this result in a build failure? The C standard requires the initializer
for a static struct field to be a constant expression. Using the variable
clk_main[0], even though it is declared as const, might cause the compiler
to reject this non-constant expression during initialization.

[ ... ]
> +	[ZX_CLK_TIMER_T17_DIV]     =3D DIV("timer-t17-div", PARENT_ID(ZX_CLK_TI=
MER_T17_MUX),
> +					 0x124, 0, 4),
> +	[ZX_CLK_WDT_T18_DIV]       =3D DIV("wdt-t18-div", PARENT_ID(ZX_CLK_WDT_=
T18_MUX),
> +					 0x48, 8, 4),
> +	[ZX_CLK_USIM1_DIV]         =3D DIV("usim1-div", clk_unknown,
> +					 0x48, 12, 1),

[Severity: Low]
Similarly, will using the clk_unknown struct variable here trigger the same
compilation error because it is not a constant expression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D9
