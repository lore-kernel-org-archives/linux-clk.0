Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390550;
	b=QsBp9x3gcerz7p0sp1FprSergEX72d7ZWEFMjaFHFOGgiTwJcUXHXi3btPPeXkNiTKJB
	 qH8BIF3hVrb5A1lobx1wQMD9L/Cql+J5V03VHQFY7DviVQoCZIN6nFKH/vaUyVs6Qi7UP
	 ChINKHFVqlFvotKXCr6ZUCv7/xHTif6/qJwfoY3QxeTzFm878GIHdBzbX/5b8AEUIaAUX
	 UlFcmSFlGwjfv9m2lkXSkbNNZ6+KxRUMBw3wNDZ0atwXLNUGj2ULoQDwsWx7m0hqVvg5w
	 9VlnewQGqB+GKkmrRVu5dzpWCcAGlLJRK47vKwSLIARE4oSxw76U1mRtRdMKttKDdRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390550;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=JuoAQwfcljWx2dFYJyXxbF5HVpquu71Q4cfUewNA3ac=;
	b=mRIjsYfmjtJ8rTY5+fvLqO/q1n9qWKjXo4nASuuI4eFv17EbRcG8PeCpNJZHrw13N3nN
	 fnkcdeyaoQ2wMz+WWN5QioWtbxHuff0W1hl4xDD5KSx35H2k3BHtA//GCAB8ZPLRsLfKL
	 CEEP7BcKFCas/rM+vKHdjf8bZVdTAoxr309O5NsdafdGfLAAacBtNAGUAk+Bz9st63Guo
	 DfyTORYcU9IT80t8FFPnD+G4MbwfSd2NL7RowyobWj4HLdKCpPMO33OpyHuMj7WDhv2OS
	 nmKeJ8DsRmVsAaYYk3jSEHkgc2JzNVEOTKyPo6VsunQ5alE379NU9TkqILZ16/AZk3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="ZlzaV/MX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18727606A327;
	Wed, 11 Nov 2026 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18727606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZlzaV/MX
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C096520062C;
	Wed, 11 Nov 2026 10:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794390546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuoAQwfcljWx2dFYJyXxbF5HVpquu71Q4cfUewNA3ac=;
	b=ZlzaV/MXm0KxLALRtJsaYjn1Og6jld/xP/jTC7hE9Gp38bcI0pIAcIvGkfkZwXRD0yrVnr
	Qz8/snotVAYZQWu6wZDLVsDDC3nomzcAHcsLB/cq15Ol7Vjjw5EX4RnRRMXZpagVe57yWB
	Q7tTgm/vAHjh1LfWV4ioJSK7R6lFesqTvbtXPZagBjj4acUrpSeLFgB40OypHD0U40cfbV
	wty+OAboG4XXR6a8gElKLkAqL33r2w+BEBPhvR6EsSShLPohtfB7XQKP7HZs97xal8urAE
	hdaWVRtl8vTIPZrmBBAdJRbm9qgqs5UMscokZHOISWvuJ3xcaqZbsNnxCA4pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794390546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuoAQwfcljWx2dFYJyXxbF5HVpquu71Q4cfUewNA3ac=;
	b=QcqDIYXR2JFkuTPG65DJRUhMyFt317k8jE7ZSJMljXrlzhEwCHqwEsaPBu19lMGR/ZyfO4
	tUVKAq3oUnwNqAl+QWFyNWYoz5KyS/9okQwraqauMaLaOtvvZ30RGQBvvmYwvhTZOK32Pj
	dSnmaQ8DpS8hfGELwD0wWlPbWKOePlMoLEFmS61xtVmXP6D+Co+W/wL21qjXH1mcLRpBpZ
	k9yOusRA6hux3eCuckRtJKsLNzOMj2LD4n371tT5EG2YFol/ob4KMO+GBSW+ZcyrH5bBlm
	ehTjKau/acGMHdSo4qdoySkIhlBYzt9zS7Mmv43XLkJhjMfNZldUCZ97SrZo7g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794390546; a=rsa-sha256;
	cv=none;
	b=gM88XHLBxnSNYuZtcLlhrnUkTqlyfqg4rA3GDhCoKikC5jwMJdSaYZFDdYcsVcno09DTah
	VAqBpejybq3Da4ejXrPIcTi6F/eoScYm3xDkjTOPccH5Ubn7QBIspe+9T7uWecYSvV/eII
	2zpzxfIs/fZn8LkDyaOeDzNXT0Lu382RulMHgzh3QXzWzXYxtzQjld8kPMdCAmaNEbmo1x
	bVP7xWRmR090N/xNcwBkeybQ4ljd3JSj40uelQEFvjiYXQU7IcugX3incSYMlz727UH7Kh
	FX6LEhaBtcafi4rNUbXI2Y+ZJe6KNNDQ886WjyEzxqim95rTT1C9iJKtGwqvAw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] clk: en7523: add a reset operation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: John Crispin <john@phrozen.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com, 
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
	zhengping.zhang@airoha.com
Date: Wed, 11 Nov 2026 10:49:06 +0100
In-Reply-To: <20261111085650.632025-3-john@phrozen.org>
References: <20261111085650.632025-1-john@phrozen.org>
	 <20261111085650.632025-3-john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-11 at 09:56 +0100, John Crispin wrote:
> The reset controller implements assert, deassert and status but not
> reset, so device_reset() fails with -ENOTSUPP. The i2c-mt7621 driver
> calls it at probe and after a transfer timeout.

Is the i2c-mt7621 driver actually used with any reset controller that
implements .reset but not .assert/.deassert?

If not, it would be better to let i2c-mt7621 use
reset_control_assert/deassert() instead of adding .reset ops to all
reset controller drivers it is used with.

The .reset op is for (compatibility with) self-deasserting resets.

> Every I2C bus that
> references an SCU reset, as on the EN7581 and the AN7589, therefore
> logs "I2C reset failed!" and is never reset.
>=20
> Add a reset operation that asserts and then deasserts the line, as the
> MT7621 reset controller does for the same I2C block.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/clk/clk-en7523.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 8f63482cbb7b..eb893259d470 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -818,6 +818,18 @@ static int en7523_reset_deassert(struct reset_contro=
ller_dev *rcdev,
>  	return en7523_reset_update(rcdev, id, false);
>  }
> =20
> +static int en7523_reset_reset(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	int ret;
> +
> +	ret =3D en7523_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;

Is having no delay here valid for all possible reset consumers or are
we implicitly assuming that this will only ever be used for specific
i2c resets?

regards
Philipp
