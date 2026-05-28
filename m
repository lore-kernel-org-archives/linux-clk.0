Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8127E35E1C9
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955359; cv=pass; b=Ncsh3gtIlZwuKfAGDCrRio0+B2qr3XtuqLCwMMCU7EQ4SBd7myiif4/sJEotDDtYujTcjteYkNCMD1psSb/d6Co2LuZNlxWUxnLhVNaP1f6D4yyn8wYSyT8bzZwDlcU7GhF4cX7h2GObqYklJYLmdY1MxYKPomao/5hsZsfU9Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955359; c=relaxed/simple;
	bh=bG7XwxaEW2IACHakSY7DuqwFmH+ZNFy25Crj6OOZINg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEpMIZlyKofybt4aWkDl3E4CcrwPwsLGWW/Qndhkbjl+f5Fun1p7tsaWpYhLxRI85Bc0ybIa3JBRuM2gReQDSUV9gGZkxSp8M158M+dOyhhdj4GJVvMyYyrhmIXcrnENn52XeSH+5DCAg2fkYW4WA9QNemEo8cLIGGRZhELbzoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnHvpziF; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnHvpziF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so9210567a12.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 01:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779955356; cv=none;
        d=google.com; s=arc-20240605;
        b=bwHFmgEVYPex4l2XEXYfOaACll+d9DdI+TTZRHVlUvIK5cnrvIgOKK7mvlPqN7Lc7Q
         TbwMz1Wn84UNw5yNmayspsJRJY3+i33Th/NCEkuI6HbKwpu2PQeDsYmDrvSW2K2VzL11
         u3gQZ2oTFGElI8yXAMN8sL1/eBkJOywFUqYBem+2KF1E4238cRrWU9GdboxI/8CsESm5
         CxWnISsmi3GgQlrG653ef1TpmVPy2xSpxzxmsJJfajpwOZ9Vls/p7ECMg+TsrL7JzrD7
         qwjOT26gNmKCPVjdKsUmUyYQyz29I0RAVikLP5fB9vyApXp1v5h4gEeOLaXt3QUWtGUy
         fa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        fh=13VEoppfYyjknCmjDs8Es6B4D6mTzNS+jzfYAz1YXQk=;
        b=lQYrh7j+4mVWqlotFKJcQh+D2SO8iEQ0QTIOK/a2G34ToY7oObAYCzyrvXq1j8WBBC
         WaA8u9tvGjbZMBRtmJKTUNqhInTETtLbTIndXKuBwbUYSVCV98unGQz0anMmcPQY438k
         Wiz28yMlWOqN7+WMSC5Sr2tbBuILMCUUsYz+RXfoSK1KoqARlMLwpJ6ndNzWa6Y2KlgL
         x2+ohNM9nhsml023sPEGB/2E7uta/JsVRswbBa4wIBdMptVKq+kdvUrms2Fhc1TGqNfA
         I+aE50upcdz3+T4yagtlwNa2NqhTC2/8E6HoCZrycXbTOgcOVJcKdi++Yhpndxgd3Kwx
         H5Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779955356; x=1780560156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        b=jnHvpziF8ekQovl/+kfv2HLkAgGo6i9HZx4vXObioFLgGq4EenVdy4/x0HJuJVJQ4A
         +8v4Rx1UunKzW6VwZPw/45zmfLnLDlq6pXL2d7shKxFd0sEUichANLiEneZukaMIcGZ7
         Hv0ecc9qExm0vo6knjymxantdEr3cmq3L982N7PzyaJcqUsFX3IfQnTpLRzLuL9nKQNR
         tyhvup2WNUVqoHw3cUAvJDKusQkW8AHlTg0gPItoj13ESPRZFi4jfgI6mYTHMI52okdI
         PLIXO7ePEy7O8QvsiJbwc6g0YIAlsbdkGRpFNZXiIpp3UDa4S06TNRPZtVaxmNYq7uJu
         +2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779955356; x=1780560156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        b=e4wfPIEA7ZNJ1jg0/2dZl1klNb1idl3uLg6sZkoIuLKvUSs7vF6hYjm/eruEX/J0ho
         NW6c97JOtNBI9q/fd5/babutZLFCpYFlqEiHbUXOBW1OHxelb45p5CiRR4JUSTMsEDbc
         pO7f2xU99UEol8wzGbXPcqQyGCvsiAuH8j96VbkGtO5XhJSVVWwQrgwP+fcOgmr5VcK3
         zF2l33TmLyy2gPLIqOVPKj5XKckdrtexn6qDxYDrXiB9LcC2s+QQIA4iIG6Hdcyn4LFB
         5+hzdTawMNYf76BLSfU6b9+4OBV5FfOb8Ycl9PVKQlelrD/HhJ27zFJGsKEvdIIJZTnB
         WhJw==
X-Forwarded-Encrypted: i=1; AFNElJ9WGk6Ye7u1ug1mdNh/f1nxwnmEI2Hc/FqEAgT2do61/A43Z4i4PCWoOua7z5F/89PESOpqpIreoNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnXRCaJ/17cdYjVbZyxFCYMgEVObu4FgMJZG5JhVzMdX95NhYd
	Evtjxzfr8rEkZXbnEQ4mEfr99tRrTaFRlEJtCEKuSFztxRNToWfmgyqCxE+En7pI6u/ljEeUPgb
	yj1tfaQ5ugZDZc9/uICiMg1TGbR+qBsAaEcuid6Gr+g==
X-Gm-Gg: Acq92OGY4OCt/0SJ0w45vxiMV0FM8U/mgbwTNWiR7A0UwVhHJtbZEgLtvOEImXGLioc
	SriPznIhALyWHI5Hkv1b+p9kleCOG3zxCoFzRd1Rs2HMTg6ghhFauB5OAw3YHrjp9aXd2ADL9Op
	N+kWfuiD10QbQNu8avbe5bHCdsvx292BpbruyLFqpoGhci8oOUrTyrMFJNJZ4+jUzBqIAzZjn1P
	xFRSsCGLo+WXpSbEBpNDtlFZouBU6C7Ai+oaSXIX89vdfmS84bJA7IpBsL8lNUtxbr4VYyOiPuG
	piDxxHEMwUE+B0uyWkzgvV9CwaVwFgXJWtP8zSTHcCSotF/HsxmU
X-Received: by 2002:a05:6402:458e:b0:683:f485:c63c with SMTP id
 4fb4d7f45d1cf-6889c4321c4mr13969121a12.1.1779955355656; Thu, 28 May 2026
 01:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 09:02:22 +0100
X-Gm-Features: AVHnY4IF4snH_x_Zty3iJL9-gZoieI2TfzLBtrQPLtenatLAkZtKV7qhQYKta-8
Message-ID: <CADrjBPrsynS5qfJrrVAFwY5kzoM4VcesMC0z0-aKcH-vaGL+PQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 07:13, Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:
>
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
>
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index baa9988c7bb7..0cd9b0392cf5 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device_node *np)
>  {
>         struct clk *xxti = of_clk_get(np, 0);
>
> -       if (!IS_ERR(xxti) && clk_get_rate(xxti) == 24 * MHZ)
> -               exynos5410_plls[epll].rate_table = exynos5410_pll2550x_24mhz_tbl;
> +       if (!IS_ERR(xxti)) {
> +               if (clk_get_rate(xxti) == 24 * MHZ)
> +                       exynos5410_plls[epll].rate_table =
> +                               exynos5410_pll2550x_24mhz_tbl;
> +               clk_put(xxti);
> +       }
>
>         samsung_cmu_register_one(np, &cmu);
>
> --
> 2.54.0
>
>
