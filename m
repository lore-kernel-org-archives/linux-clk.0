Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496204;
	b=LMFnRM273uiLeTHzzRguhiVS2Lyk7grgfGGETebPqPgeI1Pp4A8Ji7Qsm/i8xlIZGHef
	 PLvBiP+pHkme7hALY2U/i7x9H+SdIof+nLOAu0aR7kELlMW48vxF5wJn7Rr86V1ITclPf
	 YUTLIUuxr46tQ5TwtMgSd08ITdmojwXZd/UtMSjksdIzWsHQc00Yd/dHH/lflYsDRum6Y
	 Yb7A2NFU/CPwF2q9+D0IW4v3/A6cI/xqdwq6OEuPMGWRQCS4Gaaj5hpsGeCUSTVVhm2sU
	 XtGXTCjd5nXQhGlOF9BTW1SzNRlN8xHl+p5YSHvxoIcF8mL84EUKbicf5DgW2DX8VBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496204;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sLnwBv1TTo0jw6HGBpVSrrS1iM2G2gH95/4vkvQjm44=;
	b=Kwh9F7xvsxioeYz4Wi2YPhs2YAzOqVg7Gbe1oTf4dCgAKtCT+1Nwj1Labt+YxBIWdJXE
	 2Fs6u42TCguO9DmBnvrmShQrh/QPzQBThOAbKQFBTsOuUHCcOgkhdUqSrJUMNsPKLFvL4
	 vN2fUouY9ySI9jRwzqnZkv3Lh88CPJGaGGuzCV/BGLKT2B3tplbzS3DLGT6P4Wm/mm6A8
	 UcFoqrYDPkwJZw8YC4JKO/cbWfg+b981tPigz6PSKe4j4wnmF7kBcYw6ZPEk7D6w8M0T5
	 tCyVIuucX5j3OBAVi9pmilXqXoVtFXEKv2VEys3BHfkCSmdQwog31qt75X8SElTvQ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjIom4gE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACFC606A321;
	Thu, 12 Nov 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjIom4gE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49F51F00A05;
	Thu, 12 Nov 2026 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794496203;
	bh=sLnwBv1TTo0jw6HGBpVSrrS1iM2G2gH95/4vkvQjm44=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QjIom4gE0SWzo7Xjca1GxtjD7qvez5AfkHZzHb6yVz5b/lV6yuM1ozwzu8McdzHk5
	 3F/cjxKcWxRcV1IRdz+UYlo6ddXgkAjBBp5rUChlhh1EYcI1QedLfjjNkpGzxQdM1o
	 tsT/sOQ45tsY0r6Kma1BdW8lrmuTLFzVQzJ1D16AuwGdZSCVWJ3oz48m/KCAII+w/h
	 ggfjWt/YVnSm57wRUNIn75IjmIlpZdBLM67kRPeox2KL0GW+/v9qyOzVOw2Tahw5CA
	 eTAl4JPMgF8R4sBWZrtEZMg2EIXKV5marCq9l3vUBYyRbdIBcRSMimUc2xtd5SRNLG
	 hovsoCX34YP+Q==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
From: Brian Masney <masneyb@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>, 
 Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
Date: Thu, 12 Nov 2026 10:09:46 -0500
Message-Id: <179449618653.1227210.1767827907767958978.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=uRUZd5KmKjguEG/aJHwwml+0Gh3Ha8KtG313fNh371w=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+XttdNJtRd+bmPat1jvesYXBivaF+a2LTqQ2/jgT2X
 1YK2cLE0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEpn9g+O+8j8c46prtXPHy
 i04t+8L43SZ/Of/aaPOrJfndrSz+X00Z/nA4+jcpeTYxRQu4O827OvV00hKH3Te5Y1+suLTu+zn
 zNC4A
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Carlo,

> DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> 
> Round up with (parent_rate - 1) / rate + 1 instead, building on an
> earlier fix by Sebastian Reichel. It divides by the full rate and does
> not overflow with clk_round_rate(clk, ULONG_MAX).
> 
> Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/clk-divider.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3d..c3f46f9ee451 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -223,11 +223,21 @@ static int _round_down_table(const struct clk_div_table *table, int div)
>  	return down;
>  }
>  
> +/*
> + * DIV_ROUND_UP() without the addition, which overflows for rates close to
> + * ULONG_MAX, as with clk_round_rate(clk, ULONG_MAX)
> + */
> +static unsigned long _get_div_round_up(unsigned long parent_rate,
> +				       unsigned long rate)
> +{
> +	return parent_rate ? (parent_rate - 1) / rate + 1 : 0;
> +}
> +
>  static int _div_round_up(const struct clk_div_table *table,
>  			 unsigned long parent_rate, unsigned long rate,
>  			 unsigned long flags)
>  {
> -	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	int div = _get_div_round_up(parent_rate, rate);

_get_div_round_up() returns an unsigned long however it's downsized to
an int here.

Brian

-- 
Brian Masney <masneyb@kernel.org>
