Return-Path: <SRS0=cffc=DO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593D5C4363D
	for <linux-clk@archiver.kernel.org>; Wed,  7 Oct 2020 23:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11C3620714
	for <linux-clk@archiver.kernel.org>; Wed,  7 Oct 2020 23:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602114806;
	bh=Ouup++k0KZa2jKp9tAE8O/4QEGO3ptvOonhqcI4wBE8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=yhe5/ncU8SPK3dT9dT0dReTakFy/KNr265oulXozLeFd4cuoNfgGesr8Z1z4WFh1Q
	 TUbzfOR75ASqwkHz8fBqvx1vConp7xBiVh8BrL65hWTR3sJDooxT89ip+wdTYdz3mz
	 mJ1PFEhjXqpkWLEcouXa7aAzWubB4N2AllxgnkKI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgJGXxZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Oct 2020 19:53:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727718AbgJGXxZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Oct 2020 19:53:25 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A26E2206E7;
        Wed,  7 Oct 2020 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602114804;
        bh=Ouup++k0KZa2jKp9tAE8O/4QEGO3ptvOonhqcI4wBE8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r/NlsCdAAOzV7Wp6CM0qsomr8whtV4PF3r2w8D49lhreMQ70PJIASDXJBhpUGZq9k
         +xYk9LPeEs9OxYoBsReVjzpLKjzKrxiZ4vUMrdKImQ4mJUmmoF+qPUDzodVNmnYUvJ
         mI2DVoOGbGHXI7LGRzi8R3QbdQ/+trLZqPUKhfeQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200928084744.32478-1-jun.nie@linaro.org>
References: <20200928084744.32478-1-jun.nie@linaro.org>
Subject: Re: [PATCH] clk: emit warning if fail to get parent clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     shawn.guo@linaro.org, Jun Nie <jun.nie@linaro.org>
To:     Jun Nie <jun.nie@linaro.org>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Wed, 07 Oct 2020 16:53:23 -0700
Message-ID: <160211480321.310579.14554922934041815553@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jun Nie (2020-09-28 01:47:44)
> Emit warning if fail to get parent clk to expose potential issue earlier.
> For example, clk_hw_get_rate() will return 0 for a clock without parent c=
ore
> while parent number is not zero. This cause opp always think it is switch=
ing
> frequency from 0 to some other frequency. Crash may happen if we switch
> from high frequency to low frequency and lower CPU voltage before clk rate
> switching.

Thanks for the background reasoning. It's good to know what the problem
is. Is there any way to change OPP so it can handle this scenario
better?

>=20
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/clk/clk.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1a27e99ccb17..78b21b888e56 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -424,6 +424,7 @@ static void clk_core_fill_parent_index(struct clk_cor=
e *core, u8 index)
>  {
>         struct clk_parent_map *entry =3D &core->parents[index];
>         struct clk_core *parent =3D ERR_PTR(-ENOENT);
> +       int emit_warn =3D 0;
> =20
>         if (entry->hw) {
>                 parent =3D entry->hw->core;
> @@ -443,6 +444,12 @@ static void clk_core_fill_parent_index(struct clk_co=
re *core, u8 index)
>         /* Only cache it if it's not an error */
>         if (!IS_ERR(parent))
>                 entry->core =3D parent;
> +       else if (parent !=3D ERR_PTR(-EPROBE_DEFER))
> +               emit_warn =3D 1;
> +
> +       if (emit_warn || (!parent && core->num_parents))
> +               pr_warn("Fail to get indexed %d parent for clk %s.",
> +                       index, core->name);

How do we know that this error isn't because the parent hasn't been
probed yet?
