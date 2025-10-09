Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA16EAF9
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759995218; cv=none; b=QkyZoWqN3VNdnBPAb3xETx6A8rLRVNKQ9RRwWvO1TlFuwNyQLji6AE75UFwHABg/gf3+zPwkr0Ehmx7f1nQaZ1cldyNk231VU4lrfdEkLhfouDm5lN1RKSNXAyLnSlow01go4FCtfSHD9EDnJF+WXNlwiJbtDfjxPqwjyJEbR+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759995218; c=relaxed/simple;
	bh=G8OoxQLaFK2PaPDhEJDRVm1b1vFwiUVvBv4LPzwja2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmLZSCNZs1cWBlOmMhjIyp+io8cbUDlrssG0CqaokbIafdcz8BkMcJriH4wQ9VOSzETiOsXijY+jlpIZq3ZNnmv/d2gOVcKIZE5ftAbkzF6SdFhTw+yS6iZqEYGOE4jcJsIeHOLnuXLkZxOInyW6hKcITzw8DPI8ZZ132/29tQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jFGnBWyj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jFGnBWyj"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3635bd94f3eso5152371fa.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759995213; x=1760600013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=;
        b=jFGnBWyjp8PPlIsG3UmFz50ei1x5BzvUhm1lYGWJkUwbSh+M/jmRzjeqXlEZ0iglKw
         PPbKitcRVD8+tucaDaoWNlLeTkG+7KOk3FmGZVujJ60+Ao2vCwouNXiYwc69PO5M/hho
         oMgeZv1oihZa/K5+XiuWeldp4WSVIGlLigJFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995213; x=1760600013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=;
        b=Qk7FrzK3Zd5elzApNSai6R//bSd5NeWSl085DtS39yw3t69KBtDesFICndwOgJxKjn
         ghGMvfdELunKOm/aWj0lvlcvl92lXGKTlIuhKRmJIe7Ejfr/3yf2r+4RR0d8rd6FbVNT
         bVqw9mxWmMmV1sw2PBTH6nyCdGpfHAVAvFUcHMnbn1mltmS6iJbKHJM1WUq6O/vn/taJ
         sjMimu95zeeHAYCrFmXn9QFNsQkug24caeZimqwpDDSFS30QvdN0hJUZFCAGAyC40SoM
         99ofR6iAWFi/an3D4Oo4YgRi/BPdsMV7OzeZ86NBtb9ZkqGZ8Y3x9YdfhWKsRxxotN8Y
         P+DA==
X-Forwarded-Encrypted: i=1; AJvYcCWhMMItvmdi7HwplqNoUJofVI9oyYFNQh3E5iEGJuCaciRTit3zvP38QhPPpZ7nA11GrsOoAPzIR/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2taKpO3FDzf7TWXzz2/l7kd4a53jeEPdt9seSfCjnJrBiuJm+
	FBMyz+rbOb/XkKQanFmUwFAF5AjGMpfq7hXnZ8j2admyumW8BucHlGbDOYxfQjdZ4+avmEzpjeW
	vja0QnJcxTyWiqJnszd7E80UHVKxSe2lQi1++yW4cI6BOozC78Os=
X-Gm-Gg: ASbGncu5ODvp8kkaUGAJXcpeJKVGeG0DsiBxYxzW1VE0wIOY499bJJ73Z/ycwGPdU6R
	+fU6rWAPIKOK7X4H3j7MlWzf1Zuaxu8hhbkn2uFDDCNDRJzU5dg1GRezn/qzzdXDCwrBUHGZcdN
	ein5RMvLvppZvlkDm739d0vTrlDdfZJgOVlwmW8v6mpRLjZnlzZ/3ORTdB6TDHX5T3Y/dVj3CJa
	xRa8StApbvKeyTgfgW26OIBeyX8BZm3E2dNe4XSnC0+KeNDARXuw7NnFZKOQA==
X-Google-Smtp-Source: AGHT+IF6m8ACDaU9hzMk8xdqL2Q2Hbks2uUt6Iy3PDX+KKlJyzdC/zfk13eIYMHbsDIcLqn07l/Zwc+Zn356g2up4Tk=
X-Received: by 2002:a2e:be9a:0:b0:337:f1d7:d500 with SMTP id
 38308e7fff4ca-37609d953b8mr16127351fa.18.1759995213025; Thu, 09 Oct 2025
 00:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:33:22 +0800
X-Gm-Features: AS18NWDCKGPR4MxJLy6Y5o4fyCGycMwSUzGQZN0AhucPrjjtAqoX3WiLmZowTiU
Message-ID: <CAGXv+5Hpndq09cbudofSvkNE6w+tHb85VCqDb3P920S8vwonHQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Refactor pllfh registration to pass device
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> After refactoring all of PLL to pass the device, it's now fairly easy to
> refactor pllfh and its users, as pllfh registration wraps PLL
> registration.
>
> Do this refactor and move all of the pllfh users to pass the device as
> well.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
>  drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
>  drivers/clk/mediatek/clk-pllfh.h             |  2 +-
>  7 files changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt6795-apmixedsys.c
> index 91665d7f125efde4941cc4de881c5b503a935529..123d5d7fea8554676364dc56f=
5c023e43325d516 100644
> --- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> @@ -152,7 +152,7 @@ static int clk_mt6795_apmixed_probe(struct platform_d=
evice *pdev)
>                 return -ENOMEM;
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> -       ret =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       ret =3D mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls),
>                                       pllfhs, ARRAY_SIZE(pllfhs), clk_dat=
a);
>         if (ret)
>                 goto free_clk_data;
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index 95385bb67d5511eda3a851f81986e67eaf81e5fb..d7d416172ab35bc027ae67c16=
3c1dc20dee857b6 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -140,13 +140,13 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_apmixed=
);
>  static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  {
>         const u8 *fhctl_node =3D "mediatek,mt8173-fhctl";
> -       struct device_node *node =3D pdev->dev.of_node;
>         struct clk_hw_onecell_data *clk_data;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *base;
>         struct clk_hw *hw;
>         int r;
>
> -       base =3D of_iomap(node, 0);
> +       base =3D of_iomap(dev->of_node, 0);
>         if (!base)
>                 return -ENOMEM;
>
> @@ -157,25 +157,25 @@ static int clk_mt8173_apmixed_probe(struct platform=
_device *pdev)
>         }
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> -                                   pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
> +       r =3D mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls), pllfhs=
,
> +                                   ARRAY_SIZE(pllfhs), clk_data);
>         if (r)
>                 goto free_clk_data;
>
>         hw =3D mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base +=
 REGOFF_REF2USB);
>         if (IS_ERR(hw)) {
>                 r =3D PTR_ERR(hw);
> -               dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n"=
, r);
> +               dev_err(dev, "Failed to register ref2usb_tx: %d\n", r);
>                 goto unregister_plls;
>         }
>         clk_data->hws[CLK_APMIXED_REF2USB_TX] =3D hw;
>
> -       hw =3D devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdp=
ll_594m", 0,
> +       hw =3D devm_clk_hw_register_divider(dev, "hdmi_ref", "tvdpll_594m=
", 0,
>                                           base + REGOFF_HDMI_REF, 16, 3,
>                                           CLK_DIVIDER_POWER_OF_TWO, NULL)=
;
>         clk_data->hws[CLK_APMIXED_HDMI_REF] =3D hw;
>
> -       r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_dat=
a);
> +       r =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,=
 clk_data);
>         if (r)
>                 goto unregister_ref2usb;
>
> diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8186-apmixedsys.c
> index 4b2b16578232d986f78deed4778c5fab7f460184..d35dd2632e43ab535b32b8b99=
f8d75de02d56fe2 100644
> --- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
> @@ -151,7 +151,7 @@ static int clk_mt8186_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
> diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8192-apmixedsys.c
> index 0b66a27e4d5ac68f09dc6a4197fd84ef82342df9..b0563a285bd666d492a7fa940=
733aad1ab1a0bae 100644
> --- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> @@ -162,7 +162,7 @@ static int clk_mt8192_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_clk_data;
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8195-apmixedsys.c
> index 282a3137dc89419a6d0b574fd549cee941687900..44917ab034c56f01ef02d1957=
f17eb0655438d75 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -181,7 +181,7 @@ static int clk_mt8195_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index 62bfe4a480f14a0a742fb094aff0e6d1a79fe0c3..8ad11023d91127e88900bc6bc=
abbaeafb1e00664 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -10,6 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>

This shouldn't be needed, as you aren't using any of the APIs.

A forward declaration of |struct device| in the header should suffice.
It should be added anyway, since the header defines data structures that
have a |struct device *| field.


ChenYu
