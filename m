Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640360;
	b=JGaUBXO0pfq3WlNXA0zNYnA8ckQ1D8odniH8HCuGOTeIxYtRZEohEeZjLXI/AM3kcZBS
	 WCaHeJ5Q137PodjByw9pv86Hac6ZbpF/FIYNiiY2ODCG+j84dAdfrF6Q/LOct2JNFTg/i
	 Eo53xk3KsvKvLPIRGq15Ve2s6e9oiV1EILx3qAWO40DfPJy0ZD5/5+NBS1zbX2V5bKa+k
	 N1weJ5ufsvMStw9zNeCbMstZJYMUM1VD587ENZKzUupmKFBzdHKq4p5QAi9JhrSPqeGRG
	 IKeEj1cEPwUwmkHzuFZ9BL5CAEQ0SE+uUP34eAyYcL5xoasdohDI9YOQgsHEZin0Apg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
	b=dOIX2unELn8Uvi+Sqw5xw6zRiev2+RSHVOG2Ald/r0HAx6+EsAWb3NP0ikMCym/A7Sxz
	 xlkCK/MR2dgcQlw0BrgNKk4MZ/a01dib76P06q/5WWlJddq640BhFyC+iZb/f1/XHiENB
	 cRaKNI2E+CNr/BLrEHB9tq9BalOIQTa98q404/G6c+QfrkPbK6ASkILEtz1rwGtJeQ3mE
	 IVcAo7eZTsePiKTMnHWvrwsjgkybnXc7QIaOfbcMeQqdzZ1WZd4eye7Btxgu8naxKC+fy
	 kQjQQljYzewXL+EwgKmI6U2Y6h5897TJ8pnr6sQieh+9FrYwZPq7A6oeP8e3ot46Ksw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XX+oVSvl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8E606A323
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F8E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XX+oVSvl
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso8252196a12.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640358; cv=none;
        d=google.com; s=arc-20260327;
        b=rjpCME2S9usgtc5sQuLA5Yz3YLE/1qnCXJGZQCv21MQ2vYCak7YsqqS8Tg2kyeAWjg
         cbsjb3LR94mfffBodt3lBJxa3V25yNnlB2uBFHf8gUkkFx95EH1IcR4C323cJ2ngUAUt
         H3cXs/Irk6AEWNbcNg0KkW0sPplizLA2QFstE8fE51sMBnRjvzr/0KoHadEIHGPYCLzj
         UA4rDFqwvRV7P4akX2Ffzfpg5rFy7RojkAYpiLOTGQImiqhJsxZ53zb/wxz3xT1ZFs+w
         L3X5nYHmREytUUW+YwA2GVwzuQvtuh3vKOTXkrTqQOAHnJZSK62FqCC5XUQL/haJu2xK
         eWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        fh=caCwFB0JZVvMTULwZ8BkmeZtaYw/+/BzI39chBfWVkU=;
        b=X6DHkwiaahL1dJoHl2WfyC9zpKgONVi03D4JrOtzbHBpPle7k6XlzO7BM48Ld/5bSa
         RA/HdSzTlM2Q5jkxve1VR9pf2/2P4VkHH5G9bsTBMjDN75QO/T+enu14q+Ah5mOO5qUl
         TJ0/m0s5Baew0KPnXPArjKUwRoVSPsAaKfJhsq/9Pr7451eeWmIMEbASLQTM0ZokoLNz
         vi7yzOwCw3qmbHht/NoP6JIYnrXe4L7oMs3NxfAWLtxbzHyXIVD/0hbn4k3CcyVChlO3
         nkE9oEkU+WSKge2t3wieoWMAzRNdw/RHGJozl1y4w5WMDKgifwR5h2zUVFo7zese2xY6
         gw7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640358; x=1796245158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=XX+oVSvlwbkZJl/q7Fv5V3x1hehf+uCE6xb9HMTUuDbF0ZguAJu6UzBvMyjr+3Fj+3
         Nvvze0tQocy6EAVfwsaasTedqzOkcNCy/4uKy4ga9ffBNEU7meDWoVRIhaMd/gGGMdI7
         lq5DNc74gydvwyL0KrWQjZceHBDyui3QPZeJfkBAj+1uk1bV6V6TfjBr0CGUgjMNGPgc
         30FyNBH/PxEbZNh5NMMvBcC6d1IEiDTbCGmTdLvEdJHnoUn9P1A4ajQO/glmLAXbn1d/
         mfEWoGHROTKpQHjsOwdD0NEQ3Fr4qoUCiHkHuoHNdnRzqEcdcHzI4Nnw4O/QDAzqRJsK
         rQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640358; x=1796245158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=hN8jVDsho6t9s3H96k6A7m6XEBX1gFDgjV9l118SSnkhHQybmxZjF+1O5D4YyKmt6L
         FC9OTJzQeKGGu1/pcZP/zWaq/KeHJ2ptDIZyYUw4dOck8pOkrfC97mcbGvFuDdu8d4in
         Cv8ky/NjUrZZCJGOH+/NovGIBN9ZDuBg9ePIyelfh14uKiKKOsNh8JBQEYrQTpzvHCd8
         CLvRfoXJpkdCGBfsdzub0aq6/Jv8MaS3ik9AhPWvTowIE/KOv3gqRFPTAz2sahjAbkb3
         ExBNrJgyBZdUhFiaNwMOT8eNwLWXKJ+km75qlHhDqGNORA5OEyuPW17urFPd3OMElOsg
         gVyw==
X-Forwarded-Encrypted: i=1; AL+hErHSnX1exwBPloW3JKPvrxqh3r1+Q0TJM/9OUounO5LBeQ9pygQPXNxlbMTG/92DABfwzzGWfmQaIgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vIvhL3ddqDH/Or9Th3PrhKBQYdrjNW9+lFgr+PFpdeQcwdQWg
	cR/2RoMs8hFwZ9FzjfCQHPmwrHAYaPLUD1RthiNxBzwpNBvAmrkaeUAAHD58pFJZI6N9HAU0dny
	9CjWWFJo4FO4zJA4m042VZ76FEt3ibE5UslPf+Apb4g==
X-Gm-Gg: AZFdTZf6+Y9VePMoqAZKEqXg0RECFCp29v3lUuLq03c3H8im9aSl8iw2BAYmLMiuia7
	SS2SsZSau6lRMtTFAf/+P4nOlBnI6LJzQU4t6KrHEDvi/xmJ/9A9OV/2vNuJ0+/DSevCNVxJExb
	j06ecW0qQLdVuV5ForzpfFheDYcpgEUbdD+1YWFVVFgsr0r0ARhLrWa210Z9G3IKfFH+dGI1IwR
	w01PMQnsqMSJx7f8yg8gcoJwG9szJNb4jqpqJwQDmOxBMOn2aiXGxWDdvfc5Wiabwx74BUtddoi
	lVYeb/s4JD/qTg/fEb0/Z5sx3OOUDAdKLJyp3N1ZySgLBLYOba5u5SRzovn8e0RGssQJ1UqgB+W
	Gxmv06ijDRpdYJFAMAjssC1Qxbpqbcq+3rsyG/eOp9lKFM3lYaEfUok1BjKxouRLO8kkzQ6c=
X-Received: by 2002:aa7:cf85:0:b0:6b1:a509:875 with SMTP id
 4fb4d7f45d1cf-6ba37e66febmr9344235a12.20.1795640358409; Wed, 25 Nov 2026
 12:59:18 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-8-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-8-lee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 20:59:06 +0000
X-Gm-Features: Aa3M54qBKC7-tr-B2jw-93nT_AW_sr-oGI0v4yuTHgh0h7sm-7QQngWZhmScpnM
Message-ID: <CADrjBPq2OmgLjzs8qYybQSKRDBC5QK5DTrO8Wy4gbUoo0Ydu6g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Abraham <thomas.ab@samsung.com>, 
	Chander Kashyap <k.chander@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, 
	Tomasz Figa <t.figa@samsung.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Marian Mihailescu <mihailescu2m@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 16:49, Lee Jones <lee@kernel.org> wrote:
>
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, exynos5420_pll2550x_24mhz_tbl,
> exynos5422_bpll_rate_table, exynos5420_epll_24mhz_tbl, and
> exynos5420_vpll_24mhz_tbl all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
>
> Append a sentinel entry to each of the four PLL rate tables.
>
> Fixes: ca5b40293822 ("clk: samsung: register exynos5420 apll/kpll configuration data")
> Fixes: 9842452acd3d ("clk: samsung: exynos542x: Add EPLL rate table")
> Fixes: 8b4a7acf7b30 ("clk: samsung: add BPLL rate table for Exynos 5422 SoC")
> Fixes: b92981de92cb ("clk: samsung: exynos5420: Add VPLL rate table")
> Closes: https://sashiko.dev/#/bug/linux-553831f9-0a7b-4e94-be60-222de60ca8c3
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5420.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..35baeabf3ccb 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1419,6 +1419,7 @@ static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __ini
>         PLL_35XX_RATE(24 * MHZ, 400000000,  200, 3, 2),
>         PLL_35XX_RATE(24 * MHZ, 300000000,  200, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 200000000,  200, 3, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
> @@ -1430,6 +1431,7 @@ static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
>         PLL_35XX_RATE(24 * MHZ, 275000000, 275, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 206000000, 206, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 165000000, 110, 2, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
> @@ -1448,6 +1450,7 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>         PLL_36XX_RATE(24 * MHZ,  49152000U, 197, 3, 5, -25690),
>         PLL_36XX_RATE(24 * MHZ,  45158401U, 90, 3, 4, 20762),
>         PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> @@ -1459,6 +1462,7 @@ static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
>         PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
> +       { /* sentinel */ }
>  };
>
>  static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
> --
> 2.56.1.750.gf70dc682cf-goog
>
