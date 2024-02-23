Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F5C8DE
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708663433; cv=none; b=NfRSFdUOQ0RcxE5sHPh94lcGns+lHgMlfRO+9UztCIeV6ejfK/EfJq7k+nZ9oeBuuzeUx2wPIOOWnI/MmQZCI0qnD0uZ3OqTWGdo0cqey4HUXbwqS+kPNsSpYaJXc8tpPjoHWtAZciHYBqjgvzuSfyBWhSV1UnMePzg7gE8B5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708663433; c=relaxed/simple;
	bh=Ca4fxX1YOQIc9IaTljm5TL6Wj+BZP/Dp47VTszaskxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiAX+5EIfxuUWzDwO4iQPVtlIY1gSCi/tZgzJxP+arl/+E1joBSV9RKIcQy/OzJaqTiqHsWpDUkv6BS6qYT4qrW/Z+3iwGNeYjU4bHCPI+tb4+xfgpCOGUb82zzqhNBtaYthvsT+R7C8bkRK8AKFQZz9QZRKrJTiTAYoW6pa75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b76Xqx/F; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b76Xqx/F"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512aafb3ca8so500646e87.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 20:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708663430; x=1709268230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBx7MOkn9wW9DxztfWR4DG5bZ9dZsBTrKJsnaVTaV5I=;
        b=b76Xqx/Fd4fzyl8ovMUOV499M5dh2vDT5nCpZ7S7dYHGX5yRGIB7Dkr3rrGhgp/zIJ
         WQwu+BWTTlA+NcZv01ZT9lwh22qwk5c4suPxymiEYPF7toQomjQIIfLHRhVUOrJGrE2d
         4J/1k2MZ/HNPPFkuxAiqZf/ZWcU0pCOOLaUxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708663430; x=1709268230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBx7MOkn9wW9DxztfWR4DG5bZ9dZsBTrKJsnaVTaV5I=;
        b=nXhSzBZCNlHAGU+lYuwfHrs5yrDQyx4BEn1Z9TV2jzKpj28Yb4jJba+WNxYwV4yb0H
         VB1ioSFSOFn/EB6ul98PmK6rfpU0M9QvP9Ujni4PTiTgnyHdvJmRix/3W5QclSaAnd3Y
         YNtOBrIKEYprvCUZF4HFiO7b8CbgPtaQQIqOVvNynDeyJEYXHG2RPfpuScrAh7T7MTHG
         6IOjvVhY1pp1rteAgJ8sSSDhn6AYThF0fMmDGa6HnlZvnEv8JGBHDqCjYCVrSLpZ8TJE
         OaHWLCmvNvZvq/05Nr0lJPAMmNzxEQrkl59QJS4LwbTaY09LtPw/txsv5bhGyLVJnfSh
         jBZw==
X-Forwarded-Encrypted: i=1; AJvYcCWQDInpUbcIOUwxKezMR5/QQ1YSnOaw91XSvqSRyl2x4FcMm8PrY3+Xz/c206OLHhYDzXyMrLt2DaV6tLR4dvnx4fqlZVj6egvA
X-Gm-Message-State: AOJu0Yx8SRZJsCJbBmijP1SJ8D/p8AlNwrkQbCnsCivHfdDVEbPU4wbA
	dgNEeho8b9m172dYed2R2SlIyst1eYAhN8Juf3hrUwEXcgS/zcE1YbhmDdAuhhsOeCKM2AE0bCK
	y32FjGm+MwDOA4GJ3x+yrW16tXPJdDLhv8fK6
X-Google-Smtp-Source: AGHT+IF5QOowQOFza4xh4jiRjjWLNuX1rVomW/9NM2WmASfwoESsVYQHmb/UIiIOu30QnLkqolbWhZLkQamy3+pnN3M=
X-Received: by 2002:ac2:5984:0:b0:512:e091:cb1b with SMTP id
 w4-20020ac25984000000b00512e091cb1bmr566669lfn.13.1708663430207; Thu, 22 Feb
 2024 20:43:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org> <20240108081834.408403-2-treapking@chromium.org>
In-Reply-To: <20240108081834.408403-2-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Feb 2024 12:43:39 +0800
Message-ID: <CAGXv+5GoAauw77wVXx6SXsSma9zP_A1vXLRo=GH2ptjvY=kLgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
To: Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> mt8183-mfgcfg has a mutual dependency with genpd during the probing
> stage, so enable need_runtim_pm to prevent a deadlock in the following
> call stack:
>
> CPU0:  genpd_lock --> clk_prepare_lock
> genpd_power_off_work_fn()
>  genpd_lock()
>  generic_pm_domain::power_off()
>     clk_unprepare()
>       clk_prepare_lock()
>
> CPU1: clk_prepare_lock --> genpd_lock
> clk_register()
>   __clk_core_init()
>     clk_prepare_lock()
>     clk_pm_runtime_get()
>       genpd_lock()
>
> Do a runtime PM get at the probe function to make sure clk_register()
> won't acquire the genpd lock.
>
> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Note that this compliments a patch [1] adding the power domain for the mfgc=
fg
clock controller node, which has been floating around for almost 3 years.

[1] https://lore.kernel.org/linux-mediatek/20210414073108.3899082-1-ikjn@ch=
romium.org/

> ---
>
> (no changes since v1)
>
>  drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/media=
tek/clk-mt8183-mfgcfg.c
> index ba504e19d420..62d876e150e1 100644
> --- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
> +++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
> @@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] =3D {
>  static const struct mtk_clk_desc mfg_desc =3D {
>         .clks =3D mfg_clks,
>         .num_clks =3D ARRAY_SIZE(mfg_clks),
> +       .need_runtime_pm =3D true,
>  };
>
>  static const struct of_device_id of_match_clk_mt8183_mfg[] =3D {
> --
> 2.43.0.472.g3155946c3a-goog
>
