Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960721;
	b=rSNUgDzec0BHNpD4KvlCIqywdNcJze4VNYbtJvNdnTO1T3G3/XQxUcV/Ks70O5vosswX
	 E9LJAit+kc0GtXpW1op9PM60/zjMb50LzMSWpIaOtBq/mXf+fLbW+D2cV+UbW9s3epPFi
	 G8Az8Nuu7e4cD0PJPbkMR4UqXU4u6yoYNdQxSWaY6LAL7pKN/+80qd2Q5mztXSPuKHXQA
	 jt6khpz4C6LiedilHC+Lf6NSrfIZCYFsgAm+DcFzzAVSnT8W6tSis4ZGlaqaLKvvXs2nf
	 yPoZgthdwzsxy9km6hkNlketnDM3gRLd6aa6UhlqgnlhC8rKDJ3pWQ2AWKHauUYdTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lXoBFpH05wl+DU/OIxv7PpdFuT7gEFSRqiFhWeDB/xo=;
	b=2wA1AJNCRVsIKc544SGUt0PwJaW7NEx5A/iy5UgxUbkZN6BorT905Mxz9FR9ZQ/3pgSC
	 vJ5FcSNDawESEjS67ELlgsUsJdUzlq/LhqYfbiaNm5kwhj3kYnp+RgDhynFsqX8Da6CTg
	 Qk7OSMzZYrotnpFuwGpPaxJCvsAlM7alzBszUYwVcY2Xsxb0Txc+mPEHV+moF0NoY0NdE
	 bWRsy9S9mELvibAg6/+AIFy+6p5d3ZjEQwxQuQDpN/Eiihj0EnEwmsmiPBIXH0kUN8F0F
	 eJyPIjPBIdyjJkG3fRfdSOJ+U/7cbYz/i8WEZJcMGZDY3vNlRA/KRo+IXhoWJ83JoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUz2LLs6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE0F606A326
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUz2LLs6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8FB1F0089F;
	Fri,  6 Nov 2026 10:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960721;
	bh=lXoBFpH05wl+DU/OIxv7PpdFuT7gEFSRqiFhWeDB/xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZUz2LLs6iN84eNW61fUInUgVh+EMVrJ9/jQ0VIeMehhqZpzeCy3SizWHqIRI61fvn
	 aKjY2+pS8pnVMG0SwhLd4A15fElvUjDlZOm9NJX3HYXN+G49Z72oSeTnFdFwP7WxEd
	 xdLyd3GUJeWG9WUzHJtAOBShkba6cXbwBP96JU2n2DzAKIzBT1mR2xLfIleZd8pFmM
	 9rpkR4ZIk6F9cN1vSb42OmoeLJcJ/ZwncJeI4UKjT4UPNX17W8zspfLQ+Do4Cw3wYk
	 K2EIdGjAfYHHL62FoyeUO0/AkPmcI9jZnV10oNBNFsACt/6gSwuAyrT5f8dY/X1Kel
	 Xkpfp2sIaoYJg==
Message-ID: <sashiko-outbox-201213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:25:20 +0000
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
- [Low] clk: meson: s4: unused S4_COMP_SEL macro left behind by
  S4_PWM_SEL
--

commit 5666c90897d1a4bb5320168099b837ca1ef8216b
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

clk: meson: s4: keep the PWM clocks off vid_pll

This commit removes vid_pll from the S4 PWM clock parent list and adds a
mux table to preserve the hardware register indices for the remaining
inputs.

> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-pe=
ripherals.c
> index ba41fcd905881..e5e5ff979efd2 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -2588,51 +2588,61 @@ static struct clk_regmap s4_spicc0_en =3D {
>  	},
>  };
> =20
> -/* PWM Clock */
> +/*
> + * PWM Clock
> + *
> + * vid_pll (mux input 1) is left out: it belongs to the video path and is
> + * reprogrammed on display mode changes.
> + */
> +static u32 s4_pwm_parents_table[] =3D { 0, 2, 3 };
> +
>  static const struct clk_parent_data s4_pwm_parents[] =3D {
>  	{ .fw_name =3D "xtal", },
> -	{ .hw =3D &s4_vid_pll.hw },
>  	{ .fw_name =3D "fclk_div4", },
>  	{ .fw_name =3D "fclk_div3", },
>  };
> =20
> -static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +#define S4_PWM_SEL(_name, _reg, _shift) \
> +	MESON_COMP_SEL(s4_, _name, _reg, _shift, 0x3, s4_pwm_parents, \
> +		       s4_pwm_parents_table, 0, 0)
> +
> +static S4_PWM_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9);

[Severity: Low]
Does replacing all S4_COMP_SEL() uses with S4_PWM_SEL() leave
S4_COMP_SEL() unused in drivers/clk/meson/s4-peripherals.c, triggering a
-Wunused-macros warning under W=3D2 builds? Either S4_COMP_SEL() could take
a table argument or the unused macro definition should be removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106101827.4646=
7-1-christian.koever-draxl@student.uibk.ac.at?part=3D1
