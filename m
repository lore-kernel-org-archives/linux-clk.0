Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86553B9952
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 02:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811401; cv=pass; b=tUjKbzFjc1GxnDU8v4lXmU3VTEYhBMYcp6rTvQC8faBRi48txkuxGMlOvmwuI8ZXwHagcCOJz4xBlDBHUH7b6MeaK5hiKvWMJZ8vaBOkx/bcBGyELlwPOp59Z+AstZ13IESXv6dIf3q5ViBNmGokH+QqHrQ9v9PPjNiVGrBbnfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811401; c=relaxed/simple;
	bh=YZKYb+GkPftg01Ou+o7yt15VY2iSSja29MKhp+0jynE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFE6HWv05J1hVyymlBWdtv6dooquUfJ3XiIOeW4ZBM+wq0i+C1lgnQDMNPiMYRrZUfbRaXYCOXMXRSS27vrDQLyiSpbzJPy4Pt4YzlgOMoSSNoNcEm4uvt2fns7d/RJxJClRUMMJmB5sf0FR4xyJevk1SF+PIAcT0xLjYI5rqKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jC8vkyGR; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jC8vkyGR"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81f3b227a4aso61747307b3.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 19:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785811399; cv=none;
        d=google.com; s=arc-20260327;
        b=Y2AWYCNH6x5A0WSjFHlIjzr6BwRr0Dw3zQFAbJsRW8VvmwYW+kHtIUbPf7cDmp8dy7
         aM/mC/XMoI7Q7hLShLx1iLjYXRN/ICnfea/7gjfb5X8DICUz6jKRauHRH6QoozruK0+x
         5YvWYYBXr/DxxLCsh1pVtSjKHelN5Z7XuXA9Avs5r3tCHV/nbRlh1leD6beRLzNGED9R
         /lIx6/jDg9sKtSg1RAamu8qfe1MrSobVb8WebsyLeR16/EGAXIXnGb62hOpkA5TDBA5M
         iAUfr9rOzyRHUiqnGuzthVmqiH4EBfRd26yaGDalN3LBXcfuWFGnTg0Gb5yvjB0iXuV0
         v88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        fh=nWHwRS1I8uNeJoilG2fhr2RpJhGrrmIToEAadsLQOYE=;
        b=gsyGDUXDeH0E5FTRbjivTwJLiOMtRkphO8RBYqW9rAkJvmM/C49hNAAc5x9K9YasOZ
         5Kjg7rVzKnh++vAUPQreCmLSt4T8M0UhyCgqE3xu4eKgm9LSJu5duQoFKsrYn8rgd0ia
         rnL8J1PEnfb5ECxErANa+U/2XljdCJ//bTfhk62RuW/Mb1iZOqyeTBl7qIiZIZpUwUBp
         m7mRABWMAlj7LUpzpoY9C9wg201c/ZIan86c03pUTS8XHFwPl/stT6b54yZVh82sIve0
         GCm/EyuhKR2BSJ+V9dg13FdgVG2LoDxPu5oC26EgYj7ZBCsFJgCVQcUsVzD8LnX4Os1L
         OBTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785811399; x=1786416199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        b=jC8vkyGRk/6dVnzI57mRjrGd4MqWLiArc7JTmqjqD6z0oiS0mwNucudqoCumJqjU6B
         yfCx7waIOJmSxiWu6GvOnURVX/TuBoZF/zv/89yb+OVs/IWg5BeyTcALp8iho/2z2Lwg
         k15bw1pWFm6RivINUFCPNnpZjG4nxfykdY+6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811399; x=1786416199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        b=WZSGWG1k9ZJjpmVa8k+9abaN1RJlV49sJyt8dEGqntHkYJgqmHuAgvwf454aFuQhao
         NnuTym7TMqHdMr3R6g08S2DVHtnllqbpjUtb8iuSsROJ9IwKU25B8QJSwqD491axH4WT
         XZ8hYMfkfWrnUkE3qwWWVF88NgYm0Fet9sVy4Ud9wpef1un85Th9K5vPinhvqf6aOwKC
         dC/6+4RWINndlIk9Vt6kGiqSkdAzPnaB48ku/ARR6nbU4ENYIDoHbcPi6m+P8DAz7CtM
         sc5JTYB3CnFrXNsHmfpK+qJE758ToilEI2r4v3/F6+TzpaOVJwlkWC3U2K7rpPPf9V0W
         /Ymw==
X-Forwarded-Encrypted: i=1; AHgh+RqAmeE0ICgzU5g2HcYOns0K9OwgdPK7hddVGyjHV7JwIK6DVML1gG0PNBaGN07GIYlIfIjO2Zb07w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzliyen5V9HRJV55hjIywB7kZBuiESWzN9r0SqE6wKqJlV8tYCk
	EiCBFr/rk6fWgsEEyegDTziqQf5kAd6rQTPyHL9ql/BH96rMEuLrTp7738c0aMolVo7o8L5fMFL
	1DH677XiXVuaHrlzScmmRI0lS4DgGKKxXnuofEgVA
X-Gm-Gg: AR+sD13SeoUyxDAH5PTw7OLvsNqx+UsdZ21pn0v48K3KxKN/cikhugHQKmrzAUnaPPe
	cuD7gK+2u0wMHrH7lDzLGmAhSYIv6QzvKGoYjjRJYXu1nGEe4UyJ0f6j3x98PNLM3UNLTnRXYl4
	+Qu5a2OT7bdq2VYMAx8VfLiOpfyIQfRFmbtsC4OkIobKXaPwXs4EqjXNTzHyz5oJFyGWdcWa0qK
	Bz3BsQAdO3BuMj4I2ztrfiXzSHaOeDd7OsrEbdfmj3wysr2edKksOVicobh0WvYGxzwDvL5Ipog
	qZHrlwEUgLzmKr6ITYOQMBDxd8G9kCbdnmUKXi835btFfrs=
X-Received: by 2002:a05:690c:6984:b0:81e:a425:fe88 with SMTP id
 00721157ae682-81fd4bf523fmr168290117b3.33.1785811398719; Mon, 03 Aug 2026
 19:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803141659.559129-1-akkun11.open@gmail.com> <20260803141659.559129-12-akkun11.open@gmail.com>
In-Reply-To: <20260803141659.559129-12-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Aug 2026 10:43:08 +0800
X-Gm-Features: AUfX_mw0ODj1uLGkUiNOBLIVs6yIxP-U-M-JHW0wgLxFKYiXjICIFii0-d42exg
Message-ID: <CAGXv+5FHSNH5SLiCiXyHDieO2rUDypAQBi5-nbTFKFzb+3ZWRA@mail.gmail.com>
Subject: Re: [PATCH 11/32] clk: mediatek: Add auto-population of sub-devices
 support in simple probe
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>, 
	Miles Chen <miles.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Sam Shih <sam.shih@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 10:18=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> MediaTek audio clock drivers call devm_of_platform_populate() after
> mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
> devm_of_platform_populate() when the new 'populate_children' flag is
> set, reducing boilerplate.
>
> Note that explicit of_platform_depopulate() calls in remove functions
> are unnecessary because devm_of_platform_populate() is managed by
> devres and cleans up automatically.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 7 +++++++
>  drivers/clk/mediatek/clk-mtk.h | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index c3369a04cdec..71d70b5a9990 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> @@ -609,6 +610,12 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>         if (mcd->need_runtime_pm)
>                 pm_runtime_put(&pdev->dev);
>
> +       if (mcd->populate_children) {
> +               r =3D devm_of_platform_populate(&pdev->dev);
> +               if (r)
> +                       goto unregister_clks;

You cannot use devm_* here, as they get unrolled _after_ the probe function
returns an error or after the remove function returns. A child could be
referencing a clock that got tore down in the error path below.

All devm_* functions need to happen before anything that requires manual
tear down. You can't mix the two together.


ChenYu

> +       }
> +
>         return r;
>
>  unregister_clks:
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index b6504b3e77ed..11939e3e0b38 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -265,6 +265,7 @@ struct mtk_clk_desc {
>         unsigned int mfg_clk_idx;
>
>         bool need_runtime_pm;
> +       bool populate_children;
>  };
>
>  int mtk_clk_pdev_probe(struct platform_device *pdev);
> --
> 2.55.0
>
