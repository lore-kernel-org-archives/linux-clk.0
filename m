Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F704207A;
	Mon,  6 Jan 2025 23:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736206954; cv=none; b=MYo8xT2Y8tXDHtTxpOpwVfce6uSoddav7FaOeq6bSQhWSunUHuK5z1epaJ/Pw7YBIjy23xxJgyd/F2IqRqxiOdXNeZpf1IVek5Y8KX47N8dZ8bjHLFlxH9vBRXBQvkQy6fSiTitXN0LzfoFPhSALBoOA/kQebSEgfTmamo8Mzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736206954; c=relaxed/simple;
	bh=DOqxILEWmmCF86kx1hJGPmjd25X8GCewIcvcilYqiEo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=sdEX9X5kCg9X1ELsYdQ3vPb1vfUR3VzIolcwZrEPX2FFtNzpcyiePyWytp/PsaW5/fFCtvQDAsCMhATOLDYVglC4YN3Mr+uqFGFI/29S6COfvIPStZ6BAbRyoMLfEmKGq6ZI6Q8fm6PgmY40mNsrQv2ktQBkgE3/iwmzmmUb0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3zWZtQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3zWZtQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A973DC4CED2;
	Mon,  6 Jan 2025 23:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736206953;
	bh=DOqxILEWmmCF86kx1hJGPmjd25X8GCewIcvcilYqiEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X3zWZtQpFCvGayya/T/LlBjjNyonXpRqqAon9pWDnMvGmFwtcvlL+84VTlXBkiT+G
	 ggIIE+WwOTBE+dhAry50izm29XUS3jyXPX134y0MY57BNjq4tR0LcjG01KESS41cQ3
	 usd/tCiCPKEuWboRyiMPyTPhTpxkHKB8R8Rqd2sxRjMY0yJO/kIHy2OfOfGXtv0KHX
	 RenO1N6JV5Rn+YkPi7vJNotdqdmasqdvPJEjR/RpQaVy9NglpPauAnWWmFenkofJux
	 z95Dt7bgr40uXWUeP7ZdQcNKQXzGsCIsN2PLvcqOFgUEzQmHJZ2mT4ygviIpxbBxO3
	 HRNh8Muc7ouFA==
Message-ID: <104eed995f349b123e633862f68de966.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250106-imx8m-clk-v2-6-6aaeadac65fe@pengutronix.de>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de> <20250106-imx8m-clk-v2-6-6aaeadac65fe@pengutronix.de>
Subject: Re: [PATCH v2 6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abelvesa@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Mon, 06 Jan 2025 15:42:31 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Ahmad Fatoum (2025-01-06 06:21:47)
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a356f293621b371b9ef9b9bec90a4..3b06990b73adcb2e4807f91a8=
983ad35068572a7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -405,6 +406,145 @@ static const char * const imx8mp_clkout_sels[] =3D =
{"audio_pll1_out", "audio_pll2_
>  static struct clk_hw **hws;
>  static struct clk_hw_onecell_data *clk_hw_data;
> =20
> +struct imx8mp_clock_constraints {
> +       int clkid;

Is it signed instead of unsigned because the terminal element of the
array has -1 as a clkid? And because clkid 0 is a valid one?

> +       u32 maxrate;
> +};
> +
> +/*
> + * Below tables are taken from IMX8MPCEC Rev. 2.1, 07/2023
> + * Table 13. Maximum frequency of modules.
> + * Probable typos fixed are marked with a comment.
> + */
> +static const struct imx8mp_clock_constraints imx8mp_clock_common_constra=
ints[] =3D {
[...]
> +       { IMX8MP_CLK_MEDIA_LDB,            595 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE, 200 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_ECSPI3,                80 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_PDM,                  200 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_SAI7,                  66666667 }, /* Datasheet clai=
ms 66MHz */
> +       { IMX8MP_CLK_MAIN_AXI,             400 * HZ_PER_MHZ },
> +       { /* sentinel */ },

See nitpick below.

> +};
> +
> +static const struct imx8mp_clock_constraints imx8mp_clock_nominal_constr=
aints[] =3D {
[...]
> +       { IMX8MP_CLK_MEDIA_CAM1_PIX,    400 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_VPU_VC8000E,       400 * HZ_PER_MHZ }, /* Datasheet =
claims 500MHz */
> +       { IMX8MP_CLK_DRAM_CORE,         800 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_GIC,               400 * HZ_PER_MHZ },
> +       { /* sentinel */ },

See nitpick below.

> +};
> +
> +static const struct imx8mp_clock_constraints imx8mp_clock_overdrive_cons=
traints[] =3D {
[...]
> +       { IMX8MP_CLK_VPU_VC8000E,        500 * HZ_PER_MHZ }, /* Datasheet=
 claims 400MHz */
> +       { IMX8MP_CLK_DRAM_CORE,         1000 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_GIC,                500 * HZ_PER_MHZ },
> +       { /* sentinel */ },

Please remove the comma because nothing can come after this and if
someone were to add something after they would get a compilation error.
