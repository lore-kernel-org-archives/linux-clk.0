Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D60F212198
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867786; cv=none; b=ocOd2g3kYz/Tdl42hvdjiP/wZNOKa4/xOb+QiG8zDXVizeSt+hlinuPCgnMjTL0kbuSZQh6E7efbY7JqbEsP0THlxqmeWC6071ptsVlzoyqFetPtHDYWO31Gz/fChyvLObszUlxnuW7lpxqpL9YkAp+BEUkD4nsKdouopXitQJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867786; c=relaxed/simple;
	bh=DGrP+X7ynEJ80b1Ksbh7faaeQXhaDe50vFOPjYI2u30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRkTFOHjq7buohkYqsh2Ky0YIMnjv6aX3Z3+ZhSnVgBsLPJ/j3diwTSY48DFS9BDBbLvqgzyzwQ0WfeJZpg/SD/EeHOefhvWbWwlJg5rvvgAJoDsBvyXAWeRi8j+npIKlW7SgAD6So0XbHdM+PQJ5PUOoKZYWSXKnlzVtNdgZks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so2294158e87.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 07:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867781; x=1730472581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/svTJLUuZsHOgIxMPFLO/yUUNAOW9dJ4W1In0LnFdY=;
        b=vtbSZsrjLbMUSvsjursnQCExiXbIyz2HCDB5FBmFdilskSNEYHb1MgD9ygPD+Lkhax
         w6EWyQILWffK2DYFILezw6RfYYnWiDyvtHYz0my4uLR7HIdk+gYW1fiLddSg+ocdnkRL
         Sm2BfxjXJvqCAh0hOXljFdvEkDuOctJo5ext7mcFF7PT5KJZkYgBOj6HUElSqabUwjj1
         LCiMLWWmCxiqVk1G8smrKjv42KnscQ+auq+PK+l63lKnBFSdcJ1MvLartwmJmL+T9XWP
         yhoTP6WYeG/6ssHSzhXQM2ec6xnMmBfulbSBiEktjl5rvBMjr+/FYEzvmJQGvUjh2/C9
         FAjg==
X-Forwarded-Encrypted: i=1; AJvYcCWaml8zuh9/wDb4olywU4EEXmswNt/eeKkWOgE7duIxvUlw6qolnXV04A22xecH+5ntUm9NNirK0ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/EKlQYyBHfDo9W1UNiV/w3MXnOC0/4MGlq1bHbq4BBv2m1fB
	WcYwGEi84DA0XdzHm6tiSCnhW5WPJIvqbXXf+5XHUE8HeknBuClrkWpJhf/94ZE=
X-Google-Smtp-Source: AGHT+IEtlsgLjnqhrRI9qjDnaabpZ55WwH4aL6hl6aJNoJKmHZa0zeVxJAsBNZ6VPloBAickBRzIlg==
X-Received: by 2002:a05:6512:689:b0:539:fbfe:418f with SMTP id 2adb3069b0e04-53b23e1fee7mr3385585e87.32.1729867780826;
        Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm208300e87.200.2024.10.25.07.49.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so19018961fa.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIXVB97HFNjY88mzLNRhVYzoEaAb0GUjwpwBI9MM7prBQHFPoifC1unOR4Xs5BkSdhsdcIMnWGEu4=@vger.kernel.org
X-Received: by 2002:a05:651c:1504:b0:2fb:4c08:be08 with SMTP id
 38308e7fff4ca-2fca81d81c0mr28886391fa.11.1729867780288; Fri, 25 Oct 2024
 07:49:40 -0700 (PDT)
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
Date: Fri, 25 Oct 2024 22:49:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Message-ID: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
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
> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.

IIRC we do this for all the other SoCs. But if you want to be cautious,
we can wait for Philippe to give a Tested-by?

ChenYu

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
