Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D132263F36
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097510; cv=none; b=HvIbjujK7ynpwj9rRMJ8r78h/ZCFSTRO0C/0Vr0OUrC/Hk5ruZb8sJHCbriPmSD4UREO0BngOrv1lwVqTqsDze9sYi6p8LrxZNLAxXXtUz6RF/DsRDKWfKEHFUP3+3VWFS4DIPe1Mv6WrOeUf3juvAfiaJQ/XBZfX4tMN1xOSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097510; c=relaxed/simple;
	bh=LEuZgY0jhuQ4FL/v/uZ3J63ZdTX215qikKnl6T6j8YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdTzE8KvYI9t0xYU0OZ+76uBec/dnfgBFAWfaBGxUP2F1We+ieCs5rsCfppZyRapo/UadbC5CzD6jxXTZvXjaqRuWKM3R5AaFiSAcr6ir/KdL5eiEgyIFKZZmr30kpEImbY4kuznIZSqHDRSUAYzXNT3+g4GFV1+vydSrRWaG0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0t+ePt6z; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0t+ePt6z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=y2C+uRo2fVHUKx/+iSBSrq317XScpLFo+rXN012kNqs=; b=0t+ePt6z+QxWnu8TYx2heg9Wol
	NRgQcKJR9WRPerFtM6YFYBDdWjiek8EV+Tg2n647qjfHDFVetKcnnXvW4V37ZifW/m9+4/EWHIYJw
	8iycksI2i8YAx73B29Z/lTXwTo8lv5MRxSEQfRu8YDGdgUb8dlBiFOMPhOuPGZtv+X3F/hSLDS05Z
	yXrPln7nDPLG4E809r++H5+p4Vs4qZF3XOWMpCRGMQcQ5eFgehaTO3JhyloeXkcPKtc3jhGiqzWPk
	15mKTOjJBdaN4Jh9dMHoN9N2bB7g6Ptjg3a0cffvNPhn5+8Vvxeq5NwWsnwJ2v3ot9PcTqArGDLLx
	CTbOrqVw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u23Qn-0005H9-MJ; Tue, 08 Apr 2025 09:31:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>
Subject:
 Re: [PATCH 1/2] clk: rockchip: clk-pll: Fix CRU_xx_CON2 register usage
Date: Tue, 08 Apr 2025 09:31:36 +0200
Message-ID: <3871892.kQq0lBPeGt@diego>
In-Reply-To: <20250408063126.38904-1-eagle.alexander923@gmail.com>
References: <20250408063126.38904-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Alexander,

Am Dienstag, 8. April 2025, 08:31:25 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexander Shiyan:
> According to RK3588 TRM, CRU_(CPLL/GPLL/etc)_CON2 register
> (rate-k value) does not use highword write enable mask.
> Lets fix this.
>=20
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

The commit message doesn't say, but did you check this on actual
hardware too?

Sometimes there is a disconnect between the TRM and actual hardware,
so the actual real-life situation should be checked.


As for a test-case, any write without write-mask to a register that
would require a write-mask would not come through.
So with your patch applied, does the register value change after
the write below when reading it back again?


Thanks
Heiko


> ---
>  drivers/clk/rockchip/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pl=
l.c
> index 2c2abb3b4210..77ba4d6e7b5f 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -959,7 +959,7 @@ static int rockchip_rk3588_pll_set_params(struct rock=
chip_clk_pll *pll,
>  		       HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK3588_PLLCON1_S_=
SHIFT),
>  		       pll->reg_base + RK3399_PLLCON(1));
> =20
> -	writel_relaxed(HIWORD_UPDATE(rate->k, RK3588_PLLCON2_K_MASK, RK3588_PLL=
CON2_K_SHIFT),
> +	writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON2_K_SH=
IFT,
>  		       pll->reg_base + RK3399_PLLCON(2));
> =20
>  	/* set pll power up */
>=20




