Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A261C4740A
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7199F2089F
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568024539;
	bh=Yk7S6QNE+0Vrk3XPrz/DAzAJIhloqdm30vmB81tUVmc=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=a1rw23s6OqH9Z4LOkrMZ9DPU6VrDaEg1DizPnBRYqbPbT2tQWW/naG9H/aMRjTS4E
	 7S3Q27ZEN1ISuiv9rv+VlbU2R+irFXHSe+sa8rLjweWGQHPl3vhFLu6nNORiAjA/8n
	 EB+n5l73vN3swcD+N+jXqC0uiuGkFLDXngP03USM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbfIIKWP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 06:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729660AbfIIKWP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 06:22:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0C302089F;
        Mon,  9 Sep 2019 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568024535;
        bh=Yk7S6QNE+0Vrk3XPrz/DAzAJIhloqdm30vmB81tUVmc=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=xeWuxUI0x22r5b6XuuqnFDHzLRt+ecSXo3CbmirAKjpDEispNoHfZjtxNPYLzxyCF
         UnLOJ6EFsltO/FZ3L8d2aF7SO7kU+iM4v0HxtGCZEvJ4Qq8g9px80iB2ZoKhxnUO+A
         yYdZMk3c72H41K6ixKQBh1QLHNB5N5lb9MAmFNlc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826164510.6425-3-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-3-jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/5] clk: qcom: hfpll: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:22:14 -0700
Message-Id: <20190909102214.E0C302089F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:08)
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index a6de7101430c..87b7f46d27e0 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -52,6 +52,7 @@ static int qcom_hfpll_probe(struct platform_device *pde=
v)
>         void __iomem *base;
>         struct regmap *regmap;
>         struct clk_hfpll *h;
> +       struct clk *pclk;
>         struct clk_init_data init =3D {
>                 .parent_names =3D (const char *[]){ "xo" },
>                 .num_parents =3D 1,
> @@ -75,6 +76,13 @@ static int qcom_hfpll_probe(struct platform_device *pd=
ev)
>                                           0, &init.name))
>                 return -ENODEV;
> =20
> +       /* get parent clock from device tree (optional) */
> +       pclk =3D devm_clk_get(dev, "xo");
> +       if (!IS_ERR(pclk))
> +               init.parent_names =3D (const char *[]){ __clk_get_name(pc=
lk) };
> +       else if (PTR_ERR(pclk) =3D=3D -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +

Can this use the "new" way of specifying parents of clks? That would be
better than calling clk_get() on the XO clk to handle this.

>         h->d =3D &hdata;
>         h->clkr.hw.init =3D &init;
>         spin_lock_init(&h->lock);
