Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B66289E13
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982579; cv=none; b=SOClFdRFdXOSIDl5fiUf3E4+R3/jdsTV8A0TvTz2cyFumxZWRrgcWxQQye3G/pmJZzsv/QDBCTb71GNYKN77vwYgtPOgZ6ueWX4D28YsIVflaHw2qv7N49R1qxDp4D0cmTJRY7KJWVxjemeXFB7V+qjjfDaw8RD+cbuKQqtKTjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982579; c=relaxed/simple;
	bh=xOrPsbGqKSS2XyeFNV4ELqt4UHoe2WbEgpv+4VqM/Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0O1Sj3p8s1TzmUHxKooBKYT7H4nWibuz+7MB/UzZlYzcysYPXkn7stPTOKsEZoOsrPLaQORSH0B3XBOXZqFe732Puk25RZOG483+d8QwXwfWkdepMB1uloiEEq84EG3ZtS8gG89PKH05HRgU54MGfIbv2cQiBDvGw6nPZLcBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K25zH5y9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K25zH5y9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso4667457f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982576; x=1761587376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyCd/4JIj55gxSeGf4+DJdNpJNeCwDGuxusuHQkGxZw=;
        b=K25zH5y9ffuiLrCpG3kE75L6TD3muWG3iAtqc/uKRp9OgpBCF1azYj2g+/3k/TS73M
         PNgXCpiR+3LGrZ0XPTgrwJ3KS/sy2BF2HL1UK6ikQWBK48LTLo+MX0/mXd6SJwV4KB1v
         kLoL2GEhPcn+2qKR8dBZpD0mZMngY5bVuvCVrpJ2hcIV9CI1xhHONt/54DXdz/RbKowe
         P6u7IA9DcqrpA8hd3fIf15IrreZ8S6gr6Jk+ikv/fFMljRqOrf11adHr6jwYPJtYDO1f
         krhrxSjZpeWM0f2jaDTJN+3iJYJbLVfnP7J5YSgaJvmuOXpS10qbnQmyfZ95a6OgCN4V
         vuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982576; x=1761587376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyCd/4JIj55gxSeGf4+DJdNpJNeCwDGuxusuHQkGxZw=;
        b=vNhXWTE+vgfIK/rVdkKMIn69EYNEj0clbY0w8bzvAh/npQZApIKdyxyLX42osRp4O4
         LLL7wU+ZBTd+56ig2f5UupdYNMbOTWS5fJh//GRc2Z9f7lddd1fT1USMv33ZaJJrEN/P
         nxR+r1lSLwX2T4UzQ5YrO6xEtoRK5pPM5bweSEsu/XmNOlzq3HVDmOQFHaeUJbGLemh/
         oHJYVf8TlP/05g41mu5oVrOWs98H9iWis5ju5QyteLhGOXjHmwN/uJNXUyLOT37EhoXp
         TFbZlPbcdNku96yqiPZcqYHSponp9GMp8HMaSTBq9KUt9np0ztGosDi2uPJVgD7X74K+
         AldA==
X-Forwarded-Encrypted: i=1; AJvYcCW/kyVckWlpOx+U8zixb3ePQXMzjUdOF6rOREPL8qs0y81kerNYiUVgzaz5xle6+Ko/4nwX6bgzHJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+nz32JLoUrvwrfOqFEbjpI7+LTf3jRrdVZS9moZ2z+a3o5Lg
	btmK8h1psi74951Edy/GYAgM9tX+RojRihJ3dvh+UUanhPSL3NqrAKvH
X-Gm-Gg: ASbGncsfMjcnvkwaJ0WtgLxwP4d5xOeRrejrczywLcD1brDT35qrNqXYcbwUhOORu2Y
	A6AgRJxvxy1V67u5nprh9Mi8MWXxQYZGn6b0nx6VoZnuSMKe3DTjvL+WAsuFeC5acYVj4xRhsrx
	fZW5Oj3m4WUOPKDzbpsbpXkSvKYgsxarbL6obNbCFX0lm2K46ykzl9vTEjlOpespaG9if4QCPPx
	CBMR0TEKLZ54PQLzR9kPEoCRRrXxWpetsxdYRqhcPxrOrtJ/4PSRQcu+xnRXr0KH5nWrzTcly2o
	jr8yS17mNI3aldZ1KmEz1PSOdwlEOWP1COKXAFd1eIooy+Ot5DekorZgRZAdDo+9Uc5T9y8eQEQ
	Nfb2qRLd2yLnHRiabOafBhmqEUo8uBBfXe/Js7WVRXfA9IBH3eJ/H5USsQYoo60w2CyKarF2zO1
	L0AQXvuMnjkWwqXLKcaKfxL7wHYszLLxvA5vpDcqxTuMZXh39nXwkSB2XGeB0rulsE4+onPrlHN
	y91nA==
X-Google-Smtp-Source: AGHT+IFVJfltDBGpXshwdA6ycK/H046cTrEtcv4sm/ksCoAaIUW3ZG+YpLxzBGC+3OrZRm/196984w==
X-Received: by 2002:a05:6000:4021:b0:427:8b:441a with SMTP id ffacd0b85a97d-42704d7e960mr9407198f8f.11.1760982575740;
        Mon, 20 Oct 2025 10:49:35 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm16212597f8f.17.2025.10.20.10.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:49:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 04/11] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Mon, 20 Oct 2025 19:49:34 +0200
Message-ID: <13867454.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251020171059.2786070-5-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne ponedeljek, 20. oktober 2025 ob 19:10:50 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The TX side of the SPDIF block on the A523 is almost the same the
> previous generations, the only difference being that it has separate
> module clock inputs for the TX and RX side.
>=20
> Since this driver currently only supports TX, add support for a
> different clock name so that TX and RX clocks can be separated
> if RX support is ever added. Then add support for the A523.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index 34e5bd94e9af..6a58dc4311de 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -177,6 +177,7 @@ struct sun4i_spdif_quirks {
>  	bool has_reset;
>  	unsigned int val_fctl_ftx;
>  	unsigned int mclk_multiplier;
> +	const char *tx_clk_name;
>  };
> =20
>  struct sun4i_spdif_dev {
> @@ -323,6 +324,7 @@ static int sun4i_spdif_hw_params(struct snd_pcm_subst=
ream *substream,
>  	}
>  	mclk *=3D host->quirks->mclk_multiplier;
> =20
> +	dev_info(&pdev->dev, "Setting SPDIF clock rate to %u\n", mclk);
>  	ret =3D clk_set_rate(host->spdif_clk, mclk);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev,
> @@ -542,7 +544,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai =3D {
>  		.formats =3D SUN4I_FORMATS,
>  	},
>  	.ops =3D &sun4i_spdif_dai_ops,
> -	.name =3D "spdif",

Why this change?

>  };
> =20
>  static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks =3D {
> @@ -572,6 +573,14 @@ static const struct sun4i_spdif_quirks sun50i_h6_spd=
if_quirks =3D {
>  	.mclk_multiplier =3D 1,
>  };
> =20
> +static const struct sun4i_spdif_quirks sun55i_a523_spdif_quirks =3D {
> +	.reg_dac_txdata =3D SUN8I_SPDIF_TXFIFO,
> +	.val_fctl_ftx   =3D SUN50I_H6_SPDIF_FCTL_FTX,
> +	.has_reset      =3D true,
> +	.mclk_multiplier =3D 1,
> +	.tx_clk_name	=3D "tx",
> +};
> +
>  static const struct of_device_id sun4i_spdif_of_match[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun4i-a10-spdif",
> @@ -594,6 +603,15 @@ static const struct of_device_id sun4i_spdif_of_matc=
h[] =3D {
>  		/* Essentially the same as the H6, but without RX */
>  		.data =3D &sun50i_h6_spdif_quirks,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun55i-a523-spdif",
> +		/*
> +		 * Almost the same as H6, but has split the TX and RX clocks,
> +		 * has a separate reset bit for the RX side, and has some
> +		 * expanded features for the RX side.
> +		 */
> +		.data =3D &sun55i_a523_spdif_quirks,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_spdif_of_match);
> @@ -635,6 +653,7 @@ static int sun4i_spdif_probe(struct platform_device *=
pdev)
>  	const struct sun4i_spdif_quirks *quirks;
>  	int ret;
>  	void __iomem *base;
> +	const char *tx_clk_name =3D "spdif";

Reverse tree?

Otherwise it looks good.

Best regards,
Jernej

> =20
>  	dev_dbg(&pdev->dev, "Entered %s\n", __func__);
> =20
> @@ -671,9 +690,12 @@ static int sun4i_spdif_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(host->apb_clk);
>  	}
> =20
> -	host->spdif_clk =3D devm_clk_get(&pdev->dev, "spdif");
> +	if (quirks->tx_clk_name)
> +		tx_clk_name =3D quirks->tx_clk_name;
> +	host->spdif_clk =3D devm_clk_get(&pdev->dev, tx_clk_name);
>  	if (IS_ERR(host->spdif_clk)) {
> -		dev_err(&pdev->dev, "failed to get a spdif clock.\n");
> +		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
> +			tx_clk_name);
>  		return PTR_ERR(host->spdif_clk);
>  	}
> =20
>=20




