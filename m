Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A833438A5
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 01:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779930940; cv=none; b=X5vZmx+AEbhqwNgg4P4OXk/WnzfaXv2F8RIyh7c02uO7XKN3O9lhBieje+pY7qDVlYeNCz6v5QTc5GY6J4BUXGXxaOLApC9bUkPHbyDElF3GXk9E5L2fii1Kx3NZpimp9vc2SImLdnZzNeWTIsamhP1VHOgbqG+ANxYmz7LqXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779930940; c=relaxed/simple;
	bh=Mixj6xn5WoSIC0DQEG8/VLc5An/g4Q7amPQhck0k3PM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=Oy5YuFVEYTOgVavDx9CFmjvtbPqM0WUE++t2DcNswR/leoOqk1m10ZxtYE+7bN6YqrSI0NhGAxRNz5J8GDV/tyz7cRjJqgVSwTWqKWGPpKPUUZtLUP62IPVBGv4njaxp2L7WbQ9jGpsehPU61oephN03Bkb5KDothHI+sPj62aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dB+RfVY5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dB+RfVY5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49048e043e5so45648575e9.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 18:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779930937; x=1780535737; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2voxwMi0ctbkvCbmI9saWaf7WWfi0CrEFmlwsKP+cUo=;
        b=dB+RfVY5y32ag0tWLdQvBoFWnu7NJhD0WcpxmcxId5a63kpghDLC/BKakwi1hk6QfH
         U+/Mbi/3AYfrDqrfwLQFFHM4DMFLxY1nlFvqLhd/+/KBmRTwCLcCffx+NYKkpnynMO6e
         L2vQceIvu0TirlOPxjXew4U8HAIvlyPAlM0r/9eybulnKjqhfMY9+92e+U5EpLg0WDod
         erF4eSVfMzKv82V65FV007qUShHnyNluw0HYvyoO+06dcNbSO+EDfELvoJj1tldIFQkc
         v/naN5ITCzxtB7cePDO+Nqcka45NSByCMdwwUaljhLqiSGmdKLTwO2OgvmdVqRdfI32t
         yLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779930937; x=1780535737;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2voxwMi0ctbkvCbmI9saWaf7WWfi0CrEFmlwsKP+cUo=;
        b=BsZ3o/ubvdNmf4UKGLDljyFIdAjxUrg/JGksuepzlnGM07O8FM+xsMhpDmJxqPJ2Kk
         3LW38OxncRpE8V/+zv1D7vPHoss8rLCEjMTGzwnM+QrzNFHuinytzbzuoC8F1NO3Spg3
         WMNRM/E5eqB3+DqikyVdLa2tROHp2xsPo46GNkreG24lexoBwPL6lk21svWnEgzRgCBd
         zQofaf1fC224uVTfmT08sLRqUEY2MNUIZ+TCxFPcb48RZJCfOoxdRi58s3gAhihGyRJc
         dH734TuPlNqVAW/13NV7QrQorwTKkgKoOHZFQt2mWisILQf9KPDlRw0NkIndnf/fUPPH
         XBkw==
X-Forwarded-Encrypted: i=1; AFNElJ92aDD72PZIs3NLwbTe0zuMPFXGBCQxTusXbCANpFSkk1YCWeJC6E3S6o3QAd5Ie5TT+ENOOQABO9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTogQo8lNP5KMXAfrkQpVTuP+xHou3uUI0bXSLFQXNRIf4Hpg3
	dPtFyxH0RlgLpwjL71E+wZzeQQMvFYoTGzy3aWxoVQezQ/Naug8HqWfeIX1jNTPv4cQ=
X-Gm-Gg: Acq92OGRi+ebGlqcv+JI//rUcP+INsA7P1EgRPa8BvbBymuS4HgRY7uZMTyO14KDfK1
	9QNiFgPraX55/pcyOf1eaZp0k6doZB3IxqeS55hA7/Msa86R3df/kfGMS2jrUvEANlrU/Clm/Cm
	GxH9WwBnC2MbhipJ25rGOW/lOBCSdtJDZr6DOLo7HaWix52MlsIfIyc5AMI91EChit3Y+uxltvY
	omVdSkg1HVeOTG83sA9MhstCJ97mHgg8DY/z9TaYlGsBt49DxsrBxDSnoXFu3Bpvh8LVXXS6rzg
	xbUVWcJioD3yClC5n1IVr4NYL1e96bhwtiAZMPRXLnRfc2AQgJOzlh3IYyWtc/3vySIoCDtU1z1
	yPmEER956PZF+O+CapxWZTzorRNUThj8LkJArjuQCugWbjtfJoEF5NHTG6So3qJEGcxAB70ZmJG
	E/dIUvssezMPoCK1vNvVbTns3Vq85rVVxG2wi1Jf8dxytH9E6iEU0cGRC1IzaUHtSUOld5TxTL2
	g0rJAVhszNw/FZJUZI1AWlMU1PJm8Hp860=
X-Received: by 2002:a05:600c:3d96:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-49054291bbamr369303675e9.6.1779930936735;
        Wed, 27 May 2026 18:15:36 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c44e4sm9654900f8f.36.2026.05.27.18.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 18:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 02:15:33 +0100
Message-Id: <DITWUUN7L160.5VKMP4HONZ4@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "open list:SAMSUNG
 SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON
 CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:ARM/SAMSUNG
 S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>

On Tue May 26, 2026 at 7:13 AM BST, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
>
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/c=
lk-exynos5410.c
> index baa9988c7bb7..0cd9b0392cf5 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device=
_node *np)
>  {
>  	struct clk *xxti =3D of_clk_get(np, 0);
> =20
> -	if (!IS_ERR(xxti) && clk_get_rate(xxti) =3D=3D 24 * MHZ)
> -		exynos5410_plls[epll].rate_table =3D exynos5410_pll2550x_24mhz_tbl;
> +	if (!IS_ERR(xxti)) {
> +		if (clk_get_rate(xxti) =3D=3D 24 * MHZ)
> +			exynos5410_plls[epll].rate_table =3D
> +				exynos5410_pll2550x_24mhz_tbl;
> +		clk_put(xxti);
> +	}
> =20
>  	samsung_cmu_register_one(np, &cmu);

Best regards,
Alexey Klimov

