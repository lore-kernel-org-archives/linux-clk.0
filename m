Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076833DED0
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 12:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134472; cv=none; b=B+YsRZekgKi+XWfdMdc8DyCrAXcSxoT8PEWvr26DraNR3/guRGxFRWV8x4sVnOVwnuYl2aAKg4Sr3FaLQT4Rqt8A4eJEwZK5H8Ak6DunEneOYpP20kNR8CKS5eOHGDwl7PNxWIyv/zQn15ruWM+AVYWB+GKJF0EgCTBJJn1Zt88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134472; c=relaxed/simple;
	bh=R1mEslmJcA+r+HIRc+phVBKYFLtheMYP3sFBMbzIRaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CLQthWSavAQOG4Jb4j2xcHhsuhRdBfzpK8qM1n0BRFdMC77d8otTED08N6bUtIBDC38gOlFU5jtm6MweXBk51xr+nXi3Dw1bdIB/wBd0dGGJP5ZkL7rvznqa4RUsIhbEabgKB0fgTGN3m/7WuS63ep/6VrplyS5Qd99E42i+zhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0tSWDqQZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0tSWDqQZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso5184451f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761134467; x=1761739267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=;
        b=0tSWDqQZdUifif6uTzk6MfBQK+APjJvYp4txDwM+6f2bE2WCJUk8yCRcVABxxklabB
         FQvKXPwtHFAjOLckgZkNhmvgT6RXRmk/OGCY6+Xk+Aw6MAdkTUIPLqkDE232F66sXg4V
         AYgJROaDuqaFQts57cDRmtFDgx4z6/TvKjsWB5lsTBiQGhy9GdPyV5x40paNY1BWkHkw
         VyE/np2d881t7ZnX2MmbZLykG5IBYFK5mQqTgZG+YqFGpQA442MDhyiZ63QDL/gSxU4n
         7TIoIQZ0i05yuHBE+MDKLsexSY3g2JHg7yrlufesD/gT8SpU3pwOHVHJeNwm8sabdjvG
         53LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134467; x=1761739267;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=;
        b=Jsc+b2K4BIJQoYfUk/6L4AHJ4jrDfeJ5OUNiPsBIolSBbnhgcK56zXWhkzzylUgn67
         tzJ7Lq851Vz4RkWJREeVJVzZR5KJzqSwlgLB2dks7UcoWQDHBkgq5J+G5BAL36eJbrxl
         LYg/PQWKewEjg+uK41i8CddLVs3y38/O25Er08jRkHAampCLn8PwmHWAYGlJNAXxSu8o
         FPGIBd/+vtTIr5qzi9/dOIIH/8Vet7m8UXsEWbkYcsM93XO/hxeJhe259ypKtCNTkp9s
         Fz/Fu+c93OvPpeC+ava+kvpNxf/sg0o+n4IBWxiiL7a2ScydOK3wJ0RoBH0nESPP/yyV
         gVjA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ9lsql2u2VllNoZAgXXNEL1GuKEpCzHzbhyc/TESS7riEdwu12c5/GGIbrIB7NB/LwuB842TBIuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9b8T3cBwO3wFUCeZuABoUXZwPrItEsFVhVacdmk9vKhEHmKp
	7RJ1AZrPeBTbp8yS6hxjSpzt2GtHLa3RzncCTjAvh5DfOFkS5q32BnJt65ZVb/JFkmk=
X-Gm-Gg: ASbGncvapl7AlwIAn9cSyUOOlImgVjNmRF0KKyK32rCqtPY7TMT0RFZWEhu0KZZg2Ga
	Hm6y/IHeqf2UWKfLtm8SMF+Vx4cwsm/N+8Das3gtxOETMyS21QyKYtdLs+PZdKIMg0W3YBHY1eD
	RHb5WzuQMXhggrc3aBbEiVoKl81dIJRyEuskvkCAeLX1cPTkA0nI19zeNb1PvlLe+VwTZPMnRlC
	mF0m3hJDdJn23pt8VCIOsDvvdzRTADtR1TuamZRduNLgDgq1k5KCJMpmu7fgaooiCqGavOEos2Q
	d0eSSa8buus/PKjqIrQuXsl9V8ziJMy4iFfi1VVhF0tp03N+PVBMCavCE9rl3W/IVOTNN6T89/w
	Sw91q9kLkYkbFlrsW7qSYeXU5/8S5GCojyIvaM51/W1/tAxMmye3AZtzImW559f0i+cP9ml3NlA
	4=
X-Google-Smtp-Source: AGHT+IHbsKbAfuuLVLCAlwiAoOjeCSzSKz7jOyG6Tnh4cKgyrUKbbUqK56xJxiIvGc2SH5FLobbRRQ==
X-Received: by 2002:a5d:5f94:0:b0:425:856f:70ff with SMTP id ffacd0b85a97d-42704d99cf6mr15941694f8f.45.1761134466809;
        Wed, 22 Oct 2025 05:01:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bdae:f4f4:58be:ea26])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a797sm24998630f8f.27.2025.10.22.05.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:01:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
	(Chuan Liu via's message of "Wed, 22 Oct 2025 14:58:52 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Oct 2025 14:01:05 +0200
Message-ID: <1j347b403i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 22 Oct 2025 at 14:58, Chuan Liu via B4 Relay <devnull+chuan.liu.amlo=
gic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Amlogic PLL locking procedure shall follow this timing sequence:
> 1 Assert reset signal: Ensures PLL circuits enter known initial state.
> 2 Deassert lock-detect signal: Avoid lock signal false triggering.
> 3 Assert enable signal: Powers up PLL supply.
> 4 udelay(20): Wait for Bandgap and LDO to power up and stabilize.
> 5 Enable self-adaptation current module (Optional).
> 6 Deassert reset signal: Releases PLL to begin normal operation.
> 7 udelay(20): Wait for PLL loop stabilization.
> 8 Assert lock-detect signal: lock detection circuit starts to work.
> 9 Monitor lock status signal: Wait for PLL lock completion.
> 10 If the PLL fails to lock, it should be disabled, This makes the
> logic more complete, and also helps save unnecessary power consumption
> when the PLL is malfunctioning.

Is this applicable to all supported SoC ? from meson8 to s4 ?

What did you test ?


>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 68 ++++++++++++++++++++++++++-------------=
------
>  1 file changed, 40 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index b07e1eb19d12..26c83db487e8 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw *=
hw)
>  	return -EIO;
>  }
>=20=20
> +static void meson_clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk =3D to_clk_regmap(hw);
> +	struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
> +
> +	/* Put the pll is in reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 1);
> +
> +	/* Disable the pll */
> +	meson_parm_write(clk->map, &pll->en, 0);
> +
> +	/* Disable PLL internal self-adaption current module */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
> +		meson_parm_write(clk->map, &pll->current_en, 0);
> +}

I don't get why you moved that code around and make the diff even harder
to read

> +
>  static int meson_clk_pll_enable(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk =3D to_clk_regmap(hw);
> @@ -366,53 +383,48 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 1);
>=20=20
> +	/* Disable the PLL lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> +		meson_parm_write(clk->map, &pll->l_detect, 1);
> +
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
> -
> -	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	/* Wait for Bandgap and LDO to power up and stabilize */
> +	udelay(20);
>=20=20
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the
>  	 * PLL. The sequence is:
> -	 * 1. enable the pll, delay for 10us
> +	 * 1. enable the pll, ensure a minimum delay of 10=CE=BCs
>  	 * 2. enable the pll self-adaption current module, delay for 40us
>  	 * 3. enable the lock detect module
>  	 */
>  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -		udelay(10);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
> -		udelay(40);
> -	}
> -
> -	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +		udelay(20);
>  	}
>=20=20
> -	if (meson_clk_pll_wait_lock(hw))
> -		return -EIO;
> +	/* Take the pll out reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 0);
>=20=20
> -	return 0;
> -}
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
>=20=20
> -static void meson_clk_pll_disable(struct clk_hw *hw)
> -{
> -	struct clk_regmap *clk =3D to_clk_regmap(hw);
> -	struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
> +	/* Enable the lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> +		meson_parm_write(clk->map, &pll->l_detect, 0);
>=20=20
> -	/* Put the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (meson_clk_pll_wait_lock(hw)) {
> +		/* disable PLL when PLL lock failed. */
> +		meson_clk_pll_disable(hw);
> +		pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
>=20=20
> -	/* Disable the pll */
> -	meson_parm_write(clk->map, &pll->en, 0);
> +		return -EIO;
> +	}
>=20=20
> -	/* Disable PLL internal self-adaption current module */
> -	if (MESON_PARM_APPLICABLE(&pll->current_en))
> -		meson_parm_write(clk->map, &pll->current_en, 0);
> +	return 0;
>  }
>=20=20
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,

--=20
Jerome
