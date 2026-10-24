Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838107;
	b=vt8uFlczxS8lmOJMTV6/mPquOK0/eKrk+8MztJc90o8wnH3aK21BneYkCS3/ca93O7WY
	 RIvFPnHo+Fz6FCZ8yLUVEacFT/qs8KFxd1tf/eNiVaAxoJNxAqRFSbhtdDI8xrOuIAeGg
	 sV/TqEdnI49uRTNlBQC4Ps/8D6BKfgiXbg0T768yN6CuFimgsb1E1p1pHx+GwUhMi3AGI
	 2Sc3tTfamLtOtypVKTF912gLLnKHA4++I+LtnkCus12lnPIGhOIGFjqKv0pCyVWHTgYoW
	 Jg21PkC+OuCi0FvvIaGT/uVT1b9Yf7uD2AbPVR/LqHOgS2qWx1H4qoNHbMbmHFMlngg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838107;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T8E3KuR0K0ngyRka9wB5lneWnir6PeeaNG70FQpT6Uo=;
	b=waRsi15bml18caApoae007M7GLT6R3U4ATwBb2TSXQbYt4jQco43yMrJbpoFZCx0/7fV
	 7ayWYGewwkU2qfGt7Bfhsip0Poeo3G4nslTG/k/b+OL8uDFphexZ4uXa10sJTFSbH8VaU
	 5MjWLClRkqjo6bEuuLtTXBmH/ZO6xcmOqHY2x05lnEq9FkYeXcRdbrfZR9cAseqr+CF8x
	 34bPpNoIx3mxtIDO7qLgh41k9qih32BMUtJTJ3cHOVoG3HEb39yVm7ha/t0NNvtAFGeET
	 3pXqx/a+byJIpWyGXS2CTweBE+lKm6uhRdSdyzglCQfif/ZsHGR8xcHp4tJUp+WpGTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmBE8Z4o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672F606A321;
	Sat, 24 Oct 2026 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmBE8Z4o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431901F01825;
	Sat, 24 Oct 2026 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792838106;
	bh=T8E3KuR0K0ngyRka9wB5lneWnir6PeeaNG70FQpT6Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmBE8Z4o5PtqqIcGo5bgZv282y2w34PVIZL7lHMh0f4MmnNgu62zRS5d4Si7SP15Z
	 AnPCJxhsfdAl51lKwY6kfniaaQ74fglJZ34q4d0dIlZVLojzwNrjFXY97E5LtpCHfP
	 gP1xT4QlpT5rj7rFx3ueFt1zJ0YOXB7YywZL4IQU1kk1hkWzMuO19Sk4renZe37Och
	 sWyKAMCOMKXkz8E+sPkpdtRqbCM8Z02J0aSXpMKkP9yQ6296DUfjA6w+IVhKjlbwsu
	 N5VKJpuXpiCoCHQxn+57wn7bwMRP1AiVyL3PJmBGFtMEWpgIFhWsYk05kGsafJHqD8
	 n/EUT8pL+qiLg==
Message-ID: <sashiko-outbox-183650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: rockchip: Add RK3572 clock and reset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-add-board-ok3572-c-clk-v2-3-90b98836be6e@qq.com>
References: <20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com>
 <20261023-add-board-ok3572-c-clk-v2-3-90b98836be6e@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 10:35:05 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: rockchip: s16 k overflow in rk3572_pll_rates[] struct initiali=
zers
--

commit c2a7bfa93851b6e038e2eb4b577e1b1e53dcecfb
Author: Elaine Zhang <zhangqing@rock-chips.com>

clk: rockchip: Add RK3572 clock and reset support

This patch adds clock and reset controller support for the Rockchip RK3572
SoC, including PLLs, CPU clock trees, branch clocks, and soft reset lookup
tables.

> diff --git a/drivers/clk/rockchip/clk-rk3572.c b/drivers/clk/rockchip/clk=
-rk3572.c
> new file mode 100644
> index 0000000000000..712651c6b8cf0
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-rk3572.c
> @@ -0,0 +1,2004 @@

[ ... ]

> +static struct rockchip_pll_rate_table rk3572_pll_rates[] =3D {
> +	/* _mhz, _p, _m, _s, _k */

[ ... ]

> +	RK3588_PLL_RATE(1188000000, 2, 198, 1, 0),
> +	RK3588_PLL_RATE(1186814000, 2, 198, 1, 52581),
> +	RK3588_PLL_RATE(1186812000, 2, 198, 1, 52559),
> +	RK3588_PLL_RATE(1109000000, 3, 554, 2, 32767),
> +	RK3588_PLL_RATE(1100000000, 3, 550, 2, 0),
> +	RK3588_PLL_RATE(1051000000, 3, 525, 2, 32767),
> +	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> +	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> +	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> +	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> +	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> +	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> +	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> +	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> +	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> +	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> +	RK3588_PLL_RATE(773000000, 2, 258, 2, 43690),
> +	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> +	RK3588_PLL_RATE(697000000, 2, 232, 2, 21845),
> +	RK3588_PLL_RATE(610400000, 3, 305, 2, 13107),
> +	RK3588_PLL_RATE(604800000, 1, 101, 2, 52428),
> +	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> +	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
> +	RK3588_PLL_RATE(408000000, 2, 272, 3, 0),
> +	RK3588_PLL_RATE(312000000, 2, 208, 3, 0),
> +	RK3588_PLL_RATE(266580000, 1, 178, 4, 47185),

[Severity: Low]
Does initializing the k field in rk3572_pll_rates[] with positive constants
above 32767 overflow s16 and trigger compiler warnings?

Commit 581478883477 ("clk: rockchip: Fractional PLL coefficient on
RK3588/RK3576 is two's complement") changed the fractional coefficient k in
struct rockchip_pll_rate_table to s16:

drivers/clk/rockchip/clk.h:
struct rockchip_pll_rate_table {
	...
		struct {
			/* for RK3588 */
			unsigned int m;	/* main divider, 10 bit unsigned */
			unsigned int p;	/* pre-divider, 6 bit unsigned */
			unsigned int s;	/* scaler, 3 bit unsigned */
			s16 k;		/* fractional part, 16 bit two's complement */
		};
	...
};

While the 955520000 and 785560000 entries use signed negative values (-15730
and -14419), five other entries with adjusted m values still pass unsigned
16-bit two's complement constants exceeding 32767:

- 1186814000: 52581 (instead of -12955)
- 1186812000: 52559 (instead of -12977)
- 773000000: 43690 (instead of -21846)
- 604800000: 52428 (instead of -13108)
- 266580000: 47185 (instead of -18351)

When CONFIG_CLK_RK3572 is enabled, this triggers -Woverflow in GCC and
-Wconstant-conversion in Clang, causing the build to fail under
CONFIG_WERROR=3Dy. Should these five entries use their negative signed
equivalents?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-add-board-=
ok3572-c-clk-v2-0-90b98836be6e@qq.com?part=3D3
