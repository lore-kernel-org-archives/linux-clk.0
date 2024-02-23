Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FFCA73
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 04:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708662463; cv=none; b=mT46qcJgo/9yFXu/xTWwT8DPXSCqtWU6YmPQp+iWCNVuw+ee7a3CK8DrvyYKr4dgKXqFwAER/Eau+2UXIZVwISovtxvTTCAO0j58KhJ4+vfHnIOfh2CSPBlByjfwb3ImHlB5voLmYUmOzvXxveMCBnBz8XEnqy1dq2dZjC97v4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708662463; c=relaxed/simple;
	bh=+U7/HUm+newXNawm3OIBe64OPniGPxcNgU8MBN03388=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DupqotT7jzWCfShWdA7gNuF96kdc7X2UT4Tjrtihbw41X1Tub9LeYAdGmfA48V3sMq0tw2ZYtbp9Mvd5xyRd+M12BgBUoLgas2luryN9HiItnqkYkdXN5F+m6ujFOjG4wYD/QkM0gCkNaUjhVWT8LxxrzJOUhkDTgRd7Zp5jP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J+KzbLHJ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J+KzbLHJ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512be6fda52so776421e87.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 20:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708662460; x=1709267260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDgHpddbeDRitK+X3PotUxSVopTporXEfeUFX+IG05I=;
        b=J+KzbLHJQDrRBTrBZBcixyMd5z8cghwc8fcRb4f18HHLEV9t/VvAj8TUhOjTqjORRh
         cpv124oXOAO/J2YhimrKunBZwEU0hXQbDxfsHWMVPj4icVEzJxD2ilIIjwrz65VPbEiV
         gRYNULB9dS9NCIwtnWQczAvtFv51l8PYzO0As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708662460; x=1709267260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDgHpddbeDRitK+X3PotUxSVopTporXEfeUFX+IG05I=;
        b=MJCIKb+8mk1MnNe8QSznDkgMBstw75W+HiOtt4IZdZAie6FyR/rfjK2ZhpTnbeaubO
         Ts8+wJGfOF363+lLWtjSv9d/EFaChEXrqIO1JK9PMt+JKppmeiEBPqgCq2BLhwaNId87
         svfxuwn19cpeDj5fLzhIeNFnW+Kl5ZSNLqQyJTHct0rPNhUvE4LVcdiMzvWd7VgDQ88k
         e77db0So/DvhznVTxOuPtCCK3A5Hq4t6WO9osuphlSDulN5EBzNQbvX+DZNq5lRzx5KD
         yM8hZ2uVYXEL9AcT5xrJTDBkry0L3dc01c/CpYz+UW7K0ZBalIBxZN2MOXS1PX/XJ293
         W/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNzSjUbG6uB9R/EWPtjaCNgTkTAL/0VtEVuvrMO5xPT2AwVIPqMyJz2O1rS6RdCe23ba3iB2u3uLvyB2zqTSQ9PZNTuCRJh7f+
X-Gm-Message-State: AOJu0YxPOhJJgdRfB6ik4wZVFLHHjpIFK3xfKdLHkGq/fIke7/I9XQZ0
	NjaMmNT8eJwkI8yST9Sltv+w74dhkajiYmgQo53PCQhMU08FX2NR0fTuNIcfUJnHc5bQyMiZzdr
	ddJ5+HVk7nnMUdO11v80csP+YzNrYl26rlyIR
X-Google-Smtp-Source: AGHT+IG1gpB6olc4CmFRKGnaml07scqjkk6frDritOolB30oK3tyv/MOjQ+fLmmeie41GBXOwScJywtfR3U5/7Iy6Hw=
X-Received: by 2002:ac2:4249:0:b0:512:c1ba:9115 with SMTP id
 m9-20020ac24249000000b00512c1ba9115mr562755lfl.57.1708662460080; Thu, 22 Feb
 2024 20:27:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
In-Reply-To: <20240108081834.408403-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Feb 2024 12:27:28 +0800
Message-ID: <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
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
> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> this clock controller needs runtime PM for its operations.
> Also do a runtime PM get on the clock controller during the
> probing stage to workaround a possible deadlock.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

The patch itself looks fine.

Besides the MT8183 MFG clock issues, we do actually need this for the
MT8192 ADSP clock. Its power domain is not enabled by default.

> ---
>
> Changes in v3:
> - Update the commit message and the comments before runtime PM call
>
> Changes in v2:
> - Fix the order of error handling
> - Update the commit message and add a comment before the runtime PM call
>
>  drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 2e55368dc4d8..ba1d1c495bc2 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>
>  #include "clk-mtk.h"
> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>                         return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>         }
>
> +
> +       if (mcd->need_runtime_pm) {
> +               devm_pm_runtime_enable(&pdev->dev);
> +               /*
> +                * Do a pm_runtime_resume_and_get() to workaround a possi=
ble
> +                * deadlock between clk_register() and the genpd framewor=
k.
> +                */
> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> +               if (r)
> +                       return r;
> +       }
> +
>         /* Calculate how many clk_hw_onecell_data entries to allocate */
>         num_clks =3D mcd->num_clks + mcd->num_composite_clks;
>         num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>                         goto unregister_clks;
>         }
>
> +       if (mcd->need_runtime_pm)
> +               pm_runtime_put(&pdev->dev);
> +
>         return r;
>
>  unregister_clks:
> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>  free_base:
>         if (mcd->shared_io && base)
>                 iounmap(base);
> +
> +       if (mcd->need_runtime_pm)
> +               pm_runtime_put(&pdev->dev);
>         return r;
>  }
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 22096501a60a..c17fe1c2d732 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>
>         int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>         unsigned int mfg_clk_idx;
> +
> +       bool need_runtime_pm;
>  };
>
>  int mtk_clk_pdev_probe(struct platform_device *pdev);
> --
> 2.43.0.472.g3155946c3a-goog
>
