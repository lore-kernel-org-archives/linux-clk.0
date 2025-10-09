Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2A2BE65B
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759993691; cv=none; b=rHix4XCKGyaS/Oh0IMMDBBkFNC3vAQKZFoHinuTRifKPEBVQ+TMk+XodAafzE+ok7n/O3JTVkaC6G2YHnHrcihx5w01HYrtmP9w3Kglb8FnhRDkaY2rNIKYcY+YQNESyBXXYliAWu136W/v8yBLi9ll+jn4CqkFv7/UHcaSm5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759993691; c=relaxed/simple;
	bh=LhYyzk6WfYJhkKhEyLTwv9qmYjmpZeKxoucLrJ2XuEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpIX5e1eAEkhx97JIz/1HA2u8t3u01TUOpAACirNoprvNA3B/14AhpaIzu0VPYmwcT1lTE61SlSAehw/LuInad6Nep/isY5gZwDblBcDBmcqySsa3AQEIx/z1u2M/2xTaW5LmUfU90lL6e67HImNdxTi7feYpwIbd17geTOks8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y3hBbt8z; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y3hBbt8z"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-373a1ab2081so4869371fa.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759993687; x=1760598487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=;
        b=Y3hBbt8z8AwSILzcdkl6Bwx1zj7jBg53Puw9j1ElP818AHH9BIixjKVyOf7YpVu913
         icKUHN92dLdHT45wRQcU0tg4N5eRUHAM1PRZZHE5zqt4BFCks5+dWLcvZjI6HguWdYvo
         M6KnJcRCdR/J1RTW9Dg7ulpu6Se3NpttfzPR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993687; x=1760598487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=;
        b=fDq+KQqhF7r3XWBbKk4d93L7NRzRHfByaybOpTAb6ZuX1xngJPZoJBDZwukYT+lNvf
         J/zuMEEOACqT2+WL4pcVP9D1YipziCT0pOrUvYvZNmfmoFC34igpVNAA6mTqtyuq+0iI
         0DHS1j+4OAwfNPlt8v+vSg1iMJk5x8ZjpY0qr0q/iC56rFzKYO+rDMyaZaX776hcRK56
         sw/vpnYqWi17e0Ks6VW1eV/mI88vcTpG0OqzTaKXuZ6HT/cyRXMF6GzH2RsbBFVA6MLa
         NBm6iTuZzlwDvDeEvWdbXxomL4L3gCcgJ3O3IsnpSiqrqFXOBOo2PtAEv+qZ71+x/9JR
         CNOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYSU9Uh7iI4QVjABlHBjYaC1g18ADWBKKaTacUCBqct1QXOWHKvqu51mv9i+r+u9pCh4MjGxfaIxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvvoxfivpuTY7/QVaaKh4R0wTdfVo2XyqaVi+v+HOKT185gqdI
	Hfhul+YZzak+8Sgl8RMS59GBIznXco3YboMnGJHx/FCPmxO7KFuXhc1WFSfw+VWFB6KMvBVO4DB
	dCj4vDTarucw0jAGwk2IwtByCYxoQCdRtbIpH8Q/K
X-Gm-Gg: ASbGncs6rt5NHWogLWn3XXy/PBZ1zVi8UExL/ipG1V8qE+i2wHZKNvS6xVabPxYoCZ3
	tLSgQmdCeuSOltAIPx6GEJfotrc5il6IEdSYuyfUxgeeAQQyKil9TMwxY6PBHFLXYubvj4aOVeo
	L2IltN6TSCaoK2LJWKw3xZhTLWmZXyYF9PKuGdxjyxaIDJkN7Efvq7TuFhwZimnNFA1eeQ2kc3n
	LcUlTLix7Kypri/JBSOKwFNzFtbv9XlZ4tgM1yAgkF0k6Xpj4EpgRj+CnJReg==
X-Google-Smtp-Source: AGHT+IHRoD8fUFYarUIhK/FMKZGr2CwU3Gj3Lvi6h5d/Em4hrbue6QlrL7H+4NXmnHM+zo7hkW3w3oPsj8Dawmy7Yjk=
X-Received: by 2002:a2e:be26:0:b0:365:6b40:8687 with SMTP id
 38308e7fff4ca-37609e0ea58mr13923031fa.22.1759993686781; Thu, 09 Oct 2025
 00:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:07:55 +0800
X-Gm-Features: AS18NWBxQ-yW1drBobxZE5-xVOr4CwQCIc293oxeKqSrQOU5dPVPYMgKJ9ACvWg
Message-ID: <CAGXv+5F_xeC_sGNB9Aev4CQbC_8Vo4YA1u7K60oKu8PseL=Qhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 12:07=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
>
> Add parent enables/disables where the recalc_rate op is called directly.
>
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents en=
able (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents en=
able (part 1)")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98d=
f0c0d2ad244eb90 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *c=
ore,
>         unsigned long rate =3D parent_rate;
>
>         if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> +               if (core->flags & CLK_OPS_PARENT_ENABLE)
> +                       clk_core_prepare_enable(core->parent);
> +
>                 rate =3D core->ops->recalc_rate(core->hw, parent_rate);
> +
> +               if (core->flags & CLK_OPS_PARENT_ENABLE)
> +                       clk_core_disable_unprepare(core->parent);
> +
>                 clk_pm_runtime_put(core);
>         }
>         return rate;
> @@ -4031,6 +4038,9 @@ static int __clk_core_init(struct clk_core *core)
>          */
>         clk_core_update_duty_cycle_nolock(core);
>
> +       if (core->flags & CLK_OPS_PARENT_ENABLE)
> +               clk_core_prepare_enable(core->parent);
> +
>         /*
>          * Set clk's rate.  The preferred method is to use .recalc_rate. =
 For
>          * simple clocks and lazy developers the default fallback is to u=
se the
> @@ -4046,6 +4056,9 @@ static int __clk_core_init(struct clk_core *core)
>                 rate =3D 0;
>         core->rate =3D core->req_rate =3D rate;
>
> +       if (core->flags & CLK_OPS_PARENT_ENABLE)
> +               clk_core_disable_unprepare(core->parent);
> +
>         /*
>          * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
>          * don't get accidentally disabled when walking the orphan tree a=
nd
>
> --
> 2.51.0
>
>
