Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DA7C2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28AD12388B
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600804669;
	bh=ntmBKPwvpinKhTnLQ11J3/mogaVqqHwr8L3wynu522M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=j+Z+/L2NBHKXoLzZgBzcd2JZyEjn22aid+FmT8eYFVmkq+gCMs+aAce66NxMqfB41
	 EIndDeLoorK6Sk/mrG3kRQdCaieMtHOq6AcbV9z6RGTd9uSAJHRfMHlFKUiW5aBL5o
	 /QlG8bJkru/WW0avuB/jmPw4wTFP8hIyd9o9gFZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIVT5s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:57:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbgIVT5s (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:57:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E05BE221E8;
        Tue, 22 Sep 2020 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804668;
        bh=ntmBKPwvpinKhTnLQ11J3/mogaVqqHwr8L3wynu522M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JlhV/5qZzGRg6E9j0SMkhFL44YlHP3UULlSUex4VdEnZv+GVWTT3+3YE8mm/HVRve
         tIprZpbADikutTApTgi0w0kJsX20XeRkQZ2RqrQugLDB8fa+WXYVfm5qDannA9V8U6
         I9cBKccpqlyP9nYjO4Opk9Zyb8/ueCVq+UVeIb7k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918094642.108070-1-zhangqilong3@huawei.com>
References: <20200918094642.108070-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] clk: tegra: clk-dfll: indicate correct error reason in tegra_dfll_register
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org
To:     Qilong Zhang <zhangqilong3@huawei.com>, mturquette@baylibre.com
Date:   Tue, 22 Sep 2020 12:57:46 -0700
Message-ID: <160080466654.310579.9823605565645488149@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Qilong Zhang (2020-09-18 02:46:42)
> From: Zhang Qilong <zhangqilong3@huawei.com>
>=20
> Calling devm_ioremap means getting devices resource have been
> successful. When remap operation failed, we should return '-ENOMEM'
> instead of '-ENODEV' to differentiate between getting resource and
> mapping memory for reminding callers. Moreover, it is not consistent
> with devm_kzalloc operation.
>=20
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index cfbaa90c7adb..6637b73be9f1 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1993,7 +1993,7 @@ int tegra_dfll_register(struct platform_device *pde=
v,
>         td->base =3D devm_ioremap(td->dev, mem->start, resource_size(mem)=
);
>         if (!td->base) {
>                 dev_err(td->dev, "couldn't ioremap DFLL control registers=
\n");
> -               return -ENODEV;
> +               return -ENOMEM;

Can you remove the dev_err() lines too? They're pretty much useless.
