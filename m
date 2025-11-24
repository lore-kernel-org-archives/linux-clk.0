Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F125BF15
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764017516; cv=none; b=qdQHv0dtZ+WHhhv1LbvKt2EKuveu1e8o9WKWQ5YzhRRtiS74lCj2DzTJgLsAG8fzQJ8t4L0D22ArOJcRBzqQ9mKueBCRHGDhJ5cGP8/qTL3Qg4lwjSDpAi6sl+Ti1t4kpKT4exUcU7e/CIxrZa1VMtKj/CsEB4nEN+IhGvMfbNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764017516; c=relaxed/simple;
	bh=6BFNjZe8ORTR3sVnxgEjAoGriWJrUk47wmMEOvjSAC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaZHsQBe+I4/Y6vJCOiObSKTaCUC9jOyL+Fn7lxW3+oEPA71Iey8p53tz7qeoOsEkAEMXKKg22jQqp8j+qt328vRCB+6Pt76XAyFcpgLbYVElskd2ThpMqH4LnRZzGaz+R+SLtOxt5IiOTWJsixQV1wBn11jnal2NmO7yACvumo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RbI5H4y5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RbI5H4y5"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b98983baeacso2285905a12.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 12:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764017514; x=1764622314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6idQiT/Lk41XT3er1JulNtEcFMX7tPcBFqFIy23wX4=;
        b=RbI5H4y5Kkm62wlHUY7vIW818Qmhzvbs88DzRjblNlHNuyqrJP5iiTXW01bu2Q5g7O
         uNT0DQD45FrvHiifq+LahipKcs/k6Toh7bYEffeozhj4fiO+rWYi7YExVnOa/AbswWQW
         7mdBckDyDa7Rur/xwmehfC4xWG2apCE8UYLF92/RKUuaxlQL1dmnYQT1M8QnXuLE0DOG
         W1+7kS+GqHx0OV/a3L6yAKxmGcW3Fjof1Y//7F/9mdymDHhXo4rySw3MAKNEBITeC74A
         ANM5C+SW+hcTorRl/SeNmcvc0yP27lU8efnUeHao1CVczDgVgaKoGEqUwS8V0kZy3kbJ
         YI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764017514; x=1764622314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6idQiT/Lk41XT3er1JulNtEcFMX7tPcBFqFIy23wX4=;
        b=jb+8v0cY5+3PAzrx+gBmXhMXIeKTnhKxmXTx8JVu1Mdexvn6njnLXeA+GfgY6W1QK+
         YVeKD6BJxekU6siJ4mPhx5OljJBv9iGfdF+GfF2bKcCmjctYrusnpZl7ZnmDBmmORwgG
         qlkyaE/icmwil4vVgSEiHP8hmIc1Kp+24rqOi+BSLTbPkPlMxINJjgsMYXmfrZPkGMUq
         woCyrOREjjra5SBlJcVmhSp4hmdzDSX89VtVSFqlgfgLTEjUKsio3ygfkVhd0pM08ayr
         8xIgHjG3zBVpiVYsFur5PsD3Q6Vwj1rp2XLrWjeSgJvG0TPQWpV3qMWpZzUuGsGflfQ9
         MG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAH1Qr/Vm3NxpXE8j8AEShAUiqkPTVCiIxGCEalbgK6O5H+oNG6DCEJpGlFeBa6aHEg4b/k/HRMoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVNUIW6C1ENXPl0LzJxHUiIUt2CddBGDqbQP2oJAzluoygvjq
	cXDCbSzByYpXrt4AEMkqTu0fi49rOOCSd61gMil1RFVD3ukcs1IBHY5V10pTPdGZTqWw1h2VdSB
	SGhMl9O4hxXCvmAr90AG25pHBXxU7skalvIKeVuzI7A==
X-Gm-Gg: ASbGncv9JCPc0U/iyp3TieOucTcEL9Pj9R+4v9BgnEh8Q2uV+3u/1UiUN3be10C4AtW
	Ph+q1verDh/+Q+PGzgt4Q+KmgwfbVJbshp5JaawDWxOC8cEVWreN7KNIDLeMesXDIJE6oa3UST2
	/SyTGkb4PT0XreswXBHPPYOGCAe9QpNTnhnSzkuY8PFwQ7Estu9PkT2OspaAnTOvnxYWOMTdbUs
	2RVALFRh3WFn8xGiaunomzQGRTmcxEz7y8AfE0doCJ08QLZrGRg4SW0J232NsVHJfv9jWlLegLt
	Z8LQ24POfT7bQp6ZBBgPy0tW82nTqw==
X-Google-Smtp-Source: AGHT+IFjLWT6yOg2hi2wu5H1G4MoFcdeFYH0BRB30KFAuwP0u2IagJSBzMzfwB9OaD6Hyztv/D0RJutCW3MA+Q+DdWM=
X-Received: by 2002:a05:7301:4586:b0:2a6:9d86:48a8 with SMTP id
 5a478bee46e88-2a7195c9662mr7982342eec.17.1764017513591; Mon, 24 Nov 2025
 12:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
In-Reply-To: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 24 Nov 2025 14:51:42 -0600
X-Gm-Features: AWmQ_bkR6_YnQmKNQToJOLZtI9vyDFo3HYMS0rYpoLLIQEjyJTPF_i9DJ12NbWk
Message-ID: <CAPLW+4k=My6np3uKoRmODDVbUekTs+yDdBbwoH_Ba743sRQTRg@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Assign .num before accessing .hws
To: Nathan Chancellor <nathan@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Salvatore Bonaccorso <carnil@debian.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, stable@vger.kernel.org, 
	Jochen Sprickerhof <jochen@sprickerhof.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:11=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero. This
> occurs in exynos_clkout_probe() due to .num being assigned after .hws[]
> has been accessed:
>
>   UBSAN: array-index-out-of-bounds in drivers/clk/samsung/clk-exynos-clko=
ut.c:178:18
>   index 0 is out of range for type 'clk_hw *[*]'
>
> Move the .num initialization to before the first access of .hws[],
> clearing up the warning.
>
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __cou=
nted_by")
> Reported-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Closes: https://lore.kernel.org/aSIYDN5eyKFKoXKL@eldamar.lan/
> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-exynos-clkout.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsun=
g/clk-exynos-clkout.c
> index 5f1a4f5e2e59..5b21025338bd 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device=
 *pdev)
>         clkout->mux.shift =3D EXYNOS_CLKOUT_MUX_SHIFT;
>         clkout->mux.lock =3D &clkout->slock;
>
> +       clkout->data.num =3D EXYNOS_CLKOUT_NR_CLKS;
>         clkout->data.hws[0] =3D clk_hw_register_composite(NULL, "clkout",
>                                 parent_names, parent_count, &clkout->mux.=
hw,
>                                 &clk_mux_ops, NULL, NULL, &clkout->gate.h=
w,
> @@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device=
 *pdev)
>                 goto err_unmap;
>         }
>
> -       clkout->data.num =3D EXYNOS_CLKOUT_NR_CLKS;
>         ret =3D of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get,=
 &clkout->data);
>         if (ret)
>                 goto err_clk_unreg;
>
> ---
> base-commit: b6430552c8cd95e90bb842ce2f421e7a5381859f
> change-id: 20251124-exynos-clkout-fix-ubsan-bounds-error-93071375ec78
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>
