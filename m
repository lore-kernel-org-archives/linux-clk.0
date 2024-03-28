Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD6130E50
	for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711648831; cv=none; b=OaJu9SJuzAX5LSjIWbk9C6ko22WWdXDejGHRt132WTnUdp2Rz7vbxlsrwLjvhNwN6E2s53qZXj/i0++1I/C+mdakWve+6G1qnVEpuDc10R06c8/BiVQumjCGFl4G2t34Mx0b1DW7xlFSw7YKH/BAMyrm9ZmSrV4BpsNzdo765b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711648831; c=relaxed/simple;
	bh=OUydAPp6uAcvd+QU+kjZdkJNOn3bbSBOUwQje8ZcuGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xula5h0+hnKuV5a2UqI5krxZ3MKEDJSmTp4drM2iAYv8xikxg0nq2cfKOcgnRdx5O8pjudJVCOfvj0GMZtw+IKM//yVFUAzH/75svolqhVKjS/yGxWSXsNpjuXRW2XrcLXS17mFsA4y+59W+SPtmTOEUkftCweIImuqNIZnYCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBxOLjEC; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBxOLjEC"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso923899276.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711648828; x=1712253628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKbfion+n4fQpm3TAmkfKQ03jeIchA2VK+TIGXUHdDw=;
        b=rBxOLjECmakZ0P+Jgp7LTlJ7fJhdQmE5hePtGDoMgrR/wXhtheIid6NF8DLlVG/O0t
         gDsm29z+5LKfrRf0VV8ICRTkCrJf49JPAVUgWLih/IBz1RLRbKgKrAzvSZ/XQNt3gD6U
         5rGxTtnJtqtfwe6dz7tEvTCYbXUnAgJ+SqD6O2tXdqKdzpBxM2+EgC6p+gBMx85PKR3E
         wLtu9H8Eyr1+lVGsicdSZG5Jh8J1aMOZ/YlfQ8Mq7MTbBXTMtr6JDYHrv3ueyA9zqskZ
         2TeumASDhN4N7R/jXyHS1yQgL0ewG1YpSknwpEGGX3tVTWSDgTMXQ3d1JHYf1rD9HLb0
         uchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648828; x=1712253628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKbfion+n4fQpm3TAmkfKQ03jeIchA2VK+TIGXUHdDw=;
        b=JuPOEW3qyg0ChAM1iaVPpP6qyo6kvrIM8cIfmmA1jNTPDxpfS57xwjSjkxHpHk3ifK
         GFW3BKQipjZpFC9vx6f8JNY24JAdMaIanqmPepSRReA4zYpCafH6Ds517frr1ZtxKZrx
         Pt8xnebXPP6hfU78dE92w8+ctX7hvtBdjUwQgJDG2W2uSQDk4lCQMg3rP/m8tKhdxR5D
         CYs3kK9SdeJ4L36SbcqEMzM+T0LSdI2+Gw4bx39Agyhxb0TwPuHYjPUE0K/Lc3w+6Czg
         yKhV7PxMhNyOHwMiuLyiCbUljMm/MsJDAFYzk2PJejaeKi1rCN9l/Zu1ATvUyd7LFxsF
         w4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7CH5nq3czyhCkZuOMYHt/fwQDFRlSWTL0biJVo08rFuhNYPWV3V3AvCWVrmDFsFJC+2Rs/xe9puk+ZLZPJTtgVOtBiOhOiRp4
X-Gm-Message-State: AOJu0YyNPdffgzm2HFOAOhjUsy16U+QBmG8RbhrOxpad5iWz1IroxT9p
	eTk6DP2qbXJ8Yx8mp9tk1J3O6xlhyHo1vrAQ9Ft60RIk3jvNbpcJCHL1XyMB3WWJIMOK/4IVF0c
	dxFOx+6aOGtAOcbo7Q4EJYjgd7epe+mW5u3qo9A==
X-Google-Smtp-Source: AGHT+IGHxMl2tnOV7GPTKo3pBywdHk3iGeVuT0X7oDfIzsFuQvKcAYE+hyVJY60/3ItdBMDUUFGB2g/T+7vhTuvUDjQ=
X-Received: by 2002:a25:b989:0:b0:dbd:8f9:a71 with SMTP id r9-20020a25b989000000b00dbd08f90a71mr44716ybg.28.1711648828232;
 Thu, 28 Mar 2024 11:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240328091426epcas2p4f227abb6cd7e710f49f4e61aa022f74f@epcas2p4.samsung.com>
 <20240328091000.17660-1-jaewon02.kim@samsung.com>
In-Reply-To: <20240328091000.17660-1-jaewon02.kim@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 28 Mar 2024 13:00:17 -0500
Message-ID: <CAPLW+4=kW3-h69_Ctx=MNE2c_k3iyTqZf7242wixRBz-gRkzkQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynosautov9: fix wrong pll clock id value
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 4:14=E2=80=AFAM Jaewon Kim <jaewon02.kim@samsung.co=
m> wrote:
>
> All PLL id values of CMU_TOP were incorrectly set to FOUT_SHARED0_PLL.
> It modified to the correct PLL clock id value.
>
> Fixes: 6587c62f69dc ("clk: samsung: add top clock support for Exynos Auto=
 v9 SoC")
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynosautov9.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung=
/clk-exynosautov9.c
> index e9c06eb93e66..f04bacacab2c 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -352,13 +352,13 @@ static const struct samsung_pll_clock top_pll_clks[=
] __initconst =3D {
>         /* CMU_TOP_PURECLKCOMP */
>         PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>             PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
> -       PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared1_pll", "oscclk",
> +       PLL(pll_0822x, FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
>             PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1, NULL),
> -       PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared2_pll", "oscclk",
> +       PLL(pll_0822x, FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
>             PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2, NULL),
> -       PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared3_pll", "oscclk",
> +       PLL(pll_0822x, FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
>             PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
> -       PLL(pll_0822x, FOUT_SHARED0_PLL, "fout_shared4_pll", "oscclk",
> +       PLL(pll_0822x, FOUT_SHARED4_PLL, "fout_shared4_pll", "oscclk",
>             PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
>  };
>
> --
> 2.43.2
>
>
