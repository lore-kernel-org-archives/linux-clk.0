Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9B7F47F
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721295739; cv=none; b=A0d0YKFNWHGn5hKpk9mM4AfCLMTB78PG+S64oMmQYjS8Q2+P0HZ0osmeyDKGkOm0iiNyHSE31bSp7nMZi6G5FRylKcTaP6jVvsYnju/ONKtwwjBTmUrrdIUgTUURMDn7xT2ev2FoEE1yWq7WQmwiNUmv1toCrGDq5k2LsNpAzSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721295739; c=relaxed/simple;
	bh=ma1jqCvpXLvw/qJ+K1BuBiSsJ9sT6SZ1Fzi3osTq3Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4jTRGEoQqzmLxmHcfmhU/DYiGpBNZ15ea0Q3yfHzgHll7wmhAkd8ulBN/fRmCd5WwkoRsXMcVksdPIn+3SfZ1jxFEUhmDV0GIrmNyzCNC087TQvGjY0eBDM/yLnB4ywCpb9y3b/O79sIEOEElQmLs56mf1CefB+Ei6p4MmYsRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IUlJO1ih; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IUlJO1ih"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-48feaeaa705so211693137.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721295736; x=1721900536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WurLU3I0ZY0rwZGNbG1KQfDTWM2GScsE4+HGMoCekcE=;
        b=IUlJO1ihpZxhv1O/+rr5lj2aYpAESctxWkKByH88QcAfRDMRsqSptGLPPH3irrc8DD
         M0Io2wnQVHn0bd2eKirP3w//RMBOFKp9XnJ+CA5lcv7UWZeEATyTBC7mLMD6df0auAhu
         9iQTUE0ilsvGop1AiY/wCvNShT9Bu+duDdins=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721295736; x=1721900536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WurLU3I0ZY0rwZGNbG1KQfDTWM2GScsE4+HGMoCekcE=;
        b=i5heMbSyogBMF2e6h7YxiwF3PYrmTvWM8TnyILOE2rQkBaSNC2y1lYh4rRfLwqDdIV
         iJcR4UVMkquOh+gFafBYqTm0YZh7laXuI2+R1k71ZXKOYF17oqH7E51zkLQ7igzOzHx9
         06fYlssh/DkwPcFvcfBAT67Aa4I6fzbog9tIUhTuc2i7JPDRZx1jL1P0Ih85MajbRpSJ
         loR0jscDpn+iAYgKApr9rYC6HblSxU7OLkGis6WkpaN5cFH5q9re1W8GEf5ePm4fjiiw
         9U2Yfcxpxtl4UGmG3jDc+X9KL0AQAdTLHej6AvBckiqQG/owyScfP2IqUSh/URys2xKO
         eStw==
X-Forwarded-Encrypted: i=1; AJvYcCUwZKxcC64gvF/w3nYb/lN9bGvVhh1mNvoOaNqMy12Wu/NQ4XW8UfEDL2Xj5HFRWmvd1fBtz8p92a6w7Vbe9GwrcCsDwZ4Ex6Jd
X-Gm-Message-State: AOJu0YxSHLj9GUhq7v2BB2W/AnD0yFeI95KuXVk934AJqOTMkVNfHXln
	jeYYUH6va8S0Df5viMauIluUQ4E2It8MzwRL3be0BoqMTTeAswtMteV4CpaRg3ksKSVEjcjXfc2
	oeg==
X-Google-Smtp-Source: AGHT+IF6LCYaLDkgaT6psUafvk+fGYOBwF35C38nz1y3vezxNQgeIKpaZ+330KBohWUvMzyOAm3k9w==
X-Received: by 2002:a05:6102:8014:b0:48f:bbf3:b8b5 with SMTP id ada2fe7eead31-4915986a8afmr5862888137.7.1721295736078;
        Thu, 18 Jul 2024 02:42:16 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-822c8ac4478sm128313241.29.2024.07.18.02.42.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 02:42:15 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-81177a1089fso182579241.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:42:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj1S7bBQcHo1i5J8CxFb4xEezLt24z6yafxGy57iZMq7Wdw7gH2ccUw8NkpYyJxrGVnpF8vatBm9/bTyrgt+yp2VrzDxW0pla5
X-Received: by 2002:a05:6102:8014:b0:48f:bbf3:b8b5 with SMTP id
 ada2fe7eead31-4915986a8afmr5862849137.7.1721295735028; Thu, 18 Jul 2024
 02:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jul 2024 17:41:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhmuGfaQrK-3TZzY3-c1_cDbB5g_Zp2nXOzg6zQZ-j4Lw@mail.gmail.com>
Message-ID: <CAC=S1nhmuGfaQrK-3TZzY3-c1_cDbB5g_Zp2nXOzg6zQZ-j4Lw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Remove unused mtk_register_reset_controller()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, 
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 4:26=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that all clock controllers have been migrated to the new
> mtk_register_reset_controller_with_dev() function, the one taking
> struct device node is now unused: remove it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/clk/mediatek/reset.c | 59 ------------------------------------
>  drivers/clk/mediatek/reset.h | 10 ------
>  2 files changed, 69 deletions(-)
>
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 290ceda84ce4..069f9e909cb0 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -110,65 +110,6 @@ static int reset_xlate(struct reset_controller_dev *=
rcdev,
>         return data->desc->rst_idx_map[reset_spec->args[0]];
>  }
>
> -int mtk_register_reset_controller(struct device_node *np,
> -                                 const struct mtk_clk_rst_desc *desc)
> -{
> -       struct regmap *regmap;
> -       const struct reset_control_ops *rcops =3D NULL;
> -       struct mtk_clk_rst_data *data;
> -       int ret;
> -
> -       if (!desc) {
> -               pr_err("mtk clock reset desc is NULL\n");
> -               return -EINVAL;
> -       }
> -
> -       switch (desc->version) {
> -       case MTK_RST_SIMPLE:
> -               rcops =3D &mtk_reset_ops;
> -               break;
> -       case MTK_RST_SET_CLR:
> -               rcops =3D &mtk_reset_ops_set_clr;
> -               break;
> -       default:
> -               pr_err("Unknown reset version %d\n", desc->version);
> -               return -EINVAL;
> -       }
> -
> -       regmap =3D device_node_to_regmap(np);
> -       if (IS_ERR(regmap)) {
> -               pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
> -               return -EINVAL;
> -       }
> -
> -       data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> -       if (!data)
> -               return -ENOMEM;
> -
> -       data->desc =3D desc;
> -       data->regmap =3D regmap;
> -       data->rcdev.owner =3D THIS_MODULE;
> -       data->rcdev.ops =3D rcops;
> -       data->rcdev.of_node =3D np;
> -
> -       if (data->desc->rst_idx_map_nr > 0) {
> -               data->rcdev.of_reset_n_cells =3D 1;
> -               data->rcdev.nr_resets =3D desc->rst_idx_map_nr;
> -               data->rcdev.of_xlate =3D reset_xlate;
> -       } else {
> -               data->rcdev.nr_resets =3D desc->rst_bank_nr * RST_NR_PER_=
BANK;
> -       }
> -
> -       ret =3D reset_controller_register(&data->rcdev);
> -       if (ret) {
> -               pr_err("could not register reset controller: %d\n", ret);
> -               kfree(data);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>                                            const struct mtk_clk_rst_desc =
*desc)

I guess that means the "_with_dev" suffix here becomes redundant and
therefore can be removed.
Do you want to update it all together?

Regards,
Fei


>  {
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 6a58a3d59165..562ffd290a22 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -59,16 +59,6 @@ struct mtk_clk_rst_data {
>         const struct mtk_clk_rst_desc *desc;
>  };
>
> -/**
> - * mtk_register_reset_controller - Register MediaTek clock reset control=
ler
> - * @np: Pointer to device node.
> - * @desc: Constant pointer to description of clock reset.
> - *
> - * Return: 0 on success and errorno otherwise.
> - */
> -int mtk_register_reset_controller(struct device_node *np,
> -                                 const struct mtk_clk_rst_desc *desc);
> -
>  /**
>   * mtk_register_reset_controller - Register mediatek clock reset control=
ler with device
>   * @np: Pointer to device.
> --
> 2.45.2
>
>
