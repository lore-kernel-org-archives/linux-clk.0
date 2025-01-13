Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEB1FBBD0
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782410; cv=none; b=EuqRGoTqZueLO4jZG6V1k+JjCOWSt3DXPz0B8s/Wk1HgYvkbDr0dirkMAljraJEG2Bfn2wzoRv2BsJty0FF+WciNqYoQACo5tMdpTX8mr4XfdvxjIzOdJa3Hn105Jfs7jmFstFy5BYAPSedm4fJ3NgGVs5Lrt4i7xQ6XMniD63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782410; c=relaxed/simple;
	bh=yTHqEISNgRUayH9CEv+7Ky22omesEucD+Ly57lh61ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlpEPfC4I/dqLD4ftJrRRBE5qFgEKZ1BMhAH9XO0UIDl5q38mPdaCSwbmqkg4ScF3SZFjqBoPEW33lOGRHM9dv7NRi7M3QV1lbya8GSUqw7ERkF5tbe+bbA4t1mepD3asF+Au+GOZqdLyCwstZmVmKFzjPNre7B/lGQQCAtDO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso1892094e87.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 07:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782405; x=1737387205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMO1ehTiBUYEBAd5/n1ftLnQAH5SeU5tVjatLn3yZxo=;
        b=jO7bL3hEtJrZZz/9QJgxFXx4FWBh2XQfALDMwsTOMM+C4okG1HLqSKTVDAawGYP4ym
         Bh2ngzojSFDXdqhNXe2UedwxEKC8Rmsf1xyM1kv49oOVO0PFDYbhqm6dynDtqhv2b9N8
         xMQlT0pNCdjzq0LDRDwaa6KVk5/64cjbso65xNKFam832fP3RYsk5JPvlIJsx+ZNk9e5
         CiGGyPrZKN/3d2eDGgGHzymCqt+aVrHZaMF9vC/w+/9ntlWwL85g5LKR9atpHByuYrSu
         f3mzjxRxNeN/TlwMXKzCk9iaQy9Zps3kUvJapSzskze5SBeBSw37QbsuxuBzZX5t6HIB
         QjBw==
X-Forwarded-Encrypted: i=1; AJvYcCUIeGEsXQ2q3rWv/6ukr3wBB/44hLpYB7wsT1uJZu1f0TK+CW+fPABawHIeIZHWFanSMamEF/FLhaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWbHLRyvgP6A2dCFVVsVF7JMZsyzUhFGe/BWN6fugpIitLneG
	zu5DqdFPzG8wse9fpIZZytfP2pCrDPBkouP/OO/wc5pAB83ftHKFEVTLdGasOkU=
X-Gm-Gg: ASbGncvMSJSNT1a92czn3Pa1keTG7X/m06+9sKjyzdIUWANtmTMd0u8RacnnaGEz0YU
	bkNMJw40/U9rQQ9pEPhEv/XwFgG50TxVltG9VJbqUhRyvrQkeIFUYvtW71Cl256Wi6qwCA7FPS+
	G9n3XEFwzhw2MFTTR5nll3r6lqwNOXfd/TTLzdOZ4TXP829s2C4ld76Q6WsyruxOcodvNdYIlcX
	aied9LSLL0d+dn172wmn00pTcb5DR3DkRSNZ4bbAPcPfR62a0pP5Ry4B3x+eStVJ7JCJy+ZqRBV
	lIVjSXqK8CNERA==
X-Google-Smtp-Source: AGHT+IHW+T1IA66Pz2sfotFJh1wjB5DVvpeI7v/otSp9zWMz+Kw9hFW6uEZM3zfWezvUhEABCIUZBw==
X-Received: by 2002:a05:6512:3094:b0:542:28e3:2155 with SMTP id 2adb3069b0e04-542845ae4efmr5739959e87.6.1736782402847;
        Mon, 13 Jan 2025 07:33:22 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6b48sm1356147e87.153.2025.01.13.07.33.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 07:33:22 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so40905721fa.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 07:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqO5rI6l4rlYKha7PUTKKRTyQ5Khx2tmgN9SMhARxS+FOw3hrSdSKXwHMLOMwko6VS/JMJMNbYads=@vger.kernel.org
X-Received: by 2002:a05:651c:887:b0:306:124c:69d5 with SMTP id
 38308e7fff4ca-306124c6acamr38561941fa.34.1736782402241; Mon, 13 Jan 2025
 07:33:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025105620.1891596-1-andre.przywara@arm.com>
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Jan 2025 23:33:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v67aDGR=oVbBCv6M492L2MdcnuD8pugVciSeujy5Druw4A@mail.gmail.com>
X-Gm-Features: AbW1kvZj0Eas5i5rfPRkek1NJ1CRUjBzE3zaOM_q3BEvET2T34lYAwlvKL0KqfI
Message-ID: <CAGb2v67aDGR=oVbBCv6M492L2MdcnuD8pugVciSeujy5Druw4A@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Philippe Simons <simons.philippe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 6:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source)=
,
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Stephen, can you pick this one directly for -next?


Thanks
ChenYu

> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.
>
> The same algorithm would apply to the A100/A133 (and the upcoming A523)
> as well.
>
> Cheers,
> Andre
>
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 84e406ddf9d12..85eea196f25e3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] =3D {
>         SUN50I_H616_USB3_CLK_REG,
>  };
>
> +static struct ccu_mux_nb sun50i_h616_cpu_nb =3D {
> +       .common         =3D &cpux_clk.common,
> +       .cm             =3D &cpux_clk.mux,
> +       .delay_us       =3D 1, /* manual doesn't really say */
> +       .bypass_index   =3D 4, /* PLL_PERI0@600MHz, as recommended by man=
ual */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =3D {
> +       .common         =3D &pll_cpux_clk.common,
> +       .enable         =3D BIT(29),      /* LOCK_ENABLE */
> +       .lock           =3D BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>         void __iomem *reg;
>         u32 val;
> -       int i;
> +       int ret, i;
>
>         reg =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(reg))
> @@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>         val |=3D BIT(24);
>         writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
>
> -       return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_des=
c);
> +       ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_de=
sc);
> +       if (ret)
> +               return ret;
> +
> +       /* Reparent CPU during CPU PLL rate changes */
> +       ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +                                 &sun50i_h616_cpu_nb);
> +
> +       /* Re-lock the CPU PLL after any rate changes */
> +       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> +
> +       return 0;
>  }
>
>  static const struct of_device_id sun50i_h616_ccu_ids[] =3D {
> --
> 2.25.1
>
