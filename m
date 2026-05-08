Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DA0322C6D
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260952; cv=pass; b=dKs/LkxFjdavrYC0W/84/1BIcn5eqAEtG9mZQDe2N0HN1I1I/PR6iipk5HbW39KmldvfJJX7JHBnu9qvBEy0RwzsTX9vs5PQHt+HVTuXmALWQpwmCYlfok8nycGWZ25rRBqHVAl9mEb6iD3XiCrdZuu9UluBHkU0IxhLqSgBqsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260952; c=relaxed/simple;
	bh=bhjgliOCQpf3UnZBKOdagDkW2QpmCx/wb7qbG6lkCT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoSQdHT1OXzgrH0izfjtb8UjJphKiPUszQEH2iaJD+LMARO/YHN5YQ9CGQXvNjPKh5/UXpfXVDFZTlr9HREWHZaALu0wmH65AXC0QngVDesYD2UNc5pl08ahfLd07inxN/WSkBHrmwnjQ16blAqT2rSRewG1i3NKsrzV/vKwqks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2necLGa; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2necLGa"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c21049dafso2323012d50.2
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778260950; cv=none;
        d=google.com; s=arc-20240605;
        b=eJWEegVDo97v4INLyw4pLa2tT+rAyl3OpqxpB8v2JUH1TD4Bk9U/TLqtsS2zmRbV9W
         YSEHxtQahW3ACRlfbb+GmcRkSHEKi9C4dg/6hXWSGLd18SI8cwZW4zKtgtSQ2EdRKoxn
         a8iDvz09vdHKqy8xB+LitSsKZ5zb+PwYNG5obzxz8LN39wbNSD+hu885Ub7DEhLFmzLT
         ly+7XgkOlx0FdwP+0b9lPVmS418HreRr3iQNcSAEuHIXVhmW+AQpzGhQMh409kyn48Vy
         bPWHH8MlrqV/4Gk7wR9Vc+mYEGmXQ/jaGWDCGoB2z872r+yJRDKPj6+/8yHL1i8+hwYb
         N8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        fh=xr9IPr1R80dfpMUYxO/hn78cf6O3H8vf09TZGSmYEHU=;
        b=SdoNe8EEorfDUFEpvo7qdCfscgsjV2L/tOyyWJAQr3sg39Qr7z8pjcdoUseFLRTiiZ
         TO00eMrDSwGS1CQVsXcsa+UT24/xyyVGXt7l/G7qxoBzHw4pFXDCTtu2b75bnXrXRFrL
         C3BBvdeRFaS7EDZe+gEZE4sHW4CjYg/X/dH3EkW2JLQkiBtPZAvHsADn0ih+wUkt8P4c
         hHnphWvVaggZJ5ShE/y/UtsEDWUihVGEjuj4byVTGQQeyFdgCzeLme8eWxoaz9v3htZ+
         UUiPmOnTC4XLB9gvsrFxGubQ8kgTemTp40DUsqUXZOzuXly03m36xMuhR0beQNs8/la+
         m+Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778260950; x=1778865750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        b=G2necLGa2+hUMZePBrI5kC3vDBQ5SUBwer/Rl/tag4v6yKEcqfdrlA4thyZm9PB1Lg
         ME7lIN+WWxkVDiGErKSU8oapaFV/fJSvD5ErrBzJQfWtj5tz+yPU7b4GtGQfFAvp7i/Z
         eJBVBscOqRA0eM3ua4/uGhbgMc5PGMdzKF/KMTSUOqPkTTVz8N7biYYJPYfTkVSvpkbh
         C3pzG9nJ4z/H+BZaD1/sOEd0kBmAym0qC0R6CdV1jNTppJwhgCu5k1j9sAKqbWT6AUeQ
         zWoZW3ilOcmpOgPIn86vj48csVwPlWhTo2yUod/1pry+MERbUcH7N3w/NsKnUCI5S70V
         21xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260950; x=1778865750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TwIRY2nZA1VjJMy/1brhO0GpNrd8SUOXjsMr4w1IXQ=;
        b=C5bmClSUKgiyfSMmNzVp138tkw1oPegZLQYv3GU5Z+CFpNvZuYcplDGXPjTqQll7MX
         BaZJDPXbwzb+Zl34vgTIi3PN527NrXAqkDcGYbFIeu4IMSM4OPTw3t7n4tqNCKjGL/Fu
         9gPiadyoCGgVWPTL8cNWvZDbJsy9AYrBYxytSuKiQuxaSiStNCDYZh1lg9wKxDE6Sqic
         Js1Q6E9WsN+rBYXeFfg/wJEXNzsjq7Fzd2ae9PPxPauZmBZwoVSRLgySvwyzjvCHPJWa
         LXTkRMKRQa7xt08Pk9riqvKqY04WqHmJij3ejTtUIH0DbIjuJl82pEQ0q1l+vq7Je4D4
         4e4A==
X-Forwarded-Encrypted: i=1; AFNElJ9oFuqFdmfiuC75XvouZftLesqCZ5yb5Lvm98k0ERXustizHweViqqWhkDtN+WkBofWR1oz7NCNQEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtzgm7n3IcgesrHcjaqK2PGVjPkndxloVR7VUYYS/ePWqq0kRP
	mE8yfxARHYRjdCfnwhmBGaDAx8TaykQa7vqSBHW0M3xDarSVRT4QZWaGHY1+e+Y3+c12nojgl0O
	So9OpMtps3T3HKCgGdFaC1WRYMxu4AMPdhaMrDbBrGQ==
X-Gm-Gg: Acq92OHta9GMkBuu1zhb4n4gnHxdgOJBRyZeBE1upDw43l9Mr2Dk3ozQ28K1pThu3Rd
	G29ljOhPnhEQ5hJ86PVXDQvck+H8yj22L1eU4yPYee//b/wShxCidSxKnC29HBc6+gd2nCtWBFg
	c4/UrktgD5PJjOWce0NRA+wmgq/ETbk8ck4pZn/WsvXVTuLwlCIatfxB+L3S2XB2q/Fi1M+qRti
	81ET5abhfOhsKCAROkQWhZgexfBnRWguZW1sL8+D2Qu3mbyqwsm5IFpNujd31IpIcdNfPcBj7E0
	DzHkGqDN2D6vlv5w+dTx1iicd8x3jOUrc0iWvzV0sw==
X-Received: by 2002:a05:690e:400f:b0:651:bcb6:888f with SMTP id
 956f58d0204a3-65d94b499damr3535814d50.15.1778260949925; Fri, 08 May 2026
 10:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 8 May 2026 12:22:21 -0500
X-Gm-Features: AVHnY4I2OawrzI6xYvjWNwRGdaLspFjoHiDADtZnKv7uMu1NzvUcqwurZTLYMoM
Message-ID: <CAPLW+4kLyzUv-tstDezbqJetOLuPkzQ_Kt8EGBPy9U861q=7uQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Brian Masney <bmasney@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 6:53=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 APM co-processor relies on the I3C bus to communicate with
> the PMIC. Currently, there is no dedicated PMIC consumer driver managing
> these clocks, so the clock subsystem automatically gates them during the
> initialisation. Once gated, any subsequent ACPM communication with APM
> results in timeouts.
>
> As a temporary workaround (and let's hope it doesn't become permanent),
> mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
> prevent the clock subsystem from disabling them. This makes the ACPM
> communication functional. This workaround should be reverted once a
> proper ACPM PMIC driver is implemented to manage these clocks.
>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynos850.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/cl=
k-exynos850.c
> index eb9c80b60225efa33d85f5f3c284eb8a63a48015..b143a42293f5a154f53a86d4e=
97e17a3e61164f3 100644
> --- a/drivers/clk/samsung/clk-exynos850.c
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -686,10 +686,11 @@ static const struct samsung_gate_clock apm_gate_clk=
s[] __initconst =3D {
>              CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
>         GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
>              CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
> +       /* TODO: Should be dealt with or enabled in PMIC ACPM driver */
>         GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
> -            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, CLK_IS_CRITICA=
L, 0),
>         GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
> -            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
> +            CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, CLK_IS_CRITICA=
L, 0),
>         GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
>              CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
>         /* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICA=
L) */
>
> ---
> base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
> change-id: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154
>
> Best regards,
> --
> Alexey Klimov <alexey.klimov@linaro.org>
>
