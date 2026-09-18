Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18823859D4
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703495; cv=none; b=II+OTW5mq9chJofii6c4yGfPUzJuoJIGgXMyz6vEqHuPiHoT+g0zGColaFAQbXrLFzEZ8CLnguiTAQBeU57DVP00aY2DBVn80GrRzP6Dz5VJO4FYBTWsKmypJ3NXad0FzHqMO1Gn8VGAIy+66X7AqoeO/U4AvpZLRnybFcmpnhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703495; c=relaxed/simple;
	bh=7hm+e5haj6Zd35caTcNALHPX1QE1gwXURphY8ZG4f1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxJXAu9RVHHowL45U5IJZQNEoFAYidUq/3dz7LNUVk0TQjdFVsM5b/eUKt4FIZjhQQMrvqnyUe+7Sg1jJJEYK19XwawOTIAIv1shiRE4Ltu+HVouyKbqJ4mW+kqGewxUdsYTnCsTBpmYofrkCWqPezHDEdvHqKuf+DJaKTHLZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6oHwiAa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6oHwiAa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7F01F00899
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 03:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789703494;
	bh=llye9i9aXgouGRcz8NFjZ/wbpgSywkSkAscOcHmbV4s=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=E6oHwiAavZrq0lVaYiw+R7Om1iuRyBJXr60WqVvKcwLqyXQB59AGjyh7SPrh6tefJ
	 lsSJS7dOT3mOaDd5l4XDlKar5Uv7Z71gasebq36ZHOzMDXja2Ww7UkZeovk3O1yUpT
	 ppsR34/DYE/TLCIKCi1eHcQje7rOVCtf2xmUIRBS+IGkLa9baLKLHGMDGdqaNphGgx
	 m7ZfpOjlDkCe8wA1wxZ3JHnG+ZC1Ek+FexhD8jKFz2fAqlpRKilEA0kNqOngdTmTAZ
	 N2bl9980dwEx1KKtMDhXy16IbKooPv5RcKptngoMVDmV64Li6NPaAWOloALjdToDci
	 xUkbj5BxDBuVA==
Received: by mail-lr2-f28.google.com with SMTP id 38308e7fff4ca-3a2ff00b8d8so2881541fa.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 20:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWFG5s9W2LYaRvZ/8+lsYOY/l5Hjpg2srDXE48zxwTxTrxB+G63pIMkWbFssDuum4D7aTQmWWTGEE=@vger.kernel.org
X-Gm-Message-State: AFuF++mj3tM7DO7kR4ajURcCrxccjVYqAhY7Mk8Sm3iSyU1tyXJmAxqZ
	A/xmbgHbUfV7P1Kan45FOhCEFFnGV+OI+pFDXdNVjtDhy03Mwi7VPlkNnPtv/+kxxE2FhMJml5u
	YSeu/P1aXZRomEL1wUUhUg854nSDMLe4=
X-Received: by 2002:a2e:a99d:0:b0:3a3:7682:499e with SMTP id
 38308e7fff4ca-3a5fc0a7d91mr1738471fa.19.1789703492590; Thu, 17 Sep 2026
 20:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917223913.1855301-1-andre.przywara@arm.com> <20260917223913.1855301-3-andre.przywara@arm.com>
In-Reply-To: <20260917223913.1855301-3-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 18 Sep 2026 11:51:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
X-Gm-Features: AcwNN1V8Mf2lfwWc7xgI8OxjluEZlzfKO7oVmRLjPeBHxGQzIMFTeAetat816ec
Message-ID: <CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mp: support clocks with just a
 shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:39=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The "mp" clock models a mod clock with divider and a shift field. At
> least one clock in the Allwinner A523 features just a power-of-2 divider
> field, so support an initialisation of the clock without providing an
> actual divider field.

Please just use the single divider clock type instead. It properly supports
power-of-2 dividers.

ChenYu

> Add a check whether the "width" field is 0, and skip the divider
> handling in this case, as the GENMASK macro will not work with a zero
> length.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 7cdb0eedc69b5..3896cb94bf733 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsign=
ed long rate,
>         spin_lock_irqsave(cmp->common.lock, flags);
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
> -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> +       if (cmp->m.width)
> +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m=
.shift);
>         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> +       if (cmp->m.width)
> +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
>         if (shift)
>                 reg |=3D ilog2(p) << cmp->p.shift;
>         else
> --
> 2.43.0
>
